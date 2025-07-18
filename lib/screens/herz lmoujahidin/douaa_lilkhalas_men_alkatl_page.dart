import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'aawza_yataawaz_biha_aala_alaadaa_page.dart';
import 'herz_lietikaa_silah_alaadow_page.dart';

class DouaaLilkhalasMenAlkatlPage extends StatefulWidget {
  static String screenRoute = 'douaalilkhalasmenalkatl_screen';
  DouaaLilkhalasMenAlkatlPage({super.key});

  @override
  State<DouaaLilkhalasMenAlkatlPage> createState() =>
      _DouaaLilkhalasMenAlkatlPageState();
}

class _DouaaLilkhalasMenAlkatlPageState
    extends State<DouaaLilkhalasMenAlkatlPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_douaalilkhalasmenalkatl_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaalilkhalasmenalkatl_screen', value);
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
                      .addFavorite('دعاء للخلاص من القتل',
                          DouaaLilkhalasMenAlkatlPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء للخلاص من القتل',
                          DouaaLilkhalasMenAlkatlPage.screenRoute,
                          DouaaLilkhalasMenAlkatlPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء للخلاص من القتل',
            style: TextStyle(
              fontSize: isTablet ? 40 : 22,
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
                        'مروي عن النبي (ص)، ذكره السيد ابن طاوس في مهج الدعوات.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'آثاره:',
                    subtitle:
                        'روي أن النبي (ص) علَّمه لبعض أصحابه فأراد الحجَّاج قتله، فلمّا قرأه لم يستطع صاحب السيف أن يقتله.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'الدعاء:',
                    subtitle:
                        'يا سامع كل صوت يا محيي النفوس بعد الموت يا من لا يجعل لأنه لا يخاف الفَوت، يا دتئم الثبات يا مخرج النبات يا محيي العظام الرَّميم الدَّارسات، بسم الله اعتصمت يالله، وتوكَّلت على الحيِّ الذي لا يموت ورميت كل من يؤْذيني بلا حول ولا قوَّة إلا بالله العليِّ العظيم.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HerzLietikaaSilahAlaadowPage.screenRoute,
          pushBack: AawzaYataawazBihaAalaAlaadaaPage.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء للخلاص من القتل.mp3',
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
