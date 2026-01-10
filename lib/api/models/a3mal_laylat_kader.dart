class A3malLaylatKader {
  final int id;
  final String title;
  final List<A3malSectionn> index;

  A3malLaylatKader({
    required this.id,
    required this.title,
    required this.index,
  });

  factory A3malLaylatKader.fromJson(Map<String, dynamic> json) {
    return A3malLaylatKader(
      id: json['id'],
      title: json['title'],
      index: (json['index'] as List<dynamic>)
          .map((e) => A3malSectionn.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'index': index.map((e) => e.toJson()).toList(),
    };
  }
}

class A3malSectionn {
  final int id;
  final String title;
  final String? subtitle;
  final String? content; // نصوص أو سور قرآنية
  final String? subContent;
  final String? secondSubContent;
  final String? secondSubtitle;
  final String? thirdSubtitle;
  final String? fourthSubtitle;
  final String? secondContent;
  final String? thirdContent;
  final String? fourthContent;
  final String? souContent;

  A3malSectionn({
    required this.id,
    required this.title,
    this.subtitle,
    this.secondSubtitle,
    this.thirdSubtitle,
    this.fourthSubtitle,
    this.content,
    this.secondContent,
    this.thirdContent,
    this.fourthContent,
    this.subContent,
    this.secondSubContent,
    this.souContent,
  });

  factory A3malSectionn.fromJson(Map<String, dynamic> json) {
    return A3malSectionn(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      secondSubtitle: json['secondSubtitle'],
      thirdSubtitle: json['thirdSubtitle'],
      fourthSubtitle: json['fourthSubtitle'],
      content: json['content'],
      secondContent: json['secondContent'],
      thirdContent: json['thirdContent'],
      fourthContent: json['fourthContent'],
      subContent: json['subContent'],
      secondSubContent: json['secondSubContent'],
      souContent: json['souContent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'secondSubtitle': secondSubtitle,
      'thirdSubtitle': thirdSubtitle,
      'fourthSubtitle': fourthSubtitle,
      'content': content,
      'secondContent': secondContent,
      'thirdContent': thirdContent,
      'fourthContent': fourthContent,
      'subContent': subContent,
      'secondSubContent': secondSubContent,
      'souContent': souContent,
    };
  }
}
