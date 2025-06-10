import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'monajat_almoridin.dart';
import 'monajat_alshakirin.dart';

class MonajatAlmoti3inLillah extends StatefulWidget {
  static String screenRoute = 'monajat_almoti3in_lillah_screen';
  const MonajatAlmoti3inLillah({super.key});

  @override
  State<MonajatAlmoti3inLillah> createState() => _MonajatAlmoti3inLillahState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAlmoti3inLillahState extends State<MonajatAlmoti3inLillah> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_monajat_almoti3in_lillah_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_almoti3in_lillah_screen', value);
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
                      .addFavorite('مناجات المطيعين لله',
                          MonajatAlmoti3inLillah.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجات المطيعين لله',
                          MonajatAlmoti3inLillah.screenRoute,
                          MonajatAlmoti3inLillah.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات المطيعين لله',
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
                      'َلّلهُمَّ اَلْهِمْنا طاعَتَكَ، وَجَنِّبْنا مَعْصِيَتَكَ، وَيَسِّرْ لَنا بُلُوغَ ما نَتَمَنّى مِنِ ابْتِغاءِ رِضْوانِكَ، وَاَحْلِلْنا بُحْبُوحَةَ جِنانِكَ، وَاقْشَعْ عَنْ بَصائِرِنا سَحابَ الاْرْتِيابِ، وَاكْشِفْ عَنْ قُلُوبِنا اَغْشِيَةَ الْمِرْيَةِ وَالْحِجابِ، وَاَزْهَقِ الْباطِلَ عَنْ ضَمائِرِنا، وَاَثْبِتِ الْحَقَّ في سَرائِرِنا، فَاِنَّ الشُّكُوكَ وَالظُّنُونَ لَواقِحُ الْفِتَنِ، وَمُكَدِّرَةٌ لِصَفْوِ الْمَنايِـحِ وَالْمِنَنِ، اَلّلهُمَّ احْمِلْنا في سُفُنِ نَجاتِكَ وَمَتِّعْنا بِلَذيذِ مُناجاتِكَ، وَاَوْرِدْنا حِياضَ حُبِّكَ، وَاَذِقْنا حَلاوَةَ وُدِّكَ وَقُرْبِكَ، وَاجْعَلْ جِهادَنا فيكَ، و هَمَّنا في طاعَتِكَ، وَاَخْلِصْ نِيّاتِنا في مُعامَلَتِكَ، فَاِنّا بِكَ وَلَكَ وَلا وَسيلَةَ لَنا اِلَيْكَ اِلاّ اَنْتَ، اِلـهي اِجْعَلْني مِنَ الْمُصْطَفَيْنَ الاَْخْيارِ، وَاَلْحِقْني بِالصّالِحينَ الاَْبْرارِ، السّابِقينَ اِليَ الْمَكْرُماتِ الْمُسارِعينَ اِلَى الْخَيْراتِ، الْعامِلينَ لِلْباقِياتِ الصّالِحاتِ، السّاعينَ اِلى رَفيعِ الدَّرَجاتِ، اِنَّكَ عَلى كُلِّ شَيْء قَديرٌ، وَبِالاِْجابَةِ جَديرٌ بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlmoridin.screenRoute,
        pushBack: MonajatAlshakirin.screenRoute,
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
