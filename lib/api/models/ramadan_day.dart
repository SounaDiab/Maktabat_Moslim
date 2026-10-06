class RamadanDay {
  final int day;
  final String weekday;
  final String gregorianDate; // التاريخ الميلادي
  final String hijriDate; // التاريخ الهجري
  final String imsak; // وقت الإمساك
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String maghrib;

  RamadanDay({
    required this.day,
    required this.weekday,
    required this.gregorianDate,
    required this.hijriDate,
    required this.imsak,
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.maghrib,
  });

  factory RamadanDay.fromJson(Map<String, dynamic> json) {
    return RamadanDay(
      day: json['day'],
      weekday: json['weekday'],
      gregorianDate: json['gregorianDate'],
      hijriDate: json['hijriDate'],
      imsak: json['imsak'],
      fajr: json['fajr'],
      sunrise: json['sunrise'],
      dhuhr: json['dhuhr'],
      maghrib: json['maghrib'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'weekday': weekday,
      'gregorianDate': gregorianDate,
      'hijriDate': hijriDate,
      'imsak': imsak,
      'fajr': fajr,
      'sunrise': sunrise,
      'dhuhr': dhuhr,
      'maghrib': maghrib,
    };
  }
}
