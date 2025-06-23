// import 'package:flutter/material.dart';
// import 'package:hijri/hijri_calendar.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:intl/intl.dart';
// import 'package:maktabat_almoslim/main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class PrayerTimeWidget extends StatefulWidget {
//   @override
//   _PrayerTimeWidgetState createState() => _PrayerTimeWidgetState();
// }

// class _PrayerTimeWidgetState extends State<PrayerTimeWidget> {
//   List<PrayerTime>? timingList;
//   String error = '';
//   bool loading = false;
//   String selectedCity = 'Beirut';
//   bool notificationsEnabled = false;

//   final FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   final List<String> cities = [
//     'Beirut',
//     'Saida',
//     'Tripoli',
//     'Tyre',
//     'Zahle',
//     'Nabatieh',
//     'Baalbek',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     initNotifications();
//     loadFromCache().then((_) => fetchPrayerTimes());
//     openExactAlarmSettings();
//   }

//   Future<void> initNotifications() async {
//     tz.initializeTimeZones();
//     tz.setLocalLocation(tz.getLocation('Asia/Beirut'));

//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//     );

//     await notificationsPlugin.initialize(initializationSettings);
//   }

//   String formatLebaneseDate(DateTime date) {
//     const lebaneseMonths = [
//       "كانون الثاني",
//       "شباط",
//       "آذار",
//       "نيسان",
//       "أيار",
//       "حزيران",
//       "تموز",
//       "آب",
//       "أيلول",
//       "تشرين الأول",
//       "تشرين الثاني",
//       "كانون الأول"
//     ];
//     String weekday = DateFormat('EEEE', 'ar').format(date);
//     int day = date.day;
//     String month = lebaneseMonths[date.month - 1];
//     int year = date.year;
//     return "$weekday، $day $month $year";
//   }

//   String getHijriDate(DateTime date) {
//     HijriCalendar.setLocal("ar");
//     final hijri = HijriCalendar.fromDate(date.toLocal());
//     return "${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear} هـ";
//   }

//   Future<void> fetchPrayerTimes() async {
//     setState(() {
//       loading = true;
//       error = '';
//     });

//     try {
//       final url = Uri.parse(
//         'https://api.aladhan.com/v1/timingsByCity?city=$selectedCity&country=Lebanon&method=0&school=1',
//       );

//       final response = await http.get(url);
//       if (response.statusCode != 200) {
//         throw Exception('فشل في تحميل البيانات: ${response.statusCode}');
//       }

//       final data = json.decode(response.body);
//       final timings = Map<String, String>.from(data['data']['timings']);

//       String adjustTime(String time, int minutes) {
//         final parts = time.split(':');
//         final hour = int.parse(parts[0]);
//         final minute = int.parse(parts[1]);
//         final original = DateTime(0, 1, 1, hour, minute);
//         final adjusted = original.add(Duration(minutes: minutes));
//         return '${adjusted.hour.toString().padLeft(2, '0')}:${adjusted.minute.toString().padLeft(2, '0')}';
//       }

//       if (selectedCity == 'Beirut') {
//         timings['Imsak'] = adjustTime(timings['Imsak']!, -2);
//         timings['Asr'] = adjustTime(timings['Asr']!, -76);
//         timings['Maghrib'] = adjustTime(timings['Maghrib']!, 3);
//         timings['Isha'] = adjustTime(timings['Isha']!, 6);
//         timings['Midnight'] = adjustTime(timings['Midnight']!, -46);
//       }

//       final labels = {
//         'Imsak': 'الإمساك',
//         'Fajr': 'صلاة الصبح',
//         'Sunrise': 'الشروق',
//         'Dhuhr': 'الظهر',
//         'Asr': 'العصر',
//         'Maghrib': 'المغرب',
//         'Isha': 'العشاء',
//         'Midnight': 'منتصف الليل',
//       };

//       final Map<String, String> namedTimings = {
//         for (final e in timings.entries)
//           if (labels.containsKey(e.key)) labels[e.key]!: e.value,
//       };

//       final orderedKeys = [
//         'الإمساك',
//         'صلاة الصبح',
//         'الشروق',
//         'الظهر',
//         'العصر',
//         'المغرب',
//         'العشاء',
//         'منتصف الليل',
//       ];

//       final List<PrayerTime> list = orderedKeys
//           .where((key) => namedTimings.containsKey(key))
//           .map((key) => PrayerTime(key, namedTimings[key]!))
//           .toList();

//       await saveToCache(list);
//       setState(() {
//         timingList = list;
//       });

//       if (notificationsEnabled) {
//         schedulePrayerNotifications(list);
//       }
//     } catch (e) {
//       setState(() {
//         error = e.toString();
//       });
//     } finally {
//       setState(() {
//         loading = false;
//       });
//     }
//   }

//   void schedulePrayerNotifications(List<PrayerTime> list) async {
//     await notificationsPlugin.cancelAll();

//     for (final prayer in list) {
//       final timeParts = prayer.time.split(':');
//       final hour = int.parse(timeParts[0]);
//       final minute = int.parse(timeParts[1]);
//       final now = DateTime.now();
//       final prayerTime = DateTime(now.year, now.month, now.day, hour, minute);

//       if (prayerTime.isAfter(now)) {
//         await notificationsPlugin.zonedSchedule(
//           list.indexOf(prayer), // ID فريد للإشعار
//           'موعد ${prayer.name}', // العنوان
//           'حان الآن وقت ${prayer.name}', // المحتوى
//           tz.TZDateTime.from(prayerTime, tz.local), // وقت الإشعار
//           const NotificationDetails(
//             android: AndroidNotificationDetails(
//               'prayer_channel', // channel ID
//               'مواقيت الصلاة', // channel name
//               channelDescription: 'تنبيهات مواقيت الصلاة',
//               importance: Importance.max,
//               priority: Priority.high,
//             ),
//           ),
//           androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
//           matchDateTimeComponents: DateTimeComponents.time,
//         );
//       }
//     }
//   }

//   Future<void> saveToCache(List<PrayerTime> list) async {
//     final prefs = await SharedPreferences.getInstance();
//     final encoded = jsonEncode(list.map((e) => e.toJson()).toList());
//     await prefs.setString('cached_prayer_times', encoded);
//   }

//   Future<void> loadFromCache() async {
//     final prefs = await SharedPreferences.getInstance();
//     final data = prefs.getString('cached_prayer_times');
//     if (data != null) {
//       final List parsed = jsonDecode(data);
//       final list = parsed.map((e) => PrayerTime.fromJson(e)).toList();
//       setState(() => timingList = List<PrayerTime>.from(list));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final isTablet = screenWidth >= 600;
//     final today = DateTime.now();

//     if (timingList == null && error.isEmpty) {
//       return Center(child: CircularProgressIndicator());
//     }

//     if (error.isNotEmpty) {
//       return Center(
//         child: Text('خطأ: $error', textAlign: TextAlign.center),
//       );
//     }

//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: isTablet ? 10 : 5),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 formatLebaneseDate(today),
//                 style: TextStyle(
//                   fontSize: isTablet ? 24 : 12,
//                   fontWeight: FontWeight.w900,
//                   fontFamily: 'Tajawal',
//                 ),
//               ),
//               Text(
//                 getHijriDate(today),
//                 style: TextStyle(
//                   fontSize: isTablet ? 24 : 12,
//                   fontWeight: FontWeight.w900,
//                   fontFamily: 'Tajawal',
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: loading
//               ? Center(child: CircularProgressIndicator())
//               : timingList == null
//                   ? Center(child: Text('لا توجد بيانات حالياً'))
//                   : ListView.builder(
//                       itemCount: timingList!.length,
//                       itemBuilder: (context, index) {
//                         final item = timingList![index];
//                         return Card(
//                           color: Colors.white,
//                           margin: EdgeInsets.all(isTablet ? 5 : 2),
//                           child: ListTile(
//                             leading: IconButton(
//                               icon: Icon(
//                                 notificationsEnabled
//                                     ? Icons.notifications_active
//                                     : Icons.notifications_off,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   notificationsEnabled = !notificationsEnabled;
//                                 });
//                                 if (notificationsEnabled &&
//                                     timingList != null) {
//                                   schedulePrayerNotifications(timingList!);
//                                 } else {
//                                   notificationsPlugin.cancelAll();
//                                 }
//                               },
//                             ),
//                             title: Text(
//                               item.name,
//                               style: TextStyle(
//                                 fontSize: isTablet ? 30 : 16,
//                                 fontFamily: 'Tajawal',
//                               ),
//                             ),
//                             trailing: Text(
//                               item.time,
//                               style: TextStyle(
//                                 fontSize: isTablet ? 30 : 16,
//                                 fontFamily: 'Tajawal',
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(
//             horizontal: isTablet ? 10 : 5,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               DropdownButton<String>(
//                 value: selectedCity,
//                 padding: EdgeInsets.only(
//                   right: 10,
//                 ),
//                 iconSize: isTablet ? 40 : 20,
//                 items: cities.map((city) {
//                   return DropdownMenuItem<String>(
//                     value: city,
//                     alignment: AlignmentDirectional.center,
//                     child: Text(
//                       city,
//                       style: TextStyle(
//                         fontFamily: 'Tajawal',
//                         fontSize: isTablet ? 30 : 14,
//                       ),
//                     ),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     setState(() {
//                       selectedCity = value;
//                     });
//                     fetchPrayerTimes();
//                   }
//                 },
//               ),
//               IconButton(
//                 icon: Icon(
//                   Icons.refresh,
//                   size: isTablet ? 40 : 20,
//                 ),
//                 onPressed: fetchPrayerTimes,
//               ),
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }

// class PrayerTime {
//   final String name;
//   final String time;

//   PrayerTime(this.name, this.time);

//   Map<String, dynamic> toJson() => {'name': name, 'time': time};

//   static PrayerTime fromJson(Map<String, dynamic> json) =>
//       PrayerTime(json['name'], json['time']);
// }
import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:android_intent_plus/flag.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
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

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

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
    initNotifications();
    checkAndRequestExactAlarm(); // ✅ فتح الإعدادات فقط أول مرة
    loadNotificationPreferences().then((_) {
      loadFromCache().then((_) => fetchPrayerTimes());
    });
  }

  Future<void> checkAndRequestExactAlarm() async {
    final prefs = await SharedPreferences.getInstance();
    final alreadyOpened = prefs.getBool('alarm_permission_opened') ?? false;

    if (!alreadyOpened) {
      openExactAlarmSettings();
      await prefs.setBool('alarm_permission_opened', true);
    }
  }

  void openExactAlarmSettings() {
    if (Platform.isAndroid) {
      final intent = AndroidIntent(
        action: 'android.settings.REQUEST_SCHEDULE_EXACT_ALARM',
        flags: <int>[Flag.FLAG_ACTIVITY_NEW_TASK],
      );
      intent.launch();
    }
  }

  Future<void> initNotifications() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Asia/Beirut'));

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await notificationsPlugin.initialize(initializationSettings);
  }

  Future<void> loadNotificationPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final storedPrefs = prefs.getString('prayer_notifications');
    if (storedPrefs != null) {
      final Map<String, dynamic> jsonMap = jsonDecode(storedPrefs);
      enabledNotificationsPerPrayer = {
        for (var e in jsonMap.entries) e.key: e.value == true
      };
    }
  }

  Future<void> saveNotificationPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'prayer_notifications', jsonEncode(enabledNotificationsPerPrayer));
  }

  String formatLebaneseDate(DateTime date) {
    const lebaneseMonths = [
      "كانون الثاني",
      "شباط",
      "آذار",
      "نيسان",
      "أيار",
      "حزيران",
      "تموز",
      "آب",
      "أيلول",
      "تشرين الأول",
      "تشرين الثاني",
      "كانون الأول"
    ];
    String weekday = DateFormat('EEEE', 'ar').format(date);
    int day = date.day;
    String month = lebaneseMonths[date.month - 1];
    int year = date.year;
    return "$weekday، $day $month $year";
  }

  String getHijriDate(DateTime date) {
    HijriCalendar.setLocal("ar");
    final hijri = HijriCalendar.fromDate(date.toLocal());
    return "${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear} هـ";
  }

  Future<void> fetchPrayerTimes() async {
    setState(() {
      loading = true;
      error = '';
    });

    try {
      final url = Uri.parse(
        'https://api.aladhan.com/v1/timingsByCity?city=$selectedCity&country=Lebanon&method=0&school=1',
      );

      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw Exception('فشل في تحميل البيانات: ${response.statusCode}');
      }

      final data = json.decode(response.body);
      final timings = Map<String, String>.from(data['data']['timings']);

      String adjustTime(String time, int minutes) {
        final parts = time.split(':');
        final hour = int.parse(parts[0]);
        final minute = int.parse(parts[1]);
        final original = DateTime(0, 1, 1, hour, minute);
        final adjusted = original.add(Duration(minutes: minutes));
        return '${adjusted.hour.toString().padLeft(2, '0')}:${adjusted.minute.toString().padLeft(2, '0')}';
      }

      timings['Imsak'] = adjustTime(timings['Imsak']!, -2);
      timings['Asr'] = adjustTime(timings['Asr']!, -76);
      timings['Maghrib'] = adjustTime(timings['Maghrib']!, 3);
      timings['Isha'] = adjustTime(timings['Isha']!, 6);
      timings['Midnight'] = adjustTime(timings['Midnight']!, -46);

      final labels = {
        'Imsak': 'الإمساك',
        'Fajr': 'صلاة الصبح',
        'Sunrise': 'الشروق',
        'Dhuhr': 'الظهر',
        'Asr': 'العصر',
        'Maghrib': 'المغرب',
        'Isha': 'العشاء',
        'Midnight': 'منتصف الليل',
      };

      final Map<String, String> namedTimings = {
        for (final e in timings.entries)
          if (labels.containsKey(e.key)) labels[e.key]!: e.value,
      };

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
          .where((key) => namedTimings.containsKey(key))
          .map((key) => PrayerTime(key, namedTimings[key]!))
          .toList();

      await saveToCache(list);
      setState(() {
        timingList = list;
      });

      schedulePrayerNotifications(list);
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void schedulePrayerNotifications(List<PrayerTime> list) async {
    await notificationsPlugin.cancelAll();

    for (final prayer in list) {
      final isEnabled = enabledNotificationsPerPrayer[prayer.name] ?? false;
      if (!isEnabled) continue;

      final timeParts = prayer.time.split(':');
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);
      final now = DateTime.now();
      final prayerTime = DateTime(now.year, now.month, now.day, hour, minute);

      if (prayerTime.isAfter(now)) {
        await notificationsPlugin.zonedSchedule(
          list.indexOf(prayer),
          'موعد ${prayer.name}',
          'حان الآن وقت ${prayer.name}',
          tz.TZDateTime.from(prayerTime, tz.local),
          NotificationDetails(
            android: AndroidNotificationDetails(
              'prayer_channel',
              'مواقيت الصلاة',
              channelDescription: 'تنبيهات مواقيت الصلاة',
              importance: Importance.max,
              priority: Priority.high,
              playSound: true,
              sound: RawResourceAndroidNotificationSound('azan'),
            ),
          ),
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          matchDateTimeComponents: DateTimeComponents.time,
        );
      }
    }
  }

  Future<void> saveToCache(List<PrayerTime> list) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(list.map((e) => e.toJson()).toList());
    await prefs.setString('cached_prayer_times', encoded);
  }

  Future<void> loadFromCache() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('cached_prayer_times');
    if (data != null) {
      final List parsed = jsonDecode(data);
      final list = parsed.map((e) => PrayerTime.fromJson(e)).toList();
      setState(() => timingList = List<PrayerTime>.from(list));
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final today = DateTime.now();

    if (timingList == null && error.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    if (error.isNotEmpty) {
      return Center(
        child: Text('خطأ: $error', textAlign: TextAlign.center),
      );
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 10 : 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatLebaneseDate(today),
                style: TextStyle(
                  fontSize: isTablet ? 24 : 12,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Tajawal',
                ),
              ),
              Text(
                getHijriDate(today),
                style: TextStyle(
                  fontSize: isTablet ? 24 : 12,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Tajawal',
                ),
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
                          color: Colors.white,
                          margin: EdgeInsets.all(isTablet ? 5 : 2),
                          child: ListTile(
                            leading: IconButton(
                              icon: Icon(
                                enabledNotificationsPerPrayer[item.name] == true
                                    ? Icons.notifications_active
                                    : Icons.notifications_off,
                                color:
                                    enabledNotificationsPerPrayer[item.name] ==
                                            true
                                        ? Colors.green
                                        : Colors.grey,
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
                                  schedulePrayerNotifications(timingList!);
                                }
                              },
                            ),
                            title: Text(
                              item.name,
                              style: TextStyle(
                                fontSize: isTablet ? 30 : 16,
                                fontFamily: 'Tajawal',
                              ),
                            ),
                            trailing: Text(
                              item.time,
                              style: TextStyle(
                                fontSize: isTablet ? 30 : 16,
                                fontFamily: 'Tajawal',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 10 : 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                value: selectedCity,
                padding: EdgeInsets.only(right: 10),
                iconSize: isTablet ? 40 : 20,
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
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      selectedCity = value;
                    });
                    fetchPrayerTimes();
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.refresh, size: isTablet ? 40 : 20),
                onPressed: fetchPrayerTimes,
              ),
            ],
          ),
        )
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
