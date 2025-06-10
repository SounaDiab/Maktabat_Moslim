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
import 'monajat_alshakin.dart';

class MonajatAlta2ibin extends StatefulWidget {
  static String screenRoute = 'monajat_alt2ibin_screen';
  const MonajatAlta2ibin({super.key});

  @override
  State<MonajatAlta2ibin> createState() => _MonajatAlta2ibinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAlta2ibinState extends State<MonajatAlta2ibin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_monajat_alt2ibin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_alt2ibin_screen', value);
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
                          'مناجات التائبين', MonajatAlta2ibin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجات التائبين',
                          MonajatAlta2ibin.screenRoute,
                          MonajatAlta2ibin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات التائبين',
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
                      'ِلـهي اَلْبَسَتْنِى الْخَطايا ثَوْبَ مَذَلَّتي، وَجَلَّلَنِى التَّباعُدُ مِنْكَ لِباسَ مَسْكَنَتي، وَاَماتَ قَلْبي عَظيمُ جِنايَتي، فَاَحْيِهِ بِتَوْبَة مِنْكَ يا اَمَلي وَبُغْيَتي وَيا سُؤْلي وَمُنْيَتي، فَوَ عِزَّتِكَ ما اَجِدُ لِذُنوُبي سِواكَ غافِراً، وَلا اَرى لِكَسْري غَيْرَكَ جابِراً، وَقَدْ خَصَعْتُ بِالاِْنابَةِ اِلَيْكَ، وَعَنَوْتُ بِالاِْسْتِكانَةِ لَدَيْكَ، فَاِنْ طَرَدْتَني مِنْ بابِكَ فَبِمَنْ اَلُوذُ، وَاِنْ رَدَدْتَني عَنْ جَنابِكَ فَبِمَنْ اَعُوذُ، فَوا اَسَفاهُ مِنْ خَجْلَتي وَافْتِضاحي، وَوا لَهْفاهُ مِنْ سُوءِ عَمَلي وَاجْتِراحي، اَسْاَلُكَ يا غافِرَ الذَّنْبِ الْكَبيرِ، وَيا جابِرَ الْعَظْمِ الْكَسيرِ، اَنْ تَهَبَ لي مُوبِقاتِ الْجَرائِرِ، وَتَسْتُرَ عَلَيَّ فاضِحاتِ السَّرائِرِ، وَلا تُخْلِني في مَشْهَدِ الْقِيامَةِ مِنْ بَرْدِ عَفْوِكَ، وَغَفْرِكَ وَلا تُعْرِني مِنْ جَميلِ صَفْحِكَ وَسَتْرِكَ، اِلـهي ظَلِّلْ عَلى ذُنُوبي غَمامَ رَحْمَتِكَ، وَاَرْسِلْ عَلى عُيُوبي سَحابَ رَأفَتِكَ اِلـهي هَلْ يَرْجِعُ الْعَبْدُ الاْبِقُ اِلاّ اِلى مَوْلاهُ، اَمْ هَلْ يُجيرُهُ مِنْ سَخَطِهِ اَحَدٌ سِواهُ، اِلـهي اِنْ كانَ النَّدَمُ عَلَى الذَّنْبِ تَوْبَةً فَاِنّي وَعِزَّتِكَ مِنَ النّادِمينَ، وَاِنْ كانَ الاِْسْتِغْفارُ مِنَ الْخَطيـئَةِ حِطَّةً فَاِنّي لَكَ مِنَ الْمُسْتَغْفِرينَ، لَكَ الْعُتْبى حَتّى تَرْضى، اِلـهي بِقُدْرَتِكَ عَلَيَّ، تُبْ عَلَيَّ وَبِحِلْمِكَ عَنّىِ، اعْفُ عَنّي وَبِعِلْمِكَ بي، اَرْفِقْ بي اِلـهي اَنْتَ الَّذي فَتَحْتَ لِعِبادِكَ باباً اِلى عَفْوِكَ سَمَّيْتَهُ التَّوْبَةَ، فَقُلْتَ «تُوبُوا اِلَى اللهِ تَوْبَةً نَصُوحاً»، فَما عُذْرُ مَنْ اَغْفَلَ دُخُولَ الْبابِ بَعْدَ فَتْحِهِ، اِلـهي اِنْ كانَ قَبُحَ الذَّنْبُ مِنْ عَبْدِكَ فَلْيَحْسُنِ الْعَفْوُ مِنْ عِنْدِكَ، اِلـهي ما اَنَا بِاَوَّلِ مَنْ عَصاكَ فَتُبْتَ عَلَيْهِ، وَتَعَرَّضَ لِمَعْرُوفِكَ فَجُدْتَ عَلَيْهِ، يا مُجيبَ الْمُضْطَرِّ، يا كاشِفَ، الضُّرِّ يا عَظيمَ الْبِرِّ، يا عَليماً بِما فِي السِّرِّ، يا جَميلَ السِّتْرِ، اِسْتَشْفَعْتُ بِجُودِكَ وَكَرَمِكَ اِلَيْكَ، وَتَوَسَّلْتُ بِجَنابِكَ وَتَرَحُّمِكَ لَدَيْكَ، فَاسْتَجِبْ دُعائي وَلا تُخَيِّبْ فيكَ رَجائي، وَتَقَبَّلْ تَوْبَتي وَكَفِّرْ خَطيـئَتي بِمَنِّكَ وَرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlshakin.screenRoute,
        pushBack: AlmonajatAlsha3baneya.screenRoute,
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
