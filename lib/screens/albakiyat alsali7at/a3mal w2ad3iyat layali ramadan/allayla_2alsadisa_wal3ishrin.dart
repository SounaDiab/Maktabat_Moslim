import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../a3mal_w2ad3iyat_layali_ramadan.dart';
import 'allayla_2al5amisa_wal3ishrin.dart';
import 'allayla_2alsabi3a_wal3ishrin.dart';

class Allayla2alsadisaWal3ishrin extends StatefulWidget {
  static String screenRoute = 'allayla_2alsadisa_wal3ishrin_screen';
  const Allayla2alsadisaWal3ishrin({super.key});

  @override
  State<Allayla2alsadisaWal3ishrin> createState() =>
      _Allayla2alsadisaWal3ishrinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Allayla2alsadisaWal3ishrinState
    extends State<Allayla2alsadisaWal3ishrin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_allayla_2alsadisa_wal3ishrin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_allayla_2alsadisa_wal3ishrin_screen', value);
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
          .pushReplacementNamed(A3malW2ad3iyatLayaliRamadan.screenRoute);
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
                      .addFavorite('الليلة السادسة والعشرين',
                          Allayla2alsadisaWal3ishrin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الليلة السادسة والعشرين',
                          Allayla2alsadisaWal3ishrin.screenRoute,
                          Allayla2alsadisaWal3ishrin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الليلة السادسة والعشرين',
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
                  title: 'دُعاءُ اللَّيلَةِ السّادِسَة وَالْعِشْرين :',
                  subtitle:
                      'يا جاعِلَ اللَّيْلِ وَالنَّهارِ آيتَيْنِ، يا مَنْ مَحا آيَةَ اللَّيْلِ وَجَعَلَ آيَةَ النَّهارِ مُبْصِرَةً لِتَبْتَغُوا فَضْلاً مِنْهُ وَرِضْواناً، يا مُفَصِّلَ كُلِّ شَيْء تَفْصيلاً، يا ماجِدُ يا وَهّابُ، يا اَللهُ يا جَوادُ، يا اَللهُ يا اَللهُ يا اَللهُ، لَكَ الاَْسْماءُ الْحُسْنى، وَالاَْمْثالُ الْعُلْيا، وَالْكِبْرِياءُ وَالالاءُ، اَسْاَلُكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمد، وَاَنْ تَجْعَلَ اسْمي في هذِهِ اللَّيْلَةِ فِي السُّعَدآءِ، وَرُوحي مَعَ الشُّهَداءِ وَاِحْساني في عِلِّيّينَ، وَاِساءَتي مَغْفُورَةً، وَاَنْ تَهَبَ لي يَقيناً تُباشِرُ بِهِ قَلْبي، وَايماناً يُذْهبُ الشَّكَّ عَنّي، وَتُرضِيَني بِما قَسَمْتَ لي، وَآتِنا فِي الدُّنْيا حَسَنَةً  وَفِي الاخِرَةِ حَسَنةً، وَقِنا عَذابَ النَّارِ الْحَريقِ، وَارْزُقْني فيها ذِكْرَكَ وَشُكْرَكَ وَالرَّغْبَةَ اِلَيْكَ وَالاِْنابَةَ وَالتَّوْبَةَ وَالتَّوْفيقَ لِما وَفَّقْتَ لَهُ مُحَمَّداً وَآلَ مُحَمَّد صَلَّى اللهُ عَلَيْهِ وَعَلَيْهِمْ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Allayla2alsabi3aWal3ishrin.screenRoute,
          pushBack: Allayla2al5amisaWal3ishrin.screenRoute,
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
