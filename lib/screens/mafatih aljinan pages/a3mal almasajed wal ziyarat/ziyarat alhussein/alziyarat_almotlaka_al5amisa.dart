import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'alziyarat_almotlaka_alrabi3a.dart';
import 'alziyarat_almotlaka_alsadisa.dart';

class AlziyaratAlmotlakaAl5amisa extends StatefulWidget {
  static String screenRoute = 'alziyarat_almotlaka_al5amisa_screen';
  const AlziyaratAlmotlakaAl5amisa({super.key});

  @override
  State<AlziyaratAlmotlakaAl5amisa> createState() =>
      _AlziyaratAlmotlakaAl5amisaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlziyaratAlmotlakaAl5amisaState
    extends State<AlziyaratAlmotlakaAl5amisa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alziyarat_almotlaka_al5amisa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_alziyarat_almotlaka_al5amisa_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context)
          .pushReplacementNamed(ZiyaratAlhousseinWa2adabiha.screenRoute);
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
                      .addFavorite(
                          'الزيارة المطلقة الخامسة للحسين (عليه السلام)',
                          AlziyaratAlmotlakaAl5amisa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الزيارة المطلقة الخامسة للحسين (عليه السلام)',
                          AlziyaratAlmotlakaAl5amisa.screenRoute,
                          AlziyaratAlmotlakaAl5amisa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الزيارة المطلقة الخامسة للحسين (عليه السلام)',
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
                      'بسند مُعتبر عن الكاظم (عليه السلام) انّه قال لابراهيم بن أبي البلاد : ماذا تقول اذا زرت الحسين (عليه السلام) ؟ فأجاب : أقول : اَلسَّلامُ عَلَيْكَ يا اَبا عَبْدِاللهِ، اَلسَّلامُ عَلَيْكَ يا بْنَ رَسُولِ اللهِ، اَشْهَدُ اَنَّكَ قَدْ اَقَمْتَ الصَّلاةَ، وَآتَيْتَ الزَّكاةَ، وَاَمَرْتَ بِالْمَعْرُوفِ، وَنَهَيْتَ عَنِ المُنْكَرِ، وَدَعَوْتَ اِلى سَبيلِ رَبِّكَ بِالْحِكْمَةِ وَالْمَوْعِظَةِ الْحَسَنَةِ، وَاَشْهَدُ اَنَّ الَّذينَ سَفَكُوا دَمَكَ وَاسْتَحَلُّوا حُرْمَتَكَ مَلْعُونُونَ مُعَذَّبُونَ عَلى لِسانِ داوُدَ وَعيسَى بْنِ مَرْيَمَ، ذلِكَ بِما عَصَوْا وَكانُوا يَعْتَدُونَ، فقال (عليه السلام): بلى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlziyaratAlmotlakaAlsadisa.screenRoute,
          pushBack: AlziyaratAlmotlakaAlrabi3a.screenRoute,
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
