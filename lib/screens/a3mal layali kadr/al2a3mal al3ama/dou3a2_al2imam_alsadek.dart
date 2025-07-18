import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/a3mal%20layali%20kadr/al2a3mal%20al3ama/dou3a2_alsalihin.dart';
import 'package:maktabat_almoslim/screens/a3mal%20layali%20kadr/al2a3mal%20al3ama/salat_rok3atain.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al3ama.dart';

class Dou3a2Al2imamAlsadek extends StatefulWidget {
  static String screenRoute = 'dou3a2_al2imam_alsadek_screen';
  const Dou3a2Al2imamAlsadek({super.key});

  @override
  State<Dou3a2Al2imamAlsadek> createState() => _Dou3a2Al2imamAlsadekState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Al2imamAlsadekState extends State<Dou3a2Al2imamAlsadek> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_dou3a2_al2imam_alsadek_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3a2_al2imam_alsadek_screen', value);
  }

    Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Al2a3malAl3ama.screenRoute);
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
                      .addFavorite('دعاء الامام الصادق عليه السلام',
                          Dou3a2Al2imamAlsadek.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء الامام الصادق عليه السلام',
                          Dou3a2Al2imamAlsadek.screenRoute,
                          Dou3a2Al2imamAlsadek.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء الامام الصادق عليه السلام',
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
                      'اللهُمَّ إِنِّي أَسْأَلُكَ أَنْ تَجْعَلَ فِيما تَقْضِي وَتُقَدِّرُ مِنَ الأَمْرِ الْمَحْتُومِ فِي الأَمْرِ الْحَكِيمِ مِنَ الْقَضاءِ الَّذِي لا يُرَدُّ وَلا يُبَدَّلُ أَنْ تَكْتُبَنِي مِنْ حُجَّاجِ بَيْتِكَ الْحَرامِ الْمَبْرُورِ حَجُّهُمُ الْمَشْكُورِ سَعْيُهُمُ الْمَغْفُورِ ذُنُوبُهُمُ الْمُكَفَّرِ عَنْ سَيِّئاتِهِمْ (عَنْهُمْ سَيِّئاتُهُمْ) وَأَنْ تَجْعَلَ فِيما تَقْضِي وَتُقَدِّرُ أَنْ تُطِيلَ عُمْرِي فِي خَيْرٍ وَعافِيَةٍ وَتُوَسِّعَ فِي رِزْقِي وَتَجْعَلَنِي مِمَّنْ تَنْتَصِرُ بِهِ لِدِينِكَ وَلا تَسْتَبْدِلْ بِي غَيْرِي.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatRok3atain.screenRoute,
          pushBack: Dou3a2Alsalihin.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء الامام الصادق عليه السلام.mp3',
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
