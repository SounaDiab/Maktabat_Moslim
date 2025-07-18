import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iyat_al2osbo3.dart';
import 'dou3a2_al5amis.dart';
import 'dou3a2_alsabt.dart';

class Dou3a2Aljom3a extends StatefulWidget {
  static String screenRoute = 'dou3a2_aljami3_screen';
  const Dou3a2Aljom3a({super.key});

  @override
  State<Dou3a2Aljom3a> createState() => _Dou3a2Aljom3aState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Aljom3aState extends State<Dou3a2Aljom3a> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou3a2_aljami3_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3a2_aljami3_screen', value);
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
                          'دعاء يوم الجمعة', Dou3a2Aljom3a.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء يوم الجمعة',
                          Dou3a2Aljom3a.screenRoute, Dou3a2Aljom3a.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء يوم الجمعة',
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
                      'بِسْمِ الله الرَّحْمنِ الرَّحِيمِ الحَمْدُ للهِ الأول قَبْلَ الاِنْشاءِ وَالاِحْياءِ وَالآخرِ بَعْدَ فَناءِ الأَشْياءِ، العَلِيمِ الَّذِي لا يَنْسى مَنْ ذَكَرَهُ وَلا يَنْقُصُ مَنْ شَكَرَهُ وَلا يَخِيبُ مَنْ دَعاهُ وَلا يَقْطَعُ رَجاءَ مَنْ رَجاهُ. اللّهُمَّ إِنِّي اُشْهِدُكَ وَكَفى بِكَ شَهِيداً، وَاُشْهِدُ جَمِيعَ مَلائِكَتِكَ وَسُكَّانَ سَماواتِكَ وَحَمَلَةَ عَرْشِكَ، وَمَنْ بَعَثْتَ مِنْ أَنْبِيائِكَ وَرُسُلِكَ، وَأَنْشَأتَ مِنْ أَصْنافِ خَلْقِكَ، أَنِّي أَشْهَدُ أَنَّكَ أَنْتَ الله لا إِلهَ إِلاّ أَنْتَ وَحْدَكَ لاشَرِيكَ لَكَ وَلا عَدِيلَ وَلا خُلْفَ لِقَوْلِكَ وَلا تَبْدِيلَ، وَأَنَّ مُحَمَّداً صَلَّى الله عَلَيْهِ وَآلِهِ عَبْدُكَ وَرَسُولُكَ أَدّى ماحَمَّلْتَهُ إِلى العِبادِ وَجاهَدَ فِي الله عَزَّ وَجلَّ حَقَّ الجِهادِ، وَأَنَّهُ بَشَّرَ بِما هُوَ حَقٌ مِنَ الثَّوابِ، وَأَنْذَرَ بِما هُوَ صِدْقٌ مِنَ العِقابِ.\n\n'
                      'اللّهُمَّ ثَبِّتْنِي عَلى دِينِكَ ما أَحْيَيْتَنِي، وَلاتُزِغْ قَلْبِي بَعْدَ إِذْ هَدَيْتَنِي، وَهَبْ لِي مِنْ لَدُنْكَ رَحْمَةً إِنَّكَ أَنْتَ الوَهّابُ ، صَلِّ عَلى مُحَمَّدٍ وَعَلى آل مُحَمَّدٍ، وَاجْعَلْنِي مِنْ أَتْباعِهِ وَشِيعَتِهِ، وَاحْشُرْنِي فِي زُمْرَتِهِ، وَوَفِّقْنِي لاَداءِ فَرْضِ الجُمُعاتِ وَما أَوْجَبْتَ عَلَيَّ فِيها مِنْ الطّاعاتِ وَقَسَمْتَ لاهْلِها مِنَ العَطاءِ فِي يَوْمِ الجَزاءِ. إِنَّكَ أَنْت‌َ العَزِيزُ الحَكِيمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: Dou3a2Alsabt.screenRoute,
        pushBack: Dou3a2Al5amis.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء الجمعة.mp3',
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
