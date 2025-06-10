import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ramadan.dart';
import 'allayla_alsabi3a_3ashara_ramadan.dart';
import 'allayla_alwa7ida_wal3ishroun_ramadan.dart';

class A3malAllailaAltasi3a3asharaRamadan extends StatefulWidget {
  static String screenRoute = 'a3mal_allayla_altasi3a_3ashara_ramadan_screen';
  const A3malAllailaAltasi3a3asharaRamadan({super.key});

  @override
  State<A3malAllailaAltasi3a3asharaRamadan> createState() =>
      _A3malAllailaAltasi3a3asharaRamadanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malAllailaAltasi3a3asharaRamadanState
    extends State<A3malAllailaAltasi3a3asharaRamadan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs
        .getBool('isFavorite_a3mal_allayla_altasi3a_3ashara_ramadan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_a3mal_allayla_altasi3a_3ashara_ramadan_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ramadan.screenRoute);
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
                      .addFavorite('أعمال الليلة التاسعة عشرة',
                          A3malAllailaAltasi3a3asharaRamadan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'أعمال الليلة التاسعة عشرة',
                          A3malAllailaAltasi3a3asharaRamadan.screenRoute,
                          A3malAllailaAltasi3a3asharaRamadan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال الليلة التاسعة عشرة',
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
                  title: 'الاوّل :',
                  subtitle:
                      'أن يقول مائة مرّة اَسْتَغْفِرُ اللهَ واَتُوبُ اِلَيْهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'مائة مرّة اَللّـهُمَّ الْعَنْ قَتَلَةَ اَميرِ الْمُؤمِنينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'دعاء يا ذَا الَّذي كانَ وقد مضى الدّعاء في القسم الرّابع من الكتاب.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'يقول : اَللّـهُمَّ اْجْعَلْ فيـما تَقْضي وَتُقَدِّرُ مِنَ الاَمْرِ الَْمحْتُومِ، وَفيـما تَفْرُقُ مِنَ الاَمْرِ الحَكيمِ في لَيْلَةِ الْقَدْرِ، وَفِي الْقَضاءِ الَّذي لا يُرَدُّ وَلا يُبَدَّلْ، اَنْ تَكْتُبَني مِنْ حُجّاجِ بَيْتِكَ الْحَرامِ، الْمَبْرُورِ حَجُّهُمُ، الْمَشْكُورِ سَعْيُهُمُ، الْمَغْفُورِ ذُنُوبُهُمُ الْمُكَفَّرِ عَنْهُمْ سَيِّئاتُهُمْ وَاجْعَلْ فيـما تَقْضي وَتُقَدِّرُ اَنْ تُطيلَ عُمْري وَتُوَسِّعَ عَلَيَّ في رِزْقي، وَتَفْعَلَ بي كَذا وَكَذا ويسأل حاجته عوض هذه الكلمة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AllaylaAlwa7idaWal3ishrounRamadan.screenRoute,
        pushBack: AllaylaAlsabi3a3asharaRamadan.screenRoute,
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
