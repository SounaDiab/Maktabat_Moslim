import '../../../Util/app_imports.dart';
import '../core/index.dart';
import '../quran/quran.dart';
import '../widgets/horizental_divider.dart';
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

    void _goToBookMark() {
      quran.goToPage(bookMark.markPage);
      overlay.toggleisShowOverlay();
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstant.surahIndex),
        actions: [
          TextButton.icon(
            onPressed: _goToBookMark,
            icon: SvgPicture.asset(
              AppAsset.saveFilled,
              color: Theme.of(context).appBarTheme.foregroundColor,
              width: isTablet ? 25 : 20,
            ),
            label: FittedBox(
              child: Text(
                isTablet ? AppConstant.goToBookMark : '',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 114,
        separatorBuilder: (context, index) {
          return HorizentalDiv();
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
                leading: SurahNumber(
                  number: surahNumber,
                ),
                title: Text(
                  getSurahNameArabic(surahNumber),
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.displayMedium?.fontFamily,
                    fontSize: isTablet ? 45 : 25,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                subtitle: Text(
                  getSurahData(surahNumber),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: isTablet ? 20 : 15,
                      ),
                ),
                trailing: Text(
                  '${page}',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: isTablet ? 42 : 21,
                      ),
                ),
              ),
              if (isMarkedSurah(bookMark.markPage, surahNumber))
                const Marker(left: 80),
            ],
          );
        },
      ),
    );
  }
}
