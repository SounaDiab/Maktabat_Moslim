import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../adab_alziyarat.dart';
import 'fi_adab_alziyarat.dart';

class FiZikrAl2isted3a2 extends StatefulWidget {
  static String screenRoute = 'fi_zikr_al2isted3a2_screen';
  const FiZikrAl2isted3a2({super.key});

  @override
  State<FiZikrAl2isted3a2> createState() => _FiZikrAl2isted3a2State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiZikrAl2isted3a2State extends State<FiZikrAl2isted3a2> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_fi_zikr_al2isted3a2_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_zikr_al2isted3a2_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(AdabAlziyarat.screenRoute);
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
                          'في ذكر الإستدعاء للدخول في كل من الروضات الشريفة',
                          FiZikrAl2isted3a2.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في ذكر الإستدعاء للدخول في كل من الروضات الشريفة',
                          FiZikrAl2isted3a2.screenRoute,
                          FiZikrAl2isted3a2.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في ذكر الإستدعاء للدخول في كل من الروضات الشريفة',
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
                padding: EdgeInsets.all(20),
                child: Text(
                  'وهُنا نثبت استئذانين :',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle:
                      'اذا أردت دخول مسجد النّبي (صلى الله عليه وآله وسلم) أو أحد المشاهد الشّريفة لاحد الائمة (عليهم السلام) فقل :\n\n'
                      'اَللّـهُمَّ اِنّي وَقَفْتُ عَلى باب مِنْ اَبْوابِ بُيُوتِ نَبِيِّكَ صَلَواتُكَ عَلَيْهِ وَآلِهِ، وَقَدْ مَنَعْتَ النّاسَ اَنْ يَدْخُلُوا إلاّ بِاِذْنِهِ، فَقُلْتَ يا اَيُّها الَّذينَ آمَنُوا لا تَدْخُلُوا بُيُوتَ النَّبيِّ إلاّ اَنْ يُؤْذَنَ لَكُمْ، اَللّـهُمَّ اِنّي اَعْتَقِدُ حُرْمَةَ صاحِبِ هذَا الْمَشْهَدِ الشَّريفِ في غَيْبَتِهِ كَما اَعْتَقِدُها في حَضْرَتِهِ، وَاَعْلَمُ اَنَّ رَسُولَكَ وَخُلَفاءَكَ عَلَيْهِمُ السَّلامُ اَحْياءٌ عِنْدَكَ يُرْزَقُونَ، يَرَوْنَ مَقامي، وَيَسْمَعُوَن كَلامي، وَيَرُدُّونَ سَلامي، وَاَنِّكَ حَجَبْتَ عَنْ سَمْعي كَلامَهُمْ، وَفَتَحْتَ بابَ فَهْمي بِلَذيذِ مُناجاتِهِمْ، وَاِنّي اَسْتَأذِنُكَ يا رَبِّ اوَّلاً وَاَسْتَأذِنُ رَسُولَكَ صَلَّى اللهُ عَلَيْهِ وَآلِهِ ثانِياً، وَاَسْتَأذِنُ خَليفَتَكَ الاِْمامَ الْمَفْرُوضَ عَلَيَّ طاعَتُهُ (فُلانَ بْنَ فُلان) (واذكر اسم الامام الذي تزُوره واسم أبيه ، فقل في زيارة الحسين (عليه السلام) مثلاً : الْحُسَيْنَ بْنَ عَلِيٍّ عَلَيْهِ السَّلامُ وفي زيارة الامام الرّضا (عليه السلام) عَلِيِّ بْنَ مُوسَى الرِّضا عَلَيْهِ السَّلامُ وهكذا ثمّ قل'
                      'وَالْمَلائِكَةَ الْمُوَكَّلينَ بِهذِهِ الْبُقْعَةِ الْمُبارَكَةِ ثالِثاً، أَاَدْخُلُ يا رَسُولَ اللهِ، أَاَدْخُلُ يا حُجَّةَ اللهِ أَاَدْخُلُ يا مَلائِكَةَ اللهِ الْمُقَرَّبينَ الْمُقيمينَ في هذَا الْمَشْهَدِ، فَأذَنْ لي يا مَوْلايَ في الدُّخُولِ اَفْضَلَ ما اَذِنْتَ لاَِحَد مِنْ اَوْلِيائِكَ، فَاِنْ لَمْ اَكُنْ اَهْلاً لِذلِكَ فَاَنْتَ اَهْل  لِذلِكَ.\n\n'
                      'ثمّ قبّل العتبة الشّريفة وادخل وقُلْ : بِسْمِ اللهِ وَبِاللهِ وَفي سَبيلِ اللهِ وَعَلى مِلَّةِ رَسُولِ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ اَللّـهُمَّ اغْفِرْ لي وَارْحَمْني وَتُبْ عَلَيَّ اِنَّكَ اَنْتَ التَّوّابُ الرَّحيمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle:
                      'الاستئذان الّذي رواه المجلسي (قدس سره) عن نسخة قديمة من مؤلّفات الاصحاب للدّخول في السّرداب المقدّس وفي البقاع المنوّرة للائمة (عليهم السلام) وهو هذا، تقول :\n\n'
                      'اَللّـهُمَّ اِنَّ هذِهِ بُقْعَةٌ طَهَّرْتَها، وَعَقْوَةٌ شَرَّفْتَها، وَمَعالِمُ زَكَّيْتَها، حَيْثُ اَظْهَرْتَ فيها اَدِلَّةَ التَّوْحيدِ، وَاَشْباحَ الْعَرْشِ الَْمجيدِ، الَّذينَ اصْطَفَيْتَهُمْ مُلُوكاً لِحِفْظِ النِّظامِ، وَاخْتَرْتَهُمْ رُؤَساءَ لِجَميعِ الاَْنامِ، وَبَعَثْتَهُمْ لِقِيامِ الْقِسْطِ فِي ابْتِدآءِ الْوُجُودِ اِلى يَوْمِ الْقِيامَةِ ثُمَّ مَنَنْتَ عَلَيْهِمْ بِاسْتِنابَةِ اَنْبِيائِكَ لِحِفْظِ شَرايِعِكَ وَاَحْكامِكَ، فَاَكْمَلْتَ بِاسْتِخْلافِهِمْ رِسالَةَ الْمُنْذِرينَ، كَما اَوْجَبْتَ رِياسَتَهُمْ في فِطَرِ الْمُكَلَّفينَ، فَسُبْحانَكَ مِنْ اِلـه ما اَرْاَفَكَ، وَلا اِلـهَ إلاّ اَنْتَ مِنْ مَلِك ما اَعْدَلَكَ، حَيْثُ طابَقَ صُنْعُكَ ما فَطَرْتَ عَلَيْهِ الْعُقُولَ، وَوافَقَ حُكْمُكَ ما قَرَّرْتَهُ فِي الْمَعْقُولِ وَالْمَنْقُولِ، فَلَكَ الْحَمْدُ عَلى تَقْديرِكَ الْحَسَنِ الْجَميلِ، وَلَكَ الشُّكْرُ عَلى قَضائِكَ الْمُعَلَّلِ بِاَكْمَلِ التَّعْليلِ، فَسُبْحانَ مَنْ لا يُسْأَلُ عَنْ فِعْلِهِ، وَلا يُنازِعُ في اَمْرِهِ، وَسُبْحانَ مَنْ كَتَبَ عَلى نَفْسِهِ الرَّحْمَةَ قَبْلَ ابْتِداءِ خَلْقِهِ، وَالْحَمْدُللهِ الَّذي مَنَّ عَلَيْنا بِحُكّام يَقُومُونَ مَقامَهُ لَوْ كانَ حاضِراً فِي الْمَكانِ، وَلا اِلـه اِلاَّ اللهُ الَّذي شَرَّفَنا بِاَوْصِياءَ يَحْفَظُونَ الشَّرايِعَ في كُلِّ الاَْزْمانِ، وَاللهُ اَكْبَرُ الَّذي اَظْهَرَهُمْ لَنا بِمُعْجِزات يَعْجَزُ عَنْهَا الثَّقَلانِ، لا حَوْلَ وَلا قُوَّةَ إلاّ بِاللهِ الْعَلِىِّ الْعَظيمِ، الَّذي اَجْرانا عَلى عَوائِدِهِ الْجَميلَةِ فِي الاُْمَمِ السّالِفينَ، اَللّـهُمَّ فَلَكَ الْحَمْدُ وَالثَّناءُ الْعَلِىُّ كَما وَجَبَ لِوَجْهِكَ الْبَقاءُ السَّرْمَدِىُّ، وَكَما جَعَلْتَ نَبِيَّنا خَيْرَ النَّبِيّينَ، وَمُلُوكَنا اَفْضَلَ الَْمخْلُوقينَ، وَاخْتَرْتَهُمْ عَلى عِلْم عَلَى الْعالَمينَ، وَفِّقْنا للِسَّعْىِ اِلى اَبْوابِهِمُ الْعامِرَةِ اِلى يَوْمِ الدّينِ، وَاجْعَلْ اَرْواحَنا تَحِنُّ إلَى مَوْطِئ اَقْدامِهِمْ، وَنُفُوسَنا تَهْوِى النَّظَرَ اِلى مَجالِسِهِمْ وَعَرصاتِهِمْ، حَتّى كَاَنَّنا نُخاطِبُهُمْ في حُضُورِ اَشْخاصِهِمْ، فَصَلَّى اللهُ عَلَيْهِمْ مِنْ سادَة غائِبينَ، وَمِنْ سُلالَة طاهِرينَ، وَمِنْ اَئمَّة مَعْصُومينَ، اَللّـهُمَّ فَأذَنْ لَنا بِدُخُولِ '
                      'هذِهِ الْعَرَصاتِ الَّتي اسْتَعْبَدْتَ بِزِيارَتِها اَهْلَ الاَْرَضينَ وَالسَّماواتِ، وَاَرْسِلْ دُمُوعَنا بِخُشُوعِ الْمَهابَةِ، وَذَلِّلْ جَوارِحَنا بِذُلِّ الْعُبُودِيِّةِ وَفَرْضِ الطّاعَةِ، حَتّى نُقِرَّ بِما يَجِبُ لَهُمْ مِنَ الاَْوْصافِ، وَنَعْتَرِفُ بِاَنَّهُمْ شُفَعاءَ الْخَلايِقِ اِذا نُصِبَتِ الْمَوازينُ في يَوْمِ الاَْعْرافِ، وَالْحَمْدُ للهِ وَسَلامٌ عَلى عِبادِهِ الَّذينَ اصْطَفى مُحَمَّد وَآلِهِ الطّاهِرينَ.\n\n'
                      'ثمّ قبّل العتبة وادخل وأنت خاشِع باك فذلك اذن منهم صلوات الله عليهم أجمعين في الدُّخول.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiAdabAlziyarat.screenRoute,
          pushBack: FiAdabAlziyarat.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في ذكر الاستدعاء.mp3',
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
