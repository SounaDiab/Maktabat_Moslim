import 'package:flutter/material.dart';
import '../../../widgets/bloc_builder_albakiyat_alsalihat.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/scroll_title.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../nozor_men_a3mal_allail_walnahar.dart';
import 'fi_azkar_wda3awat_tokra2_saba7an_wamasa2an.dart';
import 'fima_yo3mal_men_7in_al8ouroub_2ela_7in_alnawm.dart';

class FiL2intibahMenAlnawmWsalatAllayl extends StatefulWidget {
  static String screenRoute = 'fi_l2intibah_men_alnawm_wsalat_allayl_screen';
  const FiL2intibahMenAlnawmWsalatAllayl({super.key});

  @override
  State<FiL2intibahMenAlnawmWsalatAllayl> createState() =>
      _FiL2intibahMenAlnawmWsalatAllaylState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiL2intibahMenAlnawmWsalatAllaylState
    extends State<FiL2intibahMenAlnawmWsalatAllayl> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs
        .getBool('isFavorite_fi_l2intibah_men_alnawm_wsalat_allayl_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_l2intibah_men_alnawm_wsalat_allayl_screen', value);
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
          .pushReplacementNamed(NozorMenA3malAllailWalnahar.screenRoute);
      return false;
    }
  }

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
                color: isIcon ? Theme.of(context).iconTheme.color : Colors.red,
              ),
              onPressed: () async {
                setState(() {
                  isIcon = !isIcon;
                });
                await _saveFavoriteState(isIcon);

                if (!isIcon) {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .addFavorite('في الانتباه من النوم وصلاة الليل',
                          FiL2intibahMenAlnawmWsalatAllayl.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في الانتباه من النوم وصلاة الليل',
                          FiL2intibahMenAlnawmWsalatAllayl.screenRoute,
                          FiL2intibahMenAlnawmWsalatAllayl.screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(title: 'في الانتباه من النوم وصلاة الليل'),
          ),
        ),
        body: BlocBuilderAlbakiyatAlsalihat(
          text: 'في الانتباه من النوم وصلاة الليل',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiAzkarWda3awatTokra2Saba7anWamasa2an.screenRoute,
          pushBack: FimaYo3malMen7inAl8ouroub2ela7inAlnawm.screenRoute,
          soud:
              'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في الانتباه من النوم وصلاة الليل.mp3',
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
