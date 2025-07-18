import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_al7aja_al2oula.dart';
import 'salat_al7aja_alsalisa.dart';

class SalatAl7ajaAlsaniya extends StatefulWidget {
  static String screenRoute = 'salat_al7aja_alsaniya_screen';
  const SalatAl7ajaAlsaniya({super.key});

  @override
  State<SalatAl7ajaAlsaniya> createState() => _SalatAl7ajaAlsaniyaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAl7ajaAlsaniyaState extends State<SalatAl7ajaAlsaniya> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_al7aja_alsaniya_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_al7aja_alsaniya_screen', value);
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
                      .addFavorite('صلاة الحاجة الثانية',
                          SalatAl7ajaAlsaniya.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الحاجة الثانية',
                          SalatAl7ajaAlsaniya.screenRoute,
                          SalatAl7ajaAlsaniya.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الحاجة الثانية',
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
                      'قال السيد ابن طاووس رض في المزار في باب أعمال جامع الكوفة في ذيل أعمال محراب أمير المؤمنين (عليه السلام) ذكر صلاة الحاجة هناك خاصة وهي أربع ركعات أى بسلامين تقرأ في الأولى فاتحة الكتاب وقل هو الله أحد عشر مرات، وفي الثانية فاتحة الكتاب والصمد أيضاً إحدى وعشرين مرة، وفي الثالثة فاتحة الكتاب والصمد أيضاً إحدى وثلاثين مرة، وفي الرابعة فاتحة الكتاب والصمد أيضاً إحدى وأربعين مرة. فإذا سلمت وسبّحت فاقرأ قل هو الله احد أيضاً إحدى وخمسين مرّة. وتستغفر الله خمسين مرة وتصلي على النبي وآله خمسين مرة وتقول خمسين مرة: لا حَوْلَ وَلا قوَةَ إِلاّ بِالله العَليّ العَظيمِ.\n\n'
                      'ثم تقول : ياالله المانِعُ قُدْرَتَهُ خَلْقَهُ وَالمالِكُ بِها سُلْطانَهُ وَالمُتَسَلِّطُ بِما في يَدَيْهِ عَلى كُلِّ مَوْجودٍ وَغَيْرُكَ يَخيبُ رَجاءُ راجيهِ وَراجيكَ مَسْرورٌ لايَخيبُ. أَسْأَلُكَ بِكُلِّ رِضىً لَكَ وَبِكُلِّ شَيٍ أنْتَ فيهِ وَبِكُلِّ شَيٍ تُحِبُّ أنْ تُذْكَرْ بِهِ. وَبِكَ ياالله فَلَيْسَ يَعْدِلُكَ شَيٌ أنْ تُصَلِّيَ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَتَحْفَظَني وَوَلَدي وَأهْلي وَمالي وَتَحْفَظَني بِحِفْظِكَ وَأنْ تَقْضيَ حاجَتي في كَذا وَكَذا.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAl7ajaAlsalisa.screenRoute,
          pushBack: SalatAl7ajaAl2oula.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/صلاة الحاجة الثانية.mp3',
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
