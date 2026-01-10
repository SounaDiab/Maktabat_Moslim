// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../Util/app_imports.dart';


class BlocBuilderHerzAlmoujahidin extends StatelessWidget {
  final String? text;
  final double fontSize;
  final double fontSizeTablet;
  String? firstTitle;
  final String? secondTitle;
  final String? thirdTitle;
  final String? fourthTitle;
  final String? fifthTitle;
  final String? sixthTitle;
  final String? seventhTitle;
  final String? eighthTitle;
  final String? ninthTitle;
  final String? tenthTitle;
  final String? eleventhTitle;
  final String? twelfthTitle;
  final bool? isKoraan;
  BlocBuilderHerzAlmoujahidin({
    Key? key,
    required this.text,
    required this.fontSize,
    required this.fontSizeTablet,
    this.firstTitle,
    this.secondTitle,
    this.thirdTitle,
    this.fourthTitle,
    this.fifthTitle,
    this.sixthTitle,
    this.seventhTitle,
    this.eighthTitle,
    this.ninthTitle,
    this.tenthTitle,
    this.eleventhTitle,
    this.twelfthTitle,
    required this.isKoraan,
  }) : super(key: key);

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
        String beforContent = '';
        String beforSecondContent = '';
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
        for (var item in herzAlmoujahidin) {
          if (item.title == text) {
            content = item.content ?? '';
            beforContent = item.beforContent ?? '';
            beforSecondContent = item.beforSecondContent ?? '';
            secondContent = item.secondContent ?? '';
            thirdContent = item.thirdContent ?? '';
            fourthContent = item.fourthContent ?? '';
            fifthContent = item.fifthContent ?? '';
            sixthContent = item.sixthContent ?? '';
            seventhContent = item.seventhContent ?? '';
            eighthContent = item.eighthContent ?? '';
            ninthContent = item.ninthContent ?? '';
            tenthContent = item.tenthContent ?? '';
            eleventhContent = item.eleventhContent ?? '';
            twelfthContent = item.twelfthContent ?? '';
            break;
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
              beforContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: beforContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
                      ),
                    )
                  : Container(),
              Container(
                child: ListOfNineVerses(
                  title: firstTitle ?? '',
                  subtitle: content,
                  weight:
                      firstTitle == 'تعريف' ? FontWeight.w400 : FontWeight.w600,
                  size: isTablet
                      ? firstTitle == 'تعريف'
                          ? fontSizeTablet - 4
                          : fontSizeTablet
                      : firstTitle == 'تعريف'
                          ? fontSize - 4
                          : fontSize,
                ),
              ),
              secondContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: secondTitle ?? '',
                        subtitle: secondContent,
                        weight:
                            secondTitle == 'آثاره' || secondTitle == 'آثارها'
                                ? FontWeight.w400
                                : FontWeight.w600,
                        size: isTablet
                            ? secondTitle == 'آثاره' || secondTitle == 'آثارها'
                                ? fontSizeTablet - 4
                                : fontSizeTablet
                            : secondTitle == 'آثاره' || secondTitle == 'آثارها'
                                ? fontSize - 4
                                : fontSize,
                      ),
                    )
                  : Container(),
              beforSecondContent != ''
                  ? Container(
                      padding: EdgeInsets.only(top: 10),
                      child: ListOfNineVerses(
                        title: '',
                        subtitle: beforSecondContent,
                        weight: FontWeight.w400,
                        size: isTablet ? fontSizeTablet - 4 : fontSize - 4,
                      ),
                    )
                  : Container(),
              thirdContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: thirdTitle ?? '',
                        subtitle: thirdContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              fourthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fourthTitle ?? '',
                        subtitle: fourthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              fifthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: fifthTitle ?? '',
                        subtitle: fifthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              sixthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: sixthTitle ?? '',
                        subtitle: sixthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              seventhContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: seventhTitle ?? '',
                        subtitle: seventhContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              eighthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: eighthTitle ?? '',
                        subtitle: eighthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              ninthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: ninthTitle ?? '',
                        subtitle: ninthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              tenthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: tenthTitle ?? '',
                        subtitle: tenthContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              eleventhContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: eleventhTitle ?? '',
                        subtitle: eleventhContent,
                        weight: FontWeight.w600,
                        size: isTablet ? fontSizeTablet : fontSize,
                      ),
                    )
                  : Container(),
              twelfthContent != ''
                  ? Container(
                      child: ListOfNineVerses(
                        title: twelfthTitle ?? '',
                        subtitle: twelfthContent,
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
