class MafatihAljinanModel {
  final int id;
  final String title;
  final List<MafatihSection> index;

  MafatihAljinanModel({
    required this.id,
    required this.title,
    required this.index,
  });

  factory MafatihAljinanModel.fromJson(Map<String, dynamic> json) {
    return MafatihAljinanModel(
      id: json['id'],
      title: json['title'],
      index: (json['index'] as List<dynamic>)
          .map((e) => MafatihSection.fromJson(e))
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

class MafatihSection {
  final int id;
  final String title;
  final List<MafatihSectionIndex> index;

  // SubContent 1..19
  final String? subContent;
  final String? twoSubContent;
  final String? threeSubContent;
  final String? fourSubContent;
  final String? fiveSubContent;
  final String? sixSubContent;
  final String? sevenSubContent;
  final String? eightSubContent;
  final String? nineSubContent;
  final String? tenSubContent;
  final String? elevenSubContent;
  final String? twelveSubContent;
  final String? thirteenSubContent;
  final String? fourteenSubContent;
  final String? fifteenSubContent;
  final String? sixteenSubContent;
  final String? seventeenSubContent;
  final String? eighteenSubContent;
  final String? nineteenSubContent;

  // Content 1..23
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

  // Subtitle 1..23
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
  // SouTitle
  final String? soutitle;

  MafatihSection({
    required this.id,
    required this.title,
    required this.index,
    this.subContent,
    this.twoSubContent,
    this.threeSubContent,
    this.fourSubContent,
    this.fiveSubContent,
    this.sixSubContent,
    this.sevenSubContent,
    this.eightSubContent,
    this.nineSubContent,
    this.tenSubContent,
    this.elevenSubContent,
    this.twelveSubContent,
    this.thirteenSubContent,
    this.fourteenSubContent,
    this.fifteenSubContent,
    this.sixteenSubContent,
    this.seventeenSubContent,
    this.eighteenSubContent,
    this.nineteenSubContent,
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
    this.soutitle
  });

  factory MafatihSection.fromJson(Map<String, dynamic> json) {
    return MafatihSection(
      id: json['id'],
      title: json['title'],
            index: json['index'] != null
          ? (json['index'] as List<dynamic>)
              .map((e) => MafatihSectionIndex.fromJson(e))
              .toList()
          : [],
      // هنا بتعمل نفس الشي لكل الحقول (subContent, content, subtitle)
      //! SubContent 1..19
      subContent: json['subContent'],
      twoSubContent: json['twoSubContent'],
      threeSubContent: json['threeSubContent'],
      fourSubContent: json['fourSubContent'],
      fiveSubContent: json['fiveSubContent'],
      sixSubContent: json['sixSubContent'],
      sevenSubContent: json['sevenSubContent'],
      eightSubContent: json['eightSubContent'],
      nineSubContent: json['nineSubContent'],
      tenSubContent: json['tenSubContent'],
      elevenSubContent: json['elevenSubContent'],
      twelveSubContent: json['twelveSubContent'],
      thirteenSubContent: json['thirteenSubContent'],
      fourteenSubContent: json['fourteenSubContent'],
      fifteenSubContent: json['fifteenSubContent'],
      sixteenSubContent: json['sixteenSubContent'],
      seventeenSubContent: json['seventeenSubContent'],
      eighteenSubContent: json['eighteenSubContent'],
      nineteenSubContent: json['nineteenSubContent'],
      //? … كرر للباقي حتى fortyOneSubContent
      //! Content 1..23
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
      //? … كرر للباقي حتى fortyOneContent
      //! Subtitle 1..23
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
      //? … كرر للباقي حتى fortyOneSubtitle
      //! SouTitle
      soutitle: json['soutitle'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        //! SubContent 1..19
        'subContent': subContent,
        'twoSubContent': twoSubContent,
        'threeSubContent': threeSubContent,
        'fourSubContent': fourSubContent,
        'fiveSubContent': fiveSubContent,
        'sixSubContent': sixSubContent,
        'sevenSubContent': sevenSubContent,
        'eightSubContent': eightSubContent,
        'nineSubContent': nineSubContent,
        'tenSubContent': tenSubContent,
        'elevenSubContent': elevenSubContent,
        'twelveSubContent': twelveSubContent,
        'thirteenSubContent': thirteenSubContent,
        'fourteenSubContent': fourteenSubContent,
        'fifteenSubContent': fifteenSubContent,
        'sixteenSubContent': sixteenSubContent,
        'seventeenSubContent': seventeenSubContent,
        'eighteenSubContent': eighteenSubContent,
        'nineteenSubContent': nineteenSubContent,
        //? … كل الحقول لغاية fortyOneSubContent
        //! Content 1..23
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
        //? … كل الحقول لغاية fortyOneContent
        //! Subtitle 1..23
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
        //? … كل الحقول لغاية fortyOneSubtitle
        //! Soutitle
        'souTitle': soutitle,
      };
}

//todo ////////////////////////////////////////////////////////////

class MafatihSectionIndex {
  final int id;
  final String title;

  //! Content 1..41
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
  final String? fortyOneContent;

  //! Subtitle 1..41
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
  final String? fortyOneSubtitle;

  //! She3er 14
  final String? she3er;
  final String? twoShe3er;
  final String? threeShe3er;
  final String? fourShe3er;
  final String? fiveShe3er;
  
  final String? sevenShe3er;
  final String? eightShe3er;
  final String? nineShe3er;
  final String? tenShe3er;
  final String? elevenShe3er;
  final String? twelveShe3er;
  final String? thirteenShe3er;
  final String? fifteenShe3er; 
  final String? twentyShe3er;

  MafatihSectionIndex({
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
    this.fortyOneContent,
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
    this.fortyOneSubtitle,
    this.she3er,
    this.twoShe3er,
    this.threeShe3er,
    this.fourShe3er,
    this.fiveShe3er,
    this.sevenShe3er,
    this.eightShe3er,
    this.nineShe3er,
    this.tenShe3er,
    this.elevenShe3er,
    this.twelveShe3er,
    this.thirteenShe3er,
    this.fifteenShe3er,
    this.twentyShe3er,
  });

  factory MafatihSectionIndex.fromJson(Map<String, dynamic> json) {
    return MafatihSectionIndex(
      id: json['id'],
      title: json['title'],
      //! Content 1..41
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
      fortyContent: json['fortyContent'],
      fortyOneContent: json['fortyOneContent'],
      //? … كرر للباقي حتى fortyOneContent
      //! Subtitle 1..41
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
      fortySubtitle: json['fortySubtitle'],
      fortyOneSubtitle: json['fortyOneSubtitle'],
      //? … كرر للباقي حتى fortyOneSubtitle
      //! She3er 14
      she3er: json['she3er'],
      twoShe3er: json['twoShe3er'],
      threeShe3er: json['threeShe3er'],
      fourShe3er: json['fourShe3er'],
      fiveShe3er: json['fiveShe3er'],
      sevenShe3er: json['sevenShe3er'],
      eightShe3er: json['eightShe3er'],
      nineShe3er: json['nineShe3er'],
      tenShe3er: json['tenShe3er'],
      elevenShe3er: json['elevenShe3er'],
      twelveShe3er: json['twelveShe3er'],
      thirteenShe3er: json['thirteenShe3er'],
      fifteenShe3er: json['fifteenShe3er'],
      twentyShe3er: json['twentyShe3er'], 
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        //! Content 1..41
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
        'fortyContent': fortyContent,
        'fortyOneContent': fortyOneContent,
        //? … كل الحقول لغاية fortyOneContent
        //! Subtitle 1..41
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
        'fortySubtitle': fortySubtitle,
        'fortyOneSubtitle': fortyOneSubtitle,
        //? … كل الحقول لغاية fortyOneSubtitle
        //! She3er 14
        'she3er': she3er,
        'twoShe3er': twoShe3er,
        'threeShe3er': threeShe3er,
        'fourShe3er': fourShe3er,
        'fiveShe3er': fiveShe3er,
        'sevenShe3er': sevenShe3er,
        'eightShe3er': eightShe3er,
        'nineShe3er': nineShe3er,
        'tenShe3er': tenShe3er,
        'elevenShe3er': elevenShe3er,
        'twelveShe3er': twelveShe3er,
        'thirteenShe3er': thirteenShe3er,
        'fifteenShe3er': fifteenShe3er,
        'twentyShe3er': twentyShe3er,
      };
}
