import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'almonajat_bikashf_alzolm.dart';
import 'salas_kalimat_3an_amir_almo2minin.dart';

class AlmonajatBelsafar extends StatefulWidget {
  static String screenRoute = 'almonajat_belsafar_screen';
  const AlmonajatBelsafar({super.key});

  @override
  State<AlmonajatBelsafar> createState() => _AlmonajatBelsafarState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlmonajatBelsafarState extends State<AlmonajatBelsafar> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_almonajat_belsafar_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_almonajat_belsafar_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Almonajat.screenRoute);
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
                    .pushReplacementNamed(Almonajat.screenRoute);
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
                          'المناجات بالسفر', AlmonajatBelsafar.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'المناجات بالسفر',
                          AlmonajatBelsafar.screenRoute,
                          AlmonajatBelsafar.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'المناجات بالسفر',
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
                      'اللَّهُمَّ إِنِّي أُرِيدُ سَفَراً فَخِرْ لِي فِيهِ وَ أَوْضِحْ لِي فِيهِ سَبِيلَ الرَّأْيِ وَ فَهِّمْنِيهِ وَ افْتَحْ عَزْمِي بِالاسْتِقَامَةِ وَ اشْمُلْنِي فِي سَفَرِي بِالسَّلَامَةِ وَ أَفِدْنِي جَزِيلَ الْحَظِّ وَ الْكَرَامَةِ وَ اكْلَأْنِي بِحُسْنِ الْحِفْظِ وَ الْحِرَاسَةِ وَ جَنِّبْنِي اللَّهُمَّ وَعْثَاءَ الْأَسْفَارِ وَ سَهِّلْ لِي حُزُونَةَ الْأَوْعَادِ وَ اطْوِ لِي بِسَاطَ الْمَرَاحِلِ وَ قَرِّبْ مِنِّي بُعْدَ نَأْيِ الْمَنَاهِلِ وَ بَاعِدْنِي فِي الْمَسِيرِ بَيْنَ خُطَى الرَّوَاحِلِ حَتَّى تُقَرِّبَ نِيَاطَ الْبَعِيدِ وَ تُسَهِّلَ وُعُورَ الشَّدِيدِ وَ لَقِّنِي اللَّهُمَّ فِي سَفَرِي نُجْحَ طَائِرِ الْوَاقِيَةِ وَ هَبْنِي فِيهِ غُنْمَ الْعَافِيَةِ وَ خَفِيرَ الِاسْتِقْلَالِ وَ دَلِيلَ مُجَاوَزَةِ الْأَهْوَالِ وَ بَاعِثَ وُفُورِ الْكِفَايَةِ وَ سَانِحَ خَفِيرِ الْوَلَايَةِ وَ اجْعَلْهُ اللَّهُمَّ سَبَبَ عَظِيمِ السِّلْمِ حَاصِلَ الْغُنْمِ وَ اجْعَلِ اللَّيْلَ عَلَيَّ سِتْراً مِنَ الْآفَاتِ وَ النَّهَارَ مَانِعاً مِنَ الْهَلَكَاتِ وَ اقْطَعْ عَنِّي قِطَعَ لُصُوصِهِ بِقُدْرَتِكَ وَ احْرُسْنِي مِنْ وُحُوشِهِ بِقُوَّتِكَ حَتَّى‏ تَكُونَ السَّلَامَةُ فِيهِ مُصَاحِبَتِي وَ الْعَافِيَةُ فِيهِ مُقَارِنَتِي وَ الْيُمْنُ سَائِقِي وَ الْيُسْرُ مُعَانِقِي وَ الْعُسْرُ مُفَارِقِي وَ الْفَوْزُ مُوَافِقِي وَ الْأَمْنُ مُرَافِقِي إِنَّكَ ذُو الطَّوْلِ وَ الْمَنِّ وَ الْقُوَّةِ وَ الْحَوْلِ وَ أَنْتَ عَلَى كُلِّ شَيْ‏ءٍ قَدِيرٌ وَ بِعِبَادِكَ بَصِيرٌ خَبِيرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlmonajatBikashfAlzolm.screenRoute,
        pushBack: SalasKalimat3anAmirAlmo2minin.screenRoute,
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
