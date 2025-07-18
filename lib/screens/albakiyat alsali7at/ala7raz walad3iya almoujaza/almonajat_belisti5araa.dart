import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ala7raz_walad3iya_almoujaza.dart';
import 'almonajat_belistikala.dart';
import 'fi_ba3d_ala7raz_walad3iya_almoujaza.dart';

class AlmonajatBelisti5araa extends StatefulWidget {
  static String screenRoute = 'almonajat_belisti5araa_screen';
  const AlmonajatBelisti5araa({super.key});

  @override
  State<AlmonajatBelisti5araa> createState() =>
      _AlmonajatBelisti5araaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlmonajatBelisti5araaState
    extends State<AlmonajatBelisti5araa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_almonajat_belisti5araa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_almonajat_belisti5araa_screen', value);
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
                          'المناجاة بالاستخارة',
                          AlmonajatBelisti5araa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'المناجاة بالاستخارة',
                          AlmonajatBelisti5araa.screenRoute,
                          AlmonajatBelisti5araa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'المناجاة بالاستخارة',
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
                      'اللّهُمَّ إنَّ خِيرَتَكَ فيما اسْتَخَرْتُكَ فيه تُنيلُ الرَّغائِبِ وَتُجْزِلُ المَواهِبِ وَتُغْنِمُ المَطالِبِ وَتُطيبُ المَكاسِبِ وَتَهْدي إِلى أجْمَلِ المَذاهِبِ، تَسُوقُ إِلى أحْمَدِ العَواقِبِ وَتَقي مَخُوفَ النَّوائِبِ، اللّهُمَّ إِنِّي أَسْتَخيرُكَ فيما عَزَمَ رَأيي عَلَيْهِ وَقادَني عَقْلي إلَيْهِ، وَسَهِّلْ اللّهُمَّ فيهِ ماتَوَعَّرَ وَيَسِّرْ مِنْهُ ماتَعَسَّرَ وَإكْفِني فيهِ المُهِمَّ وَادْفَعْ بِهِ عَنّي كُلَّ مُلِمٍّ، وَإجْعَلْ يارَبِّ عَواقِبَهُ غُنْماً وَمَخُوفَهُ سِلْماً وَبُعْدَهُ قُرْباً وجَدْبَهُ خَصْباً، وَأرْسِلْ اللّهُمَّ إجابَتي وَأنْجِحْ طَلِبَتي وَاقْضِ حاجَتي وَاقْطَعْ عَنّي عَوائِقِها وَامْنَعْ عَنّي بَوائِقِها وَاعْطِني اللّهُمَّ لِواءَ الظَّفَرِ وَالخِيرَةَ فيما اسْتَخَرْتُكَ وُفُورِ المَغْنَمِ فيما دَعَوْتُكَ وَعَوائِدَ الافْضالِ فيما رَجَوْتُكَ، وَاقْرِنْهُ اللّهُمَّ بِالنَّجاحِ وَخُصَّهُ بِالصَّلاحِ وَأَرِني أَسْبابَ الخِيْرَةِ فيه واضحة وَأعْلامَ غَيِّها لائِحَةً وَاشْدُدْ خِناقَ تَعْسيرِها وَانْعَشْ صَريعَ تَيْسيرِها وَبَيِّنْ اللّهُمَّ مُلْتَبَسَها وَأَطْلِقْ مُحْتَبَسَها وَمَكِّنْ أُسَّها حَتّى تَكونَ خِيَرَةً مُقْبِلَةً بِالغُنْمِ مُزيلَةً لِلْغُرْمِ عاجِلَةً لِلْنّفْعِ باقيَةَ الصُّنْعِ إنَّك مَليٌ بِالمَزيدِ مُبْتَديٌ بِالجُودِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlmonajatBelistikala.screenRoute,
          pushBack: FiBa3dAla7razWalad3iyaAlmoujaza.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/المناجاة بالاستخارة.mp3',
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
