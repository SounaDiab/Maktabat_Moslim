import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business logic/cubit/albakiyat_alsalihat_cubit.dart';
import 'container_scrollview.dart';
import 'list_of_nine_verses.dart';

class BlocBuilderAlbakiyatAlsalihat extends StatelessWidget {
  final String? text;
  final double fontSize;
  final double fontSizeTablet;

  BlocBuilderAlbakiyatAlsalihat({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontSizeTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return BlocBuilder<AlbakiyatAlsalihatCubit, AlbakiyatAlsalihatState>(
        builder: (context, state) {
      if (state is AlbakiyatAlsalihatLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is AlbakiyatAlsalihatLoaded) {
        final albakiyatAlsalihat = state.items;
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
        for (var item in albakiyatAlsalihat) {
          for (var subItem in item.index) {
            if (subItem.title == text) {
              //! Content 41
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
              twentySixContent = subItem.twentySixContent ?? '';
              twentySevenContent = subItem.twentySevenContent ?? '';
              twentyEightContent = subItem.twentyEightContent ?? '';
              twentyNineContent = subItem.twentyNineContent ?? '';
              thirtyContent = subItem.thirtyContent ?? '';
              thirtyOneContent = subItem.thirtyOneContent ?? '';
              thirtyTwoContent = subItem.thirtyTwoContent ?? '';
              thirtyThreeContent = subItem.thirtyThreeContent ?? '';
              thirtyFourContent = subItem.thirtyFourContent ?? '';
              thirtyFiveContent = subItem.thirtyFiveContent ?? '';
              thirtySixContent = subItem.thirtySixContent ?? '';
              thirtySevenContent = subItem.thirtySevenContent ?? '';
              thirtyEightContent = subItem.thirtyEightContent ?? '';
              thirtyNineContent = subItem.thirtyNineContent ?? '';
              fortyContent = subItem.fortyContent ?? '';

              //! Titles 41
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
              twentySixTitle = subItem.twentySixSubtitle ?? '';
              twentySevenTitle = subItem.twentySevenSubtitle ?? '';
              twentyEightTitle = subItem.twentyEightSubtitle ?? '';
              twentyNineTitle = subItem.twentyNineSubtitle ?? '';
              thirtyTitle = subItem.thirtySubtitle ?? '';
              thirtyOneTitle = subItem.thirtyOneSubtitle ?? '';
              thirtyTwoTitle = subItem.thirtyTwoSubtitle ?? '';
              thirtyThreeTitle = subItem.thirtyThreeSubtitle ?? '';
              thirtyFourTitle = subItem.thirtyFourSubtitle ?? '';
              thirtyFiveTitle = subItem.thirtyFiveSubtitle ?? '';
              thirtySixTitle = subItem.thirtySixSubtitle ?? '';
              thirtySevenTitle = subItem.thirtySevenSubtitle ?? '';
              thirtyEightTitle = subItem.thirtyEightSubtitle ?? '';
              thirtyNineTitle = subItem.thirtyNineSubtitle ?? '';
              fortyTitle = subItem.fortySubtitle ?? '';
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
            ],
          ),
        );
      } else if (state is AlbakiyatAlsalihatError) {
        return Center(
          child: SelectableText(state.message),
        );
      }
      return const SizedBox();
    });
  }
}
