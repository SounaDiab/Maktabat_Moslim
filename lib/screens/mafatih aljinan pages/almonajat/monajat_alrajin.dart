import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'monajat_al5a2ifin.dart';
import 'monajat_alra8ibin.dart';

class MonajatAlrajin extends StatefulWidget {
  static String screenRoute = 'monajat_alrajin_screen';
  const MonajatAlrajin({super.key});

  @override
  State<MonajatAlrajin> createState() => _MonajatAlrajinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAlrajinState extends State<MonajatAlrajin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_monajat_alrajin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_alrajin_screen', value);
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
                          'مناجات  الراجين', MonajatAlrajin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجات  الراجين',
                          MonajatAlrajin.screenRoute,
                          MonajatAlrajin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات  الراجين',
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
                      'يا مَنْ اِذا سَأَلَهُ عَبْدٌ اَعْطاهُ، وَاِذا اَمَّلَ ما عِنْدَهُ بَلَّغَهُ مُناهُ، وَاِذا اَقْبَلَ عَلَيْهِ قَرَّبَهُ وَاَدْناهُ، وَاِذا جاهَرَهُ بِالْعِصْيانِ سَتَرَ عَلى ذَنْبِهِ وَغَطّاهُ، وَاِذا تَوَكَّلَ عَلَيْهِ اَحْسَبَهُ وَكَفاهُ، اِلـهي مَنِ الَّذي نَزَلَ بِكَ مُلْتَمِساً قِراكَ فَما قَرَيْتَهُ، وَمَنِ الَّذي اَناخَ بِبابِكَ مُرْتَجِياً نَداكَ فَما اَوْلَيْتَهُ، اَيَحْسُنُ اَنْ اَرْجِعَ عَنْ بابِكَ بِالْخَيْبَةِ مَصْرُوفاً وَلَسْتُ اَعْرِفُ سِواكَ مَوْلىً بِالاِْحْسانِ مَوْصُوفاً، كَيْفَ اَرْجُو غَيْرَكَ وَالْخَيْرُ كُلُّهُ بِيَدِكَ، وَكَيْفَ اُؤَمِّلُ سِواكَ وَالْخَلْقُ وَالاَْمْرُ لَكَ، أَاَقْطَعُ رَجائي مِنْكَ وَقَدْ اَوْلَيْتَني ما لَمْ اَسْأَلْهُ مِنْ فَضْلِكَ اَمْ تُفْقِرُني اِلى مِثْلي وَاَنـَا اَعْتَصِمُ بِحَبْلِكَ، يا مَنْ سَعِدَ بِرَحْمَتِهِ الْقاصِدُونَ، وَلَمْ يَشْقَ بِنِقْمَتِهِ الْمُسْتَغْفِرُونَ، كَيْفَ اَنْساكَ وَلَمْ تَزَلْ ذاكِري، وَكَيْفَ اَلْهُو عَنْكَ وَاَنْتَ مُراقِبي، اِلـهي بِذَيْلِ كَرَمِكَ اَعْلَقْتُ يَدي، وَلِنَيْلِ عَطاياكَ بَسَطْتُ اَمَلي، فَاَخْلِصْني بِخالِصَةِ تَوْحيدِكَ، وَاجْعَلْني مِنْ صَفْوَةِ عَبيدِكَ، يا مَنْ كُلُّ هارِب اِلَيْهِ يَلْتَجِئُ، وَكُلُّ طالِب اِيّاهُ يَرْتَجي، يا خَيْرَ مَرْجُوٍّ وَيا اَكْرَمَ مَدْعُوٍّ، وَيا مَنْ لا يَرُدُّ سائِلَهُ وَلا يُخَيِّبُ امِلَهُ، يا مَنْ بابُهُ مَفْتُوحٌ لِداعيهِ، وَحِجابُهُ مَرْفُوعٌ لِراجيهِ، اَسْاَلُكَ بِكَرَمِكَ اَنْ تَمُنَّ عَلَيَّ مِنْ عَطائِكَ بِما تَقِرُّ بِهِ عَيْني، وَمِنْ رَجائِكَ بِما تَطْمَئِنُّ بِهِ نَفْسي، وَمِنَ الْيَقينِ بِما تُهَوِّنُ بِهِ عَلَيَّ مُصيباتِ الدُّنْيا، وَتَجْلُو بِهِ عَنْ بَصيرَتي غَشَواتِ الْعَمى، بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlra8ibin.screenRoute,
        pushBack: MonajatAl5a2ifin.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/مناجاة الراجين.mp3',
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
