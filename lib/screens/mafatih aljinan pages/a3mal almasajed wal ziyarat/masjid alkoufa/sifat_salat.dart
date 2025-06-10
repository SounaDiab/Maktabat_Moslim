import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'a3mal_bab_alfaraj.dart';
import 'sifat_salat_lil7aja.dart';

class SifatSalat extends StatefulWidget {
  static String screenRoute = 'sifat_salat_screen';
  const SifatSalat({super.key});

  @override
  State<SifatSalat> createState() => _SifatSalatState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SifatSalatState extends State<SifatSalat> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_sifat_salat_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_sifat_salat_screen', value);
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
          .pushReplacementNamed(FadlLakoufaWmasjidoha.screenRoute);
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
                      .addFavorite('صفة صلاة أخرى في هذا المقام',
                          SifatSalat.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('صفة صلاة أخرى في هذا المقام',
                          SifatSalat.screenRoute, SifatSalat.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صفة صلاة أخرى في هذا المقام',
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
                  title: 'وهي ركعتان فاذا فرغت منها وسبّحت فقل :',
                  subtitle:
                      'اَللّـهُمَّ اِنّي حَلَلْتُ بِساحَتِكَ لِعِلْمي بِوَحْدانِيَّتِكَ وَصَمَدانِيَّتِكَ، وَاَنَّهُ لا قادِرً عَلى قَضاءِ حاجَتي غَيْرُكَ، وَقَدْ عَلِمْتُ يا رَبِّ اَنَّهُ كُلَّما شاهَدْتُ نِعْمَتَكَ عَلَيَّ اشْتَدَّتْ فاقَتي اِلَيْكَ، وَقَدْ طَرَقَني يا رَبِّ مِنْ مُهِمِّ اَمْري ما قَدْ عَرَفْتَهُ، لاَِنَّكَ عالِمٌ غَيْرُ مُعَلَّم وَاَسْاَلُكَ بِالاِْسْمِ الَّذي وَضَعْتَهُ عَلَى السَّماواتِ فَانْشَقَّتْ، وَعَلَى الاَْرْضَينَ فَانْبَسَطَتْ، وَعَلَى النُّجُومِ فَانْتَشَرَتْ، وَعَلَى الْجِبالِ فَاسْتَقَرَّتْ، وَاَسْاَلُكَ بِالاِْسْمِ الَّذي جَعَلْتَهُ عِنْدَ مُحَمَّدّ وَعِنْدَ عَلِيٍّ وَعِنْدَ الْحَسَنِ وَعِنْدَ الْحُسَيْنِ وَعِنْدَ الاَْئِمَّةَ كُلِّهِمْ صَلَواتُ اللهِ عَلَيْهِمْ اَجْمَعينَ، اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاَنْ تَقْضِيَ لي يا رَبِّ حاجَتي، وَتُيَسِّرَ عَسيرَها، وَتَكْفِيَني مُهِمَّها، وَتَفْتَحَ لي قُفْلَها، فَاِنْ فَعَلْتَ ذلِكَ فَلَكَ الْحَمْدُ، وَاِنْ لَمْ تَفْعَلْ فَلَكَ الْحَمْدُ غَيْرَ جائِر في حُكْمِكَ وَلا حائِف في عَدْلِكَ.\n\n'
                      'ثمّ تبسط خدّك الايمن على الارضِ وتقول : اَللّـهُمَّ اِنَّ يُونُسَ بْنَ مَتّى عَبْدَكَ وَنَبِيَّكَ دَعاكَ في بَطْنِ الْحُوتِ فَاسْتَجَبْتَ لَهُ، وَاَنَا اَدْعُوكَ فَاسْتَجِبْ لي بِحَقِّ مُحَمَّد وَآلِ مُحَمَّد، وتدعو بما تحبّ ثمّ تقلّب خدّك الايسر وتقول : اَللّـهُمَّ اِنَّكَ اَمَرْتَ بِالدُّعاءِ وَتَكَفَّلْتَ بِالاِْجابَةِ، وَاَنَا اَدْعُوكَ كَما اَمَرْتَني فَصَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاسْتَجِبْ لي كَما وَعَدْتَني يا كَريمُ ثمّ تعود الى السجود وتقول : يا مُعِزَّ كُلِّ ذَليل، وَيا مُذِلَّ كُلِّ عَزيز، تَعْلَمُ كُرْبَتي فَصَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَفَرِّجْ عَنّي يا كَريمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SifatSalatLil7aja.screenRoute,
          pushBack: A3malBabAlfaraj.screenRoute,
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
