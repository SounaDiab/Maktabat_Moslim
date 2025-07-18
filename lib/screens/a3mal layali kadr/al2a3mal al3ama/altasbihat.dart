import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al3ama.dart';
import 'dou3a2_makarim_al2a5lak.dart';
import 'dou3a2_ya_mafza3i.dart';

class Altasbihat extends StatefulWidget {
  static String screenRoute = 'altasbihat_screen';
  const Altasbihat({super.key});

  @override
  State<Altasbihat> createState() => _AltasbihatState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AltasbihatState extends State<Altasbihat> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_altasbihat_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_altasbihat_screen', value);
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
                      .addFavorite('التسبيحات', Altasbihat.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('التسبيحات', Altasbihat.screenRoute,
                          Altasbihat.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'التسبيحات',
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
              Center(
                child: Text(
                  'بسم الله الرحمن الرحيم',
                  style: TextStyle(
                    fontSize: isTablet ? _fontSizeTablet + 10 : _fontSize,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'سُبْحانَ مَنْ يَعْلَمُ جَوارِحَ الْقُلُوبِ، سُبْحانَ مَنْ يُحْصِي عَدَدَ الذُّنُوبِ، سُبْحانَ مَنْ لا يَخْفَى عَلَيْهِ خافِيَةٌ فِي السَّماوَاتِ وَالْأَرْضِينَ، سُبْحانَ الرَّبِّ الْوَدُودِ، سُبْحانَ الْفَرْدِ الْوِتْرِ، سُبْحانَ الْعَظِيمِ الْأَعْظَمِ، سُبْحانَ مَنْ لا يَعْتَدِي عَلَى أَهْلِ مَمْلَكَتِهِ، سُبْحانَ مَنْ لا يُؤاخِذُ أَهْلَ الْأَرْضِ بِأَلْوانِ الْعَذابِ، سُبْحانَ الْحَنَّانِ الْمَنَّانِ، سُبْحانَ الرَّؤُوفِ الرَّحِيمِ، سُبْحانَ الْجَبَّارِ الْجَوادِ، سُبْحانَ الْكَرِيمِ الْحَلِيمِ، سُبْحانَ الْبَصِيرِ الْعَلِيمِ، سُبْحانَ الْبَصِيرِ الْواسِعِ، سُبْحانَ اللهِ عَلَى إِقْبالِ النَّهارِ، سُبْحانَ اللهِ عَلَى إِدْبارِ النَّهارِ، سُبْحانَ اللهِ عَلَى إِدْبارِ اللَّيْلِ وَإِقْبالِ النَّهارِ، (سُبْحَانَاللهِ على إقْبَالِ النهارِ وإِدْبَارِ الليلِ، سُبْحَانَ اللهِ على إِقْبَالِ النَّهَارِ وإِقْبَالِ الليلِ). وَلَهُ الْحَمْدُ وَالْمَجْدُ، وَالْعَظَمَةُ وَالْكِبْرِياءُ، مَعَ كُلِّ نَفَسٍ، وَكُلِّ طَرْفَةِ عَيْنٍ، وَكُلِّ لَمْحَةٍ سَبَقَ فِي عِلْمِهِ. سُبْحانَكَ مِلءَ ما أَحْصَى كِتابُكَ، سُبْحانَكَ زِنَةَ عَرْشِكَ، سُبْحانَكَ سُبْحانَكَ سُبْحانَكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2MakarimAl2a5lak.screenRoute,
          pushBack: Dou3a2YaMafza3i.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/التسبيحات.mp3',
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
