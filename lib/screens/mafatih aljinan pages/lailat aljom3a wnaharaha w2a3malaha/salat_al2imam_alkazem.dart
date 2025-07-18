import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../lailat_aljom3a_wnaharaha_w2a3malaha.dart';
import 'salat_al2imam_alrida.dart';
import 'salat_al2imam_alsadek.dart';

class SalatAl2imamAlkazem extends StatefulWidget {
  static String screenRoute = 'salat_al2imam_alkazem_screen';
  const SalatAl2imamAlkazem({super.key});

  @override
  State<SalatAl2imamAlkazem> createState() => _SalatAl2imamAlkazemState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAl2imamAlkazemState extends State<SalatAl2imamAlkazem> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_al2imam_alkazem_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_al2imam_alkazem_screen', value);
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
          .pushReplacementNamed(LailatAljom3aWnaharahaW2a3malaha.screenRoute);
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
                    LailatAljom3aWnaharahaW2a3malaha.screenRoute);
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
                      .addFavorite('صلاة الإمام الكاظم ودعاؤه (ع)',
                          SalatAl2imamAlkazem.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الإمام الكاظم ودعاؤه (ع)',
                          SalatAl2imamAlkazem.screenRoute,
                          SalatAl2imamAlkazem.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الإمام الكاظم ودعاؤه (ع)',
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
                  title: 'صلاة الإمام الكاظم (عليه السلام)',
                  subtitle:
                      'ركعتان تقرأ في كلّ ركعة الحمد مرّة والتّوحيد اثنتي عشرة مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'دُعاء الإمام الكاظم (عليه السلام)',
                  subtitle:
                      'اِلـهى خَشَعَتِ الاصْواتُ لَكَ وَضَلَّتِ الاَحْلامُ فيكَ وَوَجِلَ كُلُّ شَيء مِنْكَ وَهرَبَ كُلُّ شَيء اِلَيْكَ وَضاقَتِ الاَشْياءُ دُونَكَ وَمَلاَ كُلَّ شَيء نُورُكَ فَأَنْتَ الرَّفيعُ في جَلالِكَ وَاَنْتَ الْبَهِيُّ فى جَمالِكَ وَاَنْتَ الْعَظيمُ فى قُدْرَتِكَ وَاْنَتَ الَّذى لا يَؤودُكَ شَيءٌ يامُنْزِلَ نِعْمَتى يا مُفَرِّجَ كُرْبَتى وَيا قاضِي حاجَتي اَعْطِني مَسْأَلَتي بِلا اِلـهَ إلاّ اَنْتَ آمَنْتُ بِكَ مُخْلِصاً لَكَ ديني، اَصْبَحْتُ عَلى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ، اَبُوءُ لَكَ بِالنِّعْمَةِ وَاَسْتَغْفِرُكَ مِنْ الذُّنُوبِ الَّتى لايَغْفِرُها غَيْرُكَ يا مَنْ هُوَ في عُلُوِّهِ دان وَفي دُنُوِّهِ عال وَفي اِشْراقِهِ مُنيرٌ وفي سُلْطانِهِ قَوِيٌّ صَلِّ عَلى مُحَمَّد وَآلِهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: SalatAl2imamAlrida.screenRoute,
        pushBack: SalatAl2imamAlsadek.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/صلاة الامام الكاظم.mp3',
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
