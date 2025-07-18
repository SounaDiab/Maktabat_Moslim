import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ala7raz_walad3iya_almoujaza.dart';
import 'almonajat_belisti5araa.dart';
import 'almonajat_belsafaar.dart';

class AlmonajatBelistikala extends StatefulWidget {
  static String screenRoute = 'almonajat_belistikala_screen';
  const AlmonajatBelistikala({super.key});

  @override
  State<AlmonajatBelistikala> createState() =>
      _AlmonajatBelistikalaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlmonajatBelistikalaState
    extends State<AlmonajatBelistikala> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_almonajat_belistikala_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_almonajat_belistikala_screen', value);
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
                          'المناجاة بالاستقالة',
                          AlmonajatBelistikala.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'المناجاة بالاستقالة',
                          AlmonajatBelistikala.screenRoute,
                          AlmonajatBelistikala.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'المناجاة بالاستقالة',
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
                      'اللّهُمَّ إنَّ الرَّجاءَ لِسَعَةِ رَحْمَتِكَ أَنْطَقَني بِاسْتِقالَتِكَ وَالاَمَلَ لاناتِكَ وَرِفْقِكَ شَجَّعَني عَلى طَلَبِ أَمانِكَ وَعَفْوِكَ، وَليَ يارّبِّ ذُنُوبٌ قَدْ وَاجَهَتْها أَوْجُهُ الانْتِقامِ وَخَطايا قَدْ لاحَظَتْها أَعْيُنُ الاصْطِلامِ وَاسْتَوْجَبَتُ بِها عَلى عَدْلِكَ أَليمَ العَذابِ وَاسْتَحْقَقْتُ بِاجْتِراحِها مُبيرَ العِقابِ وَخِفْتُ تَعْويقَها لاجابَتي وَرَدَّها إيّايَ عَنْ قَضاء حاجَتي بِإبْطالِها لِطَلِبَتي وَقَطْعَها لاَسْبابِ رَغْبَتي مِنْ أَجْلِ ما قَدْ أَنْقَضَ ظَهْري مِنْ ثُقْلِها وَبَهَظَني مِنَ الاسْتِقْلالِ بِحَمْلِها، ثُمَّ تَراجَعْتُ رَبِّ إِلى حِلْمِكَ عَنْ الخاطِئينَ وَعَفْوِكَ عَنْ المُذْنِبينَ وَرَحْمَتِكَ لِلْعاصينَ فَأَقْبَلْتُ بِثِقَتي مُتَوَكِّلاً عَلَيْكَ طارِحا نَفْسي بَيْنَ يَدَيْكَ شاكِيا بَثِّي إلَيْكَ سائِلاً مالا أَسْتَوْجِبُهُ مِنْ تَفْريجِ الهَمِّ وَلا أَسْتَحِقُهُ مِنْ تَنْفيسِ الغَمِّ مُسْتَقيلاً لَكَ إيايَ وَاثِقا مَوْلايَ بِكَ، اللّهُمَّ فَامْنُنْ عَلَيَّ بِالفَرَجِ وَتَطَوَّلْ بِسِهولَةِ الَمخْرَجِ وَادْلُلْني بِرأفَتِكَ عَلى سَمْتِ المَنْهَجِ وَأزْلِقْني بِقُدْرَتِكَ عَنْ الطَريقِ الاعْوَجِ وَخَلِّصْني مِنْ سِجْنِ الكَرْبِ بِإقالَتِكَ وَأَطْلِقْ أسْري بِرَحْمَتِكَ وَ طُلْ عَلَيَّ بِرِضْوانِكَ وَجُدْ عَلَيَّ بِإحْسانِكَ وَأقِلْني عَثْرَتي وَفَرِّجْ كُرْبَتي وَارْحَمْ عَبْرَتي وَلا تَحْجُبْ دَعْوَتي وَاشْدُدْ بِإلاقالَةِ أَزْري وَقَوِّ بِها ظَهْري وَأَصْلِحْ بِها أَمْري وَأَطِلْ بِها عُمْري وارْحَمْني يَوْمَ حَشْري وَوَقْتَ نَشْري، إنَّكَ جَوادٌ كَريمٌ غَفُورٌ رَحيمٌ وَصَلِّ عَلى مُحَمَّدٍ وَآلِهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlmonajatBelsafaar.screenRoute,
          pushBack: AlmonajatBelisti5araa.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/المناجاة بالاستقالة.mp3',
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
