import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iyat_al2osbo3.dart';
import 'dou3a2_al5amis.dart';
import 'dou3a2_alsoulasa2.dart';

class Dou3a2Al2arbi3a2 extends StatefulWidget {
  static String screenRoute = 'dou3a2_al2arbi3a2_screen';
  const Dou3a2Al2arbi3a2({super.key});

  @override
  State<Dou3a2Al2arbi3a2> createState() => _Dou3a2Al2arbi3a2State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Al2arbi3a2State extends State<Dou3a2Al2arbi3a2> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou3a2_al2arbi3a2_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3a2_al2arbi3a2_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ad3iyatAl2osbo3.screenRoute);
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
                    .pushReplacementNamed(Ad3iyatAl2osbo3.screenRoute);
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
                          'دعاء يوم الأربعاء', Dou3a2Al2arbi3a2.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء يوم الأربعاء',
                          Dou3a2Al2arbi3a2.screenRoute,
                          Dou3a2Al2arbi3a2.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء يوم الأربعاء',
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
                      'بِسْمِ الله الرَّحْمنِ الرَّحِيمِ الحَمْدُ للهِ الَّذِي جَعَلَ اللّيْلَ لِباساً وَالنَّوْمَ سُباتاً، وَجَعَلَ النَّهارَ نُشُوراً، لَكَ الحَمْدُ أَنْ بَعَثْتَنِي مِنْ مَرْقَدِي وَلَوْ شِئْتَ جَعَلْتَهُ سَرْمَداً، حَمْداً دائِماً لايَنْقَطِعُ أَبَداً وَلايُحْصِي لَهُ الخَلائِقُ عَدَداً. اللّهُمَّ لَكَ الحَمْدُ أَنْ خَلَقْتَ فَسَوَّيْتَ وَقَدَّرْتَ وَقَضَيْتَ وَأَمَتَّ وَأَحْيَيْتَ وَأَمْرَضْتَ وَشَفَيْتَ وَعافَيْتَ وَأَبْلَيْتَ، وَعَلى العَرْشِ اسْتَوَيْتَ وَعَلى المُلْكِ احْتَوَيْتَ. أَدْعُوكَ دُعاءَ مَنْ ضَعُفَتْ وَسِيلَتُهُ وَانْقَطَعَتْ حِيلَتُهُ وَاقْتَرَبَ أَجَلُهُ وَتَدانى فِي الدُّنْيا أَمَلُهُ، وَاشْتَدَّتْ إِلى رَحْمَتِكَ فاقَتُهُ وَعَظُمَتْ لِتَفْرِيطِهِ حَسْرَتُهُ وَكَثُرَتْ زَلَّتُهُ وَعَثْرَتُهُ وَخَلُصَتْ لِوَجْهِكَ تَوْبَتُهُ. فَصَلِّ عَلى مُحَمَّدٍ خاتَمِ النَّبِيِّينَ وَعَلى أَهْلِ بَيْتِهِ الطَّيِّبِينَ الطَّاهِرِينَ، وَارْزُقْنِي شَفاعَةَ مُحَمَّدٍ صَلَّى الله عَلَيْهِ وَآلِهِ، وَلاتَحْرِمْنِي صُحْبَتَهُ إِنَّكَ أَنْتَ أَرحَمُ الرّاحِمِينَ. اللّهُمَّ اقْضِ لِي فِي الاَرْبِعاءِ أَرْبَعاً: اجْعَلْ قُوَّتِي فِي طاعَتِكَ، وَنَشاطِي فِي عِبادَتِكَ، وَرَغْبَتِي فِي ثَوابِكَ، وَزُهْدِي فِيما يُوجِبُ لِي أَلِيمَ عِقابِكَ، إِنَّكَ لَطِيفٌ لِما تَشاءُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: Dou3a2Al5amis.screenRoute,
        pushBack: Dou3a2Alsoulasa2.screenRoute,
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
