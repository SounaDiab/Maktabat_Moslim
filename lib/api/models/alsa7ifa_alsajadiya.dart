class Alsa7ifaAlsajadiyaModel {
  final int id;
  final String title;
  final List<Sa7ifaSection> index;

  Alsa7ifaAlsajadiyaModel({
    required this.id,
    required this.title,
    required this.index,
  });

  factory Alsa7ifaAlsajadiyaModel.fromJson(Map<String, dynamic> json) {
    return Alsa7ifaAlsajadiyaModel(
      id: json['id'],
      title: json['title'],
      index: (json['index'] as List<dynamic>)
          .map((e) => Sa7ifaSection.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'index': index.map((e) => e.toJson()).toList(),
      };
}

// todo ////////////////////////////////////////////////////////////

class Sa7ifaSection {
  final int id;
  final String title;

  final String? souTitle;
  // Content 1..25
  final String? content;
  final String? twoContent;
  final String? threeContent;
  final String? fourContent;
  final String? fiveContent;
  final String? sixContent;
  final String? sevenContent;
  final String? eightContent;
  final String? nineContent;
  final String? tenContent;
  final String? elevenContent;
  final String? twelveContent;
  final String? thirteenContent;
  final String? fourteenContent;
  final String? fifteenContent;
  final String? sixteenContent;
  final String? seventeenContent;
  final String? eighteenContent;
  final String? nineteenContent;
  final String? twentyContent;
  final String? twentyOneContent;
  final String? twentyTwoContent;
  final String? twentyThreeContent;
  final String? twentyFourContent;
  final String? twentyFiveContent;

  // Subtitle 1..25
  final String? subtitle;
  final String? twoSubtitle;
  final String? threeSubtitle;
  final String? fourSubtitle;
  final String? fiveSubtitle;
  final String? sixSubtitle;
  final String? sevenSubtitle;
  final String? eightSubtitle;
  final String? nineSubtitle;
  final String? tenSubtitle;
  final String? elevenSubtitle;
  final String? twelveSubtitle;
  final String? thirteenSubtitle;
  final String? fourteenSubtitle;
  final String? fifteenSubtitle;
  final String? sixteenSubtitle;
  final String? seventeenSubtitle;
  final String? eighteenSubtitle;
  final String? nineteenSubtitle;
  final String? twentySubtitle;
  final String? twentyOneSubtitle;
  final String? twentyTwoSubtitle;
  final String? twentyThreeSubtitle;
  final String? twentyFourSubtitle;
  final String? twentyFiveSubtitle;

  // Tafsir 1..26
  final String? tafsir;
  final String? twoTafsir;
  final String? threeTafsir;
  final String? fourTafsir;
  final String? fiveTafsir;
  final String? sixTafsir;
  final String? sevenTafsir;
  final String? eightTafsir;
  final String? nineTafsir;
  final String? tenTafsir;
  final String? elevenTafsir;
  final String? twelveTafsir;
  final String? thirteenTafsir;
  final String? fourteenTafsir;
  final String? fifteenTafsir;
  final String? sixteenTafsir;
  final String? seventeenTafsir;
  final String? eighteenTafsir;
  final String? nineteenTafsir;
  final String? twentyTafsir;
  final String? twentyOneTafsir;
  final String? twentyTwoTafsir;
  final String? twentyThreeTafsir;
  final String? twentyFourTafsir;
  final String? twentyFiveTafsir;
  final String? twentySixTafsir;

  // Tafsir Title 1..26
  final String? tafsirTitle;
  final String? twoTafsirTitle;
  final String? threeTafsirTitle;
  final String? fourTafsirTitle;
  final String? fiveTafsirTitle;
  final String? sixTafsirTitle;
  final String? sevenTafsirTitle;
  final String? eightTafsirTitle;
  final String? nineTafsirTitle;
  final String? tenTafsirTitle;
  final String? elevenTafsirTitle;
  final String? twelveTafsirTitle;
  final String? thirteenTafsirTitle;
  final String? fourteenTafsirTitle;
  final String? fifteenTafsirTitle;
  final String? sixteenTafsirTitle;
  final String? seventeenTafsirTitle;
  final String? eighteenTafsirTitle;
  final String? nineteenTafsirTitle;
  final String? twentyTafsirTitle;
  final String? twentyOneTafsirTitle;
  final String? twentyTwoTafsirTitle;
  final String? twentyThreeTafsirTitle;
  final String? twentyFourTafsirTitle;
  final String? twentyFiveTafsirTitle;
  final String? twentySixTafsirTitle;

  Sa7ifaSection({
    required this.id,
    required this.title,
    this.souTitle,
    this.content,
    this.twoContent,
    this.threeContent,
    this.fourContent,
    this.fiveContent,
    this.sixContent,
    this.sevenContent,
    this.eightContent,
    this.nineContent,
    this.tenContent,
    this.elevenContent,
    this.twelveContent,
    this.thirteenContent,
    this.fourteenContent,
    this.fifteenContent,
    this.sixteenContent,
    this.seventeenContent,
    this.eighteenContent,
    this.nineteenContent,
    this.twentyContent,
    this.twentyOneContent,
    this.twentyTwoContent,
    this.twentyThreeContent,
    this.twentyFourContent,
    this.twentyFiveContent,
    this.subtitle,
    this.twoSubtitle,
    this.threeSubtitle,
    this.fourSubtitle,
    this.fiveSubtitle,
    this.sixSubtitle,
    this.sevenSubtitle,
    this.eightSubtitle,
    this.nineSubtitle,
    this.tenSubtitle,
    this.elevenSubtitle,
    this.twelveSubtitle,
    this.thirteenSubtitle,
    this.fourteenSubtitle,
    this.fifteenSubtitle,
    this.sixteenSubtitle,
    this.seventeenSubtitle,
    this.eighteenSubtitle,
    this.nineteenSubtitle,
    this.twentySubtitle,
    this.twentyOneSubtitle,
    this.twentyTwoSubtitle,
    this.twentyThreeSubtitle,
    this.twentyFourSubtitle,
    this.twentyFiveSubtitle,
    this.tafsir,
    this.twoTafsir,
    this.threeTafsir,
    this.fourTafsir,
    this.fiveTafsir,
    this.sixTafsir,
    this.sevenTafsir,
    this.eightTafsir,
    this.nineTafsir,
    this.tenTafsir,
    this.elevenTafsir,
    this.twelveTafsir,
    this.thirteenTafsir,
    this.fourteenTafsir,
    this.fifteenTafsir,
    this.sixteenTafsir,
    this.seventeenTafsir,
    this.eighteenTafsir,
    this.nineteenTafsir,
    this.twentyTafsir,
    this.twentyOneTafsir,
    this.twentyTwoTafsir,
    this.twentyThreeTafsir,
    this.twentyFourTafsir,
    this.twentyFiveTafsir,
    this.twentySixTafsir,
    this.tafsirTitle,
    this.twoTafsirTitle,
    this.threeTafsirTitle,
    this.fourTafsirTitle,
    this.fiveTafsirTitle,
    this.sixTafsirTitle,
    this.sevenTafsirTitle,
    this.eightTafsirTitle,
    this.nineTafsirTitle,
    this.tenTafsirTitle,
    this.elevenTafsirTitle,
    this.twelveTafsirTitle,
    this.thirteenTafsirTitle,
    this.fourteenTafsirTitle,
    this.fifteenTafsirTitle,
    this.sixteenTafsirTitle,
    this.seventeenTafsirTitle,
    this.eighteenTafsirTitle,
    this.nineteenTafsirTitle,
    this.twentyTafsirTitle,
    this.twentyOneTafsirTitle,
    this.twentyTwoTafsirTitle,
    this.twentyThreeTafsirTitle,
    this.twentyFourTafsirTitle,
    this.twentyFiveTafsirTitle,
    this.twentySixTafsirTitle,
  });

  factory Sa7ifaSection.fromJson(Map<String, dynamic> json) {
    return Sa7ifaSection(
      id: json['id'],
      title: json['title'],
      souTitle: json['souTitle'],
      //? … كرر للباقي حتى fortyOneSubContent
      //! Content 1..25
      content: json['content'],
      twoContent: json['twoContent'],
      threeContent: json['threeContent'],
      fourContent: json['fourContent'],
      fiveContent: json['fiveContent'],
      sixContent: json['sixContent'],
      sevenContent: json['sevenContent'],
      eightContent: json['eightContent'],
      nineContent: json['nineContent'],
      tenContent: json['tenContent'],
      elevenContent: json['elevenContent'],
      twelveContent: json['twelveContent'],
      thirteenContent: json['thirteenContent'],
      fourteenContent: json['fourteenContent'],
      fifteenContent: json['fifteenContent'],
      sixteenContent: json['sixteenContent'],
      seventeenContent: json['seventeenContent'],
      eighteenContent: json['eighteenContent'],
      nineteenContent: json['nineteenContent'],
      twentyContent: json['twentyContent'],
      twentyOneContent: json['twentyOneContent'],
      twentyTwoContent: json['twentyTwoContent'],
      twentyThreeContent: json['twentyThreeContent'],
      twentyFourContent: json['twentyFourContent'],
      twentyFiveContent: json['twentyFiveContent'],
      //? … كرر للباقي حتى twentyFiveContent
      //! Subtitle 1..25
      subtitle: json['subtitle'],
      twoSubtitle: json['twoSubtitle'],
      threeSubtitle: json['threeSubtitle'],
      fourSubtitle: json['fourSubtitle'],
      fiveSubtitle: json['fiveSubtitle'],
      sixSubtitle: json['sixSubtitle'],
      sevenSubtitle: json['sevenSubtitle'],
      eightSubtitle: json['eightSubtitle'],
      nineSubtitle: json['nineSubtitle'],
      tenSubtitle: json['tenSubtitle'],
      elevenSubtitle: json['elevenSubtitle'],
      twelveSubtitle: json['twelveSubtitle'],
      thirteenSubtitle: json['thirteenSubtitle'],
      fourteenSubtitle: json['fourteenSubtitle'],
      fifteenSubtitle: json['fifteenSubtitle'],
      sixteenSubtitle: json['sixteenSubtitle'],
      seventeenSubtitle: json['seventeenSubtitle'],
      eighteenSubtitle: json['eighteenSubtitle'],
      nineteenSubtitle: json['nineteenSubtitle'],
      twentySubtitle: json['twentySubtitle'],
      twentyOneSubtitle: json['twentyOneSubtitle'],
      twentyTwoSubtitle: json['twentyTwoSubtitle'],
      twentyThreeSubtitle: json['twentyThreeSubtitle'],
      twentyFourSubtitle: json['twentyFourSubtitle'],
      twentyFiveSubtitle: json['twentyFiveSubtitle'],
      //? … كرر للباقي حتى twentyFiveSubtitle
      //! Tafsir 1..26
      tafsir: json['tafsir'],
      twoTafsir: json['twoTafsir'],
      threeTafsir: json['threeTafsir'],
      fourTafsir: json['fourTafsir'],
      fiveTafsir: json['fiveTafsir'],
      sixTafsir: json['sixTafsir'],
      sevenTafsir: json['sevenTafsir'],
      eightTafsir: json['eightTafsir'],
      nineTafsir: json['nineTafsir'],
      tenTafsir: json['tenTafsir'],
      elevenTafsir: json['elevenTafsir'],
      twelveTafsir: json['twelveTafsir'],
      thirteenTafsir: json['thirteenTafsir'],
      fourteenTafsir: json['fourteenTafsir'],
      fifteenTafsir: json['fifteenTafsir'],
      sixteenTafsir: json['sixteenTafsir'],
      seventeenTafsir: json['seventeenTafsir'],
      eighteenTafsir: json['eighteenTafsir'],
      nineteenTafsir: json['nineteenTafsir'],
      twentyTafsir: json['twentyTafsir'],
      twentyOneTafsir: json['twentyOneTafsir'],
      twentyTwoTafsir: json['twentyTwoTafsir'],
      twentyThreeTafsir: json['twentyThreeTafsir'],
      twentyFourTafsir: json['twentyFourTafsir'],
      twentyFiveTafsir: json['twentyFiveTafsir'],
      twentySixTafsir: json['twentySixTafsir'],
      //? … كرر للباقي حتى twentySixTafsir
      //! TafsirTitle 1..26
      tafsirTitle: json['tafsirTitle'],
      twoTafsirTitle: json['twoTafsirTitle'],
      threeTafsirTitle: json['threeTafsirTitle'],
      fourTafsirTitle: json['fourTafsirTitle'],
      fiveTafsirTitle: json['fiveTafsirTitle'],
      sixTafsirTitle: json['sixTafsirTitle'],
      sevenTafsirTitle: json['sevenTafsirTitle'],
      eightTafsirTitle: json['eightTafsirTitle'],
      nineTafsirTitle: json['nineTafsirTitle'],
      tenTafsirTitle: json['tenTafsirTitle'],
      elevenTafsirTitle: json['elevenTafsirTitle'],
      twelveTafsirTitle: json['twelveTafsirTitle'],
      thirteenTafsirTitle: json['thirteenTafsirTitle'],
      fourteenTafsirTitle: json['fourteenTafsirTitle'],
      fifteenTafsirTitle: json['fifteenTafsirTitle'],
      sixteenTafsirTitle: json['sixteenTafsirTitle'],
      seventeenTafsirTitle: json['seventeenTafsirTitle'],
      eighteenTafsirTitle: json['eighteenTafsirTitle'],
      nineteenTafsirTitle: json['nineteenTafsirTitle'],
      twentyTafsirTitle: json['twentyTafsirTitle'],
      twentyOneTafsirTitle: json['twentyOneTafsirTitle'],
      twentyTwoTafsirTitle: json['twentyTwoTafsirTitle'],
      twentyThreeTafsirTitle: json['twentyThreeTafsirTitle'],
      twentyFourTafsirTitle: json['twentyFourTafsirTitle'],
      twentyFiveTafsirTitle: json['twentyFiveTafsirTitle'],
      twentySixTafsirTitle: json['twentySixTafsirTitle'],
      //? … كرر للباقي حتى twentySixTafsirTitle
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'souTitle': souTitle,
        //? … كل الحقول لغاية fortyOneSubContent
        //! Content 1..25
        'content': content,
        'twoContent': twoContent,
        'threeContent': threeContent,
        'fourContent': fourContent,
        'fiveContent': fiveContent,
        'sixContent': sixContent,
        'sevenContent': sevenContent,
        'eightContent': eightContent,
        'nineContent': nineContent,
        'tenContent': tenContent,
        'elevenContent': elevenContent,
        'twelveContent': twelveContent,
        'thirteenContent': thirteenContent,
        'fourteenContent': fourteenContent,
        'fifteenContent': fifteenContent,
        'sixteenContent': sixteenContent,
        'seventeenContent': seventeenContent,
        'eighteenContent': eighteenContent,
        'nineteenContent': nineteenContent,
        'twentyContent': twentyContent,
        'twentyOneContent': twentyOneContent,
        'twentyTwoContent': twentyTwoContent,
        'twentyThreeContent': twentyThreeContent,
        'twentyFourContent': twentyFourContent,
        'twentyFiveContent': twentyFiveContent,
        //? … كل الحقول لغاية twentyFiveContent
        //! Subtitle 1..25
        'subtitle': subtitle,
        'twoSubtitle': twoSubtitle,
        'threeSubtitle': threeSubtitle,
        'fourSubtitle': fourSubtitle,
        'fiveSubtitle': fiveSubtitle,
        'sixSubtitle': sixSubtitle,
        'sevenSubtitle': sevenSubtitle,
        'eightSubtitle': eightSubtitle,
        'nineSubtitle': nineSubtitle,
        'tenSubtitle': tenSubtitle,
        'elevenSubtitle': elevenSubtitle,
        'twelveSubtitle': twelveSubtitle,
        'thirteenSubtitle': thirteenSubtitle,
        'fourteenSubtitle': fourteenSubtitle,
        'fifteenSubtitle': fifteenSubtitle,
        'sixteenSubtitle': sixteenSubtitle,
        'seventeenSubtitle': seventeenSubtitle,
        'eighteenSubtitle': eighteenSubtitle,
        'nineteenSubtitle': nineteenSubtitle,
        'twentySubtitle': twentySubtitle,
        'twentyOneSubtitle': twentyOneSubtitle,
        'twentyTwoSubtitle': twentyTwoSubtitle,
        'twentyThreeSubtitle': twentyThreeSubtitle,
        'twentyFourSubtitle': twentyFourSubtitle,
        'twentyFiveSubtitle': twentyFiveSubtitle,
        //? … كل الحقول لغاية twentyFiveSubtitle
        //! Tafsir 1..26
        'tafsir': tafsir,
        'twoTafsir': twoTafsir,
        'threeTafsir': threeTafsir,
        'fourTafsir': fourTafsir,
        'fiveTafsir': fiveTafsir,
        'sixTafsir': sixTafsir,
        'sevenTafsir': sevenTafsir,
        'eightTafsir': eightTafsir,
        'nineTafsir': nineTafsir,
        'tenTafsir': tenTafsir,
        'elevenTafsir': elevenTafsir,
        'twelveTafsir': twelveTafsir,
        'thirteenTafsir': thirteenTafsir,
        'fourteenTafsir': fourteenTafsir,
        'fifteenTafsir': fifteenTafsir,
        'sixteenTafsir': sixteenTafsir,
        'seventeenTafsir': seventeenTafsir,
        'eighteenTafsir': eighteenTafsir,
        'nineteenTafsir': nineteenTafsir,
        'twentyTafsir': twentyTafsir,
        'twentyOneTafsir': twentyOneTafsir,
        'twentyTwoTafsir': twentyTwoTafsir,
        'twentyThreeTafsir': twentyThreeTafsir,
        'twentyFourTafsir': twentyFourTafsir,
        'twentyFiveTafsir': twentyFiveTafsir,
        //? … كل الحقول لغاية twentySixTafsir
        //! TafsirTitle 1..26
        'tafsirTitle': tafsirTitle,
        'twoTafsirTitle': twoTafsirTitle,
        'threeTafsirTitle': threeTafsirTitle,
        'fourTafsirTitle': fourTafsirTitle,
        'fiveTafsirTitle': fiveTafsirTitle,
        'sixTafsirTitle': sixTafsirTitle,
        'sevenTafsirTitle': sevenTafsirTitle,
        'eightTafsirTitle': eightTafsirTitle,
        'nineTafsirTitle': nineTafsirTitle,
        'tenTafsirTitle': tenTafsirTitle,
        'elevenTafsirTitle': elevenTafsirTitle,
        'twelveTafsirTitle': twelveTafsirTitle,
        'thirteenTafsirTitle': thirteenTafsirTitle,
        'fourteenTafsirTitle': fourteenTafsirTitle,
        'fifteenTafsirTitle': fifteenTafsirTitle,
        'sixteenTafsirTitle': sixteenTafsirTitle,
        'seventeenTafsirTitle': seventeenTafsirTitle,
        'eighteenTafsirTitle': eighteenTafsirTitle,
        'nineteenTafsirTitle': nineteenTafsirTitle,
        'twentyTafsirTitle': twentyTafsirTitle,
        'twentyOneTafsirTitle': twentyOneTafsirTitle,
        'twentyTwoTafsirTitle': twentyTwoTafsirTitle,
        'twentyThreeTafsirTitle': twentyThreeTafsirTitle,
        'twentyFourTafsirTitle': twentyFourTafsirTitle,
        'twentyFiveTafsirTitle': twentyFiveTafsirTitle,
        //? … كل الحقول لغاية twentySixTafsirTitle
      };
}
