import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/a3mal%20layali%20kadr/a3mal%20layaly%20alkadr/al2iste3dad.dart';
import 'package:maktabat_almoslim/screens/a3mal%20layali%20kadr/a3mal%20layaly%20alkadr/mawane3_alkoboul.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
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
                      .addFavorite(
                          'ثواب إحياء ليلة القدر', SawabAl2i7ya2.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('ثواب إحياء ليلة القدر',
                          SawabAl2i7ya2.screenRoute, SawabAl2i7ya2.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'ثواب إحياء ليلة القدر',
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
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'روي عن النبي صلى الله عليه وآله وسلم قال: "قال موسى: إلهي أُريدُ قربك، قال: قربي لمن استيقظ ليلة القَدر، قال: إلهي أريد رحمتك، قال: رحمتي لمن رحِم المساكين ليلة القدر، قال: إلهي أريد الجواز على الصراط، قال: ذلك لمن تصدّق بصدقةٍ في ليلة القدر، قال: إلهي أريد من أشجار الجنّة، قال: ذلك لمن سبّح تسبيحةً ليلة القدر، قال: إلهي أريد رضاك، قال: رضاي لمن صلّى ركعتين في ليلة القدر".',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Al2iste3dad.screenRoute,
          pushBack: Mawane3Alkoboul.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/ثواب إحياء ليلة القدر.mp3',
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
