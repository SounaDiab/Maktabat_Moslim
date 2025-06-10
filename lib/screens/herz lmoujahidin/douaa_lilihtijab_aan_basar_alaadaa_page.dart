import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import '../mafatih aljinan pages/a3mal ashor alsana/ramadan/allayla_alrabi3a_3ashar_ramadan.dart';
import 'ayat_alikhtifaa_men_alaadow_page.dart';
import 'douaa_lilihtijab_page.dart';

class DouaaLilihtijabAanBasarAlaadaaPage extends StatefulWidget {
  static String screenRoute = 'douaalilihtijabaanbasaralaadaa_screen';
  DouaaLilihtijabAanBasarAlaadaaPage({super.key});

  @override
  State<DouaaLilihtijabAanBasarAlaadaaPage> createState() =>
      _DouaaLilihtijabAanBasarAlaadaaPageState();
}

class _DouaaLilihtijabAanBasarAlaadaaPageState
    extends State<DouaaLilihtijabAanBasarAlaadaaPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_douaalilihtijabaanbasaralaadaa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_douaalilihtijabaanbasaralaadaa_screen', value);
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
          .pushReplacementNamed(HerzAlmoujahidinHomeScreen.screenRoute);
      return false;
    }
  }

  double _fontSize = 18;
  double _fontSizeTablet = 30;
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
                      .addFavorite('دعاء للإحتجاب عن بصر الأعداء',
                          AllaylaAlrabi3a3asharRamadan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء للإحتجاب عن بصر الأعداء',
                          AllaylaAlrabi3a3asharRamadan.screenRoute,
                          AllaylaAlrabi3a3asharRamadan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء للإحتجاب عن بصر الأعداء',
            style: TextStyle(
              fontSize: isTablet
                  ? 40
                  : size > 1
                      ? 17
                      : 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 10,
              right: 30,
              left: 30,
              bottom: 10,
            ),
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListOfNineVerses(
                    title: 'تعريف:',
                    subtitle:
                        'ذكره السيِّد ابن طاوس في كتاب المجتنى عن كتاب دفع الهموم والأحزان لأحمد بن داود النعماني.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'آثاره:',
                    subtitle: 'قال في المجتنى عن دفع الهموم:\n'
                        'إذا أردت أن يحجب الله عنك بصر من تخافهةوتتقي جانبه فقل.. الدُّعاء...',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'الدعاء:',
                    subtitle:
                        'يا رب العالمين إيّاك نعبد وإيّاك نستعين، أسألك باسمك العظيم الذي تجليت به لموسى على الجبل فجعلته دكاً وخرَّ موسى صعقاً أن تطمس عنّي بصر من أخشاه وتشلَّ لسانَهُ وتخْتم على قلبه وتحبس يده وتقعده من رِجلِهِ إنَّك على كلِّ شيءٍ قديرٌ.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: DouaaLilihtijabPage.screenRoute,
          pushBack: AyatAlikhtifaaMenAlaadowPage.screenRoute,
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
