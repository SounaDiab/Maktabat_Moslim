import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al3ama.dart';
import 'a3mal_ashar_ramdan.dart';
import 'dou3a2_aljawshan_alkabir.dart';

class Dou3a2Altawba extends StatefulWidget {
  static String screenRoute = 'dou3a2_altawba_screen';
  const Dou3a2Altawba({super.key});

  @override
  State<Dou3a2Altawba> createState() => _Dou3a2AltawbaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2AltawbaState extends State<Dou3a2Altawba> {
  bool isIcon = true;
  String music = '';
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou3a2_altawba_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3a2_altawba_screen', value);
  }

    Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Al2a3malAl3ama.screenRoute);
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
                      .addFavorite('دعاء التوبة', Dou3a2Altawba.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء التوبة', Dou3a2Altawba.screenRoute,
                          Dou3a2Altawba.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء التوبة',
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
              Center(
                child: Text(
                  'بسم الله الرحمن الرحيم',
                  style: TextStyle(
                    fontSize: isTablet ? _fontSizeTablet + 10 : _fontSize,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'اللَّهُمَّ يا مَنْ لا يَصِفُهُ نَعْتُ الْواصِفِينَ، وَيا مَنْ لا يُجاوِزُهُ رَجاءُ الرَّاجِينَ، وَيا مَنْ لا يَضِيعُ لَدَيْهِ أَجْرُ الْمُحْسِنِينَ، وَيا مَنْ هُوَ مُنْتَهَى خَوْفِ الْعابِدِينَ، وَيا مَنْ هُوَ غايَةُ خَشْيَةِ الْمُتَّقِينَ، هَذا مَقامُ مَنْ تَداوَلَتْهُ أَيْدِي الذُّنُوبِ وَقادَتْهُ أَزِمَّةُ الْخَطايا، وَاسْتَحْوَذَ عَلَيْهِ الشَّيْطانُ، فَقَصَّرَ عَمَّا أَمَرْتَ بِهِ تَفْرِيطاً، وَتَعاطَى ما نَهَيْتَ عَنْهُ تَعْزِيزاً، كَالْجاهِلِ بِقُدْرَتِكَ عَلَيْهِ، أَوْ كَالْمُنْكِرِ فَضْلَ إِحْسانِكَ إِلَيْهِ، حَتَّى إِذا انْفَتَحَ لَهُ بَصَرُ الْهُدَى، وَتَقَشَّعَتْ عَنْهُ سَحائِبُ الْعَمَى، أَحْصَى ما ظَلَمَ بِهِ نَفْسَهُ، وَفَكَّرَ فِيما خالَفَ بِهِ رَبَّهُ، فَرَأَى كَبِيرَ عِصْيانِهِ كَبِيراً، وَجَلِيلَ مُخالَفَتِهِ جَلِيلاً، فَأَقْبَلَ نَحْوَكَ مُؤَمِلاً لَكَ، مُسْتَحْيياً مِنْكَ، وَوَجَّهَ رَغْبَتَهُ إِلَيْكَ ثِقَةً بِكَ، فَأَمَّكَ بِطَمَعِهِ يَقِيناً، وَقَصَدَكَ بِخَوْفِهِ إِخْلاصاً، قَدْ خَلا طَمَعُهُ مِنْ كُلِّ مَطْمُوعٍ فِيهِ غَيْرِكَ، وَأَفْرَجَ رَوْعُهُ مِنْ كُلِّ مَحْذُورٍ مِنْهُ سِواكَ، فَمَثَلَ بَيْنَ يَدَيْكَ مُتَضَرِّعاً، وَغَمَّضَ بَصَرَهُ إِلَى الْأَرْضِ مُتَخَشِّعاً، وَطَأْطَأَ رَأْسَهُ لِعِزَّتِكَ مُتَذَلِّلاً، وَأَبَثَّكَ مِنْ سِرِّهِ ما أَنْتَ أَعْلَمُ بِهِ مِنْهُ خُضُوعاً، وَعَدَّدَ مِنْ ذُنُوبِهِ ما أَنْتَ أَحْصَى لَها خُشُوعاً، وَاسْتَغاثَ بِكَ مِنْ عَظِيمِ ما وَقَعَ بِهِ فِي عِلْمِكَ، وَقَبِيحِ ما فَضَحَهُ فِي حُكْمِكَ، مِنْ ذُنُوبٍ أَدْبَرَتْ لَذَّاتُها فَذَهَبَتْ وَأَقامَتْ تَبِعاتِها فَلَزِمَتْ، لا يُنْكِرُ يا إِلهِي عَدْلَكَ إِنْ عاقَبْتَهُ، وَلا يَسْتَعْظِمُ عَفْوَكَ إِنْ عَفَوْتَ عَنْهُ وَرَحِمْتَهُ، لأَنَّكَ الرَّبُّ الْكَرِيمُ الَّذِي لا يَتَعاظَمُهُ غُفْرانُ الذَّنْبِ الْعَظِيمِ؛ اللَّهُمَّ فَها أَنَا ذا قَدْ جِئْتُكَ مُطِيعاً لأَمْرِكَ فِيما أَمَرْتَ بِهِ مِنَ الدُّعاءِ، مُتَنَجِّزاً وَعْدَكَ فِيما وَعَدْتَ بِهِ مِنَ الْإِجابَةِ، إِذْ تَقُولُ ادْعُونِي أَسْتَجِبْ لَكُمْ، اللَّهُمَّ فَصَلِّ عَلَى مُحَمَّدٍ وَالْقَنِي بِمَغْفِرَتِكَ كَما لَقَيْتُكَ بِإِقْرارِي، وَارْفَعْنِي عَنْ مَصارِعِ الذُّنُوبِ كَما وَضَعْتُ لَكَ نَفْسِي، وَاسْتُرْنِي بِسِتْرِكَ كَما تَأَنَّيْتَنِي عَنِ الْانْتِقامِ مِنِّي، اللَّهُمَّ وَثَبِّتْ فِي طاعَتِكَ نِيَّتِي وَأَحْكِمْ فِي عِبادَتِكَ بَصِيرَتِي، وَوَفِّقْنِي مِنَ الْأَعْمالِ لِما تَغْسِلُ بِهِ دَنَسَ الْخَطايا عَنِّي، وَتَوَفَّنِي عَلَى مِلَّتِكَ وَمِلَّةِ نَبِيِّكَ مُحَمَّدٍ عَلَيْهِ السَّلامُ إِذا تَوَفَّيْتَنِي، اللَّهُمَّ إِنِّي أَتُوبُ إِلَيْكَ فِي مَقامِي هَذَا مِنْ كَبائِرِ ذُنُوبِي وَصَغائِرِها، وَبَواطِنِ سَيِّئاتِي وَظَواهِرِها، وَسَوالِفِ زَلاَّتِي وَحَوادِثِها، تَوْبَةَ مَنْ لا يُحَدِّثُ نَفْسَهُ بِمَعْصِيَةٍ، وَلا يُضْمِرُ أَنْ يَعُودَ فِي خَطِيئَةٍ، وَقَدْ قُلْتَ يا إِلهِي فِي مُحْكَمِ كِتابِكَ إِنَّكَ تَقْبَلُ التَّوْبَةَ عَنْ عِبادِكَ، وَتَعْفُو عَنِ السَّيّئاتِ، وَتُحِبُّ التَّوَّابِينَ فَاقْبَلْ تَوْبَتِي كَما وَعَدْتَ، وَاعْفُ عَنْ سَيِّئاتِي كَما ضَمِنْتَ وَأَوْجِبْ لِي مَحَبَّتَكَ كَما شَرَطْتَ، وَلَكَ يا رَبِّ شَرْطِي أَلاَّ أَعُودَ فِي مَكْرُوهِكَ، وَضَمانِي أَلاَّ أَرْجِعَ فِي مَذْمُومِكَ، وَعَهْدِي أَنْ أَهْجُرَ جَمِيعَ مَعاصِيكَ، اللَّهُمَّ إِنَّكَ أَعْلَمُ بِما عَمِلْتُ، فَاغْفِرْ لِي مَا عَلِمْتَ وَاصْرِفْنِي بِقُدْرَتِكَ إِلَى ما أَحْبَبْتَ، اللَّهُمَّ وَعَلَيَّ تَبِعاتٌ قَدْ حَفِظْتُهُنَّ وَتَبِعاتٌ قَدْ نَسِيْتُهُنَّ، وَكُلُّهُنَّ بِعَيْنِكَ الَّتِي لا تَنامُ، وَعِلْمِكَ الَّذِي لا يَنْسَى، فَعَوِّضْ مِنْها أَهْلَها وَاحْطُطْ عَنِّي وِزْرَها، وَخَفِّفْ عَنِّي ثِقْلَها، وَاعْصُمْنِي مِنْ أَنْ أُقارِفَ مِثْلَها، اللَّهُمَّ وَإِنَّهُ لا وَفاءَ لِي بِالتَّوْبَةِ إِلاَّ بِعِصْمَتِكَ، وَلا اسْتِمْساكَ بِي عَنِ الْخَطايا إِلاَّ عَنْ قُوَّتِكَ، فَقَوِّنِي بِقُوَّةٍ كافِيَةٍ، وَتَوَلَّنِي بِعِصْمَةٍ'
                      'مانِعَةٍ، اللَّهُمَّ أَيُّما عَبْدٍ تابَ إِلَيْكَ وَهُوَ فِي عِلْمِ الْغَيْبِ عِنْدَكَ فَاسِخٌ لِتَوْبَتِهِ وَعائِدٌ فِي ذَنْبِهِ وَخَطِيئَتِهِ، فَإِنِّي أَعُوذُ بِكَ أَنْ أَكُونَ كَذلِكَ، فَاجْعَلْ تَوْبَتِي هَذِهِ لا أَحْتاجُ بَعْدَها إِلَى تَوْبَةٍ، تَوْبَةً مُوْجِبَةً لِمَحْوِ ما سَلَفَ وَالسَّلامَةِ فِيما بَقِيَ، اللَّهُمَّ إِنِّي أَعْتَذِرُ إِلَيْكَ مِنْ جَهْلِي وَأَسْتَوْهِبُكَ سُوءَ فِعْلِي فَاضْمُمْنِي إِلَى كَنَفِ رَحْمَتِكَ تَطَوُّلاً، وَاسْتُرْنِي بِسِتْرِ عافِيَتِكَ تَفَضُّلاً، اللَّهُمَّ وَإِنِّي أَتُوبُ إِلَيْكَ مِنْ كُلِّ ما خالَفَ إِرادَتَكَ أَوْ زالَ عَنْ مَحَبَّتِكَ مِنْ خَطَراتِ قَلْبِي وَلَحَظاتِ عَيْنِي وَحِكاياتِ لِسانِي، تَوْبَةً تَسْلَمُ بِها كُلُّ جارِحَةٍ عَلَى حِيالِها مِنْ تَبِعاتِكَ وَتَأْمَنُ مِمَّا يَخافُ الْمُعْتَدُونَ مِنْ أَلِيمِ سَطَواتِكَ، اللَّهُمَّ فَارْحَمْ وَحْدَتِي بَيْنَ يَدَيْكَ وَوَجِيبَ قَلْبِي مِنْ خَشْيَتِكَ، وَاضْطِرابَ أَرْكانِي مِنْ هَيْبَتِكَ، فَقَدْ أَقامَتْنِي يا رَبِّ ذُنُوبِي مَقامَ الْخِزْيِ بِفِنائِكَ فَإِنْ سَكَتُّ لَمْ يَنْطِقْ عَنِّي أَحَدٌ وَإِنْ شَفَعْتُ فَلَسْتُ بِأَهْلِ الشَّفاعَةِ، اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَا لِهِ وَشَفِّعْ فِي خَطايايَ كَرَمَكَ، وَعُدْ عَلَى سَيِّئاتِي بِعَفْوِكَ، وَلا تُجْزِني جَزائِي مِنْ عُقُوبَتِكَ وَابْسُطْ عَلَيَّ طَوْلَكَ، وَجَلِّلْنِي بِسِتْرِكَ'
                      'وَافْعَلْ بِي فِعْلَ عَزِيزٍ تَضَرَّعَ إِلَيْهِ عَبْدٌ ذَلِيلٌ فَرَحِمَهُ، أَوْ غَنِيٌّ تَعَرَّضَ لَهُ عَبْدٌ فَقِيرٌ فَنَعَشَهُ، اللَّهُمَّ لا خَفِيرَ لِي مِنْكَ فَلْيَخْفُرْنِي عِزُّكَ وَلا شَفِيعَ لِي إِلَيْكَ فَلْيَشْفَعْ لِي فَضْلُكَ، وَقَدْ أَوْجَلَتْنِي خَطايايَ فَلْيُؤْمِنِّي عَفْوُكَ، فَما كُلُّ ما نَطَقْتُ بِهِ عَنْ جَهْلٍ مِنِّي بِسُوءِ أَثَرِي وَلا نِسْيانٍ لِما سَبَقَ مِنْ ذَمِيمِ فِعْلِي لكِنْ لِتَسْمَعَ سَماؤُكَ وَمَنْ فِيها وَأَرْضُكَ وَمَنْ عَلَيْها، ما أَظْهَرْتُ لَكَ مِنَ النَّدَمِ'
                      'وَلَجَأْتُ إِلَيْكَ فِيهِ مِنَ التَّوْبَةِ، فَلَعَلَّ بَعْصَهُمْ بِرَحْمَتِكَ يَرْحَمُني لِسُوءِ مَوْقِفِي أَوْ تُدْرِكُهُ الرِّقَّةُ عَلَيَّ لِسُوءِ حالِي فَيَنالَنِي مِنْهُ بِدَعْوَةٍ، هِيَ أَسْمَعُ لَدَيْكَ مِنْ دُعائِي، أَوْ شَفاعَةٍ أَوكَدُ عِنْدَكَ مِنْ شَفاعَتِي تَكُونُ بِها نَجاتِي مِنْ غَضَبِكَ وَفَوْزِي بِرِضاكَ، اللَّهُمَّ إِنْ يَكُنْ النَّدَمُ تَوْبَةً إِلَيْكَ فَأَنَا أَنْدَمُ النَّادِمِينَ، وَإِنْ يَكُنِ التَّرْكُ لِمَعْصِيَتِكَ إِنابَةً فَأَنَا أَوَّلَ الْمُنِبِينَ، وَإِنْ يَكُنِ الْاسْتِغْفارُ حِطَّةً'
                      'لِلذُّنُوبِ فَإِنِّي لَكَ مِنَ الْمُسْتَغْفِرِينَ، اللَّهُمَّ فَكَما أَمَرْتَ بِالتَّوْبَةِ وَضَمِنْتَ الْقَبُولَ، وَحَثَثْتَ عَلَى الدُّعاءِ وَوَعَدْتَ الْإِجابَةَ فَصَلِّ عَلَى مُحَمَّدٍ وَالِ مُحَمَّدٍ، وَاقْبَلْ تَوْبَتِي وَلا تَرْجِعْنِي مَرْجِعَ الْخَيْبَةِ'
                      'مِنْ رَحْمَتِكَ، إِنَّكَ أَنْتَ التَّوَّابُ عَلَى الْمُذْنِبِينَ، وَالرَّحِيمُ لِلْخاطِئِينَ الْمُنِيِبينَ، اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَالِهِ كَما هَدَيْتَنا بِهِ، وَصَلِّ عَلَى مُحَمَّدٍ وَالِهِ كَما اسْتَنْقَذْتَنا بِهِ وَصَلِّ عَلَى مُحَمَّدٍ وَالِهِ صَلاةً تَشْفَعُ لَنا يَوْمَ الْقِيامَةِ وَيَوْمَ الْفاقَةِ إِلَيْكَ إِنَّكَ عَلى كُلِّ شَيْءٍ قَدِيرٌ وَهُوَ عَلَيْكَ يَسِيرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: A3malAsharRamdan.screenRoute,
          pushBack: Dou3a2AljawshanAlkabir.screenRoute,
          soud: music,
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
