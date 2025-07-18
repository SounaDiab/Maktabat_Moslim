import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al3ama.dart';
import 'dou3a2_ya_3odati.dart';
import 'dou3a2_ya_mafza3i.dart';

class Dou3a2Idris extends StatefulWidget {
  static String screenRoute = 'dou32_idris_screen';
  const Dou3a2Idris({super.key});

  @override
  State<Dou3a2Idris> createState() => _Dou3a2IdrisState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2IdrisState extends State<Dou3a2Idris> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou32_idris_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou32_idris_screen', value);
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
                      .addFavorite(
                          'دعاء ادريس عليه السلام', Dou3a2Idris.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء ادريس عليه السلام',
                          Dou3a2Idris.screenRoute, Dou3a2Idris.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء ادريس عليه السلام',
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
                      '(1) سُبحانَكَ لا إلهَ إلّا أنْتَ يا رَبَّ كُلِّ شَيءٍ وَوَارِثَهُ (2) يا إلَه الآلِهَةِ الرَّفيعَ جَلالُهُ (3) يا اللهُ المَحمُودُ في كُلِّ فِعالِهِ (4) يا رَحمنَ كُلِّ شَيءٍ وَراحِمَهُ (5) يا حَيُّ حِينَ لا حَيَّ في دَيْمُومَةِ مُلْكِهِ وَبقائِهِ (6) يا قَيُّومُ فَلا يَفُوتُ (شَيئاً عِلْمُهُ) شَيءٌ مِنْ عِلمِهِ وَلا يَؤُدُهُ (7) يا واحِدُ الباقي أوَّلَ كُلّ شَيءٍ وآخِرَهُ (8) يا دائِمُ بِغَيْر فَنَاءٍ وَلا زَوالٍ لِمُلْكِهِ (9) يا صَمَدُ في غَيرِ شَبِيهٍ وَلا شَيءَ كَمِثْلِهِ (10) يا بارُّ، فَلا شَيْءَ كُفْؤُهُ، وَلا مُدانِيَ لِوَصْفِهِ (11) يا كَبيرُ، أنتَ الّذي لا تَهْتَدي القُلُوبُ لِعَظَمَتِهِ (12) يا بارىءُ المُنْشِىءُ بِلَا مِثالٍ خلا مِن غَيرِهِ (133) يا زاكي الطّاهِرُ مِنْ كُلّ آفَةٍ بِقُدْسِهِ (14) يا كافي المُوسِعُ لِما خَلَقَ مِنْ عَطايا فَضْلِهِ (15) يا نَقِيُّ مِنْ كُلّ جَوْرٍ لَم يَرْضَهُ وَلمْ يُخالِطْهُ فِعالُهُ (16) يا حنَّانُ، أنْتَ الّذي وَسِعَتْ كُلَّ شيءٍ رَحْمَتُهُ (17) يَا مَنّانُ ذا الإحْسانِ، قَد عَمَّ الخَلائِقَ مَنُّهُ (18) يا دَيّانَ العِبادِ، فَكُلٌّ يَقُومُ خاضِعاً لِـرَهْبَتِهِ (19) يا خالِقَ مَنْ في السَّمَاواتِ وَالأرَضِينَ، فَكُلٌّ إليه مَعَادُهُ (20) يا رَحْمنُ وَراحِمَ كُلِّ صَريخٍ وَمَكْرُوبٍ، وَغِياثَهُ وَمَعَاذَهُ (21) يا بارُّ، فلا تَصِفُ الألْسُنُ كُنْهَ جَلالِ مُلْكِهِ وَعِزِّهِ (22) يا مُبْدِىءَ البدايا (البَرَايَا يَا مَنْ)، لَم يَبْغِ في إِنشَائِهَا أعواناً مِن خَلْقِهِ (23) يا عَلّامَ الغُيُوبِ، فَلا يَؤُودُهُ مِن شيءٍ حِفْظُهُ (24) يا مُعيداً ما أفْنَاهُ إذا بَرَزَ الخَلَائِقُ لِدَعْوَتِهِ مِنْ مخَافَتِهِ (25) يا حَليْمُ ذَا الأَناةِ، فَلا شَيءَ يَعْدِلُهُ مِن خَلقِهِ (26) يا مَحمُودَ الفِعالِ ذا المَنِّ على جَميعِ خَلقِهِ بِلُطفِهِ (27) يا عَزيزُ المَنِيعُ الغالِبُ على أمْرِهِ، فَلا شَيءَ يَعْدِلُهُ (28) يا قاهِرُ ذا البَطشِ الشَّدِيدِ، أنْتَ الّذِي لا يُطاقُ انْتِقامُهُ (29) يا مُتعالي القَرِيبُ في عُلُوِّ ارتِفاعِ دُنُوِّهِ (30) يا جَبَّارُ المُذَلِّلُ كُلَّ شَيءٍ بِقَهْرِ عَزيزِ سُلطانِهِ (31) يا نُورَ كُلِّ شَيءٍ، أنتَ الّذي فَلَقَ الظُّلُماتِ نُورُهُ (32) يا قُدُّوسُ الطاهِرُ مِن كُلّ سُوءٍ وَلا شَيءَ يَعْدِلُهُ (33) يا قَريْبُ المُجيبُ المُتداني دُونَ كُلِّ شَيءٍ قُربُهُ (34) يا عالي الشّامِخُ في السَّماء فَوقَ كُلّ شَيءٍ عُلُوُّ ارتِفاعِهِ (35) يا بَدِيْعَ البَدائِعِ وَمُعيدَها بَعدَ فَنَائِها بقُدرَتِهِ (36) يا جَليلُ المُتكَبِّرُ عَلى كُلِّ شَيءٍ، فَالعَدْلُ أمرُهُ، والصّدقُ وَعدُهُ وَقَولُهُ (37) يا مَجيدُ، فلا يَبْلُغُ الأوهامُ كُلَّ ثَنائِهِ (شَأْنِهِ) وَمَجدِهِ (38) يا كَريمَ العَفْوِ والعَدْلِ، أنْتَ الّذي مَلأَ كُلَّ شَيءٍ عَدْلُهُ (39) يا عَظيمُ، ذا الثَناءِ الفاخِرِ، والعِزِّ وَالكِبْرِياءِ، فلا يَذِلُّ عِزُّهُ (40) يا عَجِيبُ، فَلا تَنْطِقُ الألْسُنُ بِكُلِ آلائِهِ وَثَنائِهِ. أسألُكَ، يا مُعتَمَدِي، عِندَ كُلّ كُرْبَةٍ، وَغِياثي عِندَ كُلّ شِدَّةٍ، بهذِهِ الأسماءِ، أماناً مِنْ عُقُوباتِ الدُّنيا والآخِرَةِ. وأسألُكَ أنْ تَصْرِفَ عَنّي بِهِنَّ، كُلَّ سُوءٍ وَمَخُوفٍ وَمحذُورٍ، وَتَصْرِفَ عني أبصارَ الظَّلَمَةِ المُريدِينَ بِيَ السُوءَ الّذي نَهَيْتَ عَنهُ، وأنْ تَصْرِفَ قُلُوبَهُمْ مِنْ شَرِّ ما يُضْمِرُونَ، إلى خَيرِ ما لا يَمْلِكُونَ، وَلا يَملِكُهُ غَيرُكَ يا كَريمُ. اللّهُمَّ، لا تَكِلْني إلى نَفسي فأَعْجَزَ عَنها، ولا إلى النّاسِ فَيَرْفِضُوني، وَلا تُخَيِّبْني وَأنا أرْجُوكَ، وَلا تُعَذِّبْني وَأنا أدْعُوكَ. اللّهُمَّ، إنّي أدعُوكَ كَما أمَرْتَني، فَأجِبْني كما وَعَدْتَني. اللّهُمَّ، اجْعَلْ خَيرَ عُمري ما وَلِيَ أجَلِي. اللّهُمَّ، لا تُغَيِّرْ جَسَدي، وَلا تُرْسِلْ حَظّي، وَلا تَسُؤْ صَدِيقِي. أعُوذُ بِكَ مِن سُقْمٍ مُصْرِعٍ، وَفَقْرٍ مُدْقِعٍ، وَمِنَ الذُّلِّ وبِئْسِ الخِلِّ. اللّهُمَّ، سَلِّ قَلْبي عن كُلِّ شَيءٍ لا أتزوَّدُهُ إليْكَ، وَلا أنتفِعُ بِهِ يَومَ ألقاكَ، من حَلالٍ أوْ حرامٍ، ثُمَّ أعْطِنِي قُوّةً عَليْهِ، وَعِزّاً وَقَنَاعَةً وَمَقْتاً لَهُ، ورِضاكَ فيه، يا أرْحمَ الرّاحِمِينَ. اللّهُمَّ، لَكَ الحمدُ عَلى عَطاياكَ الجَزِيلةِ، وَلَكَ الحَمدُ على مِنَنِكَ المُتواتِرَةِ، الّتي بِها دافَعْتَ عَنّي مَكارِهَ الأُمُورِ، وَبِها آتيْتَني مَواهِبَ السُّرُّورِ، مَعَ تَمادِيَّ في الغَفلَةِ، وَما بَقِيَ فِيَّ مِنَ القَسْوَةِ، فَلَم يَمنعْكَ ذلِكَ مِنْ فِعْلي، أنْ عَفَوتَ عَنّي، وَسَتَرْتَ ذلك عَليَّ، وَسَوَّغْتَني ما في يَدَيَّ مِن نِعَمِكَ، وتَابعْتَ عَليَّ مِن إحسانِكَ، وَصَفَحْتَ لي عَنْ قَبِيحِ ما أفْضَيْتُ به إليْكَ، وانْتَهَكْتُهُ مِنْ مَعاصِيْكَ. اللّهُمَّ، إنّي أسألُكَ بِكُلِّ اسْمٍ هُوَ لَكَ، يَحِقُّ عَليكَ فِيهِ إجابَةُ الدُّعَاءِ إذا دُعِيتَ بِه، وَأسألُكَ بِكُلِّ ذي حَقٍّ عَليْكَ، وَبِحَقّكَ عَلى جَميعِ مَن هُوَ دُونَكَ، أنْ تُصَلّيَ على مُحمَّدٍ عَبدِكَ وَرَسُولِكَ وَآلِ مُحمَّدٍ. وَمَنْ أرادَنِي بِسُوءٍ فَخُذْ بِسَمْعِهِ وَبَصَرِهِ، وَمِنْ بَيْنِ يَدَيْهِ وَمِنْ خَلْفِهِ، وَعَنْ يَمينِهِ وَعَن شِمالِهِ، وَامْنَعْهُ مِنّي بِحَوْلِكَ وَقُوَّتِكَ. يا مَنْ لَيسَ مَعَهُ رَبٌّ يُدْعى، ويا مَنْ لَيْسَ فَوْقَهُ خالِقٌ يُخْشَى، ويا مَنْ لَيْسَ دُوْنَهُ إلهٌ يُتّقَى، وَيا مَنْ لَيْسَ لَهُ وَزِيرٌ يُؤْتَى، ويا مَنْ لَيْسَ لَهُ حاجِبٌ يُرْشَى، وَيا مَن لَيْسَ لهُ بَوّابٌ يُنادَى، وَيا مَنْ لا يَزدادُ عَلى كَثْرَةِ العَطاءِ إلّا كَرماً وَجُوداً، وَعَلى تَتابُعِ الذُّنُوبِ إلّا مغفِرةً وعَفواً، صَلّ على مُحمَّدٍ وَآلِهِ، وَافعلْ بي ما أنتَ أهلُهُ، وَلا تَفْعَل بي ما أنا أهلُهُ، فإنّكَ أهلُ التّقْوَى وَأهلُ المَغْفِرَةِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2YaMafza3i.screenRoute,
          pushBack: Dou3a2Ya3odati.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء ادريس عليه السلام.mp3',
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
