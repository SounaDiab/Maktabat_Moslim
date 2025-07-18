import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iya_mashhoura.dart';
import 'douaa_alaahd.dart';
import 'douaa_makarim_alakhlak.dart';

class DouaaAlfaraj extends StatefulWidget {
  static String screenRoute = 'douaa_alfaraj_screen';
  const DouaaAlfaraj({super.key});

  @override
  State<DouaaAlfaraj> createState() => _DouaaAlfarajState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _DouaaAlfarajState extends State<DouaaAlfaraj> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_alfaraj_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_alfaraj_screen', value);
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
          .pushReplacementNamed(Ad3iyaMashhoura.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (previousPage == 'favorite_screen') {
                Navigator.of(context)
                    .pushReplacementNamed(FavoritesScreen.screenRoute);
              } else {
                Navigator.of(context).pushReplacementNamed(
                    Ad3iyaMashhoura.screenRoute);
              }
            },
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
                      .addFavorite('دعاء الفرج', DouaaAlfaraj.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء الفرج', DouaaAlfaraj.screenRoute,
                          DouaaAlfaraj.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء الفرج',
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
                      'اِلـهي عَظُمَ الْبَلاءُ، وَبَرِحَ الْخَفاءُ، وَانْكَشَفَ الْغِطاءُ، وَانْقَطَعَ الرَّجاءُ، وَضاقَتِ الأرض، وَمُنِعَتِ السَّماءُ، واَنْتَ الْمُسْتَعانُ، وَاِلَيْكَ الْمُشْتَكى، وَعَلَيْكَ الْمُعَوَّلُ فِي الشِّدَّةِ والرَّخاءِ، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، اُولِي الأمر الَّذينَ فَرَضْتَ عَلَيْنا طاعَتَهُمْ، وَعَرَّفْتَنا بِذلِكَ مَنْزِلَتَهُمْ، فَفَرِّجْ عَنا بِحَقِّهِمْ فَرَجاً عاجِلاً قَريباً كَلَمْحِ الْبَصَرِ اَوْ هُوَ اَقْرَبُ، يا مُحَمَّدُ يا عَلِيُّ يا عَلِيُّ يا مُحَمَّدُ اِكْفِياني فَاِنَّكُما كافِيانِ، وَانْصُراني فَاِنَّكُما ناصِرانِ، يا مَوْلانا يا صاحِبَ الزَّمانِ، الْغَوْثَ الْغَوْثَ الْغَوْثَ، اَدْرِكْني اَدْرِكْني اَدْرِكْني، السّاعَةَ السّاعَةَ السّاعَةَ، الْعَجَلَ الْعَجَلَ الْعَجَل، يا اَرْحَمَ الرّاحِمينَ، بِحَقِّ مُحَمَّد وَآلِهِ الطّاهِرينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: DouaaAlaahd.screenRoute,
        pushBack: DouaaMakarimAlakhlak.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء الفرج.mp3',
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
