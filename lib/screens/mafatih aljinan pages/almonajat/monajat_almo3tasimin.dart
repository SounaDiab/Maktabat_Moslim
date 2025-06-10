import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'monajat_alzahidin.dart';
import 'monajat_alzakirin.dart';

class MonajatAlmo3tasimin extends StatefulWidget {
  static String screenRoute = 'monajat_almo3tasimin_screen';
  const MonajatAlmo3tasimin({super.key});

  @override
  State<MonajatAlmo3tasimin> createState() => _MonajatAlmo3tasiminState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAlmo3tasiminState extends State<MonajatAlmo3tasimin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_monajat_almo3tasimin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_almo3tasimin_screen', value);
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
                          'التعقيبات العامة', MonajatAlmo3tasimin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'التعقيبات العامة',
                          MonajatAlmo3tasimin.screenRoute,
                          MonajatAlmo3tasimin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات المعتصمين',
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
                      'اَلّلهُمَّ يا مَلاذَ اللاّئِذينَ، وَيا مَعاذَ الْعائِذينَ، وَيا مُنْجِيَ الْهالِكينَ، وَيا عاصِمَ الْبائِسينَ، وَيا راحِمَ الْمَساكينِ، وَيا مُجيبَ الْمُضْطَرّينَ، وَياكَنْزَ الْمُفْتَقِرينَ، وَيا جابِرَ الْمُنْكَسِرينَ، وَيا مَأوَى الْمُنْقَطِعينَ، وَيا ناصِرَ الْمُسْتَضْعَفينَ، وَيا مُجيرَ الْخائِفينَ، وَيا مُغيثَ الْمَكْرُوبينَ، وَيا حِصْنَ اللاّجئينَ اِنْ لَمْ اَعُذْ بِعِزَّتِكَ فَبِمَنْ اَعُوذُ، وَاِنْ لَمْ اَلُذْ بِقُدْرَتِكَ فَبِمَنْ اَلُوذُ، وَقَدْ اَلْجَاَتْنِي الذُّنُوبُ اِلى التَّشَبُّثِ بِاَذْيالِ عَفْوِكَ، وَاَحْوَجَتْنِى الْخَطايا اِلَى اسْتِفْتاحِ اَبْوابِ صَفْحِكَ وَدَعَتْنِى الاِْساءَةُ اِلَى الاِْناخَةِ بِفِناءِ عِزِّكَ، وَحَمَلَتْنِى الَْمخافَةُ مِنْ نِقْمَتِكَ عَلَى الَّتمَسُّكِ بِعُرْوَةِ عَطْفِكَ، وَما حَقُّ مَنِ اعْتَصَمَ بِحَبْلِكَ اَنْ يُخْذَلَ، وَلا يَليقُ بِمَنِ اسْتَجارَ بِعِزِّكَ اَنْ يُسْلَمَ اَوْ يُهْمَلَ، اِلـهي فَلا تُخْلِنا مِنْ حِمايَتِكَ وَلا تُعْرِنا مِنْ رِعايَتِكَ، وَذُدْنا عَنْ مَوارِدِ الْهَلَكَةِ، فَاِنّا بِعَيْنِكَ وَفي كَنَفِكَ وَلَكَ، اَسْاَلُكَ بِاَهْلِ خاصَّتِكَ مِنْ مَلائِكَتِكَ وَالصّالِحينَ مِنْ بَرِيَّتِكَ اَنْ تَجْعَلَ عَلَيْنا واقِيَةً تُنْجينا مِنَ الْهَلَكاتِ، وَتُجَنِّبُنا مِنَ الاْفاتِ، وَتُكِنُّنا مِنْ دَواهِي الْمُصيباتِ، وَاَنْ تُنْزِلَ عَلَيْنا مِنْ سَكينَتِكَ، وَاَنْ تُغَشِّيَ وُجُوهَنا بِاَنْوارِ مَحَبَّتِكَ، وَاَنْ تُؤْوِيَنا اِلى شَديدِ رُكْنِكَ، وَاَنْ تَحْوِيَنا في اَكْنافِ عِصْمَتِكَ، بِرَأفَتِكَ وَرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlzahidin.screenRoute,
        pushBack: MonajatAlzakirin.screenRoute,
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
