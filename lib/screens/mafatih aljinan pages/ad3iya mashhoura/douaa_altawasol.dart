import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iya_mashhoura.dart';
import 'Douaa_alsabah.dart';
import 'douaa_komail.dart';

class DouaaAltawasol extends StatefulWidget {
  static String screenRoute = 'douaa_altawasol_screen';
  const DouaaAltawasol({super.key});

  @override
  State<DouaaAltawasol> createState() => _DouaaAltawasolState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _DouaaAltawasolState extends State<DouaaAltawasol> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_altawasol_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_altawasol_screen', value);
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
          .pushReplacementNamed(Ad3iyaMashhoura.screenRoute);
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
                    Ad3iyaMashhoura.screenRoute);
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
                      .addFavorite('دعاء التوسل', DouaaAltawasol.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء التوسل', DouaaAltawasol.screenRoute,
                          DouaaAltawasol.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء التوسل',
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
                      'اَللّـهمَّ انّي اَساَلكَ وَاَتَوَجَّه الَيكَ بنَبيّكَ نَبيّ الرَّحمَة محَمَّد صَلَّى الله عَلَيه وَآله، يا اَبَا القاسم يا رَسولَ الله يا امامَ الرَّحمَة يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستَشفَعنا وَتَوَسَّلنا بكَ الَى الله وَقَدَّمناكَ بَينَ يَدَي حاجاتنا يا وَجيها عندَ الله اشفَع لَنا عندَ الله، يا اَبَا الحَسَن يا اَميرَ المؤمنينَ يا عَليَّ بنَ اَبي طالب، يا حجَّةَ الله عَلى خَلقه يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستَشفَعنا وَتَوَسَّلنا بكَ الَى الله وَقَدَّمناكَ بَينَ يَدَي حاجاتنا، يا وَجيها عندَ الله اشفَع لَنا عندَ الله، يا فاطمَةَ الزَّهراء يا بنتَ محَمَّد يا قرَّةَ عَين الرَّسول، يا سَيّدَتَنا انّا تَوَجَّهنا وَاستَشفَعنا وَتَوَسَّلنا بك الَى الله وَقَدَّمناك بَينَ يَدَي حاجاتنا، يا وَجيهَة عندَ الله اشفَعي لَنا عندَ الله، يا اَبا محَمَّد يا حَسَنَ بنَ عَليّ اَيّهَا المجتَبى يَا بنَ رَسولَ الله، يا حجَّةَ الله عَلى خَلقه يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستَشفَعنا وَتَوَسَّلنا بكَ الَى الله وَقَدَّمناكَ بَينَ يَدَي حاجاتنا يا وَجيها عندَ الله اشفَع لَنا عندَ الله، يا اَبا عَبدالله يا حسَينَ بنَ عَليّ، اَيّهَا الشَّهيد يَا بنَ رَسولَ الله يا حجَّةَ الله عَلى خَلقه يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستَشفَعنا وَتَوَسَّلنا بكَ الَى الله وَقَدَّمناكَ بَينَ يَدَي حاجاتنا يا وَجيها عندَ الله اشفَع لَنا عندَ الله، يا اَبَا الحَسَن يا عَليَّ بنَ الحسَين، يا زَينَ العابدينَ يَا بنَ رَسول الله يا حجَّةَ الله عَلى خَلقه يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستَشفَعنا وَتَوَسَّلنا بكَ الَى الله، وَقَدَّمناكَ بَينَ يَدَي حاجاتنا، يا وَجيها عندَ الله اشفَع لَنا عندَ الله، يا اَبا جَعفَر يا محَمَّد بنَ عَليّ اَيّهَا الباقر يَا بنَ رَسولَ الله يا حجَّةَ الله عَلى خَلقه يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستَشفَعنا وَتَوَسَّلنا بكَ الَى الله، وَقَدَّمناكَ بَينَ يَدَي حاجاتنا، يا وَجيها عندَ الله اشفَع لَنا عندَ الله، يا اَبا عَبد الله يا جَعفَرَ بنَ محَمَّد، اَيّهَا الصّادق يَا بنَ رَسولَ الله يا حجَّةَ الله عَلى خَلقه يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستَشفَعنا وَتَوَسَّلنا بكَ الَى الله وَقَدَّمناكَ بَينَ يَدَي حاجاتنا، يا وَجيها عندَ الله اشفَع لَنا عندَ الله، يا اَبَا الحَسَن يا موسَى بنَ جَعفَر، اَيّهَا الكاظم يَا بنَ رَسولَ الله يا حجَّةَ الله عَلى خَلقه يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستَشفَعنا وَتَوَسَّلنا بكَ الَى الله وَقَدَّمناكَ بَينَ يَدَي حاجاتنا، يا وَجيها عندَ الله اشفَع لَنا عندَ الله، يا اَبَا الحَسَن يا عَليَّ بنَ موسى اَيّهَا الرّضا يَا بنَ رَسولَ الله يا حجَّةَ الله عَلى خَلقه يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستشفَعنا وَتَوَسَّلنا بكَ الَى الله وَقَدَّمناكَ بَينَ يَدَي حاجاتنا، يا وَجيها عندَ الله اشفَع لَنا عندَ الله، يا اَبا جَعفَر يا محَمَّدَ بنَ عَليّ اَيّهَا التَّقيّ الجَواد يَا بنَ رَسولَ الله يا حجَّةَ الله عَلى خَلقه يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستَشفَعنا وَتَوَسَّلنا بكَ الَى الله وَقَدَّمناكَ بَينَ يَدَي حاجاتنا، يا وَجيها عندَ الله اشفَع لَنا عندَ الله، يا اَبَا الحَسَن يا عَليَّ بنَ محَمَّد اَيّهَا الهادي النَّقيّ يَا بنَ رَسولَ الله يا حجَّةَ الله عَلى خَلقه يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستَشفَعنا وَتَوَسَّلنا بكَ الَى الله وَقَدَّمناكَ بَينَ يَدَي حاجاتنا يا وَجيها عندَ الله اشفَع لَنا عندَ الله، يا اَبا محَمَّد يا حَسَنَ بنَ عَليّ، اَيّهَا الزَّكيّ العَسكَريّ يَا بنَ رَسولَ الله يا حجَّةَ الله عَلى خَلقه يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستشفَعنا وَتَوَسَّلنا بكَ الَى الله وَقَدَّمناكَ بَينَ يَدَي حاجاتنا يا وَجيها عندَ الله اشفَع لَنا عندَ الله، يا وَصيَّ الحَسَن وَالخَلَفَ الحجَّةَ اَيّهَا القائم المنتَظَر المَهدىّ يَا بنَ رَسولَ الله يا حجَّةَ الله عَلى خَلقه يا سَيّدَنا وَمَولانا انّا تَوَجَّهنا وَاستَشفَعنا وَتَوَسَّلنا بكَ الَى الله وَقَدَّمناكَ بَينَ يَدَي حاجاتنا يا وَجيها عندَ الله اشفَع لَنا عندَ الله .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'ثمّ سل حوائجك، فانّها تقضى ان شاء الله تعالى، وعلى رواية اخرى قل بعد ذلك :',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'يا سادَتي وَمَواليَّ انّي تَوَجَّهت بكم اَئمَّتي وَعدَّتي ليَوم فَقري وَحاجَتي الَى الله وَتَوَسَّلت بكم الَى الله وَاستَشفَعت بكم الَى الله، فَاشفَعوا لي عندَ الله وَاستَنقذوني من ذنوبي عندَ الله، فَانَّكم وَسيلَتي الَى الله وَبحبّكم وَبقربكم اَرجو نَجاة منَ الله فَكونوا عندَ الله رَجائي يا سادَتي يا اَولياءَ الله صَلَّى الله عَلَيهم اَجمَعينَ وَلَعَنَ الله اَعداءَ الله ظالميهم منَ الاَْوَّلينَ وَالاخرينَ آمينَ رَبَّ العالَمينَ .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: DouaaKomail.screenRoute,
        pushBack: DouaaAlsabah.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء التوسل.mp3',
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
