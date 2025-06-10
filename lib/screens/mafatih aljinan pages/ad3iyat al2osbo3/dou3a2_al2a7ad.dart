import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iyat_al2osbo3.dart';
import 'dou3a2_al2isnain.dart';
import 'dou3a2_alsabt.dart';

class Dou3a2Al2a7ad extends StatefulWidget {
  static String screenRoute = 'dou3a2_al2a7ad_screen';
  const Dou3a2Al2a7ad({super.key});

  @override
  State<Dou3a2Al2a7ad> createState() => _Dou3a2Al2a7adState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Al2a7adState extends State<Dou3a2Al2a7ad> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou3a2_al2a7ad_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3a2_al2a7ad_screen', value);
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
                      .addFavorite('دعاء يوم الأحد', Dou3a2Al2a7ad.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء يوم الأحد', Dou3a2Al2a7ad.screenRoute,
                          Dou3a2Al2a7ad.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء يوم الأحد',
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
                      'بِسْمِ الله الرَّحْمنِ الرَّحِيمِ  بِسْمِ الله الَّذِي لا أَرجو إِلاّ فَضْلَهُ، وَلا أَخْشى إِلاّ عَدْلَهُ، وَلا أَعْتَمِدُ إِلاّ قَوْلَهُ، وَلا اُمْسِكُ إِلاّ بِحَبْلِهِ. بِكَ أَسْتَجِيرُ ياذا العَفْوِ وَالرِّضْوانِ مِنْ الظُّلْمِ وَالعُدْوانِ، وَمِنْ غِيَرِ الزَّمانِ، وَتواتِرُ الاَحْزانِ، وَطوارِقِ الحَدَثانِ، وَمِنْ إِنْقضاء المُدَّةِ قَبْلَ التَّأَهُبِ وَالعُدَّةِ. وَإِياكَ أَسْتَرْشِدُ لِما فِيهِ الصَّلاحُ وَالاِصْلاحُ، وَبِكَ أَسْتَعِينُ فِيما يَقْتَرِنُ بِهِ النَّجاحُ وَالاِنْجاحُ، وَإِيّاكَ أَرْغَبُ فِي لِباسِ العافِيَةِ وَتَمامِها وَشُمُولِ السَّلامَةِ وَدَوَامِها، وأَعُوذُ بِكَ يارَبِّ مِنْ هَمَزاتِ الشَّياطِينِ، وَأَحْتَرِزُ بِسُلْطانِكَ مِنْ جَوْرِ السَّلاطِينِ. فَتَقَبَّلْ ما كانَ مِنْ صَلاتِي وَصَوْمِي، وَاجْعَلْ غَدِي وَما بَعْدَهُ أَفْضَلَ مِنْ ساعَتِي وَيَوْمِي، وَأَعِزَّنِي فِي عَشِيرَتِي وَقَوْمِي ، وَاحْفَظْنِي فِي يَقْظَتِي وَنَوْمِي، فَأَنْتَ الله خَيْرٌ حافِظاً وَأَنْتَ أَرْحَمُ الرّاحِمِينَ. اللّهُمَّ إِنِّي أَبْرَُ إِلَيكَ فِي يَوْمِي هذا وَما بَعْدَهُ مِنَ الاحادِ مِنَ الشِّرْكِ وَالاِلْحادِ، وَاُخْلِصُ لَكَ دُعائِي تَعَرُّضاً لِلاِجابَةِ، وَاُقِيمُ عَلى طاعَتِكَ رَجاءً لِلاِثابَةِ، فَصَلِّ عَلى مُحَمَّدٍ خَيْرِ خَلْقِكَ الدَّاعِي إِلى حَقِّكَ، وَأَعِزَّنِي بِعِزِّكَ الَّذِي لايُضامُ، وَاحْفَظْنِي بِعَيْنِكَ الَّتِي لاتَنامُ، وَاخْتِمْ بِالاِنْقِطاعِ إِلَيْكَ أَمْرِي وَبِالمَغْفِرَةِ عُمْرِي، إِنَّكَ أَنْتَ الغَفُورُ الرَّحِيمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Al2isnain.screenRoute,
          pushBack: Dou3a2Alsabt.screenRoute,
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
