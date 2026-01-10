import '../Util/app_imports.dart';
import 'package:timezone/timezone.dart' as tz;

class PrayerTimeWidget extends StatefulWidget {
  @override
  _PrayerTimeWidgetState createState() => _PrayerTimeWidgetState();
}

class _PrayerTimeWidgetState extends State<PrayerTimeWidget> {
  List<PrayerTime>? timingList;
  String error = '';
  bool loading = false;
  String selectedCity = 'Beirut';

  Map<String, bool> enabledNotificationsPerPrayer = {};

  final List<String> cities = [
    'Beirut',
    'Saida',
    'Tripoli',
    'Tyre',
    'Zahle',
    'Nabatieh',
    'Baalbek',
  ];

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  // ✅ دمج كل عمليات التهيئة في دالة واحدة مع معالجة أخطاء
  Future<void> _initializeApp() async {
    try {
      await checkAndRequestPermissions();
      await loadNotificationPreferences();
      await loadFromCache();
      await rescheduleIfTimeZoneChanged();
      await fetchPrayerTimes();
    } catch (e) {
      print('❌ خطأ في التهيئة: $e');
      setState(() {
        error = 'خطأ في تهيئة التطبيق: ${e.toString()}';
      });
    }
  }

  // ✅ دمج طلب الأذونات
  Future<void> checkAndRequestPermissions() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // طلب إذن الإشعارات
      bool isAllowed = await AwesomeNotifications().isNotificationAllowed();
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }

      // فتح إعدادات المنبهات الدقيقة (مرة واحدة فقط)
      final alreadyOpened = prefs.getBool('alarm_permission_opened') ?? false;
      if (!alreadyOpened && Platform.isAndroid) {
        openExactAlarmSettings();
        await prefs.setBool('alarm_permission_opened', true);
      }
    } catch (e) {
      print('❌ خطأ في طلب الأذونات: $e');
    }
  }

  void openExactAlarmSettings() {
    if (Platform.isAndroid) {
      try {
        final intent = AndroidIntent(
          action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
          flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
        );
        intent.launch();
      } catch (e) {
        print('❌ خطأ في فتح الإعدادات: $e');
      }
    }
  }

  Future<void> rescheduleIfTimeZoneChanged() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final nowOffset = DateTime.now().timeZoneOffset.inMinutes;
      final lastOffset = prefs.getInt('last_tz_offset');

      if (lastOffset == null || lastOffset != nowOffset) {
        await prefs.setInt('last_tz_offset', nowOffset);
        if (timingList != null) {
          await schedulePrayerNotifications(timingList!);
        }
      }
    } catch (e) {
      print('❌ خطأ في إعادة الجدولة: $e');
    }
  }

  Future<void> loadNotificationPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final keys = [
        'الإمساك',
        'صلاة الصبح',
        'الشروق',
        'الظهر',
        'العصر',
        'المغرب',
        'العشاء',
        'منتصف الليل',
      ];
      enabledNotificationsPerPrayer = {
        for (var k in keys) k: prefs.getBool(k) ?? true,
      };
    } catch (e) {
      print('❌ خطأ في تحميل الإعدادات: $e');
    }
  }

  Future<void> saveNotificationPreferences() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      for (var entry in enabledNotificationsPerPrayer.entries) {
        await prefs.setBool(entry.key, entry.value);
      }
    } catch (e) {
      print('❌ خطأ في حفظ الإعدادات: $e');
    }
  }

  Future<void> fetchPrayerTimes() async {
    setState(() {
      loading = true;
      error = '';
    });

    try {
      Map<String, List<double>> cityCoordinates = {
        'Beirut': [33.8938, 35.5018],
        'Saida': [33.5631, 35.3737],
        'Tripoli': [34.4367, 35.8497],
        'Tyre': [33.2705, 35.1963],
        'Zahle': [33.8463, 35.9020],
        'Nabatieh': [33.3789, 35.4839],
        'Baalbek': [34.0047, 36.2110],
      };

      final coords = cityCoordinates[selectedCity] ?? [33.8938, 35.5018];
      final myCoordinates = Coordinates(coords[0], coords[1]);
      final params = CalculationMethod.tehran.getParameters();
      params.madhab = Madhab.shafi;

      final prayerTimes = PrayerTimes.today(myCoordinates, params);

      String formatTime(DateTime time) {
        return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
      }

      final nextFajr = PrayerTimes(
              myCoordinates,
              DateComponents.from(DateTime.now().add(Duration(days: 1))),
              params)
          .fajr;

      final middleOfTheNight = prayerTimes.maghrib.add(
        Duration(
            seconds: nextFajr.difference(prayerTimes.maghrib).inSeconds ~/ 2),
      );

      final Map<String, String> timings = {
        'الإمساك':
            formatTime(prayerTimes.fajr.subtract(const Duration(minutes: 2))),
        'صلاة الصبح': formatTime(prayerTimes.fajr.add(Duration(minutes: 9))),
        'الشروق': formatTime(prayerTimes.sunrise),
        'الظهر': formatTime(prayerTimes.dhuhr),
        'العصر': formatTime(prayerTimes.asr.add(Duration(minutes: 43))),
        'المغرب':
            formatTime(prayerTimes.maghrib.subtract(Duration(minutes: 3))),
        'العشاء': formatTime(prayerTimes.isha.subtract(Duration(minutes: 2))),
        'منتصف الليل': formatTime(middleOfTheNight.add(Duration(minutes: 32))),
      };

      String adjustTime(String time, int minutes) {
        final parts = time.split(':');
        final hour = int.parse(parts[0]);
        final minute = int.parse(parts[1]);
        final original = DateTime(0, 1, 1, hour, minute);
        final adjusted = original.add(Duration(minutes: minutes));
        return '${adjusted.hour.toString().padLeft(2, '0')}:${adjusted.minute.toString().padLeft(2, '0')}';
      }

      timings['الإمساك'] = adjustTime(timings['الإمساك']!, 1);
      timings['صلاة الصبح'] = adjustTime(timings['صلاة الصبح']!, -1);
      timings['العصر'] = adjustTime(timings['العصر']!, -43);
      timings['المغرب'] = adjustTime(timings['المغرب']!, 3);
      timings['العشاء'] = adjustTime(timings['العشاء']!, 6);
      timings['منتصف الليل'] = adjustTime(timings['منتصف الليل']!, -38);

      final orderedKeys = [
        'الإمساك',
        'صلاة الصبح',
        'الشروق',
        'الظهر',
        'العصر',
        'المغرب',
        'العشاء',
        'منتصف الليل',
      ];

      final List<PrayerTime> list = orderedKeys
          .where((key) => timings.containsKey(key))
          .map((key) => PrayerTime(key, timings[key]!))
          .toList();

      await saveToCache(list);
      setState(() {
        timingList = list;
      });

      await schedulePrayerNotifications(list);
    } catch (e) {
      print('❌ خطأ في حساب المواقيت: $e');
      setState(() {
        error = 'خطأ في حساب المواقيت: ${e.toString()}';
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  Future<void> schedulePrayerNotifications(List<PrayerTime> list) async {
    try {
      await AwesomeNotifications().cancelAllSchedules();

      for (var prayer in list) {
        if (enabledNotificationsPerPrayer[prayer.name] != true) continue;

        final parts = prayer.time.split(':');
        final hour = int.parse(parts[0]);
        final minute = int.parse(parts[1]);
        final now = tz.TZDateTime.now(tz.local);
        tz.TZDateTime scheduled =
            tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

        if (scheduled.isBefore(now)) {
          scheduled = scheduled.add(const Duration(days: 1));
        }

        await AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: prayer.name.hashCode,
            channelKey: 'prayer_channel',
            title: '🕌 ${prayer.name}',
            body: 'حان الآن وقت ${prayer.name}',
            notificationLayout: NotificationLayout.Default,
            displayOnForeground: true,
            displayOnBackground: true,
            autoDismissible: true,
          ),
          schedule: NotificationCalendar(
            year: scheduled.year,
            month: scheduled.month,
            day: scheduled.day,
            hour: scheduled.hour,
            minute: scheduled.minute,
            second: 0,
            repeats: true,
            preciseAlarm: true,
          ),
        );

        print('🔔 تم جدولة ${prayer.name} عند $scheduled');
      }
    } catch (e) {
      print('❌ خطأ في جدولة الإشعارات: $e');
    }
  }

  Future<void> saveToCache(List<PrayerTime> list) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final encoded = jsonEncode(list.map((e) => e.toJson()).toList());
      await prefs.setString('cached_prayer_times', encoded);
    } catch (e) {
      print('❌ خطأ في حفظ الكاش: $e');
    }
  }

  Future<void> loadFromCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final data = prefs.getString('cached_prayer_times');
      if (data != null) {
        final List parsed = jsonDecode(data);
        final list = parsed.map((e) => PrayerTime.fromJson(e)).toList();
        setState(() => timingList = List<PrayerTime>.from(list));
      }
    } catch (e) {
      print('❌ خطأ في تحميل الكاش: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    if (timingList == null && error.isEmpty && loading) {
      return Center(child: CircularProgressIndicator());
    }

    if (error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 50, color: Colors.red),
            SizedBox(height: 10),
            Text('خطأ: $error', textAlign: TextAlign.center),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => fetchPrayerTimes(),
              child: Text('إعادة المحاولة'),
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 10 : 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                iconEnabledColor: Theme.of(context).iconTheme.color,
                value: selectedCity,
                padding: EdgeInsets.only(right: isTablet ? 20 : 10),
                iconSize: isTablet ? 50 : 20,
                items: cities.map((city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      city,
                      style: TextStyle(
                        fontFamily: 'Tajawal',
                        fontSize: isTablet ? 30 : 14,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) async {
                  if (value != null) {
                    setState(() {
                      selectedCity = value;
                    });
                    await fetchPrayerTimes();
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.refresh, size: isTablet ? 40 : 20),
                onPressed: () async {
                  await fetchPrayerTimes();
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: loading
              ? Center(child: CircularProgressIndicator())
              : timingList == null
                  ? Center(child: Text('لا توجد بيانات حالياً'))
                  : ListView.builder(
                      itemCount: timingList!.length,
                      itemBuilder: (context, index) {
                        final item = timingList![index];
                        return Card(
                          color: Theme.of(context).cardColor,
                          margin: EdgeInsets.all(isTablet ? 10 : 2),
                          child: ListTile(
                            leading: IconButton(
                              icon: Icon(
                                enabledNotificationsPerPrayer[item.name] == true
                                    ? Icons.notifications_active
                                    : Icons.notifications_off,
                                color:
                                    enabledNotificationsPerPrayer[item.name] ==
                                            true
                                        ? Theme.of(context).iconTheme.color
                                        : Colors.grey,
                                size: isTablet ? 50 : 25,
                              ),
                              onPressed: () async {
                                setState(() {
                                  enabledNotificationsPerPrayer[item.name] =
                                      !(enabledNotificationsPerPrayer[
                                              item.name] ??
                                          false);
                                });

                                await saveNotificationPreferences();
                                if (timingList != null) {
                                  await schedulePrayerNotifications(
                                      timingList!);
                                }
                              },
                            ),
                            title: Text(
                              item.name,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            trailing: Text(
                              item.time,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}

class PrayerTime {
  final String name;
  final String time;

  PrayerTime(this.name, this.time);

  Map<String, dynamic> toJson() => {'name': name, 'time': time};

  static PrayerTime fromJson(Map<String, dynamic> json) =>
      PrayerTime(json['name'], json['time']);
}
