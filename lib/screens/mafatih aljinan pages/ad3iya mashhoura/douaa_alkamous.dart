import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iya_mashhoura.dart';
import 'douaa_alhazin.dart';
import 'douaa_alihtijab.dart';

class DouaaAlkamous extends StatefulWidget {
  static String screenRoute = 'douaa_alkamous_screen';
  const DouaaAlkamous({super.key});

  @override
  State<DouaaAlkamous> createState() => _DouaaAlkamousState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _DouaaAlkamousState extends State<DouaaAlkamous> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_alkamous_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_alkamous_screen', value);
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
                      .addFavorite('دعاء السيفي الصغير المعروف بدعاء القاموس',
                          DouaaAlkamous.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء السيفي الصغير المعروف بدعاء القاموس',
                          DouaaAlkamous.screenRoute,
                          DouaaAlkamous.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء السيفي الصغير المعروف بدعاء القاموس',
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
                      'ذَكَره الشّيخ الاجلّ ثقة الاسلام النّوري عطّر الله مرقده في الصّحيفة الثّانية العلويّة، وقال: انّ لهذا الدّعاء في كلمات أرباب الطّلسمات والتسخيرات شرح غريب وقد ذكروا له آثاراً عجيبة، وَلَم أروِ ما ذكرُوه لعدم اعتمادي عليه ولكن اُورد أصل الدّعاء تسامحاً في أدلّة السّنن وتاسّياً، بالعلمآء الاعلام ، وهو هذا الدّعاء:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'رَبِّ أَدْخِلْنِي فِي لُجَّةِ بَحْرِ أَحَدِيَّتِكَ، وَطَمْطامِ يَمِّ وَحْدانِيَّتِكَ، وَقَوِّنِي بِقُوَّةِ سَطْوَةِ سُلْطانِ فَرْدانِيَّتِكَ، حَتَّى أَخْرُجَ إِلى فَضاءِ سَعَةِ رَحْمَتِكَ، وَفِي وَجْهِي لَمَعاتُ بَرْقِ القُرْبِ مِنْ آثارِ حِمايَتِكَ، مَهِيباً بِهَيْبَتِكَ عَزِيزاً بِعِنايَتِكَ، مُتَجَلِّلاً مُكَرَّماً بِتَعْلِيمِكَ وَتَزْكِيَـتِكَ، وَأَلْبِسْنِي خِلَعَ العِزَّةِ وَالقَبُولِ، وَسَهِّلْ لِي مَناهِجَ الوُصْلَةِ وَالوُصُولِ، وَتَوِّجْنِي بِتاجِ الكَرامَةِ وَالوَقارِ وَأَلِّفْ بَيْنِي وَبَيْنَ أحِبَّائِكَ فِي دارِ الدُّنْيا وَدارِ القَرارِ وَارْزُقْنِي مِنْ نُورِ اسْمِكَ هَيْبَةً وَسَطْوَةً تَنْقادُ لِيَ القُلُوبُ وَالأَرْواحُ وَتَخْضَعُ لَدَيَّ النُّفُوسُ وَالأشْباحُ، يا مَنْ ذَلَّتْ لَهُ رِقابُ الجَبابِرَةِ وَخَضَعَتْ لَدَيْهِ أَعْناقُ الأكاسِرَةِ، لا مَلْجَأَ وَلا مَنْجىً مِنْكَ إِلَّا إِلَيْكَ وَلا إعانَةَ إِلَّا بِكَ وَلا اتِّكاءَ إِلَّا عَلَيْكَ، اِدْفَعْ عَنِّي كَيْدَ الحاسِدِينَ وَظُلُماتِ شَرِّ المُعانِدينَ وَارْحَمْنِي تَحْتَ سُرادِقاتِ عَرْشِكَ يا أكْرَمَ الأكْرَمِينَ.\n'
                      'أَيِّدْ ظاهِري فِي تَحْصِيلِ مَراضِيكَ وَنَوِّرْ قَلْبِي وَسِرِّي بِالاطِّلاعِ عَلى مَناهِجِ مَساعِيكَ، إِلهِي كَيْفَ أَصْدُرُ عَنْ بابِكَ بِخَيْبَةٍ مِنْكَ وَقَدْ وَرَدْتُهُ عَلى ثِقَةٍ بِكَ؟ وَكَيْفَ تُؤْيِسُنِي مِنْ عَطائِكَ وَقَدْ أَمَرْتَني بِدُعائِكَ؟ وَها أَنا مُقْبِلٌ عَلَيْكَ مُلْتَجِئٌ إِلَيْكَ، باعِدْ بَيْنِي وَبَيْنَ أعْدائِي كَما باعَدْتَ بَيْنَ أعْدائِي، اِخْتَطِفْ أَبْصارَهُمْ عَنِّي بِنُورِ قُدْسِكَ وَجَلالِ مَجْدِكَ إنَّكَ أَنْتَ اللهُ المُعْطِي جَلائِلَ النِّعَمِ المُكَرَّمَةِ لِمَنْ ناجاكَ بِلَطائِفِ رَحْمَتِكَ، يا حَيُّ يا قَيُّومُ يا ذا الجَلالِ وَالإِكْرامِ، وَصَلَّى الله عَلى سَيِّدِنا وَنَبِيِّنا مُحَمَّدٍ وآلِهِ أجْمَعينَ الطَّيِّبِينَ الطَّاهِرِينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: DouaaAlihtijab.screenRoute,
        pushBack: DouaaAlhazin.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء القاموس.mp3',
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
