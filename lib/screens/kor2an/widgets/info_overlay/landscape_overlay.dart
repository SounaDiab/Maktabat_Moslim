import '../../../../Util/app_imports.dart';

import '../../core/index.dart';
// import '../../providers/style_provider.dart';
import '../custom_container.dart';
import '../go_to_page_popup.dart';
import '../horizental_divider.dart';
import '../vertical_divider.dart';
import 'info_text.dart';

class LandscapeOverlay extends StatelessWidget {
  const LandscapeOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context);
    final bookMark = Provider.of<BookMarkProvider>(context);
    final overlay = Provider.of<ShowOverlayProvider>(context, listen: false);
    // final styleProvider = Provider.of<StyleProvider>(context);

    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
    );

    void _goToBookMark() {
      quran.goToPage(bookMark.markPage);
      overlay.toggleisShowOverlay();
    }

    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              InfoText(
                text: '${AppConstant.page} ${quran.currentPage}',
                svgIcon: AppAsset.page,
              ),
              const SizedBox(width: 5),
              InfoText(
                text: '${AppConstant.juz} ${quran.juz}',
                svgIcon: AppAsset.part,
              ),
              const SizedBox(width: 5),
              InfoText(
                text: quran.hizbText,
              ),
              const SizedBox(width: 5),
              InfoText(
                text: quran.surahData,
                svgIcon: AppAsset.book,
              ),
              const Spacer(),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        icon: SvgPicture.asset(
                          bookMark.isMarkedPage
                              ? AppAsset.saveFilled
                              : AppAsset.save,
                        ),
                        onPressed: bookMark.changeMark,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          HorizentalDiv(color: Theme.of(context).indicatorColor),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextButton.icon(
                    onPressed: _goToBookMark,
                    icon: SvgPicture.asset(AppAsset.saveFilled),
                    label: const FittedBox(
                      child: Text(
                        AppConstant.goToBookMark,
                        style: textStyle,
                      ),
                    ),
                  ),
                ),
                VerticalDiv(color: Theme.of(context).indicatorColor),
                Expanded(
                  flex: 3,
                  child: TextButton.icon(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => const GoToPagePopup(),
                      );
                      overlay.toggleisShowOverlay();
                    },
                    icon: SvgPicture.asset(AppAsset.page),
                    label: const Text(
                      AppConstant.changePage,
                      style: textStyle,
                    ),
                  ),
                ),
                VerticalDiv(color: Theme.of(context).indicatorColor),
                Expanded(
                  flex: 2,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(IndexScreen.screenRoute);
                    },
                    icon: SvgPicture.asset(AppAsset.index),
                    label: const Text(
                      AppConstant.index,
                      style: textStyle,
                    ),
                  ),
                ),
                VerticalDiv(color: Theme.of(context).indicatorColor),
                Expanded(
                  flex: 2,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(JuzIndexScreen.screenRoute);
                    },
                    icon: SvgPicture.asset(AppAsset.part),
                    label: const Text(
                      AppConstant.ajzaa,
                      style: textStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
