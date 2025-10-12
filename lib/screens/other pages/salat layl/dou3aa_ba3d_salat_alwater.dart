import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../salat_allayl.dart';
import 'dou3aa_7azin.dart';
import 'waktaha_wakaifyatiha.dart';

class Dou3aaBa3dSalatAlwater extends StatefulWidget {
  static String screenRoute = 'dou3aa_ba3d_salat_alwater_screen';
  const Dou3aaBa3dSalatAlwater({super.key});

  @override
  State<Dou3aaBa3dSalatAlwater> createState() => _Dou3aaBa3dSalatAlwaterState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3aaBa3dSalatAlwaterState extends State<Dou3aaBa3dSalatAlwater> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_dou3aa_ba3d_salat_alwater_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3aa_ba3d_salat_alwater_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(SalatAllayl.screenRoute);
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
                color: isIcon ? Theme.of(context).iconTheme.color : Colors.red,
              ),
              onPressed: () async {
                setState(() {
                  isIcon = !isIcon;
                });
                await _saveFavoriteState(isIcon);

                if (!isIcon) {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .addFavorite('دعاء بعد صلاة الوتر',
                          Dou3aaBa3dSalatAlwater.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء بعد صلاة الوتر',
                          Dou3aaBa3dSalatAlwater.screenRoute,
                          Dou3aaBa3dSalatAlwater.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء بعد صلاة الوتر',
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
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'بسم الله الرحمن الرحيم',
                        style: TextStyle(
                          fontSize: isTablet ? _fontSizeTablet : _fontSize,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'اللهم صلِّ على محمد وآل محمد',
                        style: TextStyle(
                          fontSize: isTablet ? _fontSizeTablet : _fontSize,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'إِلهِي، تَعَرَّضَ لَكَ فِي هذَا اللَّيْلِ الْمُتَعَرِّضُونَ، وَقَصَدَكَ الْقاصِدُونَ، وَأَمَّلَ فَضْلَكَ وَمَعْرُوفَكَ الطَّالِبُونَ. وَلَكَ فِي هذَا اللَّيْلِ نَفَحاتٌ وَجَوائِزُ، وَعَطايا وَمَواهِبُ، تَمُنُّ بِها عَلَى مَنْ تَشَاءُ مِنْ عِبادِكَ، وَتَمْنَعُها مَنْ لَمْ تَسْبِقْ لَهُ الْعِنايَةُ مِنْكَ، وَها أَنَا ذَا عُبَيْدُكَ الْفَقِيرُ إِلَيْكَ، الْمُؤَمِّلُ فَضْلَكَ وَمَعْرُوفَكَ، فَإِنْ كُنْتَ، يا مَوْلايَ، تَفَضَّلْتَ فِي هـذِهِ اللَّيْلَةِ عَلَى أَحَدٍ مِنْ خَلْقِكَ، وَعُدْتَ عَلَيْهِ بِعائِدَةٍ مِنْ عَطْفِكَ، فَصَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، الطَّيِّبينَ الطَّاهِرِينَ، الْخَيِّرِينَ الْفاضِلِينَ، وَجُدْ عَلَيَّ بِطَوْلِكَ وَمَعْرُوفِكَ، يا رَبَّ الْعالَمِينَ، وَصَلَّى اللهُ عَلَى مُحَمَّدٍ خاتَمِ النَّبِيِّينَ وَآلِهِ الطَّاهِرِينَ وَسَلَّمَ تَسْلِيماً، إِنَّ اللهَ حَمِيدٌ مَجِيدٌ. اللّهُمَّ، إِنّي أَدْعُوكَ كَما أَمَرْتَ، فَاسْتَجِبْ لِي كَما وَعَدْتَ، إِنَّكَ لا تُخْلِفُ الْمِيعادَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3aa7azin.screenRoute,
          pushBack: WaktahaWakaifyatiha.screenRoute,
          soud:
              'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء بعد صلاة الوتر.mp3',
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
