import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alrida.dart';
import 'ziyarat_alimam_alrida_alsaniya.dart';

class ZiyaratAlimamAlridaAl2oula extends StatefulWidget {
  static String screenRoute = 'ziyarat_alimam_alrida_al2oula_screen';
  const ZiyaratAlimamAlridaAl2oula({super.key});

  @override
  State<ZiyaratAlimamAlridaAl2oula> createState() =>
      _ZiyaratAlimamAlridaAl2oulaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratAlimamAlridaAl2oulaState
    extends State<ZiyaratAlimamAlridaAl2oula> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_alimam_alrida_al2oula_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_ziyarat_alimam_alrida_al2oula_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiyaratAlrida.screenRoute);
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
                      .addFavorite('زيارة الإمام الرضا (عليه السلام) الأولى',
                          ZiyaratAlimamAlridaAl2oula.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة الإمام الرضا (عليه السلام) الأولى',
                          ZiyaratAlimamAlridaAl2oula.screenRoute,
                          ZiyaratAlimamAlridaAl2oula.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة الإمام الرضا (عليه السلام) الأولى',
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
                      'روى ابن قولويه عن بعض الائمة (عليهم السلام) انّه قال : اذا صرت الى قبر الامام الرّضا (عليه السلام) فقُل :\n\n'
                      'اَللّـهُمَّ صَلِّ عَلى عَلِيِّ بْنِ مُوسَى الرِّضا الْمُرْتَضَى الاِْمامِ التَّقِيِّ النَّقِيِّ وَحُجَّتِكَ عَلى مَنْ فَوْقَ الاَْرْضِ وَمَنْ تَحْتَ الثَّرى، الصِّدّيقِ الشَّهيدِ، صَلاةً كَثيرَةً تامَّةً زاكِيَةً مُتَواصِلَةً مُتَواتِرَةً مُتَرادِفَةً، كَاَفْضَلِ ما صَلَّيْتَ عَلى اَحَد مِنْ اَوْلِيائِكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: ZiyaratAlimamAlridaAlsaniya.screenRoute,
        pushBack: ZiyaratAlimamAlridaAlsaniya.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة الامام الرضا الاولى.mp3',
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
