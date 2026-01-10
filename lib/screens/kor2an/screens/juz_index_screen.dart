import '../../../Util/app_imports.dart';

import '../core/index.dart';
import '../widgets/horizental_divider.dart';
import '../widgets/juz_card.dart';

class JuzIndexScreen extends StatelessWidget {
  static String screenRoute = 'juz_index_screen';
  const JuzIndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookMark = Provider.of<BookMarkProvider>(context);
    final overlay = Provider.of<ShowOverlayProvider>(context, listen: false);
    final quran = Provider.of<Quran>(context, listen: false);

    void _goToBookMark() {
      quran.goToPage(bookMark.markPage);
      overlay.toggleisShowOverlay();
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstant.ajzaa),
        actions: [
          TextButton.icon(
            onPressed: _goToBookMark,
            icon: SvgPicture.asset(
              AppAsset.saveFilled,
              // color: colorScheme.juzCardText,
            ),
            label: FittedBox(
              child: Text(
                AppConstant.goToBookMark,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: 30,
        separatorBuilder: (context, index) {
          return HorizentalDiv(
            thickness: 3,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return JuzCard(juz: index + 1);
        },
      ),
    );
  }
}
