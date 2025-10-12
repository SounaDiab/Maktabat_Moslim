import 'package:flutter/material.dart';
import '../../../widgets/bloc_builder_widget.dart';
import '../../../widgets/scroll_title.dart';
import '../../a3mal%20layali%20kadr/a3mal%20layaly%20alkadr/al2iste3dad.dart';
import '../../a3mal%20layali%20kadr/a3mal%20layaly%20alkadr/mawane3_alkoboul.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../a3mal_layaly_alkadr.dart';

class SawabAl2i7ya2 extends StatefulWidget {
  static String screenRoute = 'sawab_al2i7ya2_screen';
  const SawabAl2i7ya2({super.key});

  @override
  State<SawabAl2i7ya2> createState() => _SawabAl2i7ya2State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SawabAl2i7ya2State extends State<SawabAl2i7ya2> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_sawab_al2i7ya2_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_sawab_al2i7ya2_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(A3malLayalyAlkadr.screenRoute);
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
                      .addFavorite(
                          'ثواب احياء ليلة القدر', SawabAl2i7ya2.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('ثواب احياء ليلة القدر',
                          SawabAl2i7ya2.screenRoute, SawabAl2i7ya2.screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(title: 'ثواب احياء ليلة القدر'),
          ),
        ),
        body: BlocBuilderWidget(
          text: 'ثواب احياء ليلة القدر',
          isKoraan: false,
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Al2iste3dad.screenRoute,
          pushBack: Mawane3Alkoboul.screenRoute,
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
