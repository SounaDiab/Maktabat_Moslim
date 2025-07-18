import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_al3asra.dart';
import 'salat_al7aja_al2oula.dart';

class SalatLziyadatAlrizk extends StatefulWidget {
  static String screenRoute = 'salat_lziyadat_alrizk_screen';
  const SalatLziyadatAlrizk({super.key});

  @override
  State<SalatLziyadatAlrizk> createState() => _SalatLziyadatAlrizkState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatLziyadatAlrizkState extends State<SalatLziyadatAlrizk> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_lziyadat_alrizk_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_lziyadat_alrizk_screen', value);
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
                      .addFavorite(
                          'صلاة لزيادة الرزق', SalatLziyadatAlrizk.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة لزيادة الرزق',
                          SalatLziyadatAlrizk.screenRoute,
                          SalatLziyadatAlrizk.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة لزيادة الرزق',
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
                      'روي أن رجلاً أتى النبي (صلّى الله عليه وآله وسلم) فقال : يارسول الله إنّي ذو عيال كثير وعليّ دين قد اشتدّ حالي فعلمني دعاءً أدعو الله به عزَّ وجلَّ يرزقني ما أقضي به ديني وأستعين به على عيالي فقال رسول الله (صلّى الله عليه وآله وسلم) يا عبد الله توضأ واسبغ وضؤك ثم صلِّ ركعتين تتم الركوع والسجود ثم قل : ياماجِدُ ياواحِدُ ياكَريمُ، أتَوَجَّهُ إلَيْكَ بمُحَمَّدٍ نَبيِّكَ نَبيّ الرَّحْمَةِ صَلى الله عَلَيْهِ وَآلِهِ، يامُحَمَّدُ يارَسولَ الله إِنِّي أتَوَجَّهُ بِكَ إِلى الله رَبِّي وَرَبِّكَ وَرَبِّ كُلِّ شَيٍ، وَأَسْأَلُكَ اللَّهُمَّ أنْ تُصَلِّيَ عَلى مُحَمَّدٍ وَأهْلِ بَيْتِهِ، وَأَسْأَلُكَ نَفْحَةً كَريمَةً مِنْ نَفَحاتِكَ وَفَتْحاً يَسيراً وَرِزْقاً وَاسِعاً ألِمُّ بِهِ شَعَثِي وَأقْضي بِهِ دَيْني وَأسْتَعينُ بِهِ عَلى عِيالي.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة أخرى لزيادة الرزق',
                  subtitle:
                      'إذا أردت الذهاب إلى حانوتك فابدأ بالذهاب إلى المسجد وصلِّ ركعتين أو أربع ركعات وقل: غَدَوْتُ بِحَوْلِ الله وَقوَتِهِ وَغَدَوْتُ بِلاحَوْلٍ مِني وَلا قوَةٍ وَلكِنْ بَحَوْلِكَ وَقوَتِكَ يارَبِّ، اللَّهُمَّ إِنِّي عَبْدُكَ ألْتَمِسُ مِنْ فَضْلِكَ كَما أمَرْتَني فَيَسِّرْ لي ذلِكَ وَأنا خافِضٌ في عافِيَتِكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة أخرى',
                  subtitle:
                      'وهي ركعتان : في الأولى الحمد مرة وإنا أعطيناك الكوثر ثلاث مرات، وفي الثانية الحمد مرة وكل من المعوذتين ثلاث مرات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAl7ajaAl2oula.screenRoute,
          pushBack: SalatAl3asra.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/صلاة لزيادة الرزق.mp3',
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
