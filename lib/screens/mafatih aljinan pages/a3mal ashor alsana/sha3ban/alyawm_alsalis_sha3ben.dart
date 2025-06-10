import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../sha3ban.dart';
import 'allayla_alsalisa_3ashara_sha3ban.dart';
import 'alyawm_al2awal_sha3ban.dart';

class AlyawmAlsalisSha3ben extends StatefulWidget {
  static String screenRoute = 'alyawm_alsalis_sha3ben_screen';
  const AlyawmAlsalisSha3ben({super.key});

  @override
  State<AlyawmAlsalisSha3ben> createState() => _AlyawmAlsalisSha3benState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlyawmAlsalisSha3benState extends State<AlyawmAlsalisSha3ben> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alyawm_alsalis_sha3ben_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alyawm_alsalis_sha3ben_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Sha3ban.screenRoute);
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
                          'اليوم الثالث', AlyawmAlsalisSha3ben.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'اليوم الثالث',
                          AlyawmAlsalisSha3ben.screenRoute,
                          AlyawmAlsalisSha3ben.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اليوم الثالث',
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
                      'هو يوم مبارك ، قال الشّيخ في المصباح : في هذا اليوم ولد الحسين بن علي (عليه السلام)وخرج الى أبي القاسم بن علاء الهمداني وكيل الامام العسكري انّ مولانا الحسين (عليه السلام) ولد يوم الخميس لثلاث خلون من شعبان فصُمه وادع فيه بهذا الدّعاء :\n\n'
                      'اَللّـهُمَّ اِنّي اَساَلُكَ بِحَقِّ الْمَوْلُودِ في هذَا الْيَوْمِ، الْمَوْعُودِ بِشَهادَتِهِ قَبْلَ اْستِهْلالِهِ وَوِلادَتِهِ. بَكَتْهُ السَّماءُوَمَنْ فيها، وَالاَْرْضُ وَمَنْ عَلَيْها، وَلَمّا يَطَأْ لابَتَيْها قَتيل الْعَبْرَةِ، وَسَيِّدِ الاُْسْرَةِ، الْمَمْدُودِ بِالنُّصْرَةِ يَوْمَ الْكَرَّةِ، الْمُعَوَّضِ مِنْ قَتْلِهِ اَنَّ الاَْئِمَّةَ مِنْ نَسْلِهِ، وَالشِّفاءَ في تُرْبَتِهِ، والْفَوْزَ مَعَهُ في اَوْبَتِهِ، والاَْصِياءِ مِنْ عِتْرَتِهِ بَعْدَ قائِمِهِمْ وَغَيْبَتِهِ حَتّى يُدْرِكُوا الاَْوْتارَ، وَيَثْأَرُوا الثّارَ، وَيُرْضُوا الْجَبّارَ، وَيَكُونُوا خَيْرَ اَنْصار، صَلَّى اللهُ عَلَيْهِمْ مَعَ اْختِلافِ اللَّيلِ وَالنَّهارِ، اَللّـهُمَّ فَبِحَقِّهِمْ اِلَيْكَ اَتَوَسَّلُ وَاَسْأَلُ سُؤالَ مُقْتَرف مُعْتَرف مُسيئ اِلى نَفْسِهِ، مِمَّا فَرَّطَ في يَوْمِهِ وَاَمْسِهِ يَسْأَلُكَ الْعِصْمَةَ اِلى مَحَلِّ رَمْسِهِ، اَللّـهُمَّ فَصَلِّ عَلى مُحَمَّد وَعِتْرَتِهِ، وَاحْشُرْنا في زُمْرَتِهِ، وَبَوِّئْنا مَعَهُ دارَ الْكَرامَةِ، وَمَحَلَّ الاِقامَةِ، اَللّـهُمَّ وَكَما اَكْرَمْتَنا بِمَعْرِفَتِهِ فَاَكْرِمْنا بِزُلْفَتِهِ، وَارْزُقْنا مُرافَقَتَهُ وَسابِقَتَهُ، وَاجْعَلْنا مِمَّنْ يُسَلِّمُ لاَْمْرِهِ وَيُكْثِرُ الصَّلاةَ عَلَيْهِ عِنْدَ ذِكْرِهِ، وَعَلى جَميعِ اَوْصِيائِهِ وَاَهْلِ اَصْفِيائِهِ الْمَمْدُوديِنَ مِنْكَ بِالْعَدَدِ، الاَْثْنَىْ عَشَرَ، النّجُومِ الزُّهرِ، وَالْحُجَجِ عَلى جَميعِ الْبَشَرِ، اَللّـهُمَّ وَهَبْ لَنا في هذَا الْيَوْمِ خَيْرَ مَوْهِبَة، وَاَنْجِحْ لَنا فيهِ كُلَّ طَلِبَته كَما وَهَبْتَ الْحُسَيْنِ لُِمحَمَّد جَدِّهِ وَعاذَ فُطْرُسُ بِمَهْدِهِ، فَنَحْنُ عائِذُونَ بِقَبْرِهِ مِنْ بَعْدِهِ، نَشْهَدُ تُرْبَتَهُ، وَننْظُر اَوْبَتَهُ، آمينَ رَبَّ الْعالَمينَ.\n\n'
                      'ثمّ تدعو بعد ذلك بدعاء الحسين (عليه السلام) وهو آخر دعائه (عليه السلام) يوم كثرت عليه أعداؤه وهو يوم عاشوراء :\n\n'
                      'اَللّـهُمَّ اَنْتَ مُتَعالِي الْمَكانِ، عَظيمُ الْجَبَرُوتِ، شَديدُ الِمحالِ، غَنِيٌّ عنِ الْخَلايِقِ، عَريضُ الْكِبْرِياءِ، قادِرٌ عَلى ما تَشاءُ، قَريبُ الرَّحْمَةِ، صادِقُ الْوَعْدِ، سابِغُ النِّعْمَةِ، حَسَنُ الْبَلاءِ، قَريبٌ إذا دُعيتَ، مُحيطٌ بِما خَلَقْتَ، قابِلُ التُّوبَةِ لَمَنْ تابَ اِلَيْكَ، قادِرٌ عَلى ما اَرَدْتَ، وَمُدْرِكُ ما طَلَبْتَ، وَشَكُورٌ اِذا شُكِرْتَ، وَذَكُورٌ اِذا ذُكِرْتَ، اَدْعُوكَ مُحْتاجاً، وَاَرْغَبُ اِلَيْكَ فَقيراً، وَاَفْزَعُ اِلَيْكَ خائِفاً، واَبْكي اِلَيْكَ مَكْرُوباً، وَاَسْتَعينُ بِكَ ضَعيفاً، وَاَتوَكَّلُ عَلَيْكَ كافِياً، اُحْكُمْ بَيْنَنا وَبَيْنَ قَوْمِنا فَاِنَّهُمْ غَرُّونا وَخَدَعُونا وَغَدَروا بِنا وَقَتَلُونا، ونَحْنُ عِتْرَةُ نَبِيِّكَ، وَوَلَدُ حَبيبِكَ مُحَمَّدِ بْنِ عَبْدِاللهِ، الَّذي اصطَفَيْتَهُ بِالرِّسالَةِ، وَائْتَمَنْتَهُ عَلى وَحْيِكَ، فَاجْعَلْ لَنا مِنْ اَمْرِنا فَرَجاً وَمَخْرجاً بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.\n\n'
                      'قال ابن عيّاش : سمعت الحسين بن علي بن سفيان البزوفري يقول : سمعت الصّادق (عليه السلام) يدعو به في هذا اليوم وقال هو من أدعية اليوم الثّالث من شعبان وهو ميلاد الحسين (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AllaylaAlsalisa3asharaSha3ban.screenRoute,
        pushBack: AlyawmAl2awalSha3ban.screenRoute,
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
