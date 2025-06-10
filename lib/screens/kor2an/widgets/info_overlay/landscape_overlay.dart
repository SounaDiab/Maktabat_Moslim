import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maktabat_almoslim/screens/kor2an/screens/index_screen.dart';
import 'package:maktabat_almoslim/screens/kor2an/screens/juz_index_screen.dart';
import 'package:provider/provider.dart';

import '../../core/index.dart';
import '../../providers/bookmark.dart';
import '../../providers/quran.dart';
import '../../providers/show_overlay_provider.dart';
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
                    //             const SizedBox(width: 5),
                    //             Text(
                    //               '${styleProvider.style}',
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
            ],
          ),
          const HorizentalDiv(),
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
                const VerticalDiv(),
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
                const VerticalDiv(),
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
                const VerticalDiv(),
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
