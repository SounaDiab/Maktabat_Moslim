import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business logic/cubit/alhakiba_alramadaneya_cubit.dart';
import 'container_scrollview.dart';
import 'list_of_nine_verses.dart';

class BlocBuilderAlhakibaAlramadaneya extends StatelessWidget {
  final String? text;
    final double fontSize;
  final double fontSizeTablet;

  BlocBuilderAlhakibaAlramadaneya({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontSizeTablet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return BlocBuilder<AlhakibaAlramadaneyaCubit, AlhakibaAlramadaneyaState>(
        builder: (context, state) {
      if (state is AlhakibaAlramadaneyaLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is AlhakibaAlramadaneyaLoaded) {
        final alhakibaAlramadaneya = state.items;
        String content = '';
        String secondContent = '';
        String thirdContent = '';
        String fourthContent = '';
        String fifthContent = '';
        String sixthContent = '';
        String seventhContent = '';
        String eighthContent = '';
        String ninthContent = '';
        String tenthContent = '';
        String eleventhContent = '';
        String twelfthContent = '';
        String thirteenthContent = '';
        String fourteenthContent = '';
        String fifteenthContent = '';
        String sixteenthContent = '';
        String seventeenthContent = '';
        String eighteenthContent = '';
        String nineteenthContent = '';
        String she3er = '';
        String firstTitle = '';
        String secondTitle = '';
        String thirdTitle = '';
        String fourthTitle = '';
        String fifthTitle = '';
        String sixthTitle = '';
        String seventhTitle = '';
        String eighthTitle = '';
        String ninthTitle = '';
        String tenthTitle = '';
        String eleventhTitle = '';
        String twelfthTitle = '';
        String thirteenthTitle = '';
        String fourteenthTitle = '';
        String fifteenthTitle = '';
        String sixteenthTitle = '';
        String seventeenthTitle = '';
        String eighteenthTitle = '';
        String nineteenthTitle = '';
        for (var item in alhakibaAlramadaneya) {
          for (var subItem in item.index) {
            if (subItem.title == text) {
              content = subItem.content ?? '';
              secondContent = subItem.secondContent ?? '';
              thirdContent = subItem.thirdContent ?? '';
              fourthContent = subItem.fourthContent ?? '';
              fifthContent = subItem.fifthContent ?? '';
              sixthContent = subItem.sixthContent ?? '';
              seventhContent = subItem.seventhContent ?? '';
              eighthContent = subItem.eighthContent ?? '';
              ninthContent = subItem.ninthContent ?? '';
              tenthContent = subItem.tenthContent ?? '';
              eleventhContent = subItem.eleventhContent ?? '';
              twelfthContent = subItem.twelfthContent ?? '';
              thirteenthContent = subItem.thirteenthContent ?? '';
              fourteenthContent = subItem.fourteenthContent ?? '';
              fifteenthContent = subItem.fifteenthContent ?? '';
              sixteenthContent = subItem.sixteenthContent ?? '';
              seventeenthContent = subItem.seventeenthContent ?? '';
              eighteenthContent = subItem.eighteenthContent ?? '';
              nineteenthContent = subItem.nineteenthContent ?? '';
              she3er = subItem.she3er ?? '';
              firstTitle = subItem.subtitle ?? '';
              secondTitle = subItem.secondSubtitle ?? '';
              thirdTitle = subItem.thirdSubtitle ?? '';
              fourthTitle = subItem.fourthSubtitle ?? '';
              fifthTitle = subItem.fifthSubtitle ?? '';
              sixthTitle = subItem.sixthSubtitle ?? '';
              seventhTitle = subItem.seventhSubtitle ?? '';
              eighthTitle = subItem.eighthSubtitle ?? '';
              ninthTitle = subItem.ninthSubtitle ?? '';
              tenthTitle = subItem.tenthSubtitle ?? '';
              eleventhTitle = subItem.eleventhSubtitle ?? '';
              twelfthTitle = subItem.twelfthSubtitle ?? '';
              thirteenthTitle = subItem.thirteenthSubtitle ?? '';
              fourteenthTitle = subItem.fourteenthSubtitle ?? '';
              fifteenthTitle = subItem.fifteenthSubtitle ?? '';
              sixteenthTitle = subItem.sixteenthSubtitle ?? '';
              seventeenthTitle = subItem.seventeenthSubtitle ?? '';
              eighteenthTitle = subItem.eighteenthSubtitle ?? '';
              nineteenthTitle = subItem.nineteenthSubtitle ?? '';
            }
          }
        }
        return ContainerScrollview(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'بسم الله الرحمن الرحيم',
                  style: TextStyle(
                    fontSize: isTablet ? fontSizeTablet + 10 : fontSize,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'UthmanicHafs',
                  ),
                ),
              ),
              Center(
                child: Text(
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
              secondContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: secondTitle != '' ? secondTitle : '',
                        subtitle: secondContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              thirdContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirdTitle != '' ? thirdTitle : '',
                        subtitle: thirdContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              she3er != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: she3er,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              fourthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fourthTitle != '' ? fourthTitle : '',
                        subtitle: fourthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              fifthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fifthTitle != '' ? fifthTitle : '',
                        subtitle: fifthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              sixthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: sixthTitle != '' ? sixthTitle : '',
                        subtitle: sixthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              seventhContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: seventhTitle != '' ? seventhTitle : '',
                        subtitle: seventhContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              eighthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: eighthTitle != '' ? eighthTitle : '',
                        subtitle: eighthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              ninthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: ninthTitle != '' ? ninthTitle : '',
                        subtitle: ninthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              tenthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: tenthTitle != '' ? tenthTitle : '',
                        subtitle: tenthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              eleventhContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: eleventhTitle != '' ? eleventhTitle : '',
                        subtitle: eleventhContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              twelfthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twelfthTitle != '' ? twelfthTitle : '',
                        subtitle: twelfthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              thirteenthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirteenthTitle != '' ? thirteenthTitle : '',
                        subtitle: thirteenthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              fourteenthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fourteenthTitle != '' ? fourteenthTitle : '',
                        subtitle: fourteenthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              fifteenthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fifteenthTitle != '' ? fifteenthTitle : '',
                        subtitle: fifteenthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              sixteenthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: sixteenthTitle != '' ? sixteenthTitle : '',
                        subtitle: sixteenthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              seventeenthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: seventeenthTitle != '' ? seventeenthTitle : '',
                        subtitle: seventeenthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              eighteenthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: eighteenthTitle != '' ? eighteenthTitle : '',
                        subtitle: eighteenthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              nineteenthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: nineteenthTitle != '' ? nineteenthTitle : '',
                        subtitle: nineteenthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      } else if (state is AlhakibaAlramadaneyaError) {
        return Center(
          child: Text(state.message),
        );
      }
      return const SizedBox();
    });
  }
}
