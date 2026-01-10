import '../../Util/app_imports.dart';

class BlocBuilderAlsa7ifaAlsajadiya extends StatelessWidget {
  final String? text;
  final double fontSize;
  final double fontSizeTablet;

  BlocBuilderAlsa7ifaAlsajadiya({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontSizeTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return BlocBuilder<Alsa7ifaAlsajadiyaCubit, Alsa7ifaAlsajadiyaState>(
        builder: (context, state) {
      if (state is Alsa7ifaAlsajadiyaLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is Alsa7ifaAlsajadiyaLoaded) {
        final alsa7ifaAlsajadiya = state.items;
        String souTitle = '';
        String content = '';
        String twoContent = '';
        String threeContent = '';
        String fourContent = '';
        String fiveContent = '';
        String sixContent = '';
        String sevenContent = '';
        String eightContent = '';
        String nineContent = '';
        String tenContent = '';
        String elevenContent = '';
        String twelveContent = '';
        String thirteenContent = '';
        String fourteenContent = '';
        String fifteenContent = '';
        String sixteenContent = '';
        String seventeenContent = '';
        String eighteenContent = '';
        String nineteenContent = '';
        String twentyContent = '';
        String twentyOneContent = '';
        String twentyTwoContent = '';
        String twentyThreeContent = '';
        String twentyFourContent = '';
        String twentyFiveContent = '';
        String firstTitle = '';
        String twoTitle = '';
        String threeTitle = '';
        String fourTitle = '';
        String fiveTitle = '';
        String sixTitle = '';
        String sevenTitle = '';
        String eightTitle = '';
        String nineTitle = '';
        String tenTitle = '';
        String elevenTitle = '';
        String twelveTitle = '';
        String thirteenTitle = '';
        String fourteenTitle = '';
        String fifteenTitle = '';
        String sixteenTitle = '';
        String seventeenTitle = '';
        String eighteenTitle = '';
        String nineteenTitle = '';
        String twentyTitle = '';
        String twentyOneTitle = '';
        String twentyTwoTitle = '';
        String twentyThreeTitle = '';
        String twentyFourTitle = '';
        String twentyFiveTitle = '';
        String firstTafsir = '';
        String twoTafsir = '';
        String threeTafsir = '';
        String fourTafsir = '';
        String fiveTafsir = '';
        String sixTafsir = '';
        String sevenTafsir = '';
        String eightTafsir = '';
        String nineTafsir = '';
        String tenTafsir = '';
        String elevenTafsir = '';
        String twelveTafsir = '';
        String thirteenTafsir = '';
        String fourteenTafsir = '';
        String fifteenTafsir = '';
        String sixteenTafsir = '';
        String seventeenTafsir = '';
        String eighteenTafsir = '';
        String nineteenTafsir = '';
        String twentyTafsir = '';
        String twentyOneTafsir = '';
        String twentyTwoTafsir = '';
        String twentyThreeTafsir = '';
        String twentyFourTafsir = '';
        String twentyFiveTafsir = '';
        String twentySixTafsir = '';
        String firstTafsirTitle = '';
        String twoTafsirTitle = '';
        String threeTafsirTitle = '';
        String fourTafsirTitle = '';
        String fiveTafsirTitle = '';
        String sixTafsirTitle = '';
        String sevenTafsirTitle = '';
        String eightTafsirTitle = '';
        String nineTafsirTitle = '';
        String tenTafsirTitle = '';
        String elevenTafsirTitle = '';
        String twelveTafsirTitle = '';
        String thirteenTafsirTitle = '';
        String fourteenTafsirTitle = '';
        String fifteenTafsirTitle = '';
        String sixteenTafsirTitle = '';
        String seventeenTafsirTitle = '';
        String eighteenTafsirTitle = '';
        String nineteenTafsirTitle = '';
        String twentyTafsirTitle = '';
        String twentyOneTafsirTitle = '';
        String twentyTwoTafsirTitle = '';
        String twentyThreeTafsirTitle = '';
        String twentyFourTafsirTitle = '';
        String twentyFiveTafsirTitle = '';
        String twentySixTafsirTitle = '';
        for (var item in alsa7ifaAlsajadiya) {
          for (var subItem in item.index) {
            if (subItem.title == text) {
              souTitle = subItem.souTitle ?? '';
              //! Content 25
              content = subItem.content ?? '';
              twoContent = subItem.twoContent ?? '';
              threeContent = subItem.threeContent ?? '';
              fourContent = subItem.fourContent ?? '';
              fiveContent = subItem.fiveContent ?? '';
              sixContent = subItem.sixContent ?? '';
              sevenContent = subItem.sevenContent ?? '';
              eightContent = subItem.eightContent ?? '';
              nineContent = subItem.nineContent ?? '';
              tenContent = subItem.tenContent ?? '';
              elevenContent = subItem.elevenContent ?? '';
              twelveContent = subItem.twelveContent ?? '';
              thirteenContent = subItem.thirteenContent ?? '';
              fourteenContent = subItem.fourteenContent ?? '';
              fifteenContent = subItem.fifteenContent ?? '';
              sixteenContent = subItem.sixteenContent ?? '';
              seventeenContent = subItem.seventeenContent ?? '';
              eighteenContent = subItem.eighteenContent ?? '';
              nineteenContent = subItem.nineteenContent ?? '';
              twentyContent = subItem.twentyContent ?? '';
              twentyOneContent = subItem.twentyOneContent ?? '';
              twentyTwoContent = subItem.twentyTwoContent ?? '';
              twentyThreeContent = subItem.twentyThreeContent ?? '';
              twentyFourContent = subItem.twentyFourContent ?? '';
              twentyFiveContent = subItem.twentyFiveContent ?? '';

              //! Titles 25
              firstTitle = subItem.subtitle ?? '';
              twoTitle = subItem.twoSubtitle ?? '';
              threeTitle = subItem.threeSubtitle ?? '';
              fourTitle = subItem.fourSubtitle ?? '';
              fiveTitle = subItem.fiveSubtitle ?? '';
              sixTitle = subItem.sixSubtitle ?? '';
              sevenTitle = subItem.sevenSubtitle ?? '';
              eightTitle = subItem.eightSubtitle ?? '';
              nineTitle = subItem.nineSubtitle ?? '';
              tenTitle = subItem.tenSubtitle ?? '';
              elevenTitle = subItem.elevenSubtitle ?? '';
              twelveTitle = subItem.twelveSubtitle ?? '';
              thirteenTitle = subItem.thirteenSubtitle ?? '';
              fourteenTitle = subItem.fourteenSubtitle ?? '';
              fifteenTitle = subItem.fifteenSubtitle ?? '';
              sixteenTitle = subItem.sixteenSubtitle ?? '';
              seventeenTitle = subItem.seventeenSubtitle ?? '';
              eighteenTitle = subItem.eighteenSubtitle ?? '';
              nineteenTitle = subItem.nineteenSubtitle ?? '';
              twentyTitle = subItem.twentySubtitle ?? '';
              twentyOneTitle = subItem.twentyOneSubtitle ?? '';
              twentyTwoTitle = subItem.twentyTwoSubtitle ?? '';
              twentyThreeTitle = subItem.twentyThreeSubtitle ?? '';
              twentyFourTitle = subItem.twentyFourSubtitle ?? '';
              twentyFiveTitle = subItem.twentyFiveSubtitle ?? '';

              //! tafsir 26
              firstTafsir = subItem.tafsir ?? '';
              twoTafsir = subItem.twoTafsir ?? '';
              threeTafsir = subItem.threeTafsir ?? '';
              fourTafsir = subItem.fourTafsir ?? '';
              fiveTafsir = subItem.fiveTafsir ?? '';
              sixTafsir = subItem.sixTafsir ?? '';
              sevenTafsir = subItem.sevenTafsir ?? '';
              eightTafsir = subItem.eightTafsir ?? '';
              nineTafsir = subItem.nineTafsir ?? '';
              tenTafsir = subItem.tenTafsir ?? '';
              elevenTafsir = subItem.elevenTafsir ?? '';
              twelveTafsir = subItem.twelveTafsir ?? '';
              thirteenTafsir = subItem.thirteenTafsir ?? '';
              fourteenTafsir = subItem.fourteenTafsir ?? '';
              fifteenTafsir = subItem.fifteenTafsir ?? '';
              sixteenTafsir = subItem.sixteenTafsir ?? '';
              seventeenTafsir = subItem.seventeenTafsir ?? '';
              eighteenTafsir = subItem.eighteenTafsir ?? '';
              nineteenTafsir = subItem.nineteenTafsir ?? '';
              twentyTafsir = subItem.twentyTafsir ?? '';
              twentyOneTafsir = subItem.twentyOneTafsir ?? '';
              twentyTwoTafsir = subItem.twentyTwoTafsir ?? '';
              twentyThreeTafsir = subItem.twentyThreeTafsir ?? '';
              twentyFourTafsir = subItem.twentyFourTafsir ?? '';
              twentyFiveTafsir = subItem.twentyFiveTafsir ?? '';
              twentySixTafsir = subItem.twentySixTafsir ?? '';

              //! tafsirTitle 26
              firstTafsirTitle = subItem.tafsirTitle ?? '';
              twoTafsirTitle = subItem.twoTafsirTitle ?? '';
              threeTafsirTitle = subItem.threeTafsirTitle ?? '';
              fourTafsirTitle = subItem.fourTafsirTitle ?? '';
              fiveTafsirTitle = subItem.fiveTafsirTitle ?? '';
              sixTafsirTitle = subItem.sixTafsirTitle ?? '';
              sevenTafsirTitle = subItem.sevenTafsirTitle ?? '';
              eightTafsirTitle = subItem.eightTafsirTitle ?? '';
              nineTafsirTitle = subItem.nineTafsirTitle ?? '';
              tenTafsirTitle = subItem.tenTafsirTitle ?? '';
              elevenTafsirTitle = subItem.elevenTafsirTitle ?? '';
              twelveTafsirTitle = subItem.twelveTafsirTitle ?? '';
              thirteenTafsirTitle = subItem.thirteenTafsirTitle ?? '';
              fourteenTafsirTitle = subItem.fourteenTafsirTitle ?? '';
              fifteenTafsirTitle = subItem.fifteenTafsirTitle ?? '';
              sixteenTafsirTitle = subItem.sixteenTafsirTitle ?? '';
              seventeenTafsirTitle = subItem.seventeenTafsirTitle ?? '';
              eighteenTafsirTitle = subItem.eighteenTafsirTitle ?? '';
              nineteenTafsirTitle = subItem.nineteenTafsirTitle ?? '';
              twentyTafsirTitle = subItem.twentyTafsirTitle ?? '';
              twentyOneTafsirTitle = subItem.twentyOneTafsirTitle ?? '';
              twentyTwoTafsirTitle = subItem.twentyTwoTafsirTitle ?? '';
              twentyThreeTafsirTitle = subItem.twentyThreeTafsirTitle ?? '';
              twentyFourTafsirTitle = subItem.twentyFourTafsirTitle ?? '';
              twentyFiveTafsirTitle = subItem.twentyFiveTafsirTitle ?? '';
              twentySixTafsirTitle = subItem.twentySixTafsirTitle ?? '';
              break;
            }
          }
        }

        return ContainerScrollview(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SelectableText(
                  'بسم الله الرحمن الرحيم',
                  style: TextStyle(
                    fontSize: isTablet ? fontSizeTablet + 10 : fontSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'UthmanicHafs',
                  ),
                ),
              ),
              Center(
                child: SelectableText(
                  'اللهم صلِّ على محمد وآل محمد',
                  style: TextStyle(
                    fontSize: isTablet ? fontSizeTablet + 10 : fontSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'UthmanicHafs',
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: firstTitle != '' ? firstTitle : '',
                  subtitle: content,
                  weight: FontWeight.w600,
                  size: isTablet ? fontSizeTablet : fontSize,
                ),
              ),
              souTitle != ''
                  ? Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: SelectableText(
                          souTitle,
                          style: TextStyle(
                            fontSize: isTablet ? fontSizeTablet : fontSize,
                            fontWeight: FontWeight.w900,
                            color: Colors.red,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              twoContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twoTitle != '' ? twoTitle : '',
                        subtitle: twoContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              threeContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: threeTitle != '' ? threeTitle : '',
                        subtitle: threeContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fourContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fourTitle != '' ? fourTitle : '',
                        subtitle: fourContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fiveContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fiveTitle != '' ? fiveTitle : '',
                        subtitle: fiveContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              sixContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: sixTitle != '' ? sixTitle : '',
                        subtitle: sixContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              sevenContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: sevenTitle != '' ? sevenTitle : '',
                        subtitle: sevenContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              eightContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: eightTitle != '' ? eightTitle : '',
                        subtitle: eightContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              nineContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: nineTitle != '' ? nineTitle : '',
                        subtitle: nineContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              tenContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: tenTitle != '' ? tenTitle : '',
                        subtitle: tenContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              elevenContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: elevenTitle != '' ? elevenTitle : '',
                        subtitle: elevenContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twelveContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twelveTitle != '' ? twelveTitle : '',
                        subtitle: twelveContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirteenContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirteenTitle != '' ? thirteenTitle : '',
                        subtitle: thirteenContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fourteenContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fourteenTitle != '' ? fourteenTitle : '',
                        subtitle: fourteenContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fifteenContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fifteenTitle != '' ? fifteenTitle : '',
                        subtitle: fifteenContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              sixteenContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: sixteenTitle != '' ? sixteenTitle : '',
                        subtitle: sixteenContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              seventeenContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: seventeenTitle != '' ? seventeenTitle : '',
                        subtitle: seventeenContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              eighteenContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: eighteenTitle != '' ? eighteenTitle : '',
                        subtitle: eighteenContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              nineteenContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: nineteenTitle != '' ? nineteenTitle : '',
                        subtitle: nineteenContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyTitle != '' ? twentyTitle : '',
                        subtitle: twentyContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyOneContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyOneTitle != '' ? twentyOneTitle : '',
                        subtitle: twentyOneContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyTwoContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyTwoTitle != '' ? twentyTwoTitle : '',
                        subtitle: twentyTwoContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyThreeContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyThreeTitle != '' ? twentyThreeTitle : '',
                        subtitle: twentyThreeContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyFourContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyFourTitle != '' ? twentyFourTitle : '',
                        subtitle: twentyFourContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyFiveContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyFiveTitle != '' ? twentyFiveTitle : '',
                        subtitle: twentyFiveContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              firstTafsir != ''
                  ? SizedBox(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey,
                      ),
                    )
                  : SizedBox.shrink(),
              firstTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: firstTafsirTitle != '' ? firstTafsirTitle : '',
                        subtitle: firstTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twoTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twoTafsirTitle != '' ? twoTafsirTitle : '',
                        subtitle: twoTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              threeTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: threeTafsirTitle != '' ? threeTafsirTitle : '',
                        subtitle: threeTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fourTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fourTafsirTitle != '' ? fourTafsirTitle : '',
                        subtitle: fourTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fiveTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fiveTafsirTitle != '' ? fiveTafsirTitle : '',
                        subtitle: fiveTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              sixTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: sixTafsirTitle != '' ? sixTafsirTitle : '',
                        subtitle: sixTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              sevenTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: sevenTafsirTitle != '' ? sevenTafsirTitle : '',
                        subtitle: sevenTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              eightTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: eightTafsirTitle != '' ? eightTafsirTitle : '',
                        subtitle: eightTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              nineTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: nineTafsirTitle != '' ? nineTafsirTitle : '',
                        subtitle: nineTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              tenTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: tenTafsirTitle != '' ? tenTafsirTitle : '',
                        subtitle: tenTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              elevenTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: elevenTafsirTitle != '' ? elevenTafsirTitle : '',
                        subtitle: elevenTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twelveTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twelveTafsirTitle != '' ? twelveTafsirTitle : '',
                        subtitle: twelveTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirteenTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirteenTafsirTitle != ''
                            ? thirteenTafsirTitle
                            : '',
                        subtitle: thirteenTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fourteenTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fourteenTafsirTitle != ''
                            ? fourteenTafsirTitle
                            : '',
                        subtitle: fourteenTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fifteenTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title:
                            fifteenTafsirTitle != '' ? fifteenTafsirTitle : '',
                        subtitle: fifteenTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              sixteenTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title:
                            sixteenTafsirTitle != '' ? sixteenTafsirTitle : '',
                        subtitle: sixteenTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              seventeenTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: seventeenTafsirTitle != ''
                            ? seventeenTafsirTitle
                            : '',
                        subtitle: seventeenTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              eighteenTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: eighteenTafsirTitle != ''
                            ? eighteenTafsirTitle
                            : '',
                        subtitle: eighteenTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              nineteenTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: nineteenTafsirTitle != ''
                            ? nineteenTafsirTitle
                            : '',
                        subtitle: nineteenTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyTafsirTitle != '' ? twentyTafsirTitle : '',
                        subtitle: twentyTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyOneTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyOneTafsirTitle != ''
                            ? twentyOneTafsirTitle
                            : '',
                        subtitle: twentyOneTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyTwoTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyTwoTafsirTitle != ''
                            ? twentyTwoTafsirTitle
                            : '',
                        subtitle: twentyTwoTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyThreeTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyThreeTafsirTitle != ''
                            ? twentyThreeTafsirTitle
                            : '',
                        subtitle: twentyThreeTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyFourTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyFourTafsirTitle != ''
                            ? twentyFourTafsirTitle
                            : '',
                        subtitle: twentyFourTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyFiveTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyFiveTafsirTitle != ''
                            ? twentyFiveTafsirTitle
                            : '',
                        subtitle: twentyFiveTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentySixTafsir != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentySixTafsirTitle != ''
                            ? twentySixTafsirTitle
                            : '',
                        subtitle: twentySixTafsir,
                        weight: FontWeight.w600,
                        color: Colors.blue,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        );
      } else if (state is Alsa7ifaAlsajadiyaError) {
        return Center(
          child: SelectableText(state.message),
        );
      }
      return const SizedBox();
    });
  }
}
