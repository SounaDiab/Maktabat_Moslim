import '../../../Util/app_imports.dart';

import '../core/index.dart';
import '../quran/page_data.dart';
import '../quran/quran.dart';
import 'custom_button.dart';
import 'info_overlay/info_text.dart';
import 'page_feild.dart';

class GoToPagePopup extends StatefulWidget {
  const GoToPagePopup({Key? key}) : super(key: key);

  @override
  State<GoToPagePopup> createState() => _GoToPagePopupState();
}

int currentPage = -1;
String textC = '';

class _GoToPagePopupState extends State<GoToPagePopup> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final quran = Provider.of<Quran>(context, listen: false);
    final mQ = MediaQuery.of(context);
    final isLandscape = mQ.size.aspectRatio > 0.55 &&
        mQ.size.height - mQ.viewInsets.bottom < 280;

    int typedPage(String page) {
      if (int.tryParse(page) != null &&
          int.parse(page) > 0 &&
          int.parse(page) <= 604) {
        return int.parse(page);
      }
      return -1;
    }

    void _goToPage(String page) {
      if (typedPage(page) != -1) {
        quran.goToPage(int.parse(page));
      }
      currentPage = -1;
      Navigator.of(context).pop();
    }

    return Dialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: isTablet ? 60 : 30,
          horizontal: isTablet ? 60 : 10,
        ),
        child: IntrinsicWidth(
          stepWidth: isTablet ? 550 : 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    AppConstant.goToPage,
                    style: TextStyle(
                      fontSize: isTablet ? 30 : 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: PageFeild(
                      onChanged: (text) {
                        textC = text;
                        setState(() {
                          currentPage = typedPage(text);
                        });
                      },
                      onSubmitted: _goToPage,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              if (!isLandscape) ...[
                Text(
                  'معلومات عن الصفحة:',
                  style: TextStyle(
                    fontSize: isTablet ? 30 : 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PageInfo(currentPage: currentPage),
                const SizedBox(height: 10),
              ],
              ActionButtons(_goToPage, textC: textC),
            ],
          ),
        ),
      ),
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons(
    this.goToPage, {
    Key? key,
    required this.textC,
  }) : super(key: key);

  final String textC;
  final Function(String) goToPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          isFilled: true,
          text: AppConstant.cancel,
        ),
        const SizedBox(width: 10),
        CustomButton(
          onPressed: () => goToPage(textC),
          text: AppConstant.move,
        ),
      ],
    );
  }
}

class PageInfo extends StatelessWidget {
  const PageInfo({
    Key? key,
    required this.currentPage,
  }) : super(key: key);

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    Color color = const Color.fromARGB(255, 99, 170, 227);

    return currentPage == -1
        ? Text(
            'الرجاء إدخال رقم صفحة ما بين 1 و 604',
            style: TextStyle(
              fontSize: isTablet ? 30 : 10,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 126, 11, 3),
            ),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  InfoText(
                    text:
                        '${AppConstant.juz} ${currentPage == 121 || currentPage == 201 ? quranPages[currentPage - 1].juz - 1 : quranPages[currentPage - 1].juz}',
                    svgIcon: AppAsset.part,
                    color: color,
                    padding: 0,
                  ),
                  const SizedBox(width: 20),
                  InfoText(
                    text: gethizbText(currentPage),
                    svgIcon: AppAsset.page,
                    color: color,
                    padding: 0,
                  ),
                ],
              ),
              InfoText(
                text: getSurahDataWithNameByPage(currentPage),
                svgIcon: AppAsset.book,
                color: color,
                padding: 0,
              ),
            ],
          );
  }
}
