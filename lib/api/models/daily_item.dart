class DailyItem {
  final int id;
  final int? month;
  final int? day;
  final int? moon_month;
  final int? moon_day;
  final String title;
  final String text;
  final String? image;

  DailyItem({
    required this.id,
    this.month,
    this.day,
    this.moon_month,
    this.moon_day,
    required this.title,
    required this.text,
    this.image,
  });

  String? get imageUrl {
    if (image == null) return null;

    // تحويل raw.githubusercontent.com إلى cdn.jsdelivr.net
    if (image!.contains('raw.githubusercontent.com')) {
      return image!
          .replaceAll('raw.githubusercontent.com', 'cdn.jsdelivr.net/gh')
          .replaceAll('/master/', '@master/');
    }
    return image;
  }

  factory DailyItem.fromJson(Map<String, dynamic> json) {
    return DailyItem(
      id: json['id'],
      month: json['month'],
      day: json['day'],
      moon_month: json['moon_month'],
      moon_day: json['moon_day'],
      title: json['title'],
      text: json['text'],
      image: json['image'],
    );
  }
}
