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
import 'monajat_almotawasilin.dart';

class MonajatAlmo7ebin extends StatefulWidget {
  static String screenRoute = 'monajat_almo7ebin_screen';
  const MonajatAlmo7ebin({super.key});

  @override
  State<MonajatAlmo7ebin> createState() => _MonajatAlmo7ebinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAlmo7ebinState extends State<MonajatAlmo7ebin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_monajat_almo7ebin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_almo7ebin_screen', value);
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
                          'مناجات المحبين', MonajatAlmo7ebin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجات المحبين',
                          MonajatAlmo7ebin.screenRoute,
                          MonajatAlmo7ebin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات المحبين',
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
                      'اِلـهي مَنْ ذَا الَّذي ذاقَ حَلاوَةَ مَحَبَّتِكَ فَرامَ مِنْكَ بَدَلاً، وَمَنْ ذَا الَّذي اَنـِسَ بِقُرْبِكَ فَابْتَغى عَنْكَ حِوَلاً، اِلـهي فَاجْعَلْنا مِمَّنِ اصْطَفَيْتَهُ لِقُرْبِكَ وَوِلايَتِكَ، وَاَخْلَصْتَهُ لِوُدِّكَ وَمَحَبَّتِكَ، وَشَوَّقْتَهُ اِلى لِقائِكَ، وَرَضَّيْتَهُ بِقَضائِكَ، وَمَنَحْتَهُ بِالنَّظَرِ اِلى وَجْهِكَ، وَحَبَوْتَهُ بِرِضاكَ، وَاَعَذْتَهُ مِنْ هَجْرِكَ وَقِلاكَ، وَبَوَّأتَهُ مَقْعَدَ الصِّدْقِ في جِوارِكَ، وَخَصَصْتَهُ بِمَعْرِفَتِكَ، وَاَهَّلْتَهُ لِعِبادَتِكَ، وَهَيَّمْتَ قَلْبَهُ لاِِرادَتِكَ، وَاجْتَبَيْتَهُ لِمُشاهَدَتِكَ، وَاَخْلَيْتَ وَجْهَهُ لَكَ، وَفَرَّغْتَ فُؤادَهُ لِحُبِّكَ، وَرَغَّبْتَهُ فيـما عِنْدَكَ، وَاَلْهَمْتَهُ ذِكْرَكَ، وَاَوْزَعْتَهُ شُكْرَكَ، وَشَغَلْتَهُ بِطاعَتِكَ، وَصَيَّرْتَهُ مِنْ صالِحي بَرِيَّتِكَ، وَاخْتَرْتَهُ لِمُناجاتِكَ، وَقَطَعْتَ عَنْهُ كُلَّ شَيْء يَقْطَعُهُ عَنْكَ، اَلّلهُمَّ اجْعَلْنا مِمَّنْ دَأْبُـهـُمُ الاِْرْتِياحُ اِلَيْكَ وَالْحَنينُ، وَدَهْرُهُمُ الزَّفْرَةُ وَالاَْنينُ، جِباهُهُمْ ساجِدَةٌ لِعَظَمَتِكَ، وَعُيُونُهُمْ ساهِرَةٌ في خِدْمَتِكَ، وَدُمُوعُهُمْ سائِلَةٌ مِنْ خَشْيَتِكَ، وَقُلُوبُهُمْ مُتَعَلِّقَةٌ بِمَحَبَّتِكَ، وَاَفْئِدَتُهُمْ مُنْخَلِعَةٌ مِنْ مَهابَتِكَ، يا مَنْ اَنْوارُ قُدْسِهِ لاَِبْصارِ مُحِبّيهِ رائِقَةٌ، وَسُبُحاتُ وَجْهِهِ لِقُلُوبِ عارِفيهِ شائِقَةٌ، يا مُنى قُلُوبِ الْمُشْتاقينَ، وَيا غايَةَ آمالِ الُْمحِبّينَ، اَسْاَلُكَ حُبَّكَ وَحُبَّ مَنْ يُحِبُّكَ وَحُبَّ كُلِّ عَمَل يُوصِلُني اِلى قُرْبِكَ، وَاَنْ تَجْعَلَكَ اَحَبَّ اِلَيَّ مِمّا سِواكَ، وَاَنْ تَجْعَلَ حُبّي اِيّاكَ قائِداً اِلى رِضْوانِكَ، وَشَوْقي اِلَيْكَ ذائِداً عَنْ عِصْيانِكَ، وَامْنُنْ بِالنَّظَرِ اِلَيْكَ عَلَيَّ، وَانْظُرْ بِعَيْنِ الْوُدِّ وَالْعَطْفِ اِلَىّ، وَلا تَصْرِفْ عَنّي وَجْهَكَ، وَاجْعَلْني مِنْ اَهْلِ الاِْسْعادِ وَالْحَظْوَةِ عِنْدَكَ، يا مُجيبُ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlmotawasilin.screenRoute,
        pushBack: MonajatAlmoridin.screenRoute,
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
