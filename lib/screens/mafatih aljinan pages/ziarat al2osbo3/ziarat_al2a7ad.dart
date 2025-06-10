import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/favorites_provider.dart';
import 'package:maktabat_almoslim/screens/favorites_screen.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../ziarat_al2osbou3.dart';
import 'ziarat_al2isnain.dart';
import 'ziarat_alsabt.dart';

class ZiaratAl2a7ad extends StatefulWidget {
  static String screenRoute = 'ziarat_al2a7ad_screen';
  const ZiaratAl2a7ad({super.key});

  @override
  State<ZiaratAl2a7ad> createState() => _ZiaratAl2a7adState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiaratAl2a7adState extends State<ZiaratAl2a7ad> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ziarat_al2a7ad_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziarat_al2a7ad_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiaratAl2osbou3.screenRoute);
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
                    .pushReplacementNamed(ZiaratAl2osbou3.screenRoute);
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
                          'زيارة يوم الأحد', ZiaratAl2a7ad.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('زيارة يوم الأحد',
                          ZiaratAl2a7ad.screenRoute, ZiaratAl2a7ad.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة يوم الأحد',
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
                  title: 'زيارةُ أميرِ المؤمنينَ (عليه السلام):',
                  subtitle:
                      'اَلسَّلامُ عَلَى الشَّجَرَةِ النَّبَوِيَّةِ وَالدَّوْحَةِ الْهاشِمِيَّةِ المُضيئَةِ المُثْمِرَةِ بِالنَّبُوَّةِ الْمُونِقَةِ بِالاِْمامَةِ وَعَلى ضَجيعَيْكَ آدَمَ وَنُوح عَلَيْهِمَا السَّلامُ، اَلسَّلامُ عَلَيْكَ وَعَلى اَهْلِ بَيْتِكَ الطَّيِّبينَ الطّاهِرينَ، اَلسَّلامُ عَلَيْكَ وَ عَلَى الْمَلائِكَةِ الُْمحْدِقينَ بِكَ وَالْحافّينَ بِقَبْرِكَ يا مَوْلايَ يا اَميرَ الْمُوْمِنينَ هذا يَوْمُ الاَْحَدِ وَهُوَ يَوْمُكَ وَبِاسْمِكَ وَاَنَا ضَيْفُكَ فيهِ وَ جارُكَ فَاَضِفْنى يا مَوْلاىَ وَاَجِرْنى فَاِنَّكَ كَريمٌ تُحِبُّ الضِّيافَةَ وَ مَأْمُورٌ بِالاِْجارَةِ فَافْعَلْ ما رَغِبْتُ اِلَيْكَ فيهِ وَرَجَوْتُهُ مِنْكَ بِمَنْزِلَتِكَ وَ آلِ بَيْتِكَ عِنْدَاللهِ وَمَنْزِلَتِهِ عِنْدَكُمْ وَبِحَقِّ ابْنِ عَمِّكَ رَسُولِ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ وَسَلَّمَ وَعَلَيْهِمْ اَجْمَعينَ.',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'زيارةُ الزّهْرَاءِ سَلامُ اللهِ عَليها:',
                  subtitle:
                      'اَلسَّلامُ عَلَيْكِ يا مُمْتَحَنَةُ امْتَحَنَكِ الَّذى خَلَقَكِ فَوَجَدَكِ لِمَا امْتَحَنَكِ صابِرَةً اَنَا لَكِ مُصَدِّقٌ صابِرٌ عَلى ما اَتى بِهِ اَبُوكِ وَوَصِيُّهُ صَلَواتُ اللهِ عَلَيْهِما وَاَنَا أَسْأَلُكِ اِنْ كُنْتُ صَدَّقْتُكِ إلاّ اَلْحَقْتِنى بِتَصْديقى لَهُما لِتُسَرَّ نَفْسى فَاشْهَدى اَنّى ظاهِرٌ بِوَلايَتِكِ وَوَلايَةِ آلِ بَيْتِكِ صَلَواتُ اللهِ عَلَيْهِمْ اَجْمَعينَ.',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أيضاً زِيارَتُها بِرواية اُخرى:',
                  subtitle:
                      'اَلسَّلامُ عَلَيْكِ يا مُمْتَحَنَةُ اِمْتَحَنَكِ الَّذى خَلَقَكِ قَبْلَ اَنْ يَخْلُقَكِ وَكُنْتِ لِما امْتَحَنَكِ بِه صابِرَةً وَنَحْنُ لَكِ اَولِياءُ مُصَدِّقُونَ وَلِكُلِّ ما اَتى بِهِ اَبُوكِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ وَسَلَّمَ وَاَتى بِهِ وَصِيُّهُ عَلَيْهِ السَّلامُ مُسَلِّمُونَ وَ نَحْنُ نَسْأَلُكَ اَللّـهُمَّ اِذْ كُنّا مُصَدِّقينَ لَهُمْ اَنْ تُلْحِقَنا بِتَصْديقِنا بِالدَّرَجَةِ الْعالِيَةِ لِنُبَشِّرَ اَنْفُسَنا بِاَنّا قَدْ طَهُرْنا بِوَلايَتِهِمْ عَلَيْهِمُ السَّلامُ.',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiaratAl2isnain.screenRoute,
          pushBack: ZiaratAlsabt.screenRoute,
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
