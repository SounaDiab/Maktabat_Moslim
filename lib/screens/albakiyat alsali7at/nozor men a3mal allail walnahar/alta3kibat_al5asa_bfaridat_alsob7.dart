import 'package:flutter/material.dart';
import '../../../widgets/bloc_builder_albakiyat_alsalihat.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/scroll_title.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../nozor_men_a3mal_allail_walnahar.dart';
import 'alta3kibat_al3amaa.dart';
import 'fi_nozor_mema_yo3mal_fi_alnahar_mabaina_tolou3_alshames_w8roubaha.dart';

class Alta3kibatAl5asaBfaridatAlsob7 extends StatefulWidget {
  static String screenRoute = 'alta3kibat_al5asa_bfaridat_alsob7_screen';
  const Alta3kibatAl5asaBfaridatAlsob7({super.key});

  @override
  State<Alta3kibatAl5asaBfaridatAlsob7> createState() =>
      _Alta3kibatAl5asaBfaridatAlsob7State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Alta3kibatAl5asaBfaridatAlsob7State
    extends State<Alta3kibatAl5asaBfaridatAlsob7> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alta3kibat_al5asa_bfaridat_alsob7_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_alta3kibat_al5asa_bfaridat_alsob7_screen', value);
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
                      .addFavorite('التعقيبات الخاصة بفريضة الصبح',
                          Alta3kibatAl5asaBfaridatAlsob7.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'التعقيبات الخاصة بفريضة الصبح',
                          Alta3kibatAl5asaBfaridatAlsob7.screenRoute,
                          Alta3kibatAl5asaBfaridatAlsob7.screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(title: 'التعقيبات الخاصة بفريضة الصبح'),
          ),
        ),
        body: BlocBuilderAlbakiyatAlsalihat(
          text: 'التعقيبات الخاصة بفريضة الصبح',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha
              .screenRoute,
          pushBack: Alta3kibatAl3amaa.screenRoute,
          soud:
              '',
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
