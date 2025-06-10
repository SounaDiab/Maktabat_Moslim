import 'package:flutter/material.dart';
import 'package:adhan/adhan.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class PrayerTimeWidget extends StatefulWidget {
  @override
  State<PrayerTimeWidget> createState() => _PrayerTimeWidgetState();
}

class _PrayerTimeWidgetState extends State<PrayerTimeWidget> {
  // String _dateText = "جاري تحديد التاريخ...";

  // @override
  // void initState() {
  //   super.initState();
  //   _loadLocalizedDate();
  // }

  // Future<void> _loadLocalizedDate() async {
  //   try {
  //     // الحصول على موقع المستخدم
  //     Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.best,
  //     );
  //     List<Placemark> placemarks = await placemarkFromCoordinates(
  //       position.latitude,
  //       position.longitude,
  //     );

  //     final String country = placemarks.first.country ?? "";

  //     final DateTime now = DateTime.now();
  //     final String formatted =
  //         country.contains("Lebanon") || country.contains("لبنان")
  //             ? formatLebaneseDate(now)
  //             : formatArabicDate(now);

  //     setState(() {
  //       _dateText = formatted;
  //     });
  //   } catch (e) {
  //     setState(() {
  //       _dateText = "تعذر تحديد الموقع.";
  //     });
  //   }
  // }

  final Coordinates coordinates = Coordinates(33.8938, 35.5018);
  // بيروت
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

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final params = CalculationMethod.tehran.getParameters();
    params.madhab = Madhab.shafi;
    final today = DateTime.now();
    final prayerTimes = PrayerTimes.today(coordinates, params);

    final delayeSobeh = prayerTimes.fajr.add(Duration(minutes: 10));
    final delayeIsha = prayerTimes.isha.add(Duration(minutes: 6));
    final delaySunrise = prayerTimes.sunrise.add(Duration(minutes: 1));
    final fajerSadik = prayerTimes.fajr.subtract(Duration(minutes: 8));
    final differenceFajrAndMaghrib =
        fajerSadik.difference(prayerTimes.maghrib) ~/ 2;
    final montasafLail = prayerTimes.maghrib.add(differenceFajrAndMaghrib);

    final times = {
      "الإمساك": formatTime(prayerTimes.fajr),
      "صلاة الصبح": formatTime(delayeSobeh),
      "الشروق": formatTime(delaySunrise),
      "الظهر": formatTime(prayerTimes.dhuhr),
      "العصر": formatTime(prayerTimes.asr),
      "المغرب": formatTime(prayerTimes.maghrib),
      "العشاء": formatTime(delayeIsha),
      "منتصف الليل": formatTime(montasafLail),
    };

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 20 : 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formatLebaneseDate(today),
                style: TextStyle(
                  fontSize: isTablet ? 24 : 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tajawal',
                ),
              ),
              Text(
                getHijriDate(today),
                style: TextStyle(
                  fontSize: isTablet ? 24 : 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Tajawal',
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: times.length,
            itemBuilder: (context, index) {
              String name = times.keys.elementAt(index);
              String time = times[name]!;
              return Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    name,
                    style: TextStyle(
                      fontSize: isTablet ? 30 : 16,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                  trailing: Text(
                    time,
                    style: TextStyle(
                      fontSize: isTablet ? 30 : 16,
                      fontFamily: 'Tajawal',
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

// ! // Prayer Time Widget for Shia Muslims from Api Aladhan
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class PrayerTimeWidget extends StatefulWidget {
//   @override
//   _PrayerTimeWidgetState createState() => _PrayerTimeWidgetState();
// }

// class _PrayerTimeWidgetState extends State<PrayerTimeWidget> {
//   Map<String, dynamic> prayerTimes = {};
//   String status = "جاري تحميل المواقيت...";

//   @override
//   void initState() {
//     super.initState();
//     fetchPrayerTimes();
//   }

//   Future<void> fetchPrayerTimes() async {
//     try {
//       // الحصول على الموقع الحالي
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low,
//       );

//       double lat = position.latitude;
//       double lon = position.longitude;

//       final now = DateTime.now();
//       final url =
//           'https://api.aladhan.com/v1/timings/${now.millisecondsSinceEpoch ~/ 1000}?latitude=$lat&longitude=$lon&method=0';

//       final response = await http.get(Uri.parse(url));

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         setState(() {
//           prayerTimes = data['data']['timings'];
//           status = "تم جلب المواقيت بنجاح.";
//         });
//       } else {
//         setState(() {
//           status = "فشل في جلب البيانات.";
//         });
//       }
//     } catch (e) {
//       setState(() {
//         status = "حدث خطأ: $e";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("مواقيت الصلاة - المذهب الشيعي")),
//       body: Center(
//         child: prayerTimes.isEmpty
//             ? Text(status)
//             : ListView(
//                 padding: EdgeInsets.all(20),
//                 children: prayerTimes.entries.map((entry) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 8.0),
//                     child: Text("${entry.key}: ${entry.value}",
//                         style: TextStyle(fontSize: 20)),
//                   );
//                 }).toList(),
//               ),
//       ),
//     );
//   }
// }
