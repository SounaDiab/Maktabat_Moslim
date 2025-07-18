import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/mafatih%20aljinan%20pages/a3mal%20almasajed%20wal%20ziyarat/ziyarat%202a2imat%20sir/almakam_al2awal.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'monajat_almoftakirin.dart';
import 'monajat_alzakirin.dart';

class MonajatAl3arifin extends StatefulWidget {
  static String screenRoute = 'monajat_al3arifin_screen';
  const MonajatAl3arifin({super.key});

  @override
  State<MonajatAl3arifin> createState() => _MonajatAl3arifinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAl3arifinState extends State<MonajatAl3arifin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_monajat_al3arifin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_al3arifin_screen', value);
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
                          'مناجات العارفين', AlmakamAl2awal.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجات العارفين',
                          AlmakamAl2awal.screenRoute,
                          AlmakamAl2awal.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات العارفين',
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
                      'اِلـهي قَصُرَتِ الاَْلْسُنُ عَنْ بُلُوغِ ثَنائِكَ كَما يَليقُ بِجَلالِكَ، وَعَجَزَتِ الْعُقُولُ عَنْ اِدْراكِ كُنْهِ جَمالِكَ، وَانْحَسَرَتِ الاَْبْصارُ دُونَ النَّظَرِ اِلى سُبُحاتِ وَجْهِكَ، وَلَمْ تَجْعَلْ لِلْخَلْقِ طَريقاً اِلى مَعْرِفَتِكَ اِلاّ بِالْعَجْزِ عَنْ مَعْرِفَتِكَ، اِلـهي فَاجْعَلْنا مِنَ الَّذينَ تَرَسَّخَتْ اَشْجارُ الشَّوْقِ اِلَيْكَ في حَدائِقِ صُدُورِهِمْ، وَاَخَذَتْ لَوْعَةُ مَحَبَّتِكَ بِمَجامِعِ قُلُوبِهِمْ، فَهُمْ اِلى اَوْكارِ الاَْفْكارِ يَأْوُونَ، وَفي رِياضِ الْقُرْبِ وَالْمُكاشَفَةِ يَرْتَعُونَ، وَمِنْ حِياضِ الَْمحَبَّةِ بِكَاْسِ الْمُلاطَفَةِ يَكْرَعُونَ، وَشَرايِـعَ الْمُصافاتِ يَرِدُونَ، قَدْ كُشِفَ الْغِطاءُ عَنْ اَبْصارِهِمْ، وَانْجَلَتْ ظُلْمَةُ الرَّيْبِ عَنْ عَقائِدِهِمْ وَضَمائِرِهِمْ، وَانْتَفَتْ مُخالَجَةُ الشَّكِّ عَنْ قُلُوبِهِمْ وَسَرائِرِهِمْ، وَانْشَرَحَتْ بِتَحْقيقِ الْمَعْرِفَةِ صُدُورُهُمْ، وَعَلَتْ لِسَبْقِ السَّعادَةِ فِي الزَّهادَةِ هِمَمُهُمْ، وَعَذُبَ في مَعينِ الْمُعامَلَةِ شِرْبُهُمْ، وَطابَ في مَجْلِسِ الاُْنْسِ سِرُّهُمْ، وَاَمِنَ في مَوْطِنِ الَْمخافَةِ سِرْبُهُمْ، وَاطْمَأنَّتْ بِالرُّجُوعِ اِلى رَبِّ الاَْرْبابِ اَنْفُسُهُمْ، وَتَيَقَّنَتْ بِالْفَوْزِ وَالْفَلاحِ اَرْواحُهُمْ، وَقَرَّتْ بِالنَّظَرِ اِلى مَحْبُوبِهِمْ اَعْيُنُهُمْ، وَاسْتَقَرَّ بِإدْراكِ السُّؤْلِ وَنَيْلِ الْمَأْمُولِ قَرارُهُمْ، وَرَبِحَتْ في بَيْعِ الدُّنْيا بِالاْخِرَةِ تِجارَتُهُمْ، اِلـهي ما أَلَذَّ خَواطِرَ الاِْلْهامِ بِذِكْرِكَ عَلَى الْقُلُوبِ، وَما اَحْلَى الْمَسيرَ اِلَيْكَ بِالاَْوْهامِ في مَسالِكِ الْغُيُوبِ، وَما اَطْيَبَ طَعْمَ حُبِّكَ، وَما اَعْذَبَ شِرْبَ قُرْبِكَ، فَاَعِذْنا مِنْ طَرْدِكَ وَاِبْعادِكَ، وَاجْعَلْنا مِنْ اَخَصِّ عارِفيكَ، وَاَصْلَحِ عِبادِكَ، وَاَصْدَقِ طائِعيكَ، وَاَخْلَصِ عُبّادِكَ، يا عَظيمُ يا جَليلُ، يا كَريمُ يا مُنيلُ، بِرَحْمَتِكَ وَمَنِّكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlzakirin.screenRoute,
        pushBack: MonajatAlmoftakirin.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/المناجاة العارفين.mp3',
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
