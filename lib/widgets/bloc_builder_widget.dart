import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'container_scrollview.dart';

import '../business logic/cubit/a3mal_laylat_alkader_cubit.dart';
import 'list_of_nine_verses.dart';

class BlocBuilderWidget extends StatelessWidget {
  final String? text;
  final bool? isKoraan;
  final double fontSize;
  final double fontSizeTablet;
  BlocBuilderWidget({
    super.key,
    required this.text,
    required this.isKoraan,
    required this.fontSize,
    required this.fontSizeTablet,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return BlocBuilder<A3malLaylatAlkaderCubit, A3malLaylatAlkaderState>(
        builder: (context, state) {
      if (state is A3malLaylatAlkaderLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is A3malLaylatAlkaderLoaded) {
        final a3malLaylatAlkader = state.items;
        String content = '';
        String secondContent = '';
        String thirdContent = '';
        String fourthContent = '';
        String subContent = '';
        String secondSubContent = '';
        String subtitle = '';
        String secondSubtitle = '';
        String thirdSubtitle = '';
        String fourthSubtitle = '';
        String souContent = '';
        for (var item in a3malLaylatAlkader) {
          for (var subItem in item.index) {
            if (subItem.title == text) {
              content = subItem.content ?? '';
                  secondContent = subItem.secondContent ?? '';
                  thirdContent = subItem.thirdContent ?? '';
                  fourthContent = subItem.fourthContent ?? '';
                  subContent = subItem.subContent ?? '';
                  secondSubContent = subItem.secondSubContent ?? '';
                  subtitle = subItem.subtitle ?? '';
                  secondSubtitle = subItem.secondSubtitle ?? '';
                  thirdSubtitle = subItem.thirdSubtitle ?? '';
                  fourthSubtitle = subItem.fourthSubtitle ?? '';
                  souContent = subItem.souContent ?? '';
                  break;
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
              isKoraan == false
                  ? Center(
                      child: Text(
                        'اللهم صلِّ على محمد وآل محمد',
                        style: TextStyle(
                          fontSize: isTablet ? fontSizeTablet + 10 : fontSize,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'UthmanicHafs',
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              souContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: souContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
                      ),
                    )
                  : SizedBox.shrink(),
              content != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: subtitle != '' ? subtitle : '',
                        subtitle: content,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              subContent != ''
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        subContent,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: isTablet ? fontSizeTablet : fontSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              secondContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: secondSubtitle != '' ? secondSubtitle : '',
                        subtitle: secondContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              secondSubContent != ''
                  ? Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        secondSubContent,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: isTablet ? fontSizeTablet : fontSize,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              thirdContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirdSubtitle != '' ? thirdSubtitle : '',
                        subtitle: thirdContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
              fourthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fourthSubtitle != '' ? fourthSubtitle : '',
                        subtitle: fourthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        );
      } else if (state is A3malLaylatAlkaderError) {
        return Center(
          child: Text(state.message),
        );
      }
      return const SizedBox();
    });
  }
}
