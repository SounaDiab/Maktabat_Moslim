import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'monajat_almo7ebin.dart';
import 'monajat_almoftakirin.dart';

class MonajatAlmotawasilin extends StatefulWidget {
  static String screenRoute = 'monajat_almotawasilin_screen';
  const MonajatAlmotawasilin({super.key});

  @override
  State<MonajatAlmotawasilin> createState() => _MonajatAlmotawasilinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAlmotawasilinState extends State<MonajatAlmotawasilin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_monajat_almotawasilin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_almotawasilin_screen', value);
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
                          'مناجات المتوسلين', MonajatAlmotawasilin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجات المتوسلين',
                          MonajatAlmotawasilin.screenRoute,
                          MonajatAlmotawasilin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات المتوسلين',
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
                      'اِلـهي لَيْسَ لي وَسيلَةٌ اِلَيْكَ اِلاّ عَواطِفُ رَأفَتِكَ، وَلا لي ذَريعَةٌ اِلَيْكَ اِلاّ عَوارِفُ رَحْمَتِكَ، وَشَفاعَةُ نَبِيِّكَ نَبِيِّ الرَّحْمَةِ، وَمُنْقِذِ الاُْمَّةِ مِنَ الْغُمَّةِ، فَاجْعَلْهُما لي سَبَباً اِلى نَيْلِ غُفْرانِكَ، وَصَيِّرْهُما لي وُصْلَةً اِليَ الْفَوْزِ بِرِضْوانِكَ، وَقَدْ حَلَّ رَجائي بِحَرَمِ كَرَمِكَ، وَحَطَّ طَمَعي بِفِناءِ جُودِكَ، فَحَقِّقْ فيكَ اَمَلي، وَاخْتِمْ بِالْخَيْرِ عَمَلي، وَاجْعَلْني مِنْ صَفْوَتِكَ الَّذينَ اَحْلَلْتَهُمْ بُحْبُوحَةَ جنَّتِكَ، وَبوَّأْتَهُمْ دارَ كَرامَتِكَ، وَاَقْرَرْتَ اَعْيُنَهُمْ بِالنَّظَرِ اِلَيْكَ يَوْمَ لِقائِكَ، وَاَوْرَثْتَهُمْ مَنازِلَ الصِّدْقِ في جِوارِكَ، يا مَنْ لا يَفِدُ الْوافِدُونَ عَلى اَكْرَمَ مِنْهُ، وَلا يَجِدُ الْقاصِدُونَ اَرْحَمَ مِنْهُ، يا خَيْرَ مَنْ خَلا بِهِ وَحيدٌ، وَيا اَعْطَفَ مَنْ اَوى اِلَيْهِ طَريدٌ، اِلى سَعَةِ عَفْوِكَ مَدَدْتُ يَدي، وَبِذَيْلِ كَرَمِكَ اَعْلَقْتُ كَفّي، فَلا تُولِنِي الْحِرْمانَ، وَلا تُبْلِني بِالْخَيْبَةِ وَالْخُسْرانِ، يا سَميعَ الدٌّعاءِ يا اَرْحَمَ الرّحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlmoftakirin.screenRoute,
        pushBack: MonajatAlmo7ebin.screenRoute,
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
