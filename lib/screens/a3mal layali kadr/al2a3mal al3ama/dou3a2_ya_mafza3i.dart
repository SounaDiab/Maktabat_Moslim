import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al3ama.dart';
import 'altasbihat.dart';
import 'dou3a2_idris.dart';

class Dou3a2YaMafza3i extends StatefulWidget {
  static String screenRoute = 'dou32_ya_mafza3i_screen';
  const Dou3a2YaMafza3i({super.key});

  @override
  State<Dou3a2YaMafza3i> createState() => _Dou3a2YaMafza3iState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2YaMafza3iState extends State<Dou3a2YaMafza3i> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou32_ya_mafza3i_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou32_ya_mafza3i_screen', value);
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
                      .addFavorite('دعاء يا مفزعي', Dou3a2YaMafza3i.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء يا مفزعي',
                          Dou3a2YaMafza3i.screenRoute,
                          Dou3a2YaMafza3i.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء يا مفزعي',
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
                      'يا مَفْزَعِي عِنْدَ كُرْبَتِي، وَيا غَوْثِي عِنْدَ شِدَّتِي، إِلَيْكَ فَزِعْتُ، وَبِكَ اسْتَغَثْتُ، وَبِكَ لُذْتُ، لا أَلُوذُ بِسِواكَ، وَلا أَطْلُبُ الْفَرَجَ إِلّا مِنْكَ، فَأَغِثْنِي، وَفَرِّجْ عَنِّي، يا مَنْ يَقْبَلُ الْيَسِيرَ، وَيَعْفُو عَنِ الْكَثِيرَ، اقْبَلْ مِنِّيَ الْيَسِيرَ، وَاعْفُ عَنِّيَ الْكَثِيرَ، إِنَّكَ أَنْتَ الْغَفُورُ الرَّحِيمُ. اللّهُمَّ، إِنِّي أَسْأَلُكَ إِيْماناً تُباشِرُ بِهِ قَلْبِي، وَيَقِيناً حَتَّى أَعْلَمَ أَنَّهُ لَنْ يُصِيبَنِي إِلّا ما كَتَبْتَ لِي، وَرَضِّنِي مِنَ الْعَيْشِ بِما قَسَمْتَ لِي، يا أَرْحَمَ الرَّاحِمِينَ. يا عُدَّتِي فِي كُرْبَتِي، وَيا صَاحِبِي فِي شِدَّتِي، وَيا وَلِيِّي فِي نِعْمَتِي، وَيا غايَتِي فِي رَغْبَتِي، أَنْتَ السَّاتِرُ عَوْرَتِي، وَالآمِنُ رَوْعَتِي، وَالْمُقِيلُ عَثْرَتِي، فَاغْفِرْ لِي خَطِيئَتِي، يا أَرْحَمَ الرَّاحِمِينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Altasbihat.screenRoute,
          pushBack: Dou3a2Idris.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء يا مفزعي.mp3',
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
