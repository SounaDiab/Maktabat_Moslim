import '../../Util/app_imports.dart';

class BlocBuilderMafatihAljinan extends StatelessWidget {
  final String? text;
  final double fontSize;
  final double fontSizeTablet;

  BlocBuilderMafatihAljinan({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontSizeTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return BlocBuilder<MafatihAljinanCubit, MafatihAljinanState>(
        builder: (context, state) {
      if (state is MafatihAljinanLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is MafatihAljinanLoaded) {
        final mafatihAljinan = state.items;
        String soutitle = '';
        String subContent = '';
        String twoSubContent = '';
        String threeSubContent = '';
        String fourSubContent = '';
        String fiveSubContent = '';
        String sixSubContent = '';
        String sevenSubContent = '';
        String eightSubContent = '';
        String nineSubContent = '';
        String tenSubContent = '';
        String elevenSubContent = '';
        String twelveSubContent = '';
        String thirteenSubContent = '';
        String fourteenSubContent = '';
        String fifteenSubContent = '';
        String sixteenSubContent = '';
        String seventeenSubContent = '';
        String eighteenSubContent = '';
        String nineteenSubContent = '';
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
        String twentySixContent = '';
        String twentySevenContent = '';
        String twentyEightContent = '';
        String twentyNineContent = '';
        String thirtyContent = '';
        String thirtyOneContent = '';
        String thirtyTwoContent = '';
        String thirtyThreeContent = '';
        String thirtyFourContent = '';
        String thirtyFiveContent = '';
        String thirtySixContent = '';
        String thirtySevenContent = '';
        String thirtyEightContent = '';
        String thirtyNineContent = '';
        String fortyContent = '';
        String fortyOneContent = '';
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
        String twentySixTitle = '';
        String twentySevenTitle = '';
        String twentyEightTitle = '';
        String twentyNineTitle = '';
        String thirtyTitle = '';
        String thirtyOneTitle = '';
        String thirtyTwoTitle = '';
        String thirtyThreeTitle = '';
        String thirtyFourTitle = '';
        String thirtyFiveTitle = '';
        String thirtySixTitle = '';
        String thirtySevenTitle = '';
        String thirtyEightTitle = '';
        String thirtyNineTitle = '';
        String fortyTitle = '';
        String fortyOneTitle = '';
        String she3er = '';
        String twoShe3er = '';
        String threeShe3er = '';
        String fourShe3er = '';
        String fiveShe3er = '';
        String sevenShe3er = '';
        String eightShe3er = '';
        String nineShe3er = '';
        String tenShe3er = '';
        String elevenShe3er = '';
        String twelveShe3er = '';
        String thirteenShe3er = '';
        String fifteenShe3er = '';
        String twentyShe3er = '';
        for (var item in mafatihAljinan) {
          for (var subItem in item.index) {
            if (subItem.title == text) {
              //! SouTitle
              soutitle = subItem.soutitle ?? '';
              //! SubContent 19
              subContent = subItem.subContent ?? '';
              twoSubContent = subItem.twoSubContent ?? '';
              threeSubContent = subItem.threeSubContent ?? '';
              fourSubContent = subItem.fourSubContent ?? '';
              fiveSubContent = subItem.fiveSubContent ?? '';
              sixSubContent = subItem.sixSubContent ?? '';
              sevenSubContent = subItem.sevenSubContent ?? '';
              eightSubContent = subItem.eightSubContent ?? '';
              nineSubContent = subItem.nineSubContent ?? '';
              tenSubContent = subItem.tenSubContent ?? '';
              elevenSubContent = subItem.elevenSubContent ?? '';
              twelveSubContent = subItem.twelveSubContent ?? '';
              thirteenSubContent = subItem.thirteenSubContent ?? '';
              fourteenSubContent = subItem.fourteenSubContent ?? '';
              fifteenSubContent = subItem.fifteenSubContent ?? '';
              sixteenSubContent = subItem.sixteenSubContent ?? '';
              seventeenSubContent = subItem.seventeenSubContent ?? '';
              eighteenSubContent = subItem.eighteenSubContent ?? '';
              nineteenSubContent = subItem.nineteenSubContent ?? '';

              //! Content 23
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

              //! Titles 23
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
              break;
            }
            for (var inSubItem in subItem.index) {
              if (inSubItem.title == text) {
                //! Content 41
                content = inSubItem.content ?? '';
                twoContent = inSubItem.twoContent ?? '';
                threeContent = inSubItem.threeContent ?? '';
                fourContent = inSubItem.fourContent ?? '';
                fiveContent = inSubItem.fiveContent ?? '';
                sixContent = inSubItem.sixContent ?? '';
                sevenContent = inSubItem.sevenContent ?? '';
                eightContent = inSubItem.eightContent ?? '';
                nineContent = inSubItem.nineContent ?? '';
                tenContent = inSubItem.tenContent ?? '';
                elevenContent = inSubItem.elevenContent ?? '';
                twelveContent = inSubItem.twelveContent ?? '';
                thirteenContent = inSubItem.thirteenContent ?? '';
                fourteenContent = inSubItem.fourteenContent ?? '';
                fifteenContent = inSubItem.fifteenContent ?? '';
                sixteenContent = inSubItem.sixteenContent ?? '';
                seventeenContent = inSubItem.seventeenContent ?? '';
                eighteenContent = inSubItem.eighteenContent ?? '';
                nineteenContent = inSubItem.nineteenContent ?? '';
                twentyContent = inSubItem.twentyContent ?? '';
                twentyOneContent = inSubItem.twentyOneContent ?? '';
                twentyTwoContent = inSubItem.twentyTwoContent ?? '';
                twentyThreeContent = inSubItem.twentyThreeContent ?? '';
                twentyFourContent = inSubItem.twentyFourContent ?? '';
                twentyFiveContent = inSubItem.twentyFiveContent ?? '';
                twentySixContent = inSubItem.twentySixContent ?? '';
                twentySevenContent = inSubItem.twentySevenContent ?? '';
                twentyEightContent = inSubItem.twentyEightContent ?? '';
                twentyNineContent = inSubItem.twentyNineContent ?? '';
                thirtyContent = inSubItem.thirtyContent ?? '';
                thirtyOneContent = inSubItem.thirtyOneContent ?? '';
                thirtyTwoContent = inSubItem.thirtyTwoContent ?? '';
                thirtyThreeContent = inSubItem.thirtyThreeContent ?? '';
                thirtyFourContent = inSubItem.thirtyFourContent ?? '';
                thirtyFiveContent = inSubItem.thirtyFiveContent ?? '';
                thirtySixContent = inSubItem.thirtySixContent ?? '';
                thirtySevenContent = inSubItem.thirtySevenContent ?? '';
                thirtyEightContent = inSubItem.thirtyEightContent ?? '';
                thirtyNineContent = inSubItem.thirtyNineContent ?? '';
                fortyContent = inSubItem.fortyContent ?? '';
                fortyOneContent = inSubItem.fortyOneContent ?? '';

                //! Titles 41
                firstTitle = inSubItem.subtitle ?? '';
                twoTitle = inSubItem.twoSubtitle ?? '';
                threeTitle = inSubItem.threeSubtitle ?? '';
                fourTitle = inSubItem.fourSubtitle ?? '';
                fiveTitle = inSubItem.fiveSubtitle ?? '';
                sixTitle = inSubItem.sixSubtitle ?? '';
                sevenTitle = inSubItem.sevenSubtitle ?? '';
                eightTitle = inSubItem.eightSubtitle ?? '';
                nineTitle = inSubItem.nineSubtitle ?? '';
                tenTitle = inSubItem.tenSubtitle ?? '';
                elevenTitle = inSubItem.elevenSubtitle ?? '';
                twelveTitle = inSubItem.twelveSubtitle ?? '';
                thirteenTitle = inSubItem.thirteenSubtitle ?? '';
                fourteenTitle = inSubItem.fourteenSubtitle ?? '';
                fifteenTitle = inSubItem.fifteenSubtitle ?? '';
                sixteenTitle = inSubItem.sixteenSubtitle ?? '';
                seventeenTitle = inSubItem.seventeenSubtitle ?? '';
                eighteenTitle = inSubItem.eighteenSubtitle ?? '';
                nineteenTitle = inSubItem.nineteenSubtitle ?? '';
                twentyTitle = inSubItem.twentySubtitle ?? '';
                twentyOneTitle = inSubItem.twentyOneSubtitle ?? '';
                twentyTwoTitle = inSubItem.twentyTwoSubtitle ?? '';
                twentyThreeTitle = inSubItem.twentyThreeSubtitle ?? '';
                twentyFourTitle = inSubItem.twentyFourSubtitle ?? '';
                twentyFiveTitle = inSubItem.twentyFiveSubtitle ?? '';
                twentySixTitle = inSubItem.twentySixSubtitle ?? '';
                twentySevenTitle = inSubItem.twentySevenSubtitle ?? '';
                twentyEightTitle = inSubItem.twentyEightSubtitle ?? '';
                twentyNineTitle = inSubItem.twentyNineSubtitle ?? '';
                thirtyTitle = inSubItem.thirtySubtitle ?? '';
                thirtyOneTitle = inSubItem.thirtyOneSubtitle ?? '';
                thirtyTwoTitle = inSubItem.thirtyTwoSubtitle ?? '';
                thirtyThreeTitle = inSubItem.thirtyThreeSubtitle ?? '';
                thirtyFourTitle = inSubItem.thirtyFourSubtitle ?? '';
                thirtyFiveTitle = inSubItem.thirtyFiveSubtitle ?? '';
                thirtySixTitle = inSubItem.thirtySixSubtitle ?? '';
                thirtySevenTitle = inSubItem.thirtySevenSubtitle ?? '';
                thirtyEightTitle = inSubItem.thirtyEightSubtitle ?? '';
                thirtyNineTitle = inSubItem.thirtyNineSubtitle ?? '';
                fortyTitle = inSubItem.fortySubtitle ?? '';
                fortyOneTitle = inSubItem.fortyOneSubtitle ?? '';

                //! She3er 13
                she3er = inSubItem.she3er ?? '';
                twoShe3er = inSubItem.twoShe3er ?? '';
                threeShe3er = inSubItem.threeShe3er ?? '';
                fourShe3er = inSubItem.fourShe3er ?? '';
                fiveShe3er = inSubItem.fiveShe3er ?? '';
                sevenShe3er = inSubItem.sevenShe3er ?? '';
                eightShe3er = inSubItem.eightShe3er ?? '';
                nineShe3er = inSubItem.nineShe3er ?? '';
                tenShe3er = inSubItem.tenShe3er ?? '';
                elevenShe3er = inSubItem.elevenShe3er ?? '';
                twelveShe3er = inSubItem.twelveShe3er ?? '';
                thirteenShe3er = inSubItem.thirteenShe3er ?? '';
                fifteenShe3er = inSubItem.fifteenShe3er ?? '';
                twentyShe3er = inSubItem.twentyShe3er ?? '';
                break;
              }
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
              subContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: subContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
                      ),
                    )
                  : SizedBox.shrink(),
              soutitle != ''
                  ? Container(
                      child: SelectableText(
                        soutitle,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize:
                              isTablet ? fontSizeTablet - 3 : fontSize - 3,
                          fontFamily: 'Tajawal',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              Container(
                child: ListOfNineVerses(
                  title: firstTitle != '' ? firstTitle : '',
                  subtitle: content,
                  weight: FontWeight.w600,
                  size: isTablet ? fontSizeTablet : fontSize,
                ),
              ),
              she3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: she3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twoSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: twoSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              twoShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: twoShe3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              threeSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: threeSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              threeShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: threeShe3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fourSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: fourSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              fourShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: fourShe3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fiveSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: fiveSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              fiveShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: fiveShe3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              sixSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: sixSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              sevenSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: sevenSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              sevenShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: sevenShe3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              eightSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: eightSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              eightShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: eightShe3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              nineSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: nineSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              nineShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: nineShe3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              tenSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: tenSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              tenShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: tenShe3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet - 1 : fontSize - 1,
                      ),
                    )
                  : SizedBox.shrink(),
              elevenSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: elevenSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              elevenShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: elevenShe3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twelveSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: twelveSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              twelveShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: twelveShe3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirteenSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: thirteenSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              thirteenShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: thirteenShe3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fourteenSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: fourteenSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              fifteenSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: fifteenSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              fifteenShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: fifteenShe3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              sixteenSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: sixteenSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              seventeenSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: seventeenSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              eighteenSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: eighteenSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              nineteenSubContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: nineteenSubContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
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
              twentyShe3er != ''
                  ? Container(
                      child: She3er(
                        subtitle: twentyShe3er,
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
              twentySixContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentySixTitle != '' ? twentySixTitle : '',
                        subtitle: twentySixContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentySevenContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentySevenTitle != '' ? twentySevenTitle : '',
                        subtitle: twentySevenContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyEightContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyEightTitle != '' ? twentyEightTitle : '',
                        subtitle: twentyEightContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              twentyNineContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twentyNineTitle != '' ? twentyNineTitle : '',
                        subtitle: twentyNineContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirtyContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirtyTitle != '' ? thirtyTitle : '',
                        subtitle: thirtyContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirtyOneContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirtyOneTitle != '' ? thirtyOneTitle : '',
                        subtitle: thirtyOneContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirtyTwoContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirtyTwoTitle != '' ? thirtyTwoTitle : '',
                        subtitle: thirtyTwoContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirtyThreeContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirtyThreeTitle != '' ? thirtyThreeTitle : '',
                        subtitle: thirtyThreeContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirtyFourContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirtyFourTitle != '' ? thirtyFourTitle : '',
                        subtitle: thirtyFourContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirtyFiveContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirtyFiveTitle != '' ? thirtyFiveTitle : '',
                        subtitle: thirtyFiveContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirtySixContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirtySixTitle != '' ? thirtySixTitle : '',
                        subtitle: thirtySixContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirtySevenContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirtySevenTitle != '' ? thirtySevenTitle : '',
                        subtitle: thirtySevenContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirtyEightContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirtyEightTitle != '' ? thirtyEightTitle : '',
                        subtitle: thirtyEightContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              thirtyNineContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirtyNineTitle != '' ? thirtyNineTitle : '',
                        subtitle: thirtyNineContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fortyContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fortyTitle != '' ? fortyTitle : '',
                        subtitle: fortyContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fortyOneContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fortyOneTitle != '' ? fortyOneTitle : '',
                        subtitle: fortyOneContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        );
      } else if (state is MafatihAljinanError) {
        return Center(
          child: SelectableText(state.message),
        );
      }
      return const SizedBox();
    });
  }
}
