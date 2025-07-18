import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'dou3a2_li7al_almarbout.dart';
import 'dou3a2_lilso2lol_wlilawram.dart';

class Dou3a2Lita3asorAlwilada extends StatefulWidget {
  static String screenRoute = 'dou3a2_lita3asor_alwilada_screen';
  const Dou3a2Lita3asorAlwilada({super.key});

  @override
  State<Dou3a2Lita3asorAlwilada> createState() =>
      _Dou3a2Lita3asorAlwiladaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Lita3asorAlwiladaState
    extends State<Dou3a2Lita3asorAlwilada> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_dou3a2_lita3asor_alwilada_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_dou3a2_lita3asor_alwilada_screen', value);
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
                      .addFavorite('دعاء لتعسر الولادة',
                          Dou3a2Lita3asorAlwilada.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء لتعسر الولادة',
                          Dou3a2Lita3asorAlwilada.screenRoute,
                          Dou3a2Lita3asorAlwilada.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء لتعسر الولادة',
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
                      'تكتب لها في رق : بِسْمِ اللّهِ الرَّحْمنِ الرَّحيمِ كَأَنَّهُمْ يَوْمَ يَرَوْنَ مايوعَدونَ لَمْ يَلْبثُوا إِلاّ ساعَةً مِنْ نَهارٍ كَأَنَّهُمْ يَوْمَ يَرَوْنَها لَمْ يَلْبثُوا إِلاّ عَشيَّةٍ أوْ ضُحاها. إذْ قالَتْ إمْرأةَ عِمْرانٍ رَبِّ إِنِّي نَذَرْتُ لَكَ مافي بَطْني مُحَرَراً فَتَقَبَّلْ مِنِّي إنَّكَ أنْتَ السَّمِيعُ العَلِيمُ ثم تربطه على فخذها الايمن فإذا وضعت فانزعه. وروي أيضا: يقرأ عليها : فَأجائَها الَمخاضُ إِلى جِذْعِ النَّخْلَةِ الى قوله رَطَبا جَنيا. ثم يعلي صوته بهذه الآية : وَالله أخْرَجَكُمْ مِنْ بِطونِ أمَّهاتِكُمْ لاتَعْلَمونَ شَيْئاً وَجَعَلَ لَكُمْ السَّمْعَ وَالابْصارَ وَالافْئِدَةَ لَعَلَّكُمْ تَشْكُرونَ كَذلِكَ أخْرُجْ أيُّها الطَّلقُ اُخْرُجُ بِإذْنِ اللّهِ. وروي أيضاً عن الصادق (صلوات الله وسلامه عليه) لتيسير الولادة : يكتب على ورق أو رق: اللّهُمَّ فارِجَ الهَمِّ وَكاشِفَ الغَمِّ وَرَحْمنَ الدُّنْيا وَالاخِرَة وَرَحيمَهُما إرْحَمْ فُلانَةَ بِنْتَ فُلانَةَ رَحْمَةً تُغْنيها بِها عَنْ رَحْمَةِ جَميعِ خَلْقِكَ، تُفَرِّجُ بِها كُرْبَتها وَتَكْشُفُ بِها غَمَّها وَتُيَسِّرُ وَلادَتَها، وَقُضيَ بَيْنَهُمْ بِالحَقِّ وَهُمْ لايُظْلَمونَ وَقيلَ الحَمْدُ لله ربِّ العالَمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Li7alAlmarbout.screenRoute,
          pushBack: Dou3a2Lilso2lolWlilawram.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء لتعسر الولادة.mp3',
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
