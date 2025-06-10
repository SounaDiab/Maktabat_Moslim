import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'fi_ad3iya_ma2soura_lilrizk.dart';
import 'fi_zikr_ba3d_ma_warad_lilham_wal8am_wal5awf_wa8airaha.dart';

class FiZikrDou3a2ainLildin extends StatefulWidget {
  static String screenRoute = 'fi_zikr_dou3a2ain_lildin_screen';
  const FiZikrDou3a2ainLildin({super.key});

  @override
  State<FiZikrDou3a2ainLildin> createState() => _FiZikrDou3a2ainLildinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiZikrDou3a2ainLildinState extends State<FiZikrDou3a2ainLildin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_zikr_dou3a2ain_lildin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_zikr_dou3a2ain_lildin_screen', value);
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
                      .addFavorite('في ذكر دعائين للدين',
                          FiZikrDou3a2ainLildin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في ذكر دعائين للدين',
                          FiZikrDou3a2ainLildin.screenRoute,
                          FiZikrDou3a2ainLildin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في ذكر دعائين للدين',
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
                  title: 'الأول :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : قل : اللّهُمَّ لَحْظَةً مِنْ لَحَظاتِكَ تُيَسِّرُ عَلَيَّ غُرَمائي بِها القَضاء وَتُيَسِّرُ لي بِها الاقْتِضاءَ إنَّكَ عَلى كُلِّ شَيٍ قَديرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'هذا الدعاء المروي عن موسى بن جعفر (عليه السلام) : اللّهُمَّ ارْدُدْ إِلى جَميعِ خَلْقك مَظالِمَهُمْ الَّتي قِبَلي صَغيرها وَكَبيرَها في يُسْرٍ مِنْكَ وَعافيةٍ وَمالَمْ تَبْلُغْهُ قوَّتي وَلَمْ تَسَعْهُ ذاتُ يَدي وَلَمْ يقوَ عَلَيْهِ بَدَني ويَقيني وَنَفْسي فَأدِّهِ عَنّي مِنْ جَزيلِ ماعِندَكَ مِنْ فَضْلِكَ، ثُمَّ لاتَخْلِفْ عَلَيَّ مِنْهُ شَيْئاً تَقْضيهِ مِنْ حَسَناتي ياأرْحَمْ الرّاحِمينَ. أشْهَدُ أنْ لا إلهَ إِلاّ الله وَحْدَهُ لاشَريكَ لَهُ، وَأشْهَدُ أنَّ مُحَمَّداً عَبْدُهُ وَرَسُولُهُ، وَأنَّ الدينَ كَما شَرَعَ وَأنَّ الاسْلامَ كَما وَصَفَ وَأنَّ الكتاب كَما أَنْزَلَ وَأنَّ القَوْلَ كَما حَدَّثَ، وَأنَّ الله هوَ الحَقُّ المُبينُ ذَكَرَ الله مُحَمَّداً وَأهْلَ بَيْتِهِ بِخَيْرٍ وَحَيّا مُحَمَّداً وَأهْلَ بَيْتِهِ بالسَّلامِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha.screenRoute,
          pushBack: FiAd3iyaMa2souraLilrizk.screenRoute,
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
