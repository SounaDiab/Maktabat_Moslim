import '../../../../Util/app_imports.dart';

import '../../core/index.dart';
// import '../../providers/style_provider.dart';
import '../custom_container.dart';
import '../go_to_page_popup.dart';
import '../horizental_divider.dart';
import '../vertical_divider.dart';

class BottomOverlay extends StatefulWidget {
  BottomOverlay({Key? key}) : super(key: key);

  @override
  State<BottomOverlay> createState() => _BottomOverlayState();
}

class _BottomOverlayState extends State<BottomOverlay> {
  @override
  Widget build(BuildContext context) {
    final quran = Provider.of<Quran>(context, listen: false);
    final bookMark = Provider.of<BookMarkProvider>(context);
    final overlay = Provider.of<ShowOverlayProvider>(context, listen: false);

    void _goToBookMark() {
      quran.goToPage(bookMark.markPage);
      overlay.toggleisShowOverlay();
    }

    return CustomContainer(
      child: Column(
        children: [
          SizedBox(
            height: 45,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: bookMark.changeMark,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            bookMark.markButtonText == AppConstant.saveBookmark
                                ? AppAsset.save
                                : AppAsset.saveFilled,
                            color: Theme.of(context).iconTheme.color,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            bookMark.markButtonText,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          HorizentalDiv(color: Theme.of(context).indicatorColor),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: TextButton.icon(
                    onPressed: _goToBookMark,
                    icon: SvgPicture.asset(
                      AppAsset.saveFilled,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label: FittedBox(
                      child: Text(
                        AppConstant.goToBookMark,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                ),
                VerticalDiv(color: Theme.of(context).indicatorColor),
                Expanded(
                  flex: 4,
                  child: TextButton.icon(
                    onPressed: () {
                      showDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) => GoToPagePopup(),
                      );
                      overlay.toggleisShowOverlay();
                    },
                    icon: SvgPicture.asset(
                      AppAsset.page,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label: FittedBox(
                      child: Text(
                        AppConstant.changePage,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          HorizentalDiv(color: Theme.of(context).indicatorColor),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushNamed(IndexScreen.screenRoute);
                    },
                    icon: SvgPicture.asset(
                      AppAsset.index,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label: Text(
                      AppConstant.index,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
                VerticalDiv(color: Theme.of(context).indicatorColor),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(JuzIndexScreen.screenRoute);
                    },
                    icon: SvgPicture.asset(
                      AppAsset.part,
                      color: Theme.of(context).iconTheme.color,
                    ),
                    label: Text(
                      AppConstant.ajzaa,
                      style: Theme.of(context).textTheme.labelMedium,
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
