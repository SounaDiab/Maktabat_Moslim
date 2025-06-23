import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrayerTimeWidget extends StatefulWidget {
  @override
  _PrayerTimeWidgetState createState() => _PrayerTimeWidgetState();
}

class _PrayerTimeWidgetState extends State<PrayerTimeWidget> {
  Map<String, String>? times;
  List<PrayerTime>? timingList;
  String error = '';
  bool loading = false;

  @override
  void initState() {
    super.initState();
    loadFromCache().then((_) => fetchPrayerTimes());
  }

  String formatTime(DateTime time) {
    return DateFormat('hh:mm a').format(time);
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

    String weekday = DateFormat('EEEE', 'ar').format(date); // مثل: الأحد
    int day = date.day;
    String month = lebaneseMonths[date.month - 1];
    int year = date.year;

    return "$weekday، $day $month $year";
  }

  String formatArabicDate(DateTime date) {
    String weekday = DateFormat('EEEE', 'ar').format(date); // مثل: الأحد
    int day = date.day;
    String month =
        '${date.month}'; // يمكنك استخدام اسم الشهر باللغة العربية إذا كنت ترغب في ذلك
    int year = date.year;

    return "$weekday، $day $month $year";
  }

  String getHijriDate(DateTime date) {
    HijriCalendar.setLocal("ar");
    final hijri = HijriCalendar.fromDate(date.toLocal());
    // final hijri = HijriCalendar.fromDate(date.subtract(Duration(days: 1)));
    return "${hijri.hDay} ${hijri.longMonthName} ${hijri.hYear} هـ";
  }

  Future<void> fetchPrayerTimes() async {
    setState(() {
      loading = true;
      error = '';
    });

    try {
      final url = Uri.parse(
        'https://api.aladhan.com/v1/timingsByCity?city=Beirut&country=Lebanon&method=0&school=1',
      );

      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('فشل في تحميل البيانات: ${response.statusCode}');
      }

      final data = json.decode(response.body);
      final timings = data['data']['timings'] as Map<String, dynamic>;
      String adjustTime(String time, int minutes) {
        final parts = time.split(':');
        final hour = int.parse(parts[0]);
        final minute = int.parse(parts[1]);
        final original = DateTime(0, 1, 1, hour, minute);
        final adjusted = original.add(Duration(minutes: minutes));
        return '${adjusted.hour.toString().padLeft(2, '0')}:${adjusted.minute.toString().padLeft(2, '0')}';
      }

      timings['Imsak'] = adjustTime(timings['Imsak'], -2);
      timings['Asr'] = adjustTime(timings['Asr'], -76);
      timings['Maghrib'] = adjustTime(timings['Maghrib'], 3);
      timings['Isha'] = adjustTime(timings['Isha'], 6);
      timings['Midnight'] = adjustTime(timings['Midnight'], -46);

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

// ترتيب يدوي للمواقيت
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
              IconButton(
                icon: Icon(
                  Icons.refresh,
                  size: isTablet ? 40 : 20,
                ),
                onPressed: fetchPrayerTimes,
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
                      padding: EdgeInsets.all(16),
                      itemCount: timingList!.length,
                      itemBuilder: (context, index) {
                        final item = timingList![index];
                        return Card(
                          color: Colors.white,
                          margin: EdgeInsets.all(isTablet ? 5 : 2),
                          child: ListTile(
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
