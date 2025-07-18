import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ta3kibat.dart';
import 'ta3kib_alma8rib.dart';
import 'ta3kibat_3ama.dart';

class Ta3kibAl3isha2 extends StatefulWidget {
  static String screenRoute = 'ta3kib_al3isha2_screen';
  Ta3kibAl3isha2({super.key});

  @override
  State<Ta3kibAl3isha2> createState() => _Ta3kibAl3isha2State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Ta3kibAl3isha2State extends State<Ta3kibAl3isha2> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ta3kib_al3isha2_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ta3kib_al3isha2_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ta3kibat.screenRoute);
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
                    .pushReplacementNamed(Ta3kibat.screenRoute);
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
                          'تعقيب صلاة العشاء', Ta3kibAl3isha2.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'تعقيب صلاة العشاء',
                          Ta3kibAl3isha2.screenRoute,
                          Ta3kibAl3isha2.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'تعقيب صلاة العشاء',
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
                      'اَللّـهُمَّ اِنَّهُ لَيْسَ لي عِلْمٌ بِمَوْضِعِ رِزْقي وَاِنَّما اَطْلُبُهُ بِخَطَرات تَخْطُرُ عَلى قَلْبي فَاَجُولُ فى طَلَبِهِ الْبُلْدانَ فَاَنَا فيما اَنَا طالِبٌ كَالْحَيْرانِ لا اَدْري اَفى سَهْل هَوُ اَمْ في جَبَل اَمْ في اَرْض اَمْ في سَماء اَمْ في بَرٍّ اَمْ في بَحْر وَعَلى يَدَيْ مَنْ وَمِنْ قِبَلِ مَنْ وَقَدْ عَلِمْتُ اَنَّ عِلْمَهُ عِنْدَكَ وَاَسْبابَهُ بِيَدِكَ وَاَنْتَ الَّذي تَقْسِمُهُ بِلُطْفِكَ وَتُسَبِّبُهُ بِرَحْمَتِكَ '
                      'اَللّـهُمَّ فَصَلِّ عَلى مُحَمَّد وَآلِهِ وَاجْعَلْ يا رَبِّ رِزْقَكَ لي واسِعاً وَمَطْلَبَهُ سَهْلاً وَمَأخَذَهُ قَريباً وَلا تُعَنِّني بِطَلَبِ ما لَمْ تُقَدِّرْ لي فيهِ رِزْقاً فَاِنَّكَ غَنِىٌّ عَنْ عَذابي وَاَنَا فَقيرٌ اِلى رَحْمَتِكَ فَصَلِّ عَلى مُحَمَّد وَآلِهِ وَجُدْ عَلى عَبْدِكَ بِفَضْلِكَ اِنَّكَ ذُوفَضْل عَظيم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Ta3kibat3ama.screenRoute,
          pushBack: Ta3kibAlma8rib.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/تعقيب العشاء.mp3',
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
