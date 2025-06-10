import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/index.dart';
import '../../providers/bookmark.dart';
import '../../providers/quran.dart';
import '../../providers/show_overlay_provider.dart';
// import '../../providers/style_provider.dart';
import '../../screens/index_screen.dart';
import '../../screens/juz_index_screen.dart';
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
    // final styleProvider = Provider.of<StyleProvider>(context, listen: false);

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
                          ),
                          const SizedBox(width: 10),
                          Text(
                            bookMark.markButtonText,
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // const VerticalDiv(),
                // Expanded(
                //   child: GestureDetector(
                //     onTap: () {
                //       styleProvider.toggleStyle();
                //       print(styleProvider.style);
                //     },
                //     child: Consumer<StyleProvider>(
                //       builder: (context, styleProvider, child) => Container(
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             SvgPicture.asset(
                //               AppAsset.book,
                //             ),
                //             const SizedBox(width: 10),
                //             Text(
                //               '${AppConstant.goStyle} ${styleProvider.style}',
                //               style: textStyle,
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          const HorizentalDiv(),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  flex: 5,
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
                const VerticalDiv(),
                Expanded(
                  flex: 4,
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
                    label: const FittedBox(
                      child: Text(
                        AppConstant.changePage,
                        style: textStyle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const HorizentalDiv(),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
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
                const VerticalDiv(),
                Expanded(
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

const textStyle = TextStyle(
  color: Colors.white,
  fontSize: 15,
);
