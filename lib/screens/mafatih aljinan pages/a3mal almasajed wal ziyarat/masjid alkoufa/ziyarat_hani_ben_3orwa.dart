import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'fi_fadl_alkoufa_wamasjidouha.dart';
import 'ziyarat_mouslim_ben_3akil.dart';

class ZiyaratHaniBen3orwa extends StatefulWidget {
  static String screenRoute = 'ziyarat_hani_ben_3orwa_screen';
  const ZiyaratHaniBen3orwa({super.key});

  @override
  State<ZiyaratHaniBen3orwa> createState() => _ZiyaratHaniBen3orwaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratHaniBen3orwaState extends State<ZiyaratHaniBen3orwa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_hani_ben_3orwa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_hani_ben_3orwa_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context)
          .pushReplacementNamed(FadlLakoufaWmasjidoha.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
          leading: IconButton(
            onPressed: _onWillPop,
            icon: Icon(
              Icons.arrow_back,
              size: isTablet ? 50 : 25,
            ),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.only(left: isTablet ? 50 : 30),
              icon: Icon(
                isIcon ? Icons.favorite_border : Icons.favorite_rounded,
                size: isTablet ? 40 : 25,
                color: isIcon ? Colors.black : Colors.red,
              ),
              onPressed: () async {
                setState(() {
                  isIcon = !isIcon;
                });
                await _saveFavoriteState(isIcon);

                if (!isIcon) {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .addFavorite('زيارةهاني بن عروة (رحمة الله ورضوانه عليه)',
                          ZiyaratHaniBen3orwa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارةهاني بن عروة (رحمة الله ورضوانه عليه)',
                          ZiyaratHaniBen3orwa.screenRoute,
                          ZiyaratHaniBen3orwa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارةهاني بن عروة (رحمة الله ورضوانه عليه)',
            style: TextStyle(
              fontSize: isTablet
                  ? 40
                  : size > 1.0
                      ? 20
                      : 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ContainerScrollview(
          widget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'بسم الله الرحمن الرحيم',
                        style: TextStyle(
                          fontSize: isTablet ? _fontSizeTablet : _fontSize,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'اللهم صلِّ على محمد وآل محمد',
                        style: TextStyle(
                          fontSize: isTablet ? _fontSizeTablet : _fontSize,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'تقف عند قبره وتسلّم على رسول الله (صلى الله عليه وآله وسلم) وتقول :\n\n'
                      'سَلامُ اللهِ الْعَظيمِ وَصَلَواتُهُ عَلَيْكَ يا هانِيَ بْنَ عُرْوَةَ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الْعَبْدُ الصّالِحُ النّاصِحُ للهِ وَلِرَسُولِهِ وَلاَِميرِ الْمُؤْمِنينَ وَالْحَسَنِ وَالْحُسَيْنِ عَلَيْهِمُ السَّلامُ، اَشْهَدُ اَنَّكَ قُتِلْتَ مَظْلُوماً، فَلَعَنَ اللهُ مَنْ قَتَلَكَ وَاسْتَحَلَّ دَمَكَ، وَحَشى قُبُورَهُمْ ناراً، اَشْهَدُ اَنَّكَ لَقِيْتَ اللهَ وَهُوَ راض عَنْكَ بِما فَعَلْتَ وَنَصَحْتَ، وَاَشْهَدُ اَنَّكَ قَدْ بَلَغْتَ دَرَجَةَ الشُّهَداءِ وَجَعَلَ رُوحَكَ مَعَ اَرْواحِ السُّعَداءِ بِما نَصَحْتَ للهِ وَلِرَسُولِهِ مُجْتَهِداً، وَبَذَلْتَ نَفْسَكَ في ذاتِ اللهِ وَمَرْضاتِهِ، فَرَحِمَكَ اللهُ وَرَضِيَ عَنْكَ وَحَشَرَكَ مَعَ مُحَمَّد وَآلِهِ الطّاهِرينَ، وَجَمَعَنا وَاِيّاكُمْ مَعَهُمْ في دارِ النَّعيمِ، وَسَلامٌ عَلَيْكَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.\n\n'
                      'ثمّ صلّ ركعتين واهدها الى هاني وادعُ لنفسك بما شئت وودّعه بما تودّع به مسلم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiFadlAlkoufaWamasjidouha.screenRoute,
          pushBack: ZiyaratMouslimBen3akil.screenRoute,
          soud: '',
          onTap: (double fontSize) {
            // تحديث حجم الخط
            setState(() {
              isTablet ? _fontSizeTablet = fontSize : _fontSize = fontSize;
            });
            print('fontSize: $fontSize');
            // إغلاق Dialog
            Navigator.of(context).pop();
          },
          onLongPress: () {
            final snackBar = SnackBar(
              content: Center(
                child: Text(
                  '${isTablet ? _fontSizeTablet.toInt() : _fontSize.toInt()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
              width: 60,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.blue,
              duration: Duration(seconds: 2),
              shape: ShapeBorder.lerp(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                1,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        ),
      ),
    );
  }
}
