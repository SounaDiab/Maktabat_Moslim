import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ala7raz_walad3iya_almoujaza.dart';
import 'almonajat_bilisti3aza.dart';
import 'almonajat_bitalab_al7aj.dart';

class AlmonajatBitalabAltawba extends StatefulWidget {
  static String screenRoute = 'almonajat_bitalab_altawba_screen';
  const AlmonajatBitalabAltawba({super.key});

  @override
  State<AlmonajatBitalabAltawba> createState() =>
      _AlmonajatBitalabAltawbaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlmonajatBitalabAltawbaState
    extends State<AlmonajatBitalabAltawba> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_almonajat_bitalab_altawba_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_almonajat_bitalab_altawba_screen', value);
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
          .pushReplacementNamed(Ala7razWalad3iyaAlmoujaza.screenRoute);
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
                          'المناجاة بطلب التوبة',
                          AlmonajatBitalabAltawba.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'المناجاة بطلب التوبة',
                          AlmonajatBitalabAltawba.screenRoute,
                          AlmonajatBitalabAltawba.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'المناجاة بطلب التوبة',
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
                      'اللّهُمَّ إِنِّي قَصَدْتُ إلَيْكَ بِإخْلاصِ تَوْبَةٍ نَصوحٍ وَتَثْبيتِ عَقْدٍ صَحيحٍ وَدُعاءِ قَلْبٍ قَريحٍ وَإعْلانِ قَوْلٍ صَريحٍ، اللّهُمَّ فَتَقَبَّلْ مِنّي مُخْلَصَ التَّوْبَةِ وَإقْبالَ سَريعِ الاوْبَةِ وَمَصارِعَ تَخَشُّعِ الحَوْبَةِ، وَقابِلْ رَبِّي تَوْبَتي بِجَزيلِ الثَّوابِ وَكَريمِ المآبِ وَحَطِّ العِقابِ وَصَرْفِ العَذابِ وَغُنْمِ الاِيابِ وَسِتْرِ الحِجابِ، وَامْحُ اللّهُمَّ ماثَبَتَ مِنْ ذُنوبي وَاغْسَلْ بِقَبُولِها جَميعَ عُيوبي وَاجْعَلْها جالِيَةً لِقَلْبي شاخِصَةً لِبَصيرَةِ لُبِّي غاسِلَةَ لِدَرْني مُطَهِّرَةَ لِنَجاسَةِ بَدَني مُصَحِّحَةً فيها ضَميري عاجِلَةً إِلى الوَفاءِ بِها بَصيرتي وَاقْبَلْ يارَبِّ تَوْبَتي فَإنَّها تَصْدُرُ مِنْ إخْلاصِ نيَّتي وَمَحْضٍ مِنْ تَصْحيحِ بَصيرَتي وَاحْتِفالاً في طَويَّتي وَإجْتِهاداً في نَقاءِ سَريرَتي وَتَثْبيتا لانابَتي وَمُسارَعَةً إِلى أَمْرِكَ بِطاعَتي وَأجْلُ اللّهُمَّ بِالتَّوْبَةَ عَنّي ظُلْمَةَ الاصْرارِ وَامْحُ بِها ما قَدَّمْتُهُ مِنَ الاَوْزارِ وَإكْسُني لِباسَ التَّقْوى وَجَلابِيبَ الهُدى فَقَدْ خَلَعْتُ رِبْقَ المَعاصي عَنْ جَلَدي وَنَزَعْتَ سِرْبالَ الذُّنوبِ عَنْ جَسَدي مُسْتَمْسِكاً رَبِّ مِنْهُ بِقُدْرَتِكَ مُسْتَعينا عَلى نَفْسي بِعِزَّتِكَ مُسْتَوْدِعا تَوْبَتي مِنَ النَّكْثِ بِخَفْرَتِكَ مُعْتَصِما مِنَ الخُذْلانِ بِعِصْمَتِكَ مُقارِنا بِهِ لا حَوْلَ وَلا قُوَّةَ إِلاّ بِكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlmonajatBitalabAl7aj.screenRoute,
          pushBack: AlmonajatBilisti3aza.screenRoute,
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
