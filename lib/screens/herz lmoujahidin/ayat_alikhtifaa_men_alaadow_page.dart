import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'aawzat_alnabi_yawm_wadi_alkora_page.dart';
import 'douaa_lilihtijab_aan_basar_alaadaa_page.dart';

class AyatAlikhtifaaMenAlaadowPage extends StatefulWidget {
  static String screenRoute = 'ayatalikhtifa2menalaadow_screen';
  AyatAlikhtifaaMenAlaadowPage({super.key});

  @override
  State<AyatAlikhtifaaMenAlaadowPage> createState() =>
      _AyatAlikhtifaaMenAlaadowPageState();
}

class _AyatAlikhtifaaMenAlaadowPageState
    extends State<AyatAlikhtifaaMenAlaadowPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ayatalikhtifa2menalaadow_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ayatalikhtifa2menalaadow_screen', value);
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
                      .addFavorite('آيات الإختفاء من العدو',
                          AyatAlikhtifaaMenAlaadowPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'آيات الإختفاء من العدو',
                          AyatAlikhtifaaMenAlaadowPage.screenRoute,
                          AyatAlikhtifaaMenAlaadowPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'آيات الإختفاء من العدو',
            style: TextStyle(
              fontSize: isTablet ? 40 : 19,
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
                        'ذكرها السيِّد علي خان في الكلم الطيِّب، وفي المصباح قال: هءه الآيات ذكرها صاحب العدّة وصاحب معجم الأدب عن الإمام الصادق (ع).',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'آثاره:',
                    subtitle:
                        'ذكر في المصباح عن كتاب العدة وكتاب معجم الأدب أنَّ هشام بن السائب الكلبي دخل على الإمام الصادق (ع)، فقال له الإمام (ع):\n'
                        'أنت الذي تفسر القرآن؟\n'
                        'قال: فأخبرني عن قوله: "وإذا قرأت القرآن جعلنا بينك وبين الذين لا يؤمنون بالأخرة حجاباً مستوراً" [الإسراء: ٤٥]، ما ذلك القرآن الذي كان رسول الله (ص) إذا قرأه حجب عن عدوِّه؟\n'
                        'قال: لا أدري، فعلِّمني يابن رسول الله.\n'
                        'فقال: هي ثلاث آيات: آية من الكهف وآية من النحل وآية من الجاثية ثم قال في المصباح:\n'
                        'قال بعضهم خرجت من الكوفة إلى بغداد وخرجت معنا ست سفن فكانت سفينتي السابعة وكنت سمعت هذا الحديث وقرأت هذه الآيات في سفينتي فنجوت وغرق الباقون.\n'
                        'قال: وأسر الروم رجلاً عشر سنين وكان يحفظ هءه الآيات فلمّا ذكرها قرأها ونجّاه الله تعالى بمنِّه.\n'
                        'وقال السيد علي خان في الكلم الطيب: هي ممّا جربته عند خروجي من بلاد العدو سنة ١٠٠٩ه‍.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'الآيات:',
                    subtitle:
                        'بسم الله الرحمن الرحيم "أفرأيت من اتخذ إلهه هوىٰه وأضله الله على علمٍ وختم على سمعه وقلبه وجعل على بصره غشٰوةً فمن يهديه من بعد الله أفلا تذكرون" [الجاثية: ٢٣].\n\n'
                        '"أولئك الذين طبع الله على قلوبهم وسمعهم وأبصارهم وأولٰٓئك هم الغافلون" [النحل: ١٠٨].\n\n'
                        '"ومن أظلم ممن ذكِّر بئايٰت ربه فأعرض عنها ونسي ما قدمت يداه إنَّا جعلنا على قلوبهم أكنَّةً أن يفقهوه وفي ءاذانهم وقراً وإن تَدْعُهُم إلى الهدى فلن يهتدوٓا إذاً أبداً" [الكهف: ٥٧].',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: DouaaLilihtijabAanBasarAlaadaaPage.screenRoute,
          pushBack: AawzatAlnabiYawmWadiAlkoraPage.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/آيات الإختفاء من العدو.mp3',
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
