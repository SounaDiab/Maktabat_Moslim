import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz%20lmoujahidin/herz_alrasoul_wal_aimma_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'herz_alimam_alhassan_almojtaba_page.dart';
import 'herz_alimam_ali_page.dart';

class HerzFatimatAlzahraaPage extends StatefulWidget {
  static String screenRoute = 'herzfatimatalzahraa_screen';
  HerzFatimatAlzahraaPage({super.key});

  @override
  State<HerzFatimatAlzahraaPage> createState() =>
      _HerzFatimatAlzahraaPageState();
}

class _HerzFatimatAlzahraaPageState extends State<HerzFatimatAlzahraaPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_herzfatimatalzahraa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzfatimatalzahraa_screen', value);
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
                      .addFavorite('حرز فاطمة الزهراء (ع)',
                          HerzFatimatAlzahraaPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'حرز فاطمة الزهراء (ع)',
                          HerzFatimatAlzahraaPage.screenRoute,
                          HerzFatimatAlzahraaPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حرز فاطمة الزهراء (ع)',
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
                        'بسم الله النّور، بسم الله نور النّور، بسم الله نورٌ على نورٍ، بسم الله الذي هو مدبِّر الأمور، بسم الله الذي خلق النور من النور.\n'
                        'الحمدالله الذي خلق النور من النور، وأنزل النور على النور، في كتابٍ مسطور، في رقٍّ منشور، بقدرٍ مقدور، على نبيٍّ محبور.\n'
                        'الحمدالله الذي هو بالعزِّ مذكور، وبالفخر مشهور، وعلى السراء والضراء مشكور، وصلّى الله على سيدنا محمد وآله الطاهرين.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HerzAlimamAlhassanAlmojtabaPage.screenRoute,
          pushBack: HerzAlimamAliPage.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/حرز فاطمة الزهراء.mp3',
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
