class AlbakiyatAlsalihatModel {
  final int id;
  final String title;
  final List<AlbakiyatSection> index;

  AlbakiyatAlsalihatModel({
    required this.id,
    required this.title,
    required this.index,
  });

  factory AlbakiyatAlsalihatModel.fromJson(Map<String, dynamic> json) {
    return AlbakiyatAlsalihatModel(
      id: json['id'],
      title: json['title'],
      index: (json['index'] as List<dynamic>)
          .map((e) => AlbakiyatSection.fromJson(e))
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

class AlbakiyatSection {
  final int id;
  final String title;

  // Content 1..40
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
  final String? twentySixContent;
  final String? twentySevenContent;
  final String? twentyEightContent;
  final String? twentyNineContent;
  final String? thirtyContent;
  final String? thirtyOneContent;
  final String? thirtyTwoContent;
  final String? thirtyThreeContent;
  final String? thirtyFourContent;
  final String? thirtyFiveContent;
  final String? thirtySixContent;
  final String? thirtySevenContent;
  final String? thirtyEightContent;
  final String? thirtyNineContent;
  final String? fortyContent;

  // Subtitle 1..40
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
  final String? twentySixSubtitle;
  final String? twentySevenSubtitle;
  final String? twentyEightSubtitle;
  final String? twentyNineSubtitle;
  final String? thirtySubtitle;
  final String? thirtyOneSubtitle;
  final String? thirtyTwoSubtitle;
  final String? thirtyThreeSubtitle;
  final String? thirtyFourSubtitle;
  final String? thirtyFiveSubtitle;
  final String? thirtySixSubtitle;
  final String? thirtySevenSubtitle;
  final String? thirtyEightSubtitle;
  final String? thirtyNineSubtitle;
  final String? fortySubtitle;

  AlbakiyatSection({
    required this.id,
    required this.title,
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
    this.twentySixContent,
    this.twentySevenContent,
    this.twentyEightContent,
    this.twentyNineContent,
    this.thirtyContent,
    this.thirtyOneContent,
    this.thirtyTwoContent,
    this.thirtyThreeContent,
    this.thirtyFourContent,
    this.thirtyFiveContent,
    this.thirtySixContent,
    this.thirtySevenContent,
    this.thirtyEightContent,
    this.thirtyNineContent,
    this.fortyContent,
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
    this.twentySixSubtitle,
    this.twentySevenSubtitle,
    this.twentyEightSubtitle,
    this.twentyNineSubtitle,
    this.thirtySubtitle,
    this.thirtyOneSubtitle,
    this.thirtyTwoSubtitle,
    this.thirtyThreeSubtitle,
    this.thirtyFourSubtitle,
    this.thirtyFiveSubtitle,
    this.thirtySixSubtitle,
    this.thirtySevenSubtitle,
    this.thirtyEightSubtitle,
    this.thirtyNineSubtitle,
    this.fortySubtitle,
  });

  factory AlbakiyatSection.fromJson(Map<String, dynamic> json) {
    return AlbakiyatSection(
      id: json['id'],
      title: json['title'],
      //? … كرر للباقي حتى fortyOneSubContent
      //! Content 1..40
      content: json['content'],
      twoContent: json['secondContent'],
      threeContent: json['thirdContent'],
      fourContent: json['fourthContent'],
      fiveContent: json['fifthContent'],
      sixContent: json['sixthContent'],
      sevenContent: json['seventhContent'],
      eightContent: json['eighthContent'],
      nineContent: json['ninethContent'],
      tenContent: json['tenthContent'],
      elevenContent: json['eleventhContent'],
      twelveContent: json['twelfthContent'],
      thirteenContent: json['thirteenthContent'],
      fourteenContent: json['fourteenthContent'],
      fifteenContent: json['fifteenthContent'],
      sixteenContent: json['sixteenthContent'],
      seventeenContent: json['seventeenthContent'],
      eighteenContent: json['eighteenthContent'],
      nineteenContent: json['nineteenthContent'],
      twentyContent: json['twentyContent'],
      twentyOneContent: json['twentyOneContent'],
      twentyTwoContent: json['twentyTwoContent'],
      twentyThreeContent: json['twentyThreeContent'],
      twentyFourContent: json['twentyFourContent'],
      twentyFiveContent: json['twentyFiveContent'],
      twentySixContent: json['twentySixContent'],
      twentySevenContent: json['twentySevenContent'],
      twentyEightContent: json['twentyEightContent'],
      twentyNineContent: json['twentyNineContent'],
      thirtyContent: json['thirtyContent'],
      thirtyOneContent: json['thirtyOneContent'],
      thirtyTwoContent: json['thirtyTwoContent'],
      thirtyThreeContent: json['thirtyThreeContent'],
      thirtyFourContent: json['thirtyFourContent'],
      thirtyFiveContent: json['thirtyFiveContent'],
      thirtySixContent: json['thirtySixContent'],
      thirtySevenContent: json['thirtySevenContent'],
      thirtyEightContent: json['thirtyEightContent'],
      thirtyNineContent: json['thirtyNineContent'],
      fortyContent: json['fourtyContent'],
      //? … كرر للباقي حتى fortyOneContent
      //! Subtitle 1..40
      subtitle: json['subtitle'],
      twoSubtitle: json['secondSubtitle'],
      threeSubtitle: json['thirdSubtitle'],
      fourSubtitle: json['fourthSubtitle'],
      fiveSubtitle: json['fifthSubtitle'],
      sixSubtitle: json['sixthSubtitle'],
      sevenSubtitle: json['seventhSubtitle'],
      eightSubtitle: json['eighthSubtitle'],
      nineSubtitle: json['ninethSubtitle'],
      tenSubtitle: json['tenthSubtitle'],
      elevenSubtitle: json['eleventhSubtitle'],
      twelveSubtitle: json['twelfthSubtitle'],
      thirteenSubtitle: json['thirteenthSubtitle'],
      fourteenSubtitle: json['fourteenthSubtitle'],
      fifteenSubtitle: json['fifteenthSubtitle'],
      sixteenSubtitle: json['sixteenthSubtitle'],
      seventeenSubtitle: json['seventeenthSubtitle'],
      eighteenSubtitle: json['eighteenthSubtitle'],
      nineteenSubtitle: json['nineteenthSubtitle'],
      twentySubtitle: json['twentySubtitle'],
      twentyOneSubtitle: json['twentyOneSubtitle'],
      twentyTwoSubtitle: json['twentyTwoSubtitle'],
      twentyThreeSubtitle: json['twentyThreeSubtitle'],
      twentyFourSubtitle: json['twentyFourSubtitle'],
      twentyFiveSubtitle: json['twentyFiveSubtitle'],
      twentySixSubtitle: json['twentySixSubtitle'],
      twentySevenSubtitle: json['twentySevenSubtitle'],
      twentyEightSubtitle: json['twentyEightSubtitle'],
      twentyNineSubtitle: json['twentyNineSubtitle'],
      thirtySubtitle: json['thirtySubtitle'],
      thirtyOneSubtitle: json['thirtyOneSubtitle'],
      thirtyTwoSubtitle: json['thirtyTwoSubtitle'],
      thirtyThreeSubtitle: json['thirtyThreeSubtitle'],
      thirtyFourSubtitle: json['thirtyFourSubtitle'],
      thirtyFiveSubtitle: json['thirtyFiveSubtitle'],
      thirtySixSubtitle: json['thirtySixSubtitle'],
      thirtySevenSubtitle: json['thirtySevenSubtitle'],
      thirtyEightSubtitle: json['thirtyEightSubtitle'],
      thirtyNineSubtitle: json['thirtyNineSubtitle'],
      fortySubtitle: json['fourtySubtitle'],
      //? … كرر للباقي حتى fortyOneSubtitle
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        //? … كل الحقول لغاية fortyOneSubContent
        //! Content 1..40
        'content': content,
        'secondContent': twoContent,
        'thirdContent': threeContent,
        'fourthContent': fourContent,
        'fifthContent': fiveContent,
        'sixthContent': sixContent,
        'seventhContent': sevenContent,
        'eighthContent': eightContent,
        'ninethContent': nineContent,
        'tenthContent': tenContent,
        'eleventhContent': elevenContent,
        'twelfthContent': twelveContent,
        'thirteenthContent': thirteenContent,
        'fourteenthContent': fourteenContent,
        'fifteenthContent': fifteenContent,
        'sixteenthContent': sixteenContent,
        'seventeenthContent': seventeenContent,
        'eighteenthContent': eighteenContent,
        'nineteenthContent': nineteenContent,
        'twentyContent': twentyContent,
        'twentyOneContent': twentyOneContent,
        'twentyTwoContent': twentyTwoContent,
        'twentyThreeContent': twentyThreeContent,
        'twentyFourContent': twentyFourContent,
        'twentyFiveContent': twentyFiveContent,
        'twentySixContent': twentySixContent,
        'twentySevenContent': twentySevenContent,
        'twentyEightContent': twentyEightContent,
        'twentyNineContent': twentyNineContent,
        'thirtyContent': thirtyContent,
        'thirtyOneContent': thirtyOneContent,
        'thirtyTwoContent': thirtyTwoContent,
        'thirtyThreeContent': thirtyThreeContent,
        'thirtyFourContent': thirtyFourContent,
        'thirtyFiveContent': thirtyFiveContent,
        'thirtySixContent': thirtySixContent,
        'thirtySevenContent': thirtySevenContent,
        'thirtyEightContent': thirtyEightContent,
        'thirtyNineContent': thirtyNineContent,
        'fourtyContent': fortyContent,
        //? … كل الحقول لغاية fortyOneContent
        //! Subtitle 1..40
        'subtitle': subtitle,
        'secondSubtitle': twoSubtitle,
        'thirdSubtitle': threeSubtitle,
        'fourthSubtitle': fourSubtitle,
        'fifthSubtitle': fiveSubtitle,
        'sixthSubtitle': sixSubtitle,
        'seventhSubtitle': sevenSubtitle,
        'eighthSubtitle': eightSubtitle,
        'ninethSubtitle': nineSubtitle,
        'tenthSubtitle': tenSubtitle,
        'eleventhSubtitle': elevenSubtitle,
        'twelfthSubtitle': twelveSubtitle,
        'thirteenthSubtitle': thirteenSubtitle,
        'fourteenthSubtitle': fourteenSubtitle,
        'fifteenthSubtitle': fifteenSubtitle,
        'sixteenthSubtitle': sixteenSubtitle,
        'seventeenthSubtitle': seventeenSubtitle,
        'eighteenthSubtitle': eighteenSubtitle,
        'nineteenthSubtitle': nineteenSubtitle,
        'twentySubtitle': twentySubtitle,
        'twentyOneSubtitle': twentyOneSubtitle,
        'twentyTwoSubtitle': twentyTwoSubtitle,
        'twentyThreeSubtitle': twentyThreeSubtitle,
        'twentyFourSubtitle': twentyFourSubtitle,
        'twentyFiveSubtitle': twentyFiveSubtitle,
        'twentySixSubtitle': twentySixSubtitle,
        'twentySevenSubtitle': twentySevenSubtitle,
        'twentyEightSubtitle': twentyEightSubtitle,
        'twentyNineSubtitle': twentyNineSubtitle,
        'thirtySubtitle': thirtySubtitle,
        'thirtyOneSubtitle': thirtyOneSubtitle,
        'thirtyTwoSubtitle': thirtyTwoSubtitle,
        'thirtyThreeSubtitle': thirtyThreeSubtitle,
        'thirtyFourSubtitle': thirtyFourSubtitle,
        'thirtyFiveSubtitle': thirtyFiveSubtitle,
        'thirtySixSubtitle': thirtySixSubtitle,
        'thirtySevenSubtitle': thirtySevenSubtitle,
        'thirtyEightSubtitle': thirtyEightSubtitle,
        'thirtyNineSubtitle': thirtyNineSubtitle,
        'fourtySubtitle': fortySubtitle,
        //? … كل الحقول لغاية fortyOneSubtitle
      };
}
