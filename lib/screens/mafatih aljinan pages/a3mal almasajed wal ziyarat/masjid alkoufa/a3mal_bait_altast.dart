import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'a3mal_dikat_alkada2_wbait_altast.dart';
import 'zikr_alsalat_waldou3aa_fi_wasat_almasjid.dart';

class A3malBaitAltast extends StatefulWidget {
  static String screenRoute = 'a3mal_bait_altast_screen';
  const A3malBaitAltast({super.key});

  @override
  State<A3malBaitAltast> createState() => _A3malBaitAltastState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malBaitAltastState extends State<A3malBaitAltast> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_a3mal_bait_altast_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_a3mal_bait_altast_screen', value);
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
                      .addFavorite(
                          'التعقيبات العامة', A3malBaitAltast.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'التعقيبات العامة',
                          A3malBaitAltast.screenRoute,
                          A3malBaitAltast.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال بيت الطست',
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
                      'المتّصل بدكّة القضاء ، تُصلّي هناك ركعتين فاذا سلّمت وسبّحت فقُل :',
                  subtitle:
                      'اَللّـهُمَّ اِنّي ذَخَرْتُ تَوْحيدي اِيّاكَ وَمَعْرِفَتي بِكَ وَاِخْلاصي لَكَ وَاِقْراري بِرُبُوبِيَّتِكَ، وَذَخَرْتُ وِلايَةَ مَنْ اَنْعَمْتَ عَلَيَّ بِمَعْرِفَتِهِمْ مِنْ بَرِيَّتِكَ مُحَمَّد وَعِتْرَتِهِ صَلَّى اللهُ عَلَيْهِمْ لِيَوْمِ فَزَعي اِلَيْكَ عاجِلاً وَآجِلاً، وَقَدْ فَزِعْتُ اِلَيْكَ وَاِلَيْهِمْ يا مَوْلايَ في هذَا الْيَوْمِ وَفي مَوْقِفي هذا وَسَأَلْتُكَ ما زَكى مِنْ نِعْمَتِكَ وَاِزاحَةَ ما اَخْشاهُ مِنْ نِقْمَتِكَ، وَالْبَرَكَةَ فيـما رَزَقْتَنيهِ، وَتَحْصينَ صَدْري مِنْ كُلِّ هَمّ وَجائِحَة وَمَعْصِيَة في ديني وَدُنْيايَ وَآخِرَتي يا اَرْحَمَ الرّاحِمينَ.\n\n'
                      'وروي انّ الصّادق (عليه السلام) قد صلّى ركعتين في بيت الطّست.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZikrAlsalatWaldou3aaFiWasatAlmasjid.screenRoute,
          pushBack: A3malDikatAlkada2WbaitAltast.screenRoute,
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
