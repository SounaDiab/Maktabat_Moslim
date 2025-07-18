import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ala7raz_walad3iya_almoujaza.dart';
import 'almonajat_bitalab_alrizk.dart';
import 'almonajat_bitalab_altawba.dart';

class AlmonajatBilisti3aza extends StatefulWidget {
  static String screenRoute = 'almonajat_bilisti3aza_screen';
  const AlmonajatBilisti3aza({super.key});

  @override
  State<AlmonajatBilisti3aza> createState() =>
      _AlmonajatBilisti3azaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlmonajatBilisti3azaState
    extends State<AlmonajatBilisti3aza> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_almonajat_bilisti3aza_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_almonajat_bilisti3aza_screen', value);
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
                          'المناجاة بالاستعاذة',
                          AlmonajatBilisti3aza.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'المناجاة بالاستعاذة',
                          AlmonajatBilisti3aza.screenRoute,
                          AlmonajatBilisti3aza.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'المناجاة بالاستعاذة',
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
                      'اللّهُمَّ إِنِّي أعُوذُ بِكَ مِنْ مُلِمّاتِ نَوازِلِ البَلاءِ وَأَهْوَالِ عَظائِمِ الضَّراءِ فَأَعِذْني رَبِّ مِنْ صَرْعَةِ البَأساءِ وَاحْجُبْني مِنْ سَطَواتِ البَلاءِ وَنَجِّني مِنْ مُفاجآتِ النِقَمِ وَأَجِرْني مِنْ زَوالِ النِّعَمِ وَمِنْ زَلَلِ القَدَمِ وَاجْعَلْني اللّهُمَّ في حِياطَةَ عِزِّكَ وَحِفاظِ حِرْزِكَ مِنْ مُباغَتَةِ الدَّوائِرِ وَمُعالَجَةِ البَوادِرِ، اللّهُمَّ رَبِّ وَأَرْضَ البَلاِ فَأَخْسِفْها وَعَرَصَةَ الِمحَنِ فَأَرْجِفْها وَشَمْسَ النَوائِبِ فَأَكْسِفْها وَجِبالَ السَّوءِ فَانْسِفْها وَكُرَبَ الدَّهْرِ فَاكْشِفْها وَعَوائِقَ الامورِ فَاصْرِفْها، وَأَوْرِدْني حِياضَ السَّلامَةِ وَاحْمِلْني عَلى مَطايا الكَرامَةِ وَاصْحَبْني بِإقالَةِ العَثْرَةِ وَإشْمَلْني بَسَتْرِ العَوْرَةِ، وَجُدْ عَلَيَّ يارَبِّ بِآلائِكَ وَكَشْفِ بَلائِكَ ورَفْعِ ضَرَّائِكَ وَادْفَعْ عَنّي كَلاكِلَ عَذابِكَ وَاصْرِفْ عَنّي أَليمَ عِقابِكَ وَأَعِذْني مِنْ بَوائِقِ الدُّهُورِ وَأَنْقِذْني مِنْ سُوءِ عَواقِبِ الامُورِ وَاحْرُسْني مِنْ جَميعِ الَمحْذُورِ، وَاصْدَعْ صَفاةَ البَلاءِ عَنْ أمْري وَاشْلُلْ يَدَهُ عَنّي مَدى عُمْري إنَّكَ الرَّبُّ الَمجيدُ المُبْتَديُ المُعيدُ الفَعّالُ لِما تُريدُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlmonajatBitalabAltawba.screenRoute,
          pushBack: AlmonajatBitalabAlrizk.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/المناجاة بالاستعاذة.mp3',
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
