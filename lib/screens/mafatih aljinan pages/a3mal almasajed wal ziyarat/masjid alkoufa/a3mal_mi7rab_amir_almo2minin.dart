import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'mounajat_amir_almo2minin.dart';
import 'sifat_salat_lil7aja.dart';

class A3malMi7rabAmirAlmo2minin extends StatefulWidget {
  static String screenRoute = 'a3mal_mi7rab_amir_almo2minin_screen';
  const A3malMi7rabAmirAlmo2minin({super.key});

  @override
  State<A3malMi7rabAmirAlmo2minin> createState() =>
      _A3malMi7rabAmirAlmo2mininState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malMi7rabAmirAlmo2mininState extends State<A3malMi7rabAmirAlmo2minin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_a3mal_mi7rab_amir_almo2minin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_a3mal_mi7rab_amir_almo2minin_screen', value);
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
          .pushReplacementNamed(FadlLakoufaWmasjidoha.screenRoute);
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
                      .addFavorite('أعمال محراب أمير المؤمنين (عليه السلام)',
                          A3malMi7rabAmirAlmo2minin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'أعمال محراب أمير المؤمنين (عليه السلام)',
                          A3malMi7rabAmirAlmo2minin.screenRoute,
                          A3malMi7rabAmirAlmo2minin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال محراب أمير المؤمنين (عليه السلام)',
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
                      'ثمّ صلّ في المكان الذي ضرب فيه امير المؤمنين (عليه السلام) ركعتين كلّ ركعة بالفاتحة وسورة من السّور فاذا سلّمت وسبّحت فقل :\n\n'
                      'يا مَنْ اَظْهَرَ الْجَميلَ وَسَتَرَ الْقَبيحَ، يا مَنْ لَمْ يُؤاخِذْ بِالْجَريرَةِ وَلَمْ يَهْتِكِ الِّستْرَ وَالسَّريرَةَ، يا عَظيمَ الْعَفْوِ يا حَسَنَ التَّجاوُزِ، يا واسِعَ الْمَغْفِرَةِ يا باسِطَ الْيَدَيْنِ بِالرَّحْمَةِ، يا صاحِبَ كُلِّ نَجْوى، يا مُنْتَهى كُلِّ شَكْوى، يا كَريمَ الْصَّفْحِ يا عَظيمَ الرَّجاءِ، يا سَيِّدي صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَافْعَلْ بي ما اَنْتَ اَهْلُهُ يا كَريمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MounajatAmirAlmo2minin.screenRoute,
        pushBack: SifatSalatLil7aja.screenRoute,
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
