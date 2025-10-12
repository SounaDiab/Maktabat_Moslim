class AlhakibaAlramadaneyaModel {
  final int id;
  final String title;
  final List<AlhakibaSection> index;

  AlhakibaAlramadaneyaModel({
    required this.id,
    required this.title,
    required this.index,
  });

  factory AlhakibaAlramadaneyaModel.fromJson(Map<String, dynamic> json) {
    return AlhakibaAlramadaneyaModel(
      id: json['id'],
      title: json['title'],
      index: (json['index'] as List)
          .map((e) => AlhakibaSection.fromJson(e))
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

class AlhakibaSection {
  final int id;
  final String title;

  // محتويات
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
  final String? thirteenthContent;
  final String? fourteenthContent;
  final String? fifteenthContent;
  final String? sixteenthContent;
  final String? seventeenthContent;
  final String? eighteenthContent;
  final String? nineteenthContent;

  // العناوين الفرعية
  final String? subtitle;
  final String? secondSubtitle;
  final String? thirdSubtitle;
  final String? fourthSubtitle;
  final String? fifthSubtitle;
  final String? sixthSubtitle;
  final String? seventhSubtitle;
  final String? eighthSubtitle;
  final String? ninthSubtitle;
  final String? tenthSubtitle;
  final String? eleventhSubtitle;
  final String? twelfthSubtitle;
  final String? thirteenthSubtitle;
  final String? fourteenthSubtitle;
  final String? fifteenthSubtitle;
  final String? sixteenthSubtitle;
  final String? seventeenthSubtitle;
  final String? eighteenthSubtitle;
  final String? nineteenthSubtitle;
  final String? she3er;

  AlhakibaSection({
    required this.id,
    required this.title,
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
    this.thirteenthContent,
    this.fourteenthContent,
    this.fifteenthContent,
    this.sixteenthContent,
    this.seventeenthContent,
    this.eighteenthContent,
    this.nineteenthContent,
    this.subtitle,
    this.secondSubtitle,
    this.thirdSubtitle,
    this.fourthSubtitle,
    this.fifthSubtitle,
    this.sixthSubtitle,
    this.seventhSubtitle,
    this.eighthSubtitle,
    this.ninthSubtitle,
    this.tenthSubtitle,
    this.eleventhSubtitle,
    this.twelfthSubtitle,
    this.thirteenthSubtitle,
    this.fourteenthSubtitle,
    this.fifteenthSubtitle,
    this.sixteenthSubtitle,
    this.seventeenthSubtitle,
    this.eighteenthSubtitle,
    this.nineteenthSubtitle,
    this.she3er,
  });

  factory AlhakibaSection.fromJson(Map<String, dynamic> json) {
    return AlhakibaSection(
      id: json['id'],
      title: json['title'],
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
      thirteenthContent: json['thirteenthContent'],
      fourteenthContent: json['fourteenthContent'],
      fifteenthContent: json['fifteenthContent'],
      sixteenthContent: json['sixteenthContent'],
      seventeenthContent: json['seventeenthContent'],
      eighteenthContent: json['eighteenthContent'],
      nineteenthContent: json['nineteenthContent'],
      subtitle: json['subtitle'],
      secondSubtitle: json['secondSubtitle'],
      thirdSubtitle: json['thirdSubtitle'],
      fourthSubtitle: json['fourthSubtitle'],
      fifthSubtitle: json['fifthSubtitle'],
      sixthSubtitle: json['sixthSubtitle'],
      seventhSubtitle: json['seventhSubtitle'],
      eighthSubtitle: json['eighthSubtitle'],
      ninthSubtitle: json['ninthSubtitle'],
      tenthSubtitle: json['tenthSubtitle'],
      eleventhSubtitle: json['eleventhSubtitle'],
      twelfthSubtitle: json['twelfthSubtitle'],
      thirteenthSubtitle: json['thirteenthSubtitle'],
      fourteenthSubtitle: json['fourteenthSubtitle'],
      fifteenthSubtitle: json['fifteenthSubtitle'],
      sixteenthSubtitle: json['sixteenthSubtitle'],
      seventeenthSubtitle: json['seventeenthSubtitle'],
      eighteenthSubtitle: json['eighteenthSubtitle'],
      nineteenthSubtitle: json['nineteenthSubtitle'],
      she3er: json['she3er'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
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
      'thirteenthContent': thirteenthContent,
      'fourteenthContent': fourteenthContent,
      'fifteenthContent': fifteenthContent,
      'sixteenthContent': sixteenthContent,
      'seventeenthContent': seventeenthContent,
      'eighteenthContent': eighteenthContent,
      'nineteenthContent': nineteenthContent,
      'subtitle': subtitle,
      'secondSubtitle': secondSubtitle,
      'thirdSubtitle': thirdSubtitle,
      'fourthSubtitle': fourthSubtitle,
      'fifthSubtitle': fifthSubtitle,
      'sixthSubtitle': sixthSubtitle,
      'seventhSubtitle': seventhSubtitle,
      'eighthSubtitle': eighthSubtitle,
      'ninthSubtitle': ninthSubtitle,
      'tenthSubtitle': tenthSubtitle,
      'eleventhSubtitle': eleventhSubtitle,
      'twelfthSubtitle': twelfthSubtitle,
      'thirteenthSubtitle': thirteenthSubtitle,
      'fourteenthSubtitle': fourteenthSubtitle,
      'fifteenthSubtitle': fifteenthSubtitle,
      'sixteenthSubtitle': sixteenthSubtitle,
      'seventeenthSubtitle': seventeenthSubtitle,
      'eighteenthSubtitle': eighteenthSubtitle,
      'nineteenthSubtitle': nineteenthSubtitle,
      'she3er': she3er,
    };
  }
}
