import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iyat_al2osbo3.dart';
import 'dou3a2_al2arbi3a2.dart';
import 'dou3a2_aljom3a.dart';

class Dou3a2Al5amis extends StatefulWidget {
  static String screenRoute = 'dou3a2_al5amis_screen';
  const Dou3a2Al5amis({super.key});

  @override
  State<Dou3a2Al5amis> createState() => _Dou3a2Al5amisState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Al5amisState extends State<Dou3a2Al5amis> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou3a2_al5amis_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3a2_al5amis_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ad3iyatAl2osbo3.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (previousPage == 'favorite_screen') {
                Navigator.of(context)
                    .pushReplacementNamed(FavoritesScreen.screenRoute);
              } else {
                Navigator.of(context)
                    .pushReplacementNamed(Ad3iyatAl2osbo3.screenRoute);
              }
            },
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
                          'دعاء يوم الخميس', Dou3a2Al5amis.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء يوم الخميس',
                          Dou3a2Al5amis.screenRoute, Dou3a2Al5amis.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء يوم الخميس',
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
                      'بِسْمِ الله الرَّحْمنِ الرَّحِيمِ  الحَمْدُ للهِ الَّذِي أَذْهَبَ اللَّيْلَ مُظْلِما بِقُدْرَتِهِ، وَجاءَ بِالنَّهارِ مُبْصِراً بِرَحْمَتِهِ، وَكَسانِي ضِيائَهُ وَأَنا فِي نِعْمَتِهِ. اللّهُمَّ فَكَما أَبْقَيْتَنِي لَهُ فَأَبْقِنِي لاَمْثالِهِ، وَصَلِّ عَلى النَّبِيّ مُحَمَّدٍ وَآلِهِ، وَلاتَفْجَعْنِي فِيهِ وَفِي غَيْرِهِ مِنَ اللَّيالِي وَالاَيّامِ بِارْتِكابِ المَحارِمِ وَاكْتِسابِ المَآثِمِ، وَارْزُقْنِي خَيْرَهُ وَخَيْرَ ما فِيهِ وَخَيْرَ مابَعْدَهُ، وَاصْرِفْ عَنِّي شَرَّهُ وَشَرَّ مافِيهِ وَشَرَّ مابَعْدَهُ. اللّهُمَّ إِنِّي بِذِمَّةِ الاِسْلامِ أَتَوَسَّلُ إِلَيْكَ، وَبِحُرْمَةِ القُرْآنِ أَعْتَمِدُ عَلَيْكَ، وَبِمُحَمَّدٍ المُصْطَفى صَلَّى الله عَلَيْهِ وَآلِهِ اسْتَشْفِعُ لَدَيْكَ، فَاعْرِفِ اللّهُمَّ ذِمَّتِي الَّتِي رَجَوْتُ بِها قضاء حاجَتِي، ياأَرْحَمَ الرَّاحِمِينَ. اللّهُمَّ اقْضِ لِي فِي الخَمِيسِ خَمْساً: لايَتَّسِعُ لَها إِلاّ كَرَمُكَ، وَلايُطِيقُها إِلاّ نِعَمُكَ: سَلامَةً أَقْوى بِها عَلى طاعَتِكَ، وَعِبادَةً اسْتَحِقُّ بِها جَزِيلَ مَثُوبَتِكَ، وَسِعَةً فِي الحالِ مِنَ الرّزْقِ الحَلالِ، وَأَنْ تُؤْمِنَنِي فِي مَواقِفِ الخَوْفِ بِأَمْنِكَ، وَتَجْعَلَنِي مِنْ طَوارِقِ الهُمُومِ وَالغُمُومِ فِي حِصْنِكَ، وَصَلِّ عَلى مُحمَّدٍ وَآلِ مُحَمَّدٍ، وَاجْعَلْ تَوَسُّلِي بِهِ شافِعاً يَوْمَ القِيامَةِ نافِعاً، إِنَّكَ أَنْتَ أَرْحَمُ الرَّاحِمِينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: Dou3a2Aljom3a.screenRoute,
        pushBack: Dou3a2Al2arbi3a2.screenRoute,
        soud: 'الخميس',
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
