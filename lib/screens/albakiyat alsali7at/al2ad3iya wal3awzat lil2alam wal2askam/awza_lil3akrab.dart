import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'awza_lil2amn_men_alsarik.dart';
import 'dou3a2_al3afiya.dart';

class AwzaLil3akrab extends StatefulWidget {
  static String screenRoute = 'awza_lil3akrab_screen';
  const AwzaLil3akrab({super.key});

  @override
  State<AwzaLil3akrab> createState() => _AwzaLil3akrabState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AwzaLil3akrabState extends State<AwzaLil3akrab> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_awza_lil3akrab_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_awza_lil3akrab_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(
          Al2ad3iyaWal3awzatLil2alamWal2askam.screenRoute);
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
                      .addFavorite('عوذة للعقرب', AwzaLil3akrab.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('عوذة للعقرب', AwzaLil3akrab.screenRoute,
                          AwzaLil3akrab.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'عوذة للعقرب',
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
                      'روي أنه يحدّ النظر إلى السُّهى، وهو نجم صغير بجانب النجم الاوسط من نجوم بنات النعش ويقول ثلاثا:\n\n'
                      'اللّهُمَّ رَبَّ أَسْلَمَ صَلِّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَعَجِّلْ فَرَجَهُمْ وَسَلِّمْنا مِنْ شَرِّ كُلِّ ذي شَرِّ. وروي أيضاً أنه ينظر إليه ويقول ثلاث مرّات: اللّهُمَّ رَبَّ هودٍ ابْنِ آسِيَةَ آمِنّي شَرَّ كُلِّ عَقْرَبٍ وَحَيَّةَ. وروي أيضاً عن الصادق (عليه السلام) لدفع العقارب والحيّات يقرأ عند المساء: بِسْمِ الله وَبِالله وصَلّى الله عَلى مُحَمَّدٍ وَآلِهِ أَخَذْتُ العَقارِبَ وَالحَيّاتِ كُلَّها بِإذْنِ الله تَبارَكَ وَتَعالى بِأفْواهِها وَأذْنابِها وأسْماعِها وَأَبْصارِها وَقُواها عَنّي وَعَمَّنْ أحْبَبْتُ إِلى ضَحْوَةِ النَّهارِ إنْ شاءَ الله تَعالى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'وللعقرب أيضاً :',
                  subtitle:
                      'يقول: سَلامٌ عَلى نُوحٍ في العالَمينَ إنَّا كَذلِكَ نُجْزي الُمحْسنينَ إنَّهُ مِنْ عِبادِنا المؤمِنينَ. وروي أنه لما ركب نوح (عليه السلام) في السفينة أبى أن يحمل العقرب معه، فقال: عاهدتك أن لا ألسع أحداً يقول: سَلامٌ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَعَلى نوحٍ في العالَمينَ. وفي عدة أحاديث أن مسح موضع لسع العقرب وغيره بالملح يذهب السم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Al3afiya.screenRoute,
          pushBack: AwzaLil2amnMenAlsarik.screenRoute,
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
