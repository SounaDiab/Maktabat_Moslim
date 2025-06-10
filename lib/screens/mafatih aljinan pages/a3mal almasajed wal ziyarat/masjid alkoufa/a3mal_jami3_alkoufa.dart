import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'a3mal_dikat_alkada2_wbait_altast.dart';
import 'fi_fadl_alkoufa_wamasjidouha.dart';

class A3malJami3Alkoufa extends StatefulWidget {
  static String screenRoute = 'a3mal_jami3_alkoufa_screen';
  const A3malJami3Alkoufa({super.key});

  @override
  State<A3malJami3Alkoufa> createState() => _A3malJami3AlkoufaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malJami3AlkoufaState extends State<A3malJami3Alkoufa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_a3mal_jami3_alkoufa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_a3mal_jami3_alkoufa_screen', value);
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
                      .addFavorite(
                          'أعمال جامع الكوفة', A3malJami3Alkoufa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'أعمال جامع الكوفة',
                          A3malJami3Alkoufa.screenRoute,
                          A3malJami3Alkoufa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال جامع الكوفة',
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
                  title: 'فهي على ما في مصباح الزّائر وغيره كما يلي :',
                  subtitle:
                      'قل حينما تدخل مدينة الكوفة : بِسْمِ اللهِ وَبِاللهِ وَفي سَبيلِ اللهِ وَعَلى مِلَّةِ رَسُولِ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ اَللّـهُمَّ اَنْزِلْني مُنْزَلاً مُبارَكاً وَاَنْتَ خَيْرُ الْمُنْزِلينَ، ثمّ سر نحو المسجد وأنت تقول : اَللهُ اَكْبَرُ وَلا اِلـهَ اِلاّ اللهُ وَالْحَمْدُ للهِ وَسُبْحانَ اللهِ، حتى تأتي باب المسجد فاذا أتيته فقف على الباب وقل :\n\n'
                      'اَلسَّلامُ عَلى سَيِّدِنا رَسُولِ اللهِ مُحَمَّدِ بْنِ عَبْدِ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ الطّاهِرينَ، اَلسَّلامُ عَلى اَميرِ الْمُؤْمِنينَ عَلِيِّ بْنِ أبي طالِب وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، وَعَلى مَجالِسِهِ وَمَشاهِدِهِ وَمَقامِ حِكْمَتِهِ وَآثارِ آبائِهِ آدَمَ وَنُوح وَاِبْراهيمَ وَاِسْماعيلَ وَتِبْيانِ بَيِّناتِهِ، اَلسَّلامُ عَلَى الاِْمامِ الْحَكيمِ الْعَدْلِ الصِّديقِ الاَْكْبَرِ الْفارُوقِ بِالْقِسْطِ الَّذي فَرَّقَ اللهُ بِهِ بَيْنَ الْحَقِّ وَالْباطِلِ وَالْكُفْرِ وَالاْيمانِ وَالشِّرْكِ وَالتَّوْحيدِ، لِيَهْلِكَ مَنْ هَلَكَ عَنْ بَيِّنَة وَيُحْيا مَنْ حَيَّ عَنْ بَيِّنَة، اَشْهَدُ اَنَّكَ اَميرُ الْمُؤْمِنينَ، وَخاصَّةُ نَفْسِ الْمُنْتَجَبينَ، وَزَيْنُ الصِّديقينَ، وَصابِرُ الْمُمْتَحَنينَ، وَاَنَّكَ حَكَمُ اللهِ في اَرْضِهِ، وَقاضي اَمْرِهِ، وَبابُ حِكْمَتِهِ، وَعاقِدُ عَهْدِهِ، وَالنّاطِقُ بِوَعْدِهِ، وَالْحَبْلُ الْمَوْصُولُ بَيْنَهُ وَبَيْنَ عِبادِهِ، وَكَهْفُ النَّجاةِ، وَمِنْهاجُ التُّقي، وَالدَّرَجَةُ الْعُلْيا، وَمُهَيْمِنُ الْقاضِي الاَْعْلى، يا اَميرَ الْمُؤْمِنينَ بِكَ اَتَقَرَّبُ اِلَى اللهِ زُلْفى، اَنْتَ وَلِيِّي وَسَيِّدي وَوَسيلَتي فِي الدُّنْيا وَالاْخِرَةِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title:
                      'ثمّ تدخل المسجد ، أقول : والافضل أن تدخل من الباب الواقِع خلف المسجد المشهُور بباب الفيل ثمّ تقول :',
                  subtitle:
                      'اَللهُ اَكْبَرُ اَللهُ اَكْبَرُ اَللهُ اَكْبَرُ هذا مَقامُ الْعائِذِ بِاللهِ وَبِمُحَمَّد حَبيبِ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ، وَبِوِلايَةِ اَميرِ الْمُؤْمِنينَ وَالاَْئِمَّةِ الْمَهْدِيّينَ الصّادِقينَ النّاطِقينَ الرّاشِدينَ الَّذينَ اَذْهَبَ اللهُ عَنْهُمُ الرِّجْسَ وَطَهَّرَهُمْ تَطْهيراً، رَضيتُ بِهِمْ اَئِمَّةً وَهُداةً وَمَوالِيَ سَلَّمْتُ لاَِمْرِ اللهِ لا اُشْرِكُ بِهِ شَيْئاً، وَلا اَتَّخِذُ مَعَ اللهِ وَلِيّاً، كَذَبَ الْعادِلُونَ بِاللهِ وَضَلُّوا ضَلالاً بَعيداً، حَسْبِيَ اللهُ وَاَوْلِياءُ اللهِ اَشْهَدُ اَنْ لا اِلـهَ اِلاَّ اللهُ وَحْدَهُ لا شَريكَ لَهُ، وَاَشْهَدُ اَنَّ مُحَمَّداً عَبْدُهُ وَرَسُولُهُ صَلَّى اللهُ عَلَيْهِ وَآلِهِ وَاَنَّ عَلِيّاً وَالاَْئِمَّةَ الْمَهْدِيّينَ مِنْ ذُرِّيَّتِهِ عَلَيْهِمُ السَّلامُ اَوْلِيائي وَحُجَّةُ اللهِ عَلى خَلْقِهِ.\n\n'
                      'ثمّ سر الى الاسطوانة الرّابعة الواقعة الى جانب باب الانماط بحذاء الخامسة وهي اسطوانة ابراهيم (عليه السلام) فصلّ عندها أربع ركعات ركعتان بالحمد والتّوحيد (قُلْ هُوَ اللهُ اَحَدٌ) وركعتان بالحمد والقدرِ (اِنّا اَنْزَلْناهُ فى لَيْلَةِ الْقَدْرِ) فاذا فرغت منها فسبّح تسبيح الزّهراء (عليها السلام) وقُل :\n\n'
                      'اَلسَّلامُ عَلى عِبادِ اللهِ الصّالِحينَ الرّاشِدينَ الَّذينَ اَذْهَبَ اللهُ عَنْهُمُ الرِّجْسَ وَطَهَّرَهُمْ تَطْهيراً، وَجَعَلَهُمْ اَنْبِياءَ مُرْسَلينَ وَحُجَّةً عَلَى الْخَلْقِ اَجْمَعينَ، وَسَلامٌ عَلَى الْمُرْسَلينَ، وَالْحَمْدُ للهِ رَبِّ الْعالَمينَ، ذلِكَ تَقْديرُ الْعَزيزِ الْعَليمِ. وقل سبع مرّات : سَلامٌ عَلى نُوح فِى الْعالَمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'ثمّ قل :',
                  subtitle:
                      'نَحْنُ عَلى وَصِيَّتِكَ يا وَلِيَّ الْمُؤْمِنينَ الَّتي اَوْصَيْتَ بِها ذُرِّيَّتَكَ مِنَ الْمُرْسَلينَ وَالصِّدّيقينَ، وَنَحْنُ مِنْ شيعَتِكَ وَشيعَةِ نَبِيِّنا مُحَمَّد صَلَّى اللهُ عَلَيْهِ وَآلِهِ وَعَلَيْكَ وَعَلى جَميعِ الْمُرْسَلينَ وَالاَْنْبِياءِ وَالصّادِقينَ، وَنَحْنُ عَلى مِلَّةِ اِبْرهيمَ وَدينِ مُحَمَّدّ النَّبِيِّ الاُْمِّيِّ وَالاَْئِمَّةِ الْمَهْدِيّينَ وَوِلايَةِ مَوْلانا عَلِيٍّ اَميرِ الْمُؤْمِنينَ، اَلسَّلامُ عَلَى الْبَشيرِ النَّذيرِ صَلَواتُ اللهِ عَلَيْهِ وَرَحْمَتُهُ وَرِضْوانُهُ وَبَرَكاتُهُ، وَعَلى وَصِيِّهِ وَخَليفَتِهِ الشّاهِدِ للهِ مِنْ بَعْدِهِ عَليٍّ خَلْقِهِ عَلى اَميرِ الْمُؤْمِنينَ الصِّديقِ الاَْكْبَرِ وَالْفارُوقِ الْمُبينِ، الَّذى اَخَذْتَ بَيْعَتَهُ عَلَى الْعالَمينَ، رَضيتُ بِهِمْ اَوْلِياءَ وَمَوالِيَ وَحُكّاماً في نَفْسي وَوُلْدي وَاَهْلي وَمالي وَقِسْمي وَحِلّي وَاِحْرامي وَاِسْلامي وَديني وَدُنْيايَ وَآخِرَتي وَمَحْيايَ وَمَماتي، اَنْتُمُ الاَْئِمَّةُ فِي الْكِتابِ وَفَصْلُ الْمَقامِ وَفَصْلُ الْخِطابِ، '
                      'وَاَعْيُنُ الْحَيِّ الَّذي لا يَنامُ، وَاَنْتُمْ حُكَماءُ، اللهِ وَبِكُمْ حَكَمَ اللهُ وَبِكُمْ عِرُفَ حَقُّ اللهِ، لا اِلـهَ اِلاَّ اللهُ مُحَمَّدٌ رَسُولُ اللهِ، اَنْتُمْ نُورُ اللهِ مِنْ بَيْنِ اَيْدينا وَمِنْ خَلْفِنا، اَنْتُمْ سُنَّةُ اللهِ الَّتي بِها سَبَقَ الْقَضاءُ، يا اَميرَ الْمُؤْمِنينَ اَنَا لَكُمْ مُسَلِّمٌ تَسْليماً لا اُشْرِكُ بِاللهِ شَيْئاً وَلا اَتَّخِذُ مِنْ دُونِهِ وَلِيّاً، اَلْحَمْدُ للهِ الَّذي هَداني بِكُمْ وَما كُنْتُ لاَِهْتَدِيَ لَوْلا اَنْ هَدانِيَ اللهُ، اَللهُ اَكْبَرُ اَللهُ اَكْبَرُ اَللهُ اَكْبَرُ، الْحَمْدُ للهِ عَلى ما هَدانا.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: '',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: A3malDikatAlkada2WbaitAltast.screenRoute,
        pushBack: FiFadlAlkoufaWamasjidouha.screenRoute,
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
