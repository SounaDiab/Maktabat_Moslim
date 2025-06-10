import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iya_mashhoura.dart';
import 'douaa_almashlol.dart';
import 'douaa_almojir.dart';

class DouaaYastashir extends StatefulWidget {
  static String screenRoute = 'douaa_yastashir_screen';
  const DouaaYastashir({super.key});

  @override
  State<DouaaYastashir> createState() => _DouaaYastashirState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _DouaaYastashirState extends State<DouaaYastashir> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_yastashir_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_yastashir_screen', value);
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
          .pushReplacementNamed(Ad3iyaMashhoura.screenRoute);
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
                Navigator.of(context).pushReplacementNamed(
                    Ad3iyaMashhoura.screenRoute);
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
                          'دعاء المعروف بيستشير', DouaaYastashir.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء المعروف بيستشير',
                          DouaaYastashir.screenRoute,
                          DouaaYastashir.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء المعروف بيستشير',
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
                      'روَى السّيّدْ ابن طاوُس في كِتاب مهج الدّعوات عَنْ أمير المؤمنين (عليه السلام) أنه قال: عَلَّمني رَسوُلُ الله (صلى الله عليه وآله وسلم) هذا الدّعاء وَاَمَرني اَنْ اَدعُوَ به لِكلّ شِدّة وَرَخآء، وَاَنْ اعلّمه خليفتي مِنْ بَعْدي، وَاَمَرَني اَنْ لا اُفاِرق طوُل عُمري حَتّى القى الله عزوَجَلّ ، وَقالَ لي : قُل هذَا الدّعاء حين تُصبحِ وتُمسى فانّه مِنْ كنوز العَرش، فالتمس ابيّ بن كعب النّبيّ (صلى الله عليه وآله وسلم) أن يحدّث بفضل هذا الدّعاء، فاَخَبر النّبيّ (صلى الله عليه وآله وسلم) بِبَعْضِ ثَوابِهِ الجزيل، وَمَنْ اَراد الاطِّلاع عَلَيه فَليطلبه مِنْ كتاب مهج الدَّعوات.',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'الحَمدُ للهِ الَّذي لا إلهَ إلاّ هُوَ المَلِكُ الحَقُّ المُبينُ، المُدَبِّرُ بِلا وَزيرٍ، وَلا خَلقٍ مِن عِبادِهِ يَستَشيرُ، الأوَّلُ غَيرُ مَوصوفٍ ، وَالباقي بَعدَ فَناءِ الخَلقِ، العَظيمُ الرُّبوبيَّةِ، نورُ السَّماواتُ وَالأرَضينَ وَفاطِرُهُما وَمُبتَدِعُهُما، بِغَيرِ عَمَدٍ خَلَقَهُما وَفَتَقَهُما فَتقاً، فَقامَتِ السَّماواتِ طائِعاتٍ بِأمرِهِ، وَاستَقَرَّتِ الأرَضونَ بِأوتادِها فَوقَ الماءِ، ثمّ عَلا رَبُّنا في السَّماواتِ العُلى، الرَّحمنُ عَلى العَرشِ استَوى، لَهُ ما في السَّماواتِ وَما في الأرضِ، وَما بَينَهُما وَما تَحتَ الثَّرى، فَأنا أشهَدُ بِأنَّكَ أنتَ الله لا رافِعَ لِما وَضَعتَ وَلا واضِعَ لِما رَفَعتَ، وَلا مُعِزَّ لِمَن أذلَلتَ، وَلا مُذِلَّ لِمَن أعزَزتَ، وَلا مانِعَ لِما أعطَيتَ، وَلا مُعطيَ لِما مَنَعتَ، وَأنتَ الله لا إلهَ إلاّ أنتَ كُنتَ إذ لَم تَكُن سماءٌ مَبنيَّةٌ، وَلا أرضٌ مَدحيَّةٌ، وَلا شَمسٌ مُضيئَةٌ، وَلا لَيلٌ مُظلِمٌ، وَلا نَهارٌ مُضيءٌ، وَلا بَحرٌ لُجّيُّ، وَلا جَبَلٌ راسٍ، وَلا نَجمٌ سارٍ، وَلا قَمَرٌ مُنيرٌ، وَلا ريحٌ تَهُبُّ، وَلا سَحابٌ يَسكُبُ، وَلا بَرقٌ يَلمَعُ، وَلا رَعدٌ يُسَبِّحُ، وَلا روحٌ تَنَفَّسُ، وَلا طائِرٌ يَطيرُ، وَلا نارٌ تَتَوَقَّدُ، وَلا ماءٌ يَطَّرِدُ، كُنتَ قَبلَ كُلِّ شيءٍ، وَكَوَّنتَ كُلَّ شيءٍ، وَقَدَرتَ عَلى كُلِّ شيءٍ، وَابتَدَعتَ كُلَّ شيءٍ وَأغنَيتَ وَأفقَرتَ، وَأمَتَّ وَأحيَيتَ وَأضحَكتَ وَأبكَيتَ وَعَلى العَرشِ استَوَيتَ فَتَبارَكتَ يا اللهُ وَتَعالَيتَ، أنتَ اللهُ الَّذي لا إلهَ إلاّ أنتَ الخَلّاقُ المُعينُ ، أمرُكَ غالِبٌ وَعِلمُكَ نافِذٌ، وَكَيدُكَ غَريبٌ وَوَعدُكَ صادِقٌ وَقَولُكَ حَقُّ وَحُكمُكَ عَدلٌ، وَكَلامُكَ هُدىً، وَوَحيُكَ نورٌ، وَرَحمَتُكَ وَاسِعَةٌ وَعَفوُكَ عَظيمٌ وَفَضلُكَ كَثيرٌ وَعَطاؤُكَ جَزيلٌ، وَحَبلُكَ مَتينٌ وإمكانُكَ عَتيدٌ وَجارُكَ عَزيزٌ وَبَأسُكَ شَديدٌ وَمَكرُكَ مَكيدٌ، أنتَ يا رَبِّ مَوضِعُ كُلِّ شَكوى حاضِرُ كُلِّ مَلأ وَشاهِدُ كُلِّ نَجوى، مُنتَهى كُلِّ حاجَةٍ، مُفَرِّجُ كُلِّ حُزنٍ ، غِنى كُلِّ مِسكينٍ، حِصنُ كُلِّ هارِبٍ أمانُ كُلِّ خائِفٍ، حِرزُ الضُّعَفاءِ، كَنزُ الفُقَراءِ، مُفَرِّجُ الغَمَّاءِ ، مُعينُ الصَّالِحينَ، ذلِكَ الله رَبُّنا لا إلهَ إلاّ هوَ، تَكفي مِن عِبادِكَ مَن تَوَكَّلَ عَلَيكَ، وأنتَ جارُ مَن لاذَ بِكَ وَتَضَرَّعَ إلَيكَ، عِصمَةُ مَنِ اعتَصَمَ بِكَ، ناصِرُ مَنِ انتَصَرَ بِكَ، تَغفِرُ الذُّنوبَ لِمَنِ استَغفَرَكَ، جَبّارُ الجَبابِرَةِ، عَظيمُ العُظَماءِ، كَبيرُ الكُبَراءِ، سَيِّدُ السَّاداتِ، مَولى المَوالي، صَريخُ المُستَصرِخينَ، مُنَفِّسٌ عَنِ المَكروبينَ، مُجيبُ دَعوَةِ المُضطَرّينَ، أسمَعُ السَّامِعينَ، أبصَرُ النَّاظِرينَ، أحكَمُ الحاكِمينَ، أسرَعُ الحاسِبينَ، أرحَمُ الرَّاحِمينَ، خَيرُ الغافِرينَ، قاضي حوائِجِ المُؤمِنينَ، مُغيثُ الصَّالِحينَ، أنتَ الله لا إلهَ إلاّ أنتَ رَبُّ العالَمينَ، أنتَ الخالِقُ وَأنا المَخلوقُ، وَأنتَ المالِكُ وَأنا المَملوكُ، وَأنتَ الرَّبُّ وَأنا العَبدُ، وَأنتَ الرَّازِقُ وَأنا المَرزوقُ، وَأنتَ المُعطي وَأنا السَّائِلُ، وَأنتَ الجَوادُ وَأنا البَخيلُ، وَأنتَ القَويُّ وَأنا الضَّعيفُ، وَأنتَ العَزيزُ وَأنا الذَّليلُ وَأنتَ الغَنيُّ وَأنا الفَقيرُ، وَأنتَ السَّيِّدُ وَأنا العَبدُ، وَأنتَ الغافِرُ وَأنا المُسيءُ، وأنتَ العالِمُ وَأنا الجاهِلُ، وَأنتَ الحَليمُ وَأنا العَجولُ، وَأنتَ الرَّحمنُ وَأنا المَرحومُ، وَأنتَ المُعافي وَأنا المُبتَلى، وَأنتَ المُجيبُ وَأنا المُضطَرُّ، وَأنا أشهَدُ بِأنَّكَ أنتَ الله لا إلهَ إلاّ أنتَ، المُعطي عِبادَكَ بِلا سُؤالٍ، وَأشهَدُ بِأنَّكَ أنتَ الله الواحِدُ الأحَدُ المُتَفَرِّدُ الصَّمّدُ الفَردُ وَإلَيكَ المَصيرُ، وَصََلّى اللهُ عَلى مُحَمَّدٍ وَأهلِ بَيتِهِ الطَّيِّبينَ الطَّاهِرينَ، وَاغفِر لي ذُنوبي، وَاستُر عَلَيَّ عُيوبي، وَافتَح لي مِن لَدُنكَ رَحمَةً وَرِزقاً وَاسِعاً يا أرحَمَ الرَّاحِمينَ، وَالحَمدُ للهِ رَبِّ العالَمينَ، وَحَسبُنا الله وَنِعمَ الوَكيلُ، وَلا حَولَ وَلا قوَّةَ إلاّ بِالله العَليِّ العَظيمِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: DouaaAlmojir.screenRoute,
        pushBack: DouaaAlmashlol.screenRoute,
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
