import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../providers/bookmark.dart';
import '../providers/show_overlay_provider.dart';
import '../quran/quran.dart';

import '../core/index.dart';
import '../providers/quran.dart';

import '../widgets/horizental_divider.dart';
import '../widgets/marker.dart';
import '../widgets/surah_number.dart';

class IndexScreen extends StatelessWidget {
  static String screenRoute = 'index_screen_screen';
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final quran = Provider.of<Quran>(context, listen: false);
    final bookMark = Provider.of<BookMarkProvider>(context);
    final overlay = Provider.of<ShowOverlayProvider>(context, listen: false);
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = TextStyle(
      color: colorScheme.juzCardText,
      fontSize: isTablet ? 30 : 15,
    );

    void _goToBookMark() {
      quran.goToPage(bookMark.markPage);
      overlay.toggleisShowOverlay();
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstant.surahIndex),
        actions: [
          TextButton.icon(
            onPressed: _goToBookMark,
            icon: SvgPicture.asset(
              AppAsset.saveFilled,
              color: colorScheme.juzCardText,
              width: isTablet ? 25 : 20,
            ),
            label: FittedBox(
              child: Text(
                isTablet ? AppConstant.goToBookMark : '',
                style: textStyle,
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 114,
        separatorBuilder: (context, index) {
          return HorizentalDiv(color: colorScheme.div);
        },
        itemBuilder: (BuildContext context, int index) {
          final surahNumber = index + 1;
          final page = getPageNumber(surahNumber);
          return Stack(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  quran.goToPageIndex(page - 1);
                },
                visualDensity: const VisualDensity(horizontal: -3),
                leading: SurahNumber(number: surahNumber),
                title: Text(
                  getSurahNameArabic(surahNumber),
                  style: const TextStyle(
                    fontFamily: AppTheme.secondaryFontFamily,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                subtitle: Text(
                  getSurahData(surahNumber),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                trailing: Text(
                  '${page}',
                  style: TextStyle(
                    fontSize: 21,
                    color: colorScheme.pageNumber,
                  ),
                ),
              ),
              if (isMarkedSurah(bookMark.markPage, surahNumber))
                const Marker(left: 60),
            ],
          );
        },
      ),
    );
  }
}