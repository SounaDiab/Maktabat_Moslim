import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'monajat_alrajin.dart';
import 'monajat_alshakin.dart';

class MonajatAl5a2ifin extends StatefulWidget {
  static String screenRoute = 'monajat_al5a2ifin_screen';
  const MonajatAl5a2ifin({super.key});

  @override
  State<MonajatAl5a2ifin> createState() => _MonajatAl5a2ifinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAl5a2ifinState extends State<MonajatAl5a2ifin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_monajat_al5a2ifin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_al5a2ifin_screen', value);
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
                          'مناجات الخائفين', MonajatAl5a2ifin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجات الخائفين',
                          MonajatAl5a2ifin.screenRoute,
                          MonajatAl5a2ifin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات الخائفين',
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
                      'اِلـهي اَتَراكَ بَعْدَ الاْيمانِ بِكَ تُعَذِّبُني، اَمْ بَعْدَ حُبّي اِيّاكَ تُبَعِّدُني، اَمْ مَعَ رَجائي لِرَحْمَتِكَ وَصَفْحِكَ تَحْرِمُني، اَمْ مَعَ اسْتِجارَتي بِعَفْوِكَ تُسْلِمُني، حاشا لِوَجْهِكَ الْكَريمِ اَنْ تُخَيِّبَني، لَيْتَ شِعْري اَلِلشَّقاءِ وَلَدَتْني اُمّي، اَمْ لِلْعَناءِ رَبَّتْني، فَلَيْتَها لَمْ تَلِدْني وَلَمْ تُرَبِّني، وَلَيْتَني عَلِمْتُ اَمِنْ اَهْلِ السَّعادَةِ جَعَلْتَني وَبِقُرْبِكَ وَجِوارِكَ خَصَصْتَني، فَتَقِرَّ بِذلِكَ عَيْني وَتَطْمَئِنَّ لَهُ نَفْسي، اِلـهي هَلْ تُسَوِّدُ وُجُوهاً خَرَّتْ ساجِدةً لِعَظَمَتِكَ، اَوْ تُخْرِسُ اَلْسِنَةً نَطَقَتْ بِالثَّناءِ عَلى مَجْدِكَ وَجَلالَتِكَ، اَوْ تَطْبَعُ عَلى قُلُوب انْطَوَتْ عَلى مَحَبَّتِكَ، اَوْ تُصِمُّ اَسْماعاً تَلَذَّذَتْ بِسَماعِ ذِكْرِكَ في اِرادَتِكَ، اَوْ تَغُلُّ اَكُفَّاً رَفَعَتْهَا الاْمالُ اِلَيْكَ رَجاءَ رَأفَتِكَ، اَوْ تُعاقِبُ اَبْداناً عَمِلَتْ بِطاعَتِكَ حَتّى نَحِلَتْ في مُجاهَدَتِكَ، اَوْ تُعَذِّبُ اَرْجُلاً سَعَتْ في عِبادَتِكَ، اِلـهي لا تُغْلِقْ عَلى مُوَحِّديكَ اَبْوابَ رَحْمَتِكَ، وَلا تَحْجُبْ مُشْتاقيكَ عَنِ النَّظَرِ اِلى جَميلِ رُؤْيَتِكَ، اِلـهي نَفْسٌ اَعْزَزْتَها بِتَوْحيدِكَ كَيْفَ تُذِلُّها بِمَهانَةِ هِجْرانِكَ، وَضَميرٌ انْعَقَدَ عَلى مَوَدَّتِكَ كَيْفَ تُحْرِقُهُ بِحَرارَةِ نيرانِكَ، اِلـهي اَجِرْني مِنْ أليمِ غَضَبِكَ وَعَظيمِ سَخَطِكَ يا حَنّانُ يا مَنّانُ، يا رَحيمُ يا رَحْمنُ، يا جَبّارُ يا قَهّارُ، يا غَفّارُ يا سَتّارُ، نَجِّني بِرَحْمَتِكَ مَنْ عَذابِ النّارِ وَفَضيحَةِ الْعارِ، اِذَا امْتازَ الاَْخْيارُ مِنَ الاَْشْرارِ، وَحالَتِ الاَْحْوالُ وَهالَتِ الاَْهْوالُ، وَقَرُبَ الُْمحْسِنُونَ وَبَعُدَ الْمُسيـئُونَ، وَوُفّيَتْ كُلُّ نَفْس ما كَسَبَتْ وَهُمْ لا يُظْلَمُونَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlrajin.screenRoute,
        pushBack: MonajatAlshakin.screenRoute,
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
