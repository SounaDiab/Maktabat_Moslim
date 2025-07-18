import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz%20lmoujahidin/herz_alrasoul_wal_aimma_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'herz_alimam_alhadi_page.dart';
import 'herz_alimam_almahdi_page.dart';

class HerzAlimamAlaaskariPage extends StatefulWidget {
  static String screenRoute = 'herzalimamalaaskari_screen';
  HerzAlimamAlaaskariPage({super.key});

  @override
  State<HerzAlimamAlaaskariPage> createState() =>
      _HerzAlimamAlaaskariPageState();
}

class _HerzAlimamAlaaskariPageState extends State<HerzAlimamAlaaskariPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_herzalimamalaaskari_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzalimamalaaskari_screen', value);
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
          .pushReplacementNamed(HerzAlrasoulWalAimmaPage.screenRoute);
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
                      .addFavorite('حرز الإمام الحسن العسكري (ع)',
                          HerzAlimamAlaaskariPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'حرز الإمام الحسن العسكري (ع)',
                          HerzAlimamAlaaskariPage.screenRoute,
                          HerzAlimamAlaaskariPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حرز الإمام الحسن العسكري (ع)',
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
                  child: Center(
                    child: Text(
                      'بسم الله الرحمن الرحيم',
                      style: TextStyle(
                        fontSize: isTablet ? _fontSizeTablet : _fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: '',
                    subtitle:
                        'احتجت بحجاب الله النّور الذي احتجب به عن العيون واحتطت على نفسي وأهلي وولدي ومالي وما اشتملت عليه عنايتي ببسم الله الرحمن الرحيم وأحرزت نفسي وذلك كلُّه من كلِّ ما أخاف وأحذر بـ"الله لآ إله إلا هو الحي القيوم لا تأخذه سنةٌ ولا نومٌ له ما في السمٰوات وما في الأرض من ذا الذي يشفع عنده إلا بإذنه يعلم ما بين أيديهم وما خلفهم ولا يحيطون بشيءٍ من علمه إلا بما شآء وسع كرسيُّه السمٰوات والأرض ولا يـٔوده حفظهما وهو العلي العظيم"، "ومن أظلم ممن ذُكِّر بـٔايٰت ربه فأعرض عنها ونسِىَ ما قدَّمت يداه إنا جعلنا على قلوبهم أكنةً أن يفقهوه وفيٓ ءاذانهم وقراً وإن تدعهم إلى الهدى فلن يهتدوٓا إذاً أبداً"، "أفرأيت من اتخذ إلٰهه هواه وأضله الله على علمٍ وختم على سمعه وقلبه وجعل على بصره غشٰوة فمن يهديه من بعد الله أفلا تذكَّرون"، "أولـٰٓئك الذين طبع الله على قلوبهم وسمعهم وأبصارهم وألـٰٓئك هم الغـٰفلون"، "وإذا قرأت القرءان جعلنا بينك وبين الذين لا يؤمنون بالأخرة حجاباً مستوراً"، "وجعلنا على قلوبهم أكنةً أن يفقهوه وفيٓ ءاذانهم وقراً"، "وإذا ذكرت ربك في القرءان وحده ولَّوا علىٓ أدبارهم نفوراً" وصلّى الله على محمدٍ وآله الطَّاهرين.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HerzAlimamAlmahdiPage.screenRoute,
          pushBack: HerzAlimamAlhadiPage.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/حرز الإمام الحسن العسكري.mp3',
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
