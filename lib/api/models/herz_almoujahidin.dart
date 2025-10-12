// ignore_for_file: public_member_api_docs, sort_constructors_first
class HerzAlmoujahidinModel {
  final int id;
  final String title;
  final String? beforContent;
  final String? beforSecondContent;
  final String? content;
  final String? secondContent;
  final String? thirdContent;
  final String? fourthContent;
  final String? fifthContent;
  final String? sixthContent;
  final String? seventhContent;
  final String? eighthContent;
  final String? ninthContent;
  final String? tenthContent;
  final String? eleventhContent;
  final String? twelfthContent;
  final List<A3malSection> index;

  HerzAlmoujahidinModel({
    required this.id,
    required this.title,
    this.beforContent,
    this.beforSecondContent,
    this.content,
    this.secondContent,
    this.thirdContent,
    this.fourthContent,
    this.fifthContent,
    this.sixthContent,
    this.seventhContent,
    this.eighthContent,
    this.ninthContent,
    this.tenthContent,
    this.eleventhContent,
    this.twelfthContent,
    this.index = const [],
  });

  factory HerzAlmoujahidinModel.fromJson(Map<String, dynamic> json) {
    return HerzAlmoujahidinModel(
      id: json['id'],
      title: json['title'],
      beforContent: json['beforContent'],
      beforSecondContent: json['beforSecondContent'],
      content: json['content'],
      secondContent: json['secondContent'],
      thirdContent: json['thirdContent'],
      fourthContent: json['fourthContent'],
      fifthContent: json['fifthContent'],
      sixthContent: json['sixthContent'],
      seventhContent: json['seventhContent'],
      eighthContent: json['eighthContent'],
      ninthContent: json['ninthContent'],
      tenthContent: json['tenthContent'],
      eleventhContent: json['eleventhContent'],
      twelfthContent: json['twelfthContent'],
      index: json['index'] != null
          ? (json['index'] as List<dynamic>)
              .map((e) => A3malSection.fromJson(e))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'beforContent': beforContent,
      'beforSecondContent': beforSecondContent,
      'content': content,
      'secondContent': secondContent,
      'thirdContent': thirdContent,
      'fourthContent': fourthContent,
      'fifthContent': fifthContent,
      'sixthContent': sixthContent,
      'seventhContent': seventhContent,
      'eighthContent': eighthContent,
      'ninthContent': ninthContent,
      'tenthContent': tenthContent,
      'eleventhContent': eleventhContent,
      'twelfthContent': twelfthContent,
      'index': index.map((e) => e.toJson()).toList(),
    };
  }
}

class A3malSection {
  final int id;
  final String title;
  final String? content;
  final String? secondContent;
  final String? thirdContent;

  A3malSection({
    required this.id,
    required this.title,
    this.content,
    this.secondContent,
    this.thirdContent,
  });

  factory A3malSection.fromJson(Map<String, dynamic> json) {
    return A3malSection(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      secondContent: json['secondContent'],
      thirdContent: json['thirdContent'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'secondContent': secondContent,
      'thirdContent': thirdContent,
    };
  }
}
