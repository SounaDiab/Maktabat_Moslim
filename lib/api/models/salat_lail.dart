class SalatLailModel {
  final int id;
  final String title;
  final String? content;
  final String? twoContent;
  final String? threeContent;
  final String? fourContent;
  final String? subtitle;
  final String? twoSubtitle;
  final String? threeSubtitle;
  final String? fourSubtitle;

  SalatLailModel({
    required this.id,
    required this.title,
    required this.content,
    required this.twoContent,
    required this.threeContent,
    required this.fourContent,
    required this.subtitle,
    required this.twoSubtitle,
    required this.threeSubtitle,
    required this.fourSubtitle,
  });

  factory SalatLailModel.fromJson(Map<String, dynamic> json) {
    return SalatLailModel(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      twoContent: json['twoContent'],
      threeContent: json['threeContent'],
      fourContent: json['fourContent'],
      subtitle: json['subtitle'],
      twoSubtitle: json['twoSubtitle'],
      threeSubtitle: json['threeSubtitle'],
      fourSubtitle: json['fourSubtitle'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'twoContent': twoContent,
      'threeContent': threeContent,
      'fourContent': fourContent,
      'subtitle': subtitle,
      'twoSubtitle': twoSubtitle,
      'threeSubtitle': threeSubtitle,
      'fourSubtitle': fourSubtitle,
    };
  }
}
