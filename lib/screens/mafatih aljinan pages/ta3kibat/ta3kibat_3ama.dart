import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../../widgets/ta3kibat_style.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ta3kibat.dart';
import 'ta3kib_al3isha2.dart';
import 'ta3kib_alsabah.dart';

class Ta3kibat3ama extends StatefulWidget {
  static String screenRoute = 'ta3kibat_3ama_screen';
  const Ta3kibat3ama({super.key});

  @override
  State<Ta3kibat3ama> createState() => _Ta3kibat3amaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Ta3kibat3amaState extends State<Ta3kibat3ama> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ta3kibat_3ama_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ta3kibat_3ama_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ta3kibat.screenRoute);
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
                Navigator.of(context)
                    .pushReplacementNamed(Ta3kibat.screenRoute);
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
                          'التعقيبات العامة', Ta3kibat3ama.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('التعقيبات العامة',
                          Ta3kibat3ama.screenRoute, Ta3kibat3ama.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'التعقيبات العامة',
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
                      'عن كتاب مصباح المتهجّد وغيره فإذا سلّمت وفرغت من الصلاة فقل اللهُ اَكْبَرُ ثلاث مرّات؛ رافعاً عند كلّ تكبيرة يديك الى حيال أذنيك ثمّ قل:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'لا اِلـهَ إلاَّ اللهُ اِلهاً واحِداً وَنَحْنُ لَهُ مُسْلِمُونَ لا اِلـهَ إلاَّ اللهُ وَلا نَعْبُدُ إلاّ اِيّاهُ مُخْلِصينَ لَهُ الدّينَ وَلَوْ كَرَهَ الْمُشْرِكُونَ لا اِلـهَ اِلاَّ اللهُ رَبُّنا وَرَبُّ آبائنَا الْاَوَّلينَ لا اِلـهَ اِلاَّ اللهُ وَحْدَهُ وَحْدَهُ وَحْدَهُ اَنْجَزَ وَعْدَهُ وَنَصَرَ عَبْدَهُ وَاَعَزَّ جُنْدَهُ وَهَزَمَ الْاَحْزابَ وَحْدَهُ فَلَهُ الْمُلْكُ وَلَهُ الْحَمْدُ يُحْيي وَيُميتُ وَيُميتُ وَيُحْيي وَهُوَ حَىٌّ لا يَمُوتُ بِيَدِهِ الْخَيْرُ وَهُوَ عَلى كُلِّ شَيْء قَديرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'ثمّ قل:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'اسْتَغْفِرُ اللهَ الَّذي لا اِلـهَ اِلاّ هُوَ الْحَيُّ الْقَيُّومُ وَاَتُوبُ اِلَيْهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'ثمّ قل:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'اَللّـهُمَّ اهْدِني مِنْ عِنْدِكَ وَاَفِضْ عَلَيَّ مِنْ فَضْلِكَ وَانْشُرْ عَلَيَّ مِنْ رَحْمَتِكَ وَاَنْزِلْ عَلَيَّ مِنْ بَرَكاتِكَ سُبْحانَكَ لا اِلـهَ اِلاّ اَنْتَ اغْفِرْ لي ذُنُوبي كُلَّها جَميعاً فَاِنَّهُ لا يَغْفِرُ الذُّنُوبَ كُلَّها جَميعاً اِلاّ اَنْتَ اَللّـهُمَّ اِنّي أسْأَلُكَ مِنْ كُلِّ خَيْر اَحاطَ بِهِ عِلْمُكَ وَاَعُوذُ بِكَ مِنْ كُلِّ شَرٍّ اَحاطَ بِهِ عِلْمُكَ اَللّـهُمَّ اِنّي أسْأَلُكَ عافِيَتَكَ في اُمُوري كُلِّها وأعوذُ بك من خزي الدنيا وعذابِ الآخرةِ وأعوُذُ بِوَجْهِكَ الْكَريمِ وَعِزَّتِكَ الَّتي لا تُرامُ وَقُدْرَتِكَ الَّتي لا يَمْتَنِعُ مِنْها شَيْءٌ مِنْ شَرِّ الدُّنْيا وَالآخِرَةِ وَمِنْ شَرِّ الأوْجاعِ كُلِّها ومن شرِّ كلِّ دابة أنت آخذٌ بناصيتها انّ ربّي على صراط مستقيم وَلا حَوْلَ وَلا قُوَّةَ إلاّ بِاللهِ الْعَلِيِّ الْعَظيمِ تَوَّكَلْتُ عَلَى الْحَيِّ الَّذي لا يَمُوتُ وَالْحَمْدُ للهِ الَّذى لَمْ يَتَّخِذْ وَلَداً وَلَمْ يَكُنْ لَهُ شَريكٌ فِي الْمُلْكِ وَلَمْ يَكُنْ لَهُ وَلِيٌّ مِنَ الذُّلِّ وَكَبِّرْهُ تَكْبيراً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'ثمّ سبّح تسبيح الزّهراء (عليها السلام) وقل عشر مرّات قبل أن تتحرّك من موضعك:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'اَشْهَدُ اَنْ لا اِلـهَ اِلاَّ اللهُ وَحْدَهُ لا شَريكَ لَهُ اِلهاً واحِداً أحَداً فَرْداً صَمَداً لَمْ يَتَّخِذْ صاحِبَةً وَلا وَلَداً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'أقول: روي لهذا التهليل فضل كثير سيّما اذا عقب به صلاة الصّبح والعشاء وإذا قرى عند طلوع الشّمس وغروبها، ثمّ تقول:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'سُبْحانَ اللهِ كُلَّما سَبَّحَ اللهَ شَيءٌ وَكَما يُحِبُّ اللهُ اَنْ يُسَبَّحَ وَكَما هُوَ اَهْلُهُ وَكما يَنْبَغي لِكَرَمِ وَجْهِهِ وَعِزِّ جَلالِهِ وَالْحَمْدُ للهِ كُلَّما حَمِدَ اللهَ شَيءٌ وَكَما يُحِبُّ اللهُ اَنْ يُحْمَدَ وَكَما هُوَ اَهْلُهُ وَكَما يَنْبَغي لِكَرَمِ وَجْهِهِ وَعِزِّ جَلالِهِ وَلا اِلـهَ اِلاّ اللهُ كُلَّما هَلَّلَ اللهَ شَيءٌ وَكَما يُحِبُّ اللهُ اَنْ يُهَلَّلَ وَكَما هُوَ اَهْلُهُ وَكَما يَنْبَغي لِكَرَمِ وَجْهِهِ وَعِزِّ جَلالِهِ وَاللهُ اَكْبَرُ كُلَّما كَبَّرَ اللهَ شَيءٌ وَكَما يُحِبُّ اللهُ اَنْ يُكَبَّرَ وَكَما هُوَ اَهْلُهُ وَكَما يَنْبَغي لِكَرَمِ وَجْهِهِ وَعِزِّ جَلالِهِ سُبْحانَ اللهِ وَالْحَمْدُ للهِ وَلا اِلـهَ اِلاَّ اللهُ وَاللهُ اَكْبَرُ عَلى كُلِّ نِعْمَة اَنْعَمَ بِها عَلَىَّ وَعَلى كُلِّ اَحَد مِنْ خَلْقِهِ مِمَّنْ كانَ أوْ يَكُونُ اِلى يَوْمِ الْقِيامَةِ اَللّـهُمَّ اِنّي أسْألُكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد وَأسْأَلُكَ مِنْ خَيْرِ ما أَرْجُووَخَيْرِ ما لا أرْجُووَاَعُوذُ بِكَ مِنْ شَرِّ ما أحْذَرُ وَمِنْ شَرِّ ما لا أحْذَرُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'ثمّ تقرأ:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'سورة الحمد وآية الكرسي و شَهِدَ اللهُ وآية قُلِ اَللّـهُمَّ مالِكِ الْمُلْكِ وآية السّخرة وهي آيات ثلاث من سورة الاعراف أوّلها اِنَّ رَبَّكُمُ اللهُ وآخرها مِنَ الْمُحْسِنينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'ثمّ تقول ثلاثاً:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'سُبْحانَ رَبِّكَ رَبِّ الْعِزَّةِ عَمّا يَصِفُونَ وَسَلامٌ عَلَى الْمُرْسَلينَ وَالْحَمْدُ للهِ رَبِّ الْعالَمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'ثم تقول ثلاث مرّات:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاجْعَلْ لي مِنْ اَمْري فَرَجاً وَمَخْرَجاً وَارْزُقْنى مِنْ حَيْثُ أَحْتَسِبُ وَمِنْ حَيْثُ لا أحْتَسِبُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text: 'وهذا دعاء علّمه جبرئيل يوسف (عليه السلام) في السّجن.',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'ثمّ خذ لحيتك بيدك اليمنى وابسط يدك اليسرى الى السّماء وقل سبع مرّات:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'يا رَبَّ مُحَمَّد وَآلِ مُحَمَّد صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَعَجِّلْ فَرَجَ آلِ مُحَمَّد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'وقل ثلاثاً وأنت على ذلك الحال:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'يا ذَا الْجَلالِ وَالاِكْرامِ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَارْحَمْني وَاَجِرْني مِنَ النّارِ ثمّ تقرأ اثنتي عشرة مرّة سورة قُلْ هُوَ اللهُ اَحَدٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'وتقول:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'اَللّـهُمَّ اِنّي أَسْأَلُكَ بِاسْمِكَ الْمَكْنُونِ الْمَخْزُونِ الطّاهِرِ الطُّهْرِ الْمُبارَكِ وَأسْأَلُكَ بِاْسمِكَ الْعَظيمِ وَسُلْطانِكَ الْقَديمِ يا واهِبَ الْعَطايا وَيا مُطْلِقَ الاُسارى وَيا فَكّاكَ الرِّقابِ مِنَ النّارِ أَسْأَلُكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاْنَ تُعْتِقَ رَقَبَتي مِنَ النّارِ وَاَنْ تُخْرِجَني مِنَ الدُّنْيا سالِماً وَتُدْخِلَنِي الْجَنَّةَ آمِناً وَاَنْ تَجْعَلَ دُعآئي اَوَّلَهُ فَلاحاً وَاَوْسَطَهُ نَجاحاً وَآخِرَهُ صَلاحاً اِنَّكَ أنْتَ عَلاّمُ الْغُيُوبِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'وورد في الصّحيفة العلويّة لتعقيب الفرائض:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'يا مَنْ لا يَشْغَلُهُ سَمْعٌ عن سمع وَيا مَنْ لا يُغَلِّطُهُ السّائِلُونَ وَيا مَنْ لا يُبْرِمُهُ اِلْحاحُ المُلِحِّينَ اَذِقْني بَرْدَ عَفْوِكَ وَحَلاوَةَ رَحْمَتِكَ وَمَغْفِرَتِكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'وَتقول أيضاً:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'اِلـهي هذه صَلاتي صَلَّيْتُها لا لحاجَة منْكَ اليْها وَلا رَغْبَة مِنْكَ فيها اِلاّ تَعْظيماً وَطاعَةً وَاِجابَةً لَكَ اِلى ما اَمَرْتَني بِهِ الـهي اِنْ كانَ فيها خَلَلٌ اَوْ نَقْصٌ مِنْ رُكُوعِها أوْ سُجُودِها فَلا تؤاخذني وَتَفَضَّلْ عَلَيَّ بِالْقَبُولِ وَالْغُفْرانِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وتدعو أيضاً عقيب الصّلوات بهذا الدّعاء الّذي علّمه النّبي (صلى الله عليه وآله وسلم) أمـير المؤمنين للذّاكرة:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'سُبْحانَ مَنْ لا يَعْتَدي عَلى أهْلِ مَمْلَكَتِهِ سُبْحانَ مَنْ لا يَأخُذُ اَهْلَ الْاَرْضِ بأَلْوانِ الْعَذابِ سُبْحانَ الرَّؤوُفِ الرَّحيمِ اَللّـهُمَّ اْجَعلْ لي في قَلْبى نُوراً وَبَصَراً وَفَهْماً وَعِلْماً اِنَّكَ عَلى كُلِّ شَي قَديرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وقال الكفعمي في المِصباح: قُل ثلاث مرّات عقيب الصّلوات:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'اُعيذُ نَفْسي وَديني وَاَهْلي وَمالي وَوَلَدي وَاِخْواني في ديني وَما رَزَقَني رَبِّي وَخَواتيمَ عَمَلي وَمَنْ يَعْنيني اَمْرُهُ بِاللهِ الْواحِدِ الاَحَدِ الصَّمَدِ الَّذي لَمْ يَلِدْ وَلَمْ يُولَدْ وَلَمْ يَكُنْ لَهُ كُفواً اَحَدٌ وَبِرَبِّ الْفَلَقِ مِنْ شَرِّ ما خَلَقَ وَمِنْ شَرِّ غاسِق اِذا وَقَبَ وَمِنْ شَرِّ النَّفّاثاتِ فِي الْعُقَدْ وَمِنْ شَرِّ حاسِد اِذا حَسَدَ وَبِرَبِّ النّاسِ مَلِكِ النّاسِ إلـهِ النّاسِ مِنْ شَرِّ الْوَسْواسِ الْخَنّاسِ الَّذى يُوَسْوِسُ في صُدُورِ النّاسِ مِنَ الْجِنَّةِ وَالنّاسِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وعن خطّ الشّيخ الشّهيد انّ رسُول الله (صلى الله عليه وآله وسلم) قال: من أراد أن لا يطلعه الله يوم القيامة على قبيح اعماله ولا يفتح ديوان سيّئاته فليقل بعد كلّ صلاة:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'اَللّـهُمَّ إنَّ مَغْفِرَتَكَ اَرْجى مِنْ عَمَلى وَاِنَّ رَحْمَتِكَ أوْسَعُ مِنْ ذَنْبي اَللّـهُمَّ إن كانَ ذَنبي عِنْدَكَ عَظيماً فَعَفْوُكَ اَعْظَمُ مِنْ ذَنْبي اَللّـهُمَّ إنْ لَمْ اَكُنْ أهْلاً أنْ اَبْلُغَ رَحْمَتُكَ فرحمتك اَهْلٌ اَنْ تَبْلُغَني وَتَسَعَني لاَِنَّها وَسِعَتْ كُلَّ شَيْء بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وعن ابن بابويه (رحمه الله) قال: اذا فرغت من تسبيح الزّهراء صلوات الله عليها فقل:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'اَللّـهُمَّ اَنْتَ السَّلامُ وَمِنْكَ السَّلامُ وَلَكَ السَّلامُ وَاِلَيْكَ يَعُودُ السَّلامُ سُبْحانَ رَبِّكَ رَبِّ الْعِزَّةِ عَمّا يَصِفُونَ وَسَلامٌ عَلَى الْمُرْسَلينَ وَالْحَمْدُ للهِ رَبِّ الْعالَمينَ اَلسَّلامُ عَلَيْكَ اَيُّهَا النَّبِيُّ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ السَّلامُ عَلَى الْاَئِمَّةِ الْهادينَ الْمَهْدِيّينَ اَلسَّلامُ عَلى جَميعِ اَنْبِيآءِ اللهِ وَرُسُلِهِ وَمَلائِكَتِهِ اَلسَّلامُ عَلَيْنا وَعَلى عِبادِ اللهِ الصّالِحينَ اَلسَّلامُ عَلى عَلِيٍّ اَميرِ الْمُؤْمِنينَ اَلسَّلامُ عَلَى الْحَسَنِ وَالْحُسَيْنِ سَيِّدَيْ شَبابِ اَهْلِ الْجَنَّةِ اَجْمَعينَ اَلسَّلامُ عَلى عَلِيِّ بْنِ الْحُسَيْنِ زَيْنِ الْعابِدينَ اَلسَّلامُ عَلى مُحَمَّدِ بْنِ عَلِيٍّ باقِرِ عِلْمِ النَّبِيّينَ اَلسَّلامُ عَلى جَعْفَرِ بْنِ مُحَمَّد الصّادِقِ اَلسَّلام عَلى مُوسَى بْنِ جَعْفَر الْكاظِمِ اَلسَّلامُ عَلى عَلِيِّ بْنِ مُوسَى الرِّضا اَلسَّلامُ عَلى مُحَمَّدِ بْنِ عَلِيٍّ الْجَوادِ اَلسَّلامُ عَلى عَلِيِّ بْنِ مُحَمَّد الْهادي اَلسَّلامُ عَلَى الْحَسَنِ بْنِ عَلِيٍّ الزَّكِيِّ الْعَسْكَرِيِ اَلسَّلامُ عَلَى الْحُجَّةِ بْنِ الْحَسَنِ الْقآئِمِ الْمَهْدِيِّ صَلَواتُ اللهِ عَلَيْهِمْ اَجْمَعينَ. ثمّ سل الله ما شئت.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'وقال الكفعمي تقول بعد الصّلوات:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'رَضيتُ بِاللهِ رَبّاً وبِالْاِسْلامِ ديناً وَبِمُحَمَّد صَلَّى اللهُ عَلَيْهِ وآلِهِ نَبِيّاً وَبِعَلِيٍّ اِماماً وَبِالْحَسَنِ وَالْحُسَيْنِ وَعَلِيٍّ وَمُحَمَّد وَجَعْفَر وَمُوسى وَعَلِيٍّ وَمُحَمَّد وَعَلِيٍّ وَالْحَسَنِ وَالْخَلَفِ الصّالِحِ عَلَيْهِمُ السَّلامُ اَئِمَّةً وَسادَةً وَقادَةً بِهِمْ اَتَولّى وَمِنْ اَعْدآئِهِمْ اَتَبَرَّأُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text: 'ثمَّ تَقولُ ثلاثاً:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'اَللّـهُمَّ اِنّي أَسْأَلُكَ الْعَفْوَ وَالْعافِيَةَ وَالْمُعافاةَ فِي الدُّنْيا وَالاْخِرَةِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Ta3kibAlsabah.screenRoute,
          pushBack: Ta3kibAl3isha2.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/تعقيبات عامة.mp3',
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
