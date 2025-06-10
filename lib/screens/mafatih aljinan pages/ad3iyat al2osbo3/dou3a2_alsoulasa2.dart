import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iyat_al2osbo3.dart';
import 'dou3a2_al2arbi3a2.dart';
import 'dou3a2_al2isnain.dart';

class Dou3a2Alsoulasa2 extends StatefulWidget {
  static String screenRoute = 'dou3a2_alsoulasa2_screen';
  const Dou3a2Alsoulasa2({super.key});

  @override
  State<Dou3a2Alsoulasa2> createState() => _Dou3a2Alsoulasa2State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Alsoulasa2State extends State<Dou3a2Alsoulasa2> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou3a2_alsoulasa2_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3a2_alsoulasa2_screen', value);
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
                          'دعاء يوم الثلثاء', Dou3a2Alsoulasa2.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء يوم الثلثاء',
                          Dou3a2Alsoulasa2.screenRoute,
                          Dou3a2Alsoulasa2.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء يوم الثلثاء',
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
                      'بِسْمِ الله الرَّحْمنِ الرَّحِيمِ الحَمْدُ للهِ وَالحَمْدُ حَقُهُ كَما يَسْتِحِقُّهُ حَمْداً كَثِيراً، وَأَعُوذُ بِهِ مِنْ شَرِّ نَفْسِي ؛ إِنَّ النَّفْسَ لاَمّارَةٌ بِالسُّوءِ إِلاّ مارَحِمَ رَبِّي، وَأَعُوذُ بِهِ مِنْ شَرِّ الشَّيْطانِ الَّذِي يَزِيدُنِي ذَنْباً إِلى ذَنْبِي، وَاحْتَرِزُ بِهِ مِنْ كُلِّ جَبّارٍ فاجِرٍ، وَسُلْطانٍ جائِرٍ، وَعَدُوٍ قاهِرٍ. اللّهُمَّ اجْعَلْنِي مِنْ جُنْدِكَ فَإِنَّ جُنْدَكَ هُمُ الغالِبُونَ، وَاجْعَلْنِي مِنْ حِزْبِكَ فَإِنَّ حِزْبَكَ هُمُ المُفْلِحُونَ، وَاجْعَلْنِي مِنْ أوْلِيائِكَ فَإِنَّ أَوْلِياَئكَ لاخَوْفٌ عَلَيْهِمْ وَلاهُمْ يَحْزَنُون. اللّهُمَّ اصْلِحْ لِي دِينِي فَإِنَّهُ عِصْمَةُ أَمْرِي، وَاصْلِحْ لِي آخِرَتِي فَإِنَّها دارُ مَقَرِّي وَإِلَيْها مِن مُجاوَرَةِ اللئامِ مَفَرِّي، وَاجْعَلْ الحَياةَ زِيادَةً لِي فِي كُلِّ خَيْرٍ وَالوَفاةَ راحَةً لِي مِنْ كُلِّ شَرٍ اللّهُمَّ صَلِّ عَلى مُحَمَّدٍ خاتَمِ النَّبِيِّينَ وَتَمامِ عِدَّةِ المُرْسَلِينَ، وَعَلى آلِهِ الطَّيِّبِينَ الطَّاهِرِينَ وَأَصْحابِهِ المُنْتَجَبِينَ، وَهَبْ لِي فِي الثُّلاثاءِ ثَلاثا: لاتَدَعْ لِي ذَنْباً إِلاّ غَفَرْتَهُ، وَلا غَمّاً إِلاّ أَذْهَبْتَهُ، وَلا عَدُوّاً إِلاّ دَفَعْتَهُ.\n\n'
                      'بِبِسْمِ الله خَيْرِ الاَسَّماء، بِسْمِ الله رَبِّ الاَرْضِ وَالسَّماء اسْتَدْفِعُ كُلَّ مَكْرُوهٍ أَوَّلُهُ سَخَطُهُ، وَأَسْتَجْلِبُ كُلَّ مَحْبُوبٍ أَوَّلُهُ رِضاهُ، فَاخْتِمْ لِي مِنْكَ بِالغُفْرانِ ياوَلِيَّ الاِحْسانِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Al2arbi3a2.screenRoute,
          pushBack: Dou3a2Al2isnain.screenRoute,
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
