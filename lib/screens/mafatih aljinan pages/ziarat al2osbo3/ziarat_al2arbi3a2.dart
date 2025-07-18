import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ziarat_al2osbou3.dart';
import 'ziarat_al5amis.dart';
import 'ziarat_alsoulasa2.dart';

class ZiaratAl2arbi3a2 extends StatefulWidget {
  static String screenRoute = 'ziarat_al2arbi3a2_screen';
  const ZiaratAl2arbi3a2({super.key});

  @override
  State<ZiaratAl2arbi3a2> createState() => _ZiaratAl2arbi3a2State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiaratAl2arbi3a2State extends State<ZiaratAl2arbi3a2> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ziarat_al2arbi3a2_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziarat_al2arbi3a2_screen', value);
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
                          'زيارة يوم الأربعاء', ZiaratAl2arbi3a2.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة يوم الأربعاء',
                          ZiaratAl2arbi3a2.screenRoute,
                          ZiaratAl2arbi3a2.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة يوم الأربعاء',
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
                      'َهُو باسم مُوسى بن جعفر وعلي بن مُوسى الرّضا ومحمّد التقي وعلي النقي ؛ زيارتهم (عليهم السلام):',
                  subtitle:
                      'اَلسَّلامُ عَلَيْكُمْ يا اَوْلِياءَ اللهِ اَلسَّلامُ عَلَيْكُمْ يا حُجَجَ اللهِ اَلسَّلامُ عَلَيْكُمْ يا نُورَ اللهِ فى ظُلُماتِ الاَْرْضِ اَلسَّلامُ عَلَيْكُمْ صَلَواتُ اللهِ عَلَيْكُمْ وَعَلى آلِ بَيْتِكُمُ الطَّيِّبينَ الطّاهِرينَ بِاَبى اَنْتُمْ وَاُمّى لَقَدْ عَبَدْتُمُ اللهَ مُخْلِصينَ وَجاهَدْتُمْ فِي اللهِ حَقَّ جِهادِهِ حَتّى أتاكم الْيَقينُ فَلَعَنَ اللهُ اَعْداءكُمْ مِنَ الْجِنِّ وَالاِْنْسِ اَجَمْعَينَ وَاَنَا اَبْرَأُ اِلَى اللهِ وَاِلَيْكُمْ مِنْهُمْ، يا مَوْلايَ يا اَبا اِبْراهيمَ مُوسَى بْنَ جَعْفَر يا مَوْلايَ يا اَبَا الْحَسَنِ عَلِيَّ بْنَ مُوسى يا مَوْلايَ يا اَبا جَعْفَر مُحَمَّدَ بْنَ عَلِيٍّ يا مَوْلايَ يا اَبَا الْحَسَنِ عَلِيَّ بْنَ مُحَمَّد اَنَا مَوْلىً لَكُمْ مُؤْمِنٌ بِسِرِّكُمْ وَجَهْرِكُمْ مُتَضَيِّفٌ بِكُمْ في يَوْمِكُمْ هذا وَهُوَ يَوْمُ الاَْرْبَعاءِ وَمُسْتَجيرٌ بِكُمْ فَاَضيفُوني وَ اَجيرُوني بِـآلِ بَيْتِـكُـمُ الطَّيـِّبيـنَ الطّاهِـريـنَ.',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiaratAl5amis.screenRoute,
          pushBack: ZiaratAlsoulasa2.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة الاربعاء.mp3',
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
