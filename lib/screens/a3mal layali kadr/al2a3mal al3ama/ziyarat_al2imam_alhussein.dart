import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al3ama.dart';
import 'dou3a2_altawasol_belmis7af.dart';
import 'ziyarat_3ali_bin_alhussein.dart';

class ZiyaratAl2imamAlhussein extends StatefulWidget {
  static String screenRoute = 'ziyarat_al2imam_alhussein_screen';
  const ZiyaratAl2imamAlhussein({super.key});

  @override
  State<ZiyaratAl2imamAlhussein> createState() =>
      _ZiyaratAl2imamAlhusseinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratAl2imamAlhusseinState extends State<ZiyaratAl2imamAlhussein> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_al2imam_alhussein_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_al2imam_alhussein_screen', value);
  }

    Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Al2a3malAl3ama.screenRoute);
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
                      .addFavorite('زيارة الامام الحسين عليه السلام',
                          ZiyaratAl2imamAlhussein.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة الامام الحسين عليه السلام',
                          ZiyaratAl2imamAlhussein.screenRoute,
                          ZiyaratAl2imamAlhussein.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة الامام الحسين عليه السلام',
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
              Center(
                child: Text(
                  'بسم الله الرحمن الرحيم',
                  style: TextStyle(
                    fontSize: isTablet ? _fontSizeTablet + 10 : _fontSize,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'السَّلامُ عَلَيْكَ يابْنَ رَسُولِ اللهِ السَّلامُ عَلَيْكَ يابْنَ أَمِيرِ الْمُؤْمِنِينَ السَّلامُ عَلَيْكَ يابْنَ الصِّدِّيقَةِ الطَّاهِرَةِ فاطِمَةَ سَيِّدَةِ نِساءِ الْعالَمِينَ السَّلامُ عَلَيْكَ يا مَوْلايَ يا أَبَا عَبْدِ اللهِ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ أَشْهَدُ أَنَّكَ قَدْ أَقَمْتَ الصَّلاةَ وَأتَيْتَ الزَّكاةَ وَأَمَرْتَ بِالْمَعْرُوفِ وَنَهَيْتَ عَنِ الْمُنْكَرِ وَتَلَوْتَ الْكِتابَ حَقَّ تِلاوَتِهِ وَجاهَدْتَ فِي اللهِ حَقَّ جِهادِهِ وَصَبَرْتَ عَلَى الأَذَى فِي جَنْبِهِ مُحْتَسِباً حَتَّى أَتَاكَ الْيَقِينُ أَشْهَدُ أَنَّ الَّذِينَ خالَفُوكَ وَحارَبُوكَ وَالَّذِينَ خَذَلُوكَ وَالَّذِينَ قَتَلُوكَ مَلْعُونُونَ عَلَى لِسانِ النَّبِيِّ الأُمِّيِّ وَقَدْ خابَ مَنِ افْتَرَى لَعَنَ اللهُ الظَّالِمِينَ لَكُمْ مِنَ الأَوَّلِينَ وَالآخِرِينَ وَضاعَفَ عَلَيْهِمُ الْعَذابَ الأَلِيمَ أَتَيْتُكَ يا مَوْلايَ يا ابْنَ رَسُولِ اللهِ زائِراً عارِفاً بِحَقِّكَ مُوالِياً لأَوْلِيائِكَ مُعادِياً لأَعْدائِكَ مُسْتَبْصِراً بِالْهُدَى الَّذِي أَنْتَ عَلَيْهِ عارِفاً بِضَلالَةِ مَنْ خالَفَكَ فَاشْفَعْ لِي عِنْدَ رَبِّكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Ziyarat3aliBinAlhussein.screenRoute,
          pushBack: Dou3a2AltawasolBelmis7af.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة الامام الحسين عليه السلام.mp3',
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
