import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al5asa.dart';
import 'dou3a2_alimam_alsadek.dart';
import 'zyarat_amir_mo2minin.dart';

class Dou3a2AllaylaAlwahidaWal3ishrin extends StatefulWidget {
  static String screenRoute = 'dou3a2_allayla_alwahida_wal3ishrin_screen';
  const Dou3a2AllaylaAlwahidaWal3ishrin({super.key});

  @override
  State<Dou3a2AllaylaAlwahidaWal3ishrin> createState() =>
      _Dou3a2AllaylaAlwahidaWal3ishrinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2AllaylaAlwahidaWal3ishrinState
    extends State<Dou3a2AllaylaAlwahidaWal3ishrin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_dou3a2_allayla_alwahida_wal3ishrin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_dou3a2_allayla_alwahida_wal3ishrin_screen', value);
  }

      Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Al2a3malAl5asa.screenRoute);
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
                      .addFavorite('دعاء الليلة الواحدة والعشرين',
                          Dou3a2AllaylaAlwahidaWal3ishrin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء الليلة الواحدة والعشرين',
                          Dou3a2AllaylaAlwahidaWal3ishrin.screenRoute,
                          Dou3a2AllaylaAlwahidaWal3ishrin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء الليلة الواحدة والعشرين',
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
                      'اللّهُمَّ، صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، وَاقْسِمْ لِي حِلْماً يَسُدُّ عَنِّي بابَ الْجَهْلِ، وَهُدَىً تَمُنُّ بِهِ عَلَيَّ مِنْ كُلِّ ضَلالَةٍ، وَغِنىً تَسُدُّ بِهِ عَنِّي بابَ كُلِّ فَقْرٍ، وَقُوَّةً تَرُدُّ بِها عَنِّي كُلَّ ضَعْفٍ، وَعِزّاً تُكْرِمُنِي بِهِ عَنْ كُلِّ ذُلٍّ، وَرِفْعَةً تَرْفَعُنِي بِها عَنْ كُلِّ ضَعَةٍ، وَأَمْناً تَرُدُّ بِهِ عَنِّي كُلَّ خَوْفٍ، وَعافِيَةً تَسْتُرُنِي بِها مِنْ كُلِّ بَلاءٍ، وَعِلْماً تَفْتَحُ لِي بِهِ كُلَّ يَقِينٍ، وَيَقِيناً تُذْهِبُ بِهِ عَنِّي كُلَّ شَكٍّ، وَدُعاءً تَبْسُطُ لِي بِهِ الْإِجابَةَ فِي هذِهِ اللَّيْلَةِ، وَفِي هـذِهِ السَّاعَةَ السَّاعَةَ السَّاعَةَ يا كَرِيمُ، وَخَوْفاً تُيَسِّرُ لِي بِهِ كُلَّ رَحْمَةٍ، وَعِصْمَةً تَحُولُ بِها بَيْنِي وَبَيْنَ الذُّنُوبِ، حَتَّى أُفْلِحَ بِها بَيْنَ الْمَعْصُومِينَ عِنْدَكَ، بِرَحْمَتِكَ يا أَرْحَمَ الرَّاحِمِينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZyaratAmirMo2minin.screenRoute,
          pushBack: Dou3a2AlimamAlsadek.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء الليلة الواحدة والعشرين.mp3',
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
