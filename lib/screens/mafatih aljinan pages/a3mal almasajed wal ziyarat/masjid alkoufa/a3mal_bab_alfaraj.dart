import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'aamal_al2ostwana_alsalisa.dart';
import 'sifat_salat.dart';

class A3malBabAlfaraj extends StatefulWidget {
  static String screenRoute = 'a3mal_bab_alfaraj_screen';
  const A3malBabAlfaraj({super.key});

  @override
  State<A3malBabAlfaraj> createState() => _A3malBabAlfarajState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malBabAlfarajState extends State<A3malBabAlfaraj> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_a3mal_bab_alfaraj_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_a3mal_bab_alfaraj_screen', value);
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
                      .addFavorite(
                          'أعمال باب الفرج المعروف بمقام نوح (عليه السلام)',
                          A3malBabAlfaraj.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'أعمال باب الفرج المعروف بمقام نوح (عليه السلام)',
                          A3malBabAlfaraj.screenRoute,
                          A3malBabAlfaraj.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال باب الفرج المعروف بمقام نوح (عليه السلام)',
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
                      'فاذا فرغت من عمل الاسطوانة فامض الى دكّة باب امير المؤمنين (عليه السلام) وهي الصّفة الواقعة ممّا يلي باب الجامِع من دار امير المؤمنين (عليه السلام) فصلّ عليها أربع ركعات بالحمد وما شِئت من السّور فاذا فرغت وسبّحت فقُل :\n\n'
                      'اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاقْضِ حاجَتي يا اَللهُ يا مَنْ لا يَخيبُ سائِلُهُ، وَلا يَنْفَدُ نائِلُهُ، يا قاضِيَ الْحاجاتِ، يا مُجيبَ الدَّعَواتِ، يا رَبَّ الاَْرَضينَ وَالسَّماواتِ، يا كاشِفَ الْكُرُباتِ، يا واسِعَ الْعَطِيّاتِ، يا دافِعَ النَّقِماتِ، يا مُبَدِّلَ السَّيِّئاتِ حَسَنات، عُدْ عَلَيَّ بِطَوْلِكَ وَفَضْلِكَ وَاِحْسانِكَ، وَاسْتَجِبْ دُعائي فيـما سَأَلْتُكَ وَطَلَبْتُ مِنْكَ، بِحَقِّ نَبِيِّكَ وَوَصِيِّكَ وَاَوْلِيائِكَ الصّالِحينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SifatSalat.screenRoute,
          pushBack: AamalAl2ostwanaAlsalisa.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اعمال باب الفرج.mp3',
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
