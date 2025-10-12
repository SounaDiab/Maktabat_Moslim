import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/bloc_builder_widget.dart';
import '../../../widgets/scroll_title.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al3ama.dart';
import 'altasbihat.dart';
import 'dou3a2_l2iftitah.dart';

class Dou3a2MakarimAl2a5lak extends StatefulWidget {
  static String screenRoute = 'dou3a2_makarim_al2a5lak_screen';
  const Dou3a2MakarimAl2a5lak({super.key});

  @override
  State<Dou3a2MakarimAl2a5lak> createState() => _Dou3a2MakarimAl2a5lakState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2MakarimAl2a5lakState extends State<Dou3a2MakarimAl2a5lak> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_dou3a2_makarim_al2a5lak_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3a2_makarim_al2a5lak_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Al2a3malAl3ama.screenRoute);
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
                      .addFavorite('دعاء مكارم الاخلاق',
                          Dou3a2MakarimAl2a5lak.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء مكارم الاخلاق',
                          Dou3a2MakarimAl2a5lak.screenRoute,
                          Dou3a2MakarimAl2a5lak.screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(title: 'دعاء مكارم الاخلاق'),
          ),
        ),
        body: BlocBuilderWidget(
          text: 'دعاء مكارم الاخلاق',
          isKoraan: false,
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2L2iftitah.screenRoute,
          pushBack: Altasbihat.screenRoute,
          soud:
              'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/dou3a2_makarim_ala5lak.mp3',
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
