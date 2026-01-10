import '../../../Util/app_imports.dart';

import '../core/index.dart';
import '../quran/quran.dart';
import 'horizental_divider.dart';
import 'vertical_divider.dart';

class JuzCard extends StatelessWidget {
  const JuzCard({Key? key, required this.juz}) : super(key: key);

  final int juz;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 95,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: CustomText(
                  '${AppConstant.juz} $juz',
                  fontSize: 24,
                  page: getJuzPage(juz),
                  fontWeight: FontWeight.bold,
                ),
              ),
              VerticalDiv(),
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    hizbPart(1),
                    HorizentalDiv(),
                    hizbPart(2),
                  ],
                ),
              ),
              VerticalDiv(),
              Expanded(
                  child: CustomText(
                '${getJuzPage(juz)}',
                page: getJuzPage(juz),
              ))
            ],
          ),
        ),
      ],
    );
  }

  Expanded hizbPart(int hizb) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: CustomText(
              '${AppConstant.hizb} ${getHizb(juz: juz, hizb: hizb)}',
              page: getHizbPage(
                getHizb(juz: juz, hizb: hizb),
              ),
            ),
          ),
          VerticalDiv(),
          Expanded(
            flex: 2,
            child: CustomText(
              'ربع',
              page: getHizbQuarterPage(
                getHizbQuarter(hizb: getHizb(juz: juz, hizb: hizb), quarter: 1),
              ),
            ),
          ),
          VerticalDiv(),
          Expanded(
            flex: 2,
            child: CustomText(
              'نصف',
              page: getHizbQuarterPage(
                getHizbQuarter(hizb: getHizb(juz: juz, hizb: hizb), quarter: 2),
              ),
            ),
          ),
          VerticalDiv(),
          Expanded(
            flex: 2,
            child: CustomText(
              '3 أرباع',
              page: getHizbQuarterPage(
                getHizbQuarter(hizb: getHizb(juz: juz, hizb: hizb), quarter: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText(this.text,
      {Key? key, this.fontSize, required this.page, this.fontWeight})
      : super(key: key);

  final String text;
  final double? fontSize;
  final int page;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context, listen: false);

    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: Size.infinite,
      ),
      onPressed: () {
        quran.goToPage(page);
        Navigator.pop(context);
      },
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
        ),
      ),
    );
  }
}
