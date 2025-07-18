import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'almonajat_alsha3baneya.dart';
import 'almonajat_belsafar.dart';

class AlmonajatBikashfAlzolm extends StatefulWidget {
  static String screenRoute = 'almonajat_bikashf_alzolm_screen';
  const AlmonajatBikashfAlzolm({super.key});

  @override
  State<AlmonajatBikashfAlzolm> createState() => _AlmonajatBikashfAlzolmState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlmonajatBikashfAlzolmState extends State<AlmonajatBikashfAlzolm> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_almonajat_bikashf_alzolm_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_almonajat_bikashf_alzolm_screen', value);
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
                      .addFavorite('المناجات بكشف الظلم',
                          AlmonajatBikashfAlzolm.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'المناجات بكشف الظلم',
                          AlmonajatBikashfAlzolm.screenRoute,
                          AlmonajatBikashfAlzolm.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'المناجات بكشف الظلم',
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
                      'اللَّهُمَّ إِنَّ ظُلْمَ عِبَادِكَ قَدْ تَمَكَّنَ فِي بِلَادِكَ حَتَّى‏ أَمَاتَ الْعَدْلَ وَ قَطَعَ السُّبُلَ وَ مَحَقَ الْحَقَّ وَ أَبْطَلَ الصِّدْقَ وَ أَخْفَى الْبِرَّ وَ أَظْهَرَ الشَّرَّ وَ أَحْمَدَ التَّقْوَى وَ أَزَالَ الْهُدَى وَ أَزَاحَ الْخَيْرَ وَ أَثْبَتَ الضَّيْرَ وَ أَنْمَى الْفَسَادَ وَ قَوَّى الْعِنَادَ وَ بَسَطَ الْجَوْرَ وَ عَدَى الطَّوْرَ اللَّهُمَّ يَا رَبِّ لَا يَكْشِفُ ذَلِكَ إِلَّا سُلْطَانُكَ وَ لَا يُجِيرُ مِنْهُ إِلَّا امْتِنَانُكَ اللَّهُمَّ رَبِّ فَابْتُرِ [فَابْتَزَّ] الظُّلْمَ وَ بُثَّ حِبَالَ الْغَشْمِ وَ أَخْمِدْ سُوقَ الْمُنْكَرِ وَ أَعِزَّ مَنْ عَنْهُ يَنْزَجِرُ وَ احْصُدْ شَافَةَ أَهْلِ الْجَوْرِ وَ أَلْبِسْهُمُ الْحَوْرَ بَعْدَ الْكَوْرِ وَ عَجِّلِ اللَّهُمَّ إِلَيْهِمُ الْبَيَاتَ وَ أَنْزِلْ عَلَيْهِمُ الْمَثُلَاتِ وَ أَمِتْ حَيَاةَ الْمُنْكَرِ لِيُؤْمَنَ الْمَخُوفُ وَ يَسْكُنَ الْمَلْهُوفُ وَ يَشْبَعَ الْجَائِعُ- وَ يَحْفَظَ الضَّائِعُ وَ يَأْوَى الطَّرِيدُ وَ يَعُودَ الشَّرِيدُ وَ يُغْنَى الْفَقِيرُ وَ يُجَارَ الْمُسْتَجِيرُ وَ يُوَقَّرَ الْكَبِيرُ وَ يُرْحَمَ الصَّغِيرُ وَ يُعَزَّ الْمَظْلُومُ وَ يُذَلَّ الظَّالِمُ وَ يُفَرَّجَ الْمَغْمُومُ وَ تَنْفَرِجَ الْغَنَاءُ وَ تَسْكُنَ الدَّهْمَاءُ وَ يَمُوتَ الِاخْتِلَافُ وَ يَعْلُوَ الْعِلْمُ وَ يَشْمَلَ السِّلْمُ وَ يُجْمَعَ الشَّتَاتُ وَ يَقْوَى الْإِيمَانُ وَ يُتْلَى الْقُرْآنُ إِنَّكَ أَنْتَ الدَّيَّانُ الْمُنْعِمُ الْمَنَّانُ‏.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlmonajatAlsha3baneya.screenRoute,
        pushBack: AlmonajatBelsafar.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/المناجاة بكشف الظلم.mp3',
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
