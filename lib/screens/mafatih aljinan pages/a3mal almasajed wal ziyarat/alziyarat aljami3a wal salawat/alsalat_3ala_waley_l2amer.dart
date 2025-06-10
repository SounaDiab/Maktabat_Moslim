import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../alziyarat_aljami3a_walsalawat.dart';
import 'alsalat_3ala_lhassan_al3askari.dart';
import 'ziyarat_2al_yasin.dart';

class Alsalat3alaWaleyL2amer extends StatefulWidget {
  static String screenRoute = 'alsalat_3ala_waley_l2amer_screen';
  const Alsalat3alaWaleyL2amer({super.key});

  @override
  State<Alsalat3alaWaleyL2amer> createState() => _Alsalat3alaWaleyL2amerState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Alsalat3alaWaleyL2amerState extends State<Alsalat3alaWaleyL2amer> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alsalat_3ala_waley_l2amer_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alsalat_3ala_waley_l2amer_screen', value);
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
          .pushReplacementNamed(AlziyaratAljami3aWalsalawat.screenRoute);
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
                      .addFavorite('الصلاة على ولي الأمر المنتظر (عليه السلام)',
                          Alsalat3alaWaleyL2amer.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الصلاة على ولي الأمر المنتظر (عليه السلام)',
                          Alsalat3alaWaleyL2amer.screenRoute,
                          Alsalat3alaWaleyL2amer.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الصلاة على ولي الأمر المنتظر (عليه السلام)',
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
                      'اَللّـهُمَّ صَلِّ عَلى وَلِيِّكَ وَابْنِ اَوْلِيائِكَ الَّذينَ فَرَضْتَ طاعَتَهُمْ وَاَوْجَبْتَ حَقَّهُمْ وَاَذْهَبْتَ عَنْهُمُ الرِّجْسَ وَطَهَّرْتَهُمْ تَطْهيراً، اَللّـهُمَّ انْصُرْهُ وَانْتَصِرْ بِهِ لِدينِكَ وَانْصُرْ بِهِ اَوْلِياءَكَ وَاَوْلِياءَهُ وَشيعَتَهُ وَاَنْصارَهُ، وَاجْعَلْنا مِنْهُمْ، اَللّـهُمَّ اَعِذْهُ مِنْ شَرِّ كُلِّ باغ وَطاغ وَمِنْ شَرِّ جَميعِ خَلْقِكَ، وَاحْفُظْهُ مِنْ بَيْنِ يَديهِ وَمِنْ خَلْفِهِ وَعَنْ يَمينِهِ وَعَنْ شِمالِهِ، وَاحْرُسْهُ وَامْنَعْهُ اَنْ يوُصَلَ اِلَيْهِ بِسوُء، وَاحْفَظْ فيهِ رَسُولَكَ، وَآلِ رَسوُلِكَ وَاَظْهِرْ بِهِ الْعَدْلَ وَاَيِّدْهُ بِالنَّصْرِ، وَانْصُرْ ناصِريهِ وَاخْذُلْ خاذِليهِ، وَاقْصِمْ بِهِ جَبابِرَةَ الْكُفْرِ وَاقْتُلْ بِهِ الْكُفّارَ وَالْمُنافِقينَ وَجَميعَ الْمُلْحِدينَ حيثُ كانُوا مِنْ مَشارِقِ الاَْرْضَ وَمَغارِبِها وَبَرِّها وَبَحْرِها وَامْلاَْ بِهِ الاَْرْضِ عَدْلاً وَاَظْهِرْ بِهِ دينَ نَبِيِّكَ عَلَيْهِ وَآلِهِ السَّلامُ، وَاجْعَلْنِى اللّهُمَّ مِنْ اَنْصارِهِ وَاَعْوانِهِ وَاَتْباعِهِ وَشيعَتِهِ وَاَرِنى فى آلِ مُحَمَّد ما يَأمَلوُنَ وَفى عَدُوِّهُمْ ما يَحْذَرُونَ اِلـهَ الْحَقِّ آمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Ziyarat2alYasin.screenRoute,
          pushBack: Alsalat3alaLhassanAl3askari.screenRoute,
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
