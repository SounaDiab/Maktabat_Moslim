import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ala7raz_walad3iya_almoujaza.dart';
import 'fi_ba3d_ala7raz_walad3iya_almoujaza.dart';
import 'fi_ba3d_ma_yata3alak_belmawt.dart';

class Dou3a2AlsajadFiZikrAltawba extends StatefulWidget {
  static String screenRoute = 'dou3a2_alsajad_fi_zikr_altawba_screen';
  const Dou3a2AlsajadFiZikrAltawba({super.key});

  @override
  State<Dou3a2AlsajadFiZikrAltawba> createState() =>
      _Dou3a2AlsajadFiZikrAltawbaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2AlsajadFiZikrAltawbaState
    extends State<Dou3a2AlsajadFiZikrAltawba> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_dou3a2_alsajad_fi_zikr_altawba_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_dou3a2_alsajad_fi_zikr_altawba_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(
          Ala7razWalad3iyaAlmoujaza.screenRoute);
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
                          'دعاء السجاد (عليه السلام) وكان من دعائه (عليه السلام) في ذكر التوبة وطلبها',
                          Dou3a2AlsajadFiZikrAltawba.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء السجاد (عليه السلام) وكان من دعائه (عليه السلام) في ذكر التوبة وطلبها',
                          Dou3a2AlsajadFiZikrAltawba.screenRoute,
                          Dou3a2AlsajadFiZikrAltawba.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء السجاد (عليه السلام) وكان من دعائه (عليه السلام) في ذكر التوبة وطلبها',
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
                      'اللّهُمَّ يامَنْ لايَصِفُهُ نَعْتُ الواصِفِينَ وَيامَنْ لا يُجاوِزْهُ رَجاءُ الرَّاجِينَ وَيامَنْ لايَضِيعُ لَدَيْهِ أجْرُ الُمحْسِنِينَ وَيامَنْ هُوَ مُنْتَهى خَوْفِ العابِدِينَ وَيامَنْ هُوَ غايَةُ خَشْيَةِ المُتَّقِينَ، هذا مَقامُ مَنْ تَداولتْهُ أيْدِي الذُنُوبِ وَقادَتْهُ أزِمَّةُ الخَطايا وَاسْتَحْوَذَ عَلَيْهِ الشَّيْطانُ فَقَصَّرَ عَمَّا أمَرْتَ بِهِ تَفْرِيطا، وَتَعاطى مانَهَيْتَ عَنْهُ تَغْرِيراً كَالجاهِلِ بِقُدْرَتِكَ عَلَيْهِ أوْ كَالمُنْكِرِ فَضْلَ إحْسانِكَ إلَيْهِ حَتّى إذا انْفَتَحَ لَهُ بَصَرُ الهُدى وَتَقْشَّعَتْ عَنْهُ سَحائِبُ العَمى، أحْصى ماظَلَمَ بِهِ نَفْسَهُ وَفَكَّرَ فِيما خالَفَ بِهِ رَبَّهُ فَرَأى كَبِيرَ عِصْيانِهِ كَبِيراً وَجَلِيلَ مُخالَفَتِهِ جَلِيلاً، فَأقْبَلَ نَحْوَكَ مُؤَمِّلاً لَكَ مُسْتَحْيا مِنْكَ وَوَجَّهَ رَغْبَتَهُ إلَيْكَ ثِقَةً بِكَ فَأمَّكَ بِطَمَعِهِ يَقِينا وَقَصَدَكَ بِخَوْفِهِ إخْلاصاً. قَدْ خَلا طَمَعُهُ مِنْ كُلِّ مَطْمُوعٍ فِيهِ غَيْرُكَ وَأفْرَخَ رَوْعُهُ مِنْ كُلِّ مَحْذُورٍ مِنْهُ سِواكَ، فَمَثَلَ بَيْنَ يَدَيْكَ مُتَضَرِّعاً وَغَمَّضَ بَصَرَهُ إِلى الارْضِ مُتَخَشِّعاً وَطَأطَأ رَأسَهُ لِعِزَّتِكَ مُتَذَلِّلاً وَأبَثَّكَ مِنْ سِرِّهِ ماأنْتَ أعْلَمُ بِهِ مِنْهُ خُضُوعا وَعَدَّدَ مِنْ ذُنُوبِهِ ما أنْتَ أحْصى لَها خُشُوعاً، وَاسْتَغاثَ بِكَ مِنْ عَظِيمِ ماوَقَعَ بِهِ فِي عِلْمِكَ وَقَبِيحِ مافَضَحَهُ فِي حُكْمِكَ مِنْ ذُنُوبٍ أدْبَرَتْ لَذَّاتُها فَذَهَبَتْ وَأقامَتْ تَبِعاتها فَلَزِمَتْ، لايُنْكِرُ ياإلهِي عَدْلَكَ إنْ عاقَبْتَهُ وَلايَسْتَعْظِمُ عَفْوَكَ إنْ عَفَوْتَ عَنْهُ وَرَحِمْتَهُ ؛ لانَّكَ الرَبُّ الكَرِيمُ الَّذِي لايَتَعاظَمُهُ غُفْرانُ الذَّنْبِ العَظِيمِ اللّهُمَّ فَها أنا ذا قَدْ جِئْتُكَ مُطِيعاً لامْرِكَ فِيما أمَرْتَ بِهِ مِنَ الدُّعاءِ مُتَنَجَّزاً وَعْدَكَ فِيما وَعَدْتَ بِهِ مِنَ الاجابَةِ، إذْ تَقُولُ ادْعُونِي أسْتَجِبْ لَكُمْ اللّهُمَّ فَصَلِّ عَلى مُحَمَّدٍ وَآلِهِ وَالْقَنِي بِمَغْفِرَتِكَ كَما لَقَيْتُكَ بِإقْرارِي وَارْفَعْنِي عَنْ مَصارِعِ الذُّنُوبِ كَما وَضَعْتُ لَكَ نَفْسِي وَاسْتُرْنِي بِسِتْرِكَ كَما تَأَنَّيْتَنِي عَنْ الانْتِقامِ مِنِّي، اللّهُمَّ وَثَبِّتْ فِي طاعَتِكَ نِيَّتِي وَأَحْكِمْ فِي عِبادَتِكَ بَصِيرَتِي وَوَفِّقْنِي مِنَ الاعْمالِ لِما تَغْسِلُ بِهِ دَنَسَ الخَطايا عَنِّي وَتَوَفَّنِي عَلى مِلَّتِكَ وَمِلَّةِ نَبِيِّكَ مُحَمَّدٍ عَلَيْهِ السَّلامُ إذا تَوَفَّيْتَنِي، اللّهُمَّ إنِّي أتُوبُ إلَيْكَ فِي مَقامِي هذا مِنْ كَبائِرِ ذُنُوبِي وَصَغائِرها وَبَواطِنِ سَيِّئاتِي وَظَواهِرِها وَسَوَالِفِ زَلاّ تِي وَحَوادِثِها تَوبَةَ مَنْ لايُحَدِّثْ نَفْسَهُ بِمَعْصِيَةٍ وَلايُضْمِرُ أنْ يَعُودَ فِي خَطِيئَةٍ، وَقَدْ قُلْتَ ياإلهِي فِي مُحْكَمِ كِتابِكَ إِنَّكَ تَقْبَلْ التَّوْبَةَ عَنْ عِبادِكَ وَتَعْفُو عَنْ السَّيِّئاتِ وَتُحِبُّ التَّوابِينَ، فَاقْبَلْ تَوْبَتِي كَما وَعَدْتَ وَاعْفُ عَنْ سَيِّئاتِي كَما ضَمِنْتَ وَأوْجِبْ لِي مَحَبَّتَكَ كَما شَرَطْتَ وَلَكَ يارَبِّ شَرْطِي إِلاّ أعُودَ فِي مَكْرُوهِكَ وَضَمانِي إِلاّ أرْجِعَ فِي مَذْمُومِكَ وَعَهْدِي أنْ أهْجُرَ جَمِيعَ مَعاصِيكَ، اللّهُمَّ إنَّكَ أعْلَمُ بِما عَمِلْتُ فَاغْفِرْ لِي ماعَلِمْتَ وَاصْرِفْنِي بِقُدْرَتِكَ إِلى ما أحْبَبْتَ، اللّهُمَّ وَعَلَيَّ تَبِعاتٌ قَدْ نَسِيتُهُنَّ وَكُلُّهُنَّ بِعَيْنِكَ الَّتي لاتَنامُ وَعِلْمِكَ الَّذي لايَنْسى، فَعَوِّضْ مِنْها أهْلَها وَاحْطُطْ عَنِّي وِزْرَها وَخَفِّفْ عَنِّي ثِقْلَها وَاعْصِمْنِي مِنْ أنْ أُقارِفَ مِثْلَها، اللّهُمَّ وَإنَّهُ لاوَفاءَ لِي بِالتَّوْبَةِ إِلاّ بِعِصْمَتِكَ وَلا اسْتِمْساكَ بِي عَنِ الخَطايا إِلاّ عَنْ قُوَّتِكَ فَقَوِّنِي بِقُوَّةٍ كافِيَةٍ وَتَوَلَّنِي بِعِصْمَةٍ مانِعَةٍ، اللّهُمَّ أيُّما عَبْدٍ تابَ إلَيْكَ وَهُوَ فِي عِلْمِ الغَيْبِ عِنْدَكَ فاسِخٌ لِتَوْبَتِهِ وَعائِدٌ فِي ذَنْبِهِ وَخَطِيئَتِهِ فَإنِّي أعُوذُ بِكَ أنْ أكُونَ كَذلِكَ، فَاجْعَلْ تَوْبَتِي هذِهِ تَوْبَةً لا أحْتاجُ بَعْدَها إِلى تَوْبَةٍ تَوْبَةً مُوجِبَةً لَِمحْوِ ماسَلَفَ وَالسَّلامَةَ فِيما بَقِيَ، اللّهُمَّ إنِّي أعْتَذِرُ إلَيْكَ مِنْ جَهْلِي وَأسْتَوْهِبُكَ سُوءَ فِعْلِي، فَاضْمُمْنِي إِلى كَنَفِ رَحْمَتِكَ تَطَوُّلاً وَاسْتُرْنِي بِسِتْر عافِيَتِكَ تَفَضُّلاً، اللّهُمَّ وَإنِّي أتُوبُ إلَيْكَ مِنْ كُلِّ ماخالَفَ إرادَتَكَ اوْ زالَ عَنْ مَحَبَّتَكَ مِنْ خطَراتِ قَلْبِي وَلَحَظاتِ عَيْنِي وَحِكاياتِ لِسانِي تَوْبَةً تَسْلَمُ بِها كُلُّ جارِحَةٍ عَلَى حِيالِها مِنْ تَبِعاتِكَ وَتَأْمَنُ مِمّا يَخافُ المُعْتَدُوَنَ مِنْ ألِيمِ سَطَواتِكَ، اللّهُمَّ فارْحَمْ وَحْدَتِي بَيْنَ يَدَيْكَ وَوَجِيبَ قَلْبِي مِنْ خَشْيَتِكَ وَاضْطِرابَ أرْكانِي مِنْ هَيْبَتِكَ فَقَدْ أقامَتْنِي يارَبِّ ذُنُوبي‌مَقامَ الخِزْي بِفِنائِكَ فَإنْ سَكَتُّ لَمْ يَنْطِقْ عَنِّي أحَدٌ وَإنْ شَفَعْتَ فَلَسْتُ بِأهْلِ الشَّفاعَةِ، اللّهُمَّ صَلِّ عَلى مُحَمَّدٍ وَآلِهِ وَشَفِّعْ فِي خَطايايَ كَرَمَكَ وَعُدْ عَلى سَيِّئاتِي بِعَفْوِكَ وَلاتُجْزِنِي جَزائِي مِنْ عُقُوبَتِكَ وَابْسُطْ عَلَيَّ طَوْلَكَ وَجَلِّلْنِي بِسِتْرِكَ وَافْعَلْ بِي فِعْلَ عَزِيزٍ تَضَرَّعَ إلَيْهِ عَبْدٌ ذَلِيلٌ فَرَحِمَهُ أوْ غَنِيٍّ تَعَرَّضَ لَهُ عَبْدٌ فَقِيرٌ فَنَعَّشَهُ، اللّهُمَّ لاخَفِيرَ لِي مِنْكَ فَلْيَخْفُرْنِي عِزُّكَ وَلا شَفِيعَ لِي إلَيْكَ فَلْيَشْفَعْ لِي فَضْلُكَ وَقَدْ أوْجَلَتْنِي خَطايايَ فَلْيُؤْمِنِّي عَفْوُكَ فَما كُلُّ ما نَطَقْتُ بِهِ عَنْ جَهْلٍ مِنِّي بِسُوءِ أثَرِي وَلانِسْيانٍ لِما سَبَقَ مِنْ ذَمِيمِ فِعْلِي، لكِنْ لِتَسْمَعَ سَماؤُكَ وَمَنْ فِيها وَأرْضُكَ وَمَنْ عَلَيْها ماأظْهَرْتُ لَكَ مِنَ النَّدَمِ وَلَجَأْتُ إلَيْكَ فِيهِ مِنَ التَّوْبَةِ فَلَعَلَّ بَعْضَهُمْ بِرَحْمَتِكَ يَرْحَمُنِي لِسُوءِ مَوْقِفِي أوْ تُدْرِكُهُ الرِّقَّةُ عَلَيَّ لِسُوءِ حالِي فَيَتالَنِي مِنْهُ بِدَعْوَةٍ هِيَ أسْمَعُ لَدَيْكَ مِنْ دُعائِي أوْ شَفاعَةٍ أوْكَدُ عِنْدَكَ مِنْ شَفاعَتِي تَكُونُ بِها نَجاتِي مِنْ غَضَبِكَ وَفَوْزِي بِرِضاكَ، اللّهُمَّ إنْ يَكُنْ النَّدَمُ تَوْبَةً إلَيْكَ فَأنا أنْدَمُ النَّادِمِينَ، وَإنْ يَكُنْ التَّرْكُ لِمَعْصِيَتِكَ إنابَةً فَأنا أوَّلُ المُنِيبينَ، وَإنْ يَكُنْ الاسْتِغْفارُ حِطَّةً للذُّنُوبِ فَإنِّي لَكَ مِنَ المُسْتَغْفِرينَ، اللّهُمَّ فَكَما أمَرْتَ بِالتَّوْبَةِ وَضَمِنْتَ القَبُولَ وَحَثَثْتَ عَلى الدُّعاءِ وَوَعَدْتَ الاجابَةَ، فَصَلِّ عَلى حَمَّدٍ وآلِ مُحَمَّدٍ وَاقْبَلْ تَوْبَتِي وَلا تَرْجِعْنِي مَرْجِعَ الخَيْبَةِ مِنْ رَحْمَتِكَ إنَّكَ أنْتَ التَوّابُ عَلى المُذْنِبِينَ وَالرَّحِيمُ لِلْخاطِئِينَ المُنِيبِينَ. اللّهُمَّ صَلِّ عَلى مُحَمَّدٍ وَآلِهِ كَما هَدَيْتَنا بِهِ، وَصَلِّ عَلى مُحَمَّدٍ وَآلِهِ كَما اسْتَنْقَذْتَنا بِهِ وَصَلِّ عَلى مُحَمَّدٍ وَآلِهِ صَلاةً تَشْفَعُ لَنا يَوْمَ القِيامَةِ وَيَوْمَ الفاقَةِ إلَيْكَ إنَّكَ عَلى كُلِّ شَيٍ قَدِيرٌ وَهُوَ عَلَيْكَ يَسِيرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiBa3dAla7razWalad3iyaAlmoujaza.screenRoute,
          pushBack: FiBa3dMaYata3alakBelmawt.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الدعاء السجاد في ذكر التوبة وطلبها.mp3',
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
