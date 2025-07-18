import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_al7aja_alrabi3a.dart';
import 'salat_al7aja_alsaniya.dart';

class SalatAl7ajaAlsalisa extends StatefulWidget {
  static String screenRoute = 'salat_al7aja_alsalisa_screen';
  const SalatAl7ajaAlsalisa({super.key});

  @override
  State<SalatAl7ajaAlsalisa> createState() => _SalatAl7ajaAlsalisaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAl7ajaAlsalisaState extends State<SalatAl7ajaAlsalisa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_al7aja_alsalisa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_al7aja_alsalisa_screen', value);
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
          .pushReplacementNamed(Ba3dAlsalawatAlmandouba.screenRoute);
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
                      .addFavorite('صلاة الحاجة الثالثة',
                          SalatAl7ajaAlsalisa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الحاجة الثالثة',
                          SalatAl7ajaAlsalisa.screenRoute,
                          SalatAl7ajaAlsalisa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الحاجة الثالثة',
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
                      'روي أن من كان له إلى الله حاجة يريد قضاءها فليصلّ أربع ركعات يقرأ في كل ركعة فاتحة الكتاب والانعام ويقول عقيب الصلاة: ياكَريمُ ياكَريمُ ياكَريمُ ياعَظيمُ ياعَظيمُ ياأعْظَمُ مِنْ كُلِّ عَظيمٌ ياسَميعَ الدُّعاءِ، يامَنْ لاتُغَيِّرَهُ اللّيالي وَالايامُ صَلِّ عَلى مُحَمَّدٍ وَآلِهِ وَارْحَمْ ضَعْفي وَفَقْري وفاقَتي وَمَسْكَنَتي، فإنّكَ أعْلَمُ بِها مِني وَأنْتَ أعْلَمُ بِحاجَتي، يامَنْ رَحِمَ الشَّيْخَ يَعْقوبَ حينَ رَدَّ عَلَيهِ يوسُفَ قُرَّةَ عَيْنِهِ يامَنْ رَحِمَ أيوبَ بَعْدَ طولِ بَلائِهِ يامَنْ رَحِمَ مُحَمَّداً (صلّى الله عليه وآله وسلم) وَمِنَ اليُتْمِ آواهُ وَنَصَرَهُ عَلى جَبابِرَةِ قُريشٍ وَطَواغيتِها وَامْكَنَهُ مِنْهُمْ، يامُغيثُ يامُغيثُ يامُغيثُ !!! يقوله مراراً ثم يسأل الله حاجته فإن الله تعالى يعطيها له.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAl7ajaAlrabi3a.screenRoute,
          pushBack: SalatAl7ajaAlsaniya.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/صلاة الحاجة الثالثة.mp3',
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
