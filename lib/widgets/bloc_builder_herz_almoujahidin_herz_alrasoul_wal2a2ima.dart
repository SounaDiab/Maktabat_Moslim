import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business logic/cubit/herz_almoujahidin_cubit.dart';
import 'container_scrollview.dart';

import 'list_of_nine_verses.dart';

class BlocBuilderHerzAlmoujahidinHerzAlrasoulWal2a2ima extends StatelessWidget {
  final String? text;
  final bool? isKoraan;
  final double fontSize;
  final double fontSizeTablet;
  BlocBuilderHerzAlmoujahidinHerzAlrasoulWal2a2ima({
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
    return BlocBuilder<HerzAlmoujahidinCubit, HerzAlmoujahidinState>(
        builder: (context, state) {
      if (state is HerzAlmoujahidinLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is HerzAlmoujahidinLoaded) {
        final herzAlmoujahidin = state.items;
        String content = '';
        String secondContent = '';
        String thirdContent = '';
        for (var item in herzAlmoujahidin) {
          for (var subItem in item.index) {
            if (subItem.title == text) {
              content = subItem.content!;
              secondContent = subItem.secondContent ?? '';
              thirdContent = subItem.thirdContent ?? '';
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
                  : Container(),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: content,
                  weight: FontWeight.w600,
                  size: isTablet ? fontSizeTablet : fontSize,
                ),
              ),
              secondContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: secondContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
                      ),
                    )
                  : Container(),
              thirdContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: thirdContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
            ],
          ),
        );
      } else if (state is HerzAlmoujahidinError) {
        return Center(
          child: Text(state.message),
        );
      }
      return const SizedBox();
    });
  }
}
