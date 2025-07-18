import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ziarat_al2osbou3.dart';
import 'ziarat_al2arbi3a2.dart';
import 'ziarat_al2isnain.dart';

class ZiaratAlsoulasa2 extends StatefulWidget {
  static String screenRoute = 'ziarat_alsoulasa2_screen';
  const ZiaratAlsoulasa2({super.key});

  @override
  State<ZiaratAlsoulasa2> createState() => _ZiaratAlsoulasa2State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiaratAlsoulasa2State extends State<ZiaratAlsoulasa2> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ziarat_alsoulasa2_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziarat_alsoulasa2_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiaratAl2osbou3.screenRoute);
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
                Navigator.of(context)
                    .pushReplacementNamed(ZiaratAl2osbou3.screenRoute);
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
                      .addFavorite(
                          'زيارة يوم الثلثاء', ZiaratAlsoulasa2.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة يوم الثلثاء',
                          ZiaratAlsoulasa2.screenRoute,
                          ZiaratAlsoulasa2.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة يوم الثلثاء',
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
                  title:
                      'وَهُو باسم عليّ بن الحسين ومحمّد بن عليّ الباقر وجعفر بن محمّد الصّادق صلوات الله عليهم أجمعين ؛ زيارتهم (عليهم السلام):',
                  subtitle:
                      'اَلسَّلامُ عَلَيْكُمْ يا خُزّانَ عِلْمِ اللهِ اَلسَّلامُ عَلَيْكُمْ يا تَراجِمَةَ وَحْيِ اللهِ اَلسَّلامُ عَلَيْكُمْ يا اَئِمَّةَ الْهُدى اَلسَّلامُ عَلَيْكُمْ يا اَعْلامَ التُّقى اَلسَّلامُ عَلَيْكُمْ يا اَوْلادَ رَسُولِ اللهِ اَنَا عارِفٌ بِحَقِّكُمْ مُسْتَبْصِرٌ بِشَأْنِكُمْ مُعاد لاَِعْدائِكُمْ مُوال لاَِوْلِيائِكُمْ بِاَبى اَنْتُمْ وَاُمّى صَلَواتُ اللهِ عَلَيْكُمْ اَللّهُمَّ اِنّى اَتَوالى آخِرَهُمْ كَما تَوالَيْتُ اَوَّلَهُمْ وَاَبْرَأُ مِنْ كُلِّ وَليجَة دُونَهُمْ وَاَكْفُرُ بِالْجِبْتِ وَالطّاغُوتِ وَاللاتِ وَالْعُزّى صَلَواتُ اللهِ عَلَيْكُمْ يا مَوالِيَّ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ اَلسَّلامُ عَلَيْكَ يا سَيِّدَ الْعابِدينَ وَسُلالَةَ الْوَصِيّينَ اَلسَّلامُ عَلَيْكَ يا باقِرَ عِلْمِ النَّبِيّينَ اَلسَّلامُ عَلَيْكَ يا صادِقاً مُصَدِّقاً فِي الْقَوْلِ وَالْفِعْلِ يا مَوالِيَّ هذا يَوْمُكُمْ وَهُوَ يَوْمُ الثلاثاء وَاَنَا فيهِ ضَيْفٌ لَكُمْ وَمُسْتَجيرٌ بِكُمْ فَاَضيفُوني وَاَجيرُوني بِمَنْزِلَةِ اللهِ عِنْدَكُمْ وَآلِ بَيْتِكُمُ الطَّيِّبينَ الطّاهِرينَ.',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiaratAl2arbi3a2.screenRoute,
          pushBack: ZiaratAl2isnain.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة الثلثاء.mp3',
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
