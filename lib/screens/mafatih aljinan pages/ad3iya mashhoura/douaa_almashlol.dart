import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iya_mashhoura.dart';
import 'douaa_alsimat.dart';
import 'douaa_yastashir.dart';

class DouaaAlmashlol extends StatefulWidget {
  static String screenRoute = 'douaa_almashlol_screen';
  const DouaaAlmashlol({super.key});

  @override
  State<DouaaAlmashlol> createState() => _DouaaAlmashlolState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _DouaaAlmashlolState extends State<DouaaAlmashlol> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_almashlol_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_almashlol_screen', value);
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
                      .addFavorite('دعاء المشلول', DouaaAlmashlol.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء المشلول',
                          DouaaAlmashlol.screenRoute,
                          DouaaAlmashlol.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء المشلول',
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
                      'الموسوم بدُعاء الشّاب المأخوذ بذَنْبه المروي في كتب الكفْعمي وَفي كتاب مهج الدّعوات، وهُو دُعـاء علّمه امير المؤمِنين (عليه السلام) شابّاً مأخوذاً بِذنبه مشلولاً نتيجة ما عمله من الظّلم والاثم في حقّ والده، فدَعى بهـذا الّدعاء واضطَجع فرأى النّبى (صلى الله عليه وآله وسلم) في مَنامه وقد مَسَح يَدَه عليه وقال: احتفظ بِاسم الله الاعظم فان عملك يكون بخَير ، فانتبه مَعافى وهُو هذا الدّعاء :',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'اَللّـهُمَّ اِنّي اَسْأَلُكَ بِاسْمِكَ بِسْمِ اللهِ الرَّحْمنِ الرَّحيمِ يا ذَا الْجَلالِ وَالاِْكرامِ يا حَيُّ يا قَيّوُمُ يا حَيُّ لا إِلـهَ إلاّ اَنْتَ، يا هُوَ يا مَنْ لا يَعْلَمُ ما هُوَ وَلا كَيْفَ هُوَ وَلا حَيْثُ هُوَ اِلاّ هُوَ، يا ذَا المُلْكِ وَالْمَلَكوُتِ يا ذَا الْعِزَّةِ وَالْجَبَروُتِ، يا مَلِكُ يا قُدُّوسُ، يا سَلامُ يا مُؤْمِنُ يا مُهَيْمِنُ يا عَزيزُ يا جَبّارُ يا مُتَكَبِّرُ يا خالِقُ يا بارِئُ يا مصوّر يا مُفيدُ يا مُدَبِّرُ يا شَديدُ يا مُبْدِئُ يا مُعيدُ يا مُبيدُ يا وَدُودُ يا مَحْمُودُ يا مَعْبوُدُ يا بَعيدُ يا قَريبُ يا مجيب يا رقيب يا حَسيبُ يا بَديعُ يا رَفيعُ يا منيعٌ يا سَميعُ يا عَليمُ يا حَليمُ يا كَريمُ يا حَكيمُ يا قَديمُ يا عَلِىُّ يا عَظيمُ يا حَنّانُ يا مَنّانُ يا دَيّانُ يا مُسْتَعانُ يا جَليلُ يا جَميلُ يا وَكيلُ يا كفَيلُ يا مُقيلُ يا مُنيلُ يا نَبيلُ يا دَليلُ يا هادى يا بادى يا اَوَّلُ يا اخِرُ يا ظاهِرُ يا باطِنُ يا قآئِمُ يا دآئِمُ يا عالِمُ يا حاكِمُ يا قاضى يا عادِلُ يا فاصِلُ يا واصِلُ يا طاهِرُ يا مُطَهِّرُ يا قادِرُ يا مُقْتَدِرُ يا كَبيرُ يا مُتَكَبِّرُ'
                      'يا واحِدُ يا اَحَدُ يا صَمَدُ يا مَنْ لَمْ يَلِدْ وَلَمْ يوُلَدْ وَلَمْ يَكُنْ لَهُ كُفُواً اَحَدٌ وَلَمْ يَكُنْ لَهُ صاحِبَةٌ وَلا كانَ مَعَهُ وَزيرٌ، وَلاَ اتَّخَذَ مَعَهُ مُشيراً، وَلاَ احْتاجَ اِلى ظَهير وَلا كانَ مَعَهُ مِنْ اِلـه غَيْرُهُ، لا اِلـهَ اِلاّ اَنْتَ فَتَعالَيْتَ عَمّا يَقُولُ الظّالِمُونَ عُلُوّاً كَبيراً، يا عَلِىُّ يا شامِخُ يا باذِخُ يا فَتّاحُ يا نَفّاحُ يا مُرْتاحُ يا مُفَرِّجُ يا ناصِرُ يا مُنْتَصِرُ يا مُدْرِكُ يا مُهْلِكُ يا مُنْتَقِمُ يا باعِثُ يا وارِثُ يا طالِبُ يا غالِبُ يا مَنْ لا يَفُوتُهُ هارِبٌ، يا تَوّابُ يا اَوّابُ يا وَهّابُ يا مُسَبِّبَ الاَْسْبابِ يا مُفَتِّحَ الاَْبْوابِ يا مَنْ حَيْثُ ما دُعِىَ اَجابَ، يا طَهُورُ يا شَكُورُ يا عَفُوُّ يا غَفُورُ يا نُورَ النُّورِ يا مُدَبِّرَ الاُْموُرِ يا لَطيفُ يا خَبيرُ يا مُجيرُ يا مُنيرُ يا بَصيرُ يا كَبيرُ يا وِتْرُ يا فَرْدُ يا اَبَدُ يا سَنَدُ يا صَمَدُ، يا كافي يا شافي يا وافي يا مُعافي يا مُحْسِنُ يا مُجْمِلُ يا مُنْعِمُ يا مُفْضِلُ يا مُتَكَرِّمُ يا مُتَفَرِّدُ،'
                      'يا مَنْ عَلا فَقَهَرَ، يا مَنْ مَلَكَ فَقَدَرَ، يا مَنْ بَطَنَ فَخَبَرَ، يا مَنْ عُبِدَ فَشَكَرَ، يا مَنْ عُصِىَ فَغَفَرَ، يا مَنْ لا يَحْويهِ الْفِكَرُ وَلا يُدْرِكُهُ بَصَرٌ، وَلا يَخْفى عَلَيْهِ اَثَرٌ، يا رازِقَ الْبَشَرِ يا مُقَدِّرَ كُلِّ قَدَر، يا عالِىَ الْمَكانِ يا شَديدَ الاَْرْكانِ يا مُبَدِّلَ الزَّمانِ يا قابِلَ الْقُرْبانِ يا ذَا الْمَنِّ وَالاِْحْسانِ يا ذَا الْعِزَّةِ وَالسُّلْطانِ يا رَحيمُ يا مَنْ هُوَ كُلِّ يَوُم فى شَاْن يا مَنْ لا يَشْغَلُهُ شَاْنٌ عَنْ شَاْن، يا عَظيمَ الشَّأنِ يا مَنْ هُوَ بِكُلِّ مَكان، يا سامِعَ الاَْصْواتِ يا مُجيبَ الدَّعَواتِ يا مُنْجِحَ الطَّلِباتِ يا قاضِىَ الْحاجاتِ يا مُنْزِلَ الْبَرَكاتِ يا راحِمَ الْعَبَراتِ يا مُقيلَ الْعَثَراتِ يا كاشِفَ الْكُرُباتِ يا وَلِىَّ الْحَسَناتِ يا رافِعَ الدَّرَجاتِ يا مُؤْتِىَ السُّؤْلاتِ يا مُحْيِىَ الاَْمْواتِ يا جامِعَ الشَّتاتِ يا مُطَّلِعاً عَلَى النِّيّاتِ يا رادَّ ما قَدْ فاتَ يا مَنْ لا تَشْتَبِهُ عَلَيْهِ الاَْصْواتُ يا مَنْ لا تُضْجِرُهُ الْمَسْأَلاتُ وَلا تَغْشاهُ الظُّلُماتُ، يا نُورَ الاَْرْضِ والسِّماواتِ'
                      'يا سابِغَ النِّعَمِ يا دافِعَ النِّقَمِ، يا بارِئَ النَّسَمِ يا جامِعَ الاُْمَمِ يا شافِىَ السَّقَمِ يا خالِقَ النُّورِ وَالظُّلَمِ يا ذَا الْجُودِ وَالْكَرَمِ يا مَنْ لا يَطَأُ عَرْشَهٌ قَدَمٌ، يا اَجْوَدَ الاَْجْوَدينَ يا اَكْرَمَ الاَْكْرَمينَ يا اَسْمَعَ السّامِعينَ يا اَبْصَرَ النّاظِرينَ يا جارَ الْمُسْتَجيرينَ يا اَمانَ الْخائِفينَ يا ظَهْرَ اللاّجينَ يا وَلِىَّ الْمُؤْمِنينَ يا غِياثَ الْمُسْتَغيثينَ يا غايَةَ الطّالِبينَ يا صاحِبَ كُلِّ غَريب يا مُؤنِسَ كُلِ وَحيد، يا مَلْجَاَ كُلِّ طَريد يا مَاْوى كُلِّ شَريد يا حافِظَ كُلِّ ضآلَّة، يا راحِمَ الشَّيْخِ الْكَبيرِ، يا رازِقَ الّطِفْلِ الصَّغيرِ يا جابِرَ الْعَظْمِ الْكَسيرِ يا فاكَّ كُلِّ اَسير، يا مُغْنِىَ الْبآئِسِ الْفَقيرِ، يا عِصْمَةَ الْخائِفِ الْمُسْتَجيرِ، يا مَنْ لَهُ التَّدْبيرُ وَالتَّقْديرُ يا مِنَ الْعَسيرُ عَلَيْهِ سَهْلٌ يَسيرٌ، يا مَنْ لا يَحْتاجُ اِلى تَفْسير، يا مَنْ هُوَ عَلى كُلِّ شْيء قَديرُ يا مَنْ هُوَ بِكُلِّ شَْيء خَبيرٌ يا مَنْ هُوَ بِكُلِّ شَْيء بَصيرٌ،'
                      'يا مُرْسِلَ الرِّياحِ يا فالِقَ الاِْصْباحِ يا باعِثَ الاَْرْواحِ يا ذَا الْجُودِ وَالسَّماحِ يا مَنْ بِيَدِهِ كُلُّ مِفْتاح، يا سامِعَ كُلِّ صَوْت يا سابِقَ كُلِّ فَوْت يا مُحْيِىَ كُلِّ نَفْس بَعْدَ المَوْتِ، يا عُدَّتى فى شِدَّتى يا حافِظىِ فى غُرْبَتى يا مُؤنِسى فى وَحْدَتى يا وَلِيّى فى نِعْمَتى يا كَهْفى حينَ تُعْيينِى الْمَذاهِبُ وَتُسَلِّمُنىِ الاَْقارِبُ وَيَخْذُلُنى كُلُّ صاحِب، يا عِمادَ مَنْ لا عِمادَ لَهُ، يا سَنَدَ مَنْ لا سَنَدَ لَهُ، يا ذُخْرَ مَنْ لا ذُخْرَ لَهُ، يا حِرْزَ مَنْ لا حِرْزَ لَهُ، يا كَهْفَ مَنْ لا كَهْفَ لَهُ، يا كَنْزَ مَنْ لا كَنْزَ لَهُ، يا رُكُنَ مَنْ لا رُكْنَ لَهُ، يا غِياثَ مَنْ لا غِياثَ لَهُ، يا جارَ مَنْ لا جارَ لَهُ، يا جارِىَ اللَّصيقَ، يا رُكْنِىَ الَْوثيقَ، يا اِلـهى بِالتَّحْقيقِ، يا رَبَّ الْبَيْتِ الْعَتيقِ، يا شَفيقُ يا رَفيقُ فُكَّنى مِنْ حَلَقِ الْمَضيقِ، وَاصْرِفْ عَنّى كُلَّ هَمٍّ وَغَمٍّ وَ ضيق، وَاكْفِنى شَرَّ ما لا اُطيقُ، وَاَعِنّى عَلى ما اُطيقُ،'
                      'يا رآدَّ يُوسُفَ عَلى يَعْقُوبَ، يا كاشِفَ ضُرِّ اَيُّوبَ، يا غافِرَ ذَنْبِ داوُدَ، يا رافِعَ عيسَى بْنِ مَرْيَمَ وَ مُنْجِيَهُ مِنْ اَيْدِى الْيَهوُدِ، يا مُجيبَ نِدآءِ يُونٌسَ فِى الظُّلُماتِ، يا مُصْطَفِىَ مُوسى بِالْكَلِماتِ، يا مَنْ غَفَرَ لاِدَمَ خَطيـئَتَهُ وَرَفَعَ اِدْريسَ مَكاناً عَلِيّاً بِرَحْمَتِهِ، يا مَنْ نَجّى نُوحاً مِنَ الْغَرَقِ، يا مَنْ اَهْلَكَ عاداً الاْوُلى وَثَمُودَ فَما اَبْقى وَقَوْمَ نوُح مِنْ قَبْلُ اِنَّهُمْ كانُوا هُمْ اَظْلَمَ وَاَطْغى، وَالْمُؤْتَفِكَةَ اَهْوى يا مَنْ دَمَّرَ عَلى قَوْمِ لوُط وَدَمْدَمَ عَلى قَوْمِ شُعَيْب، يا مَنِ اتَّخَذَ اِبْراهيمَ خَليلاً، يا مَنِ اتَّخَذَ مُوسى كَليماً وَاتَّخَذَ مُحَمَّداً صَلَّى اللهُ عَلَيْهِ وَآلِهِ وَعَلَيْهِمْ اَجْمَعينَ حَبيباً، يا مُؤْتِىَ لُقْمانَ الْحِكْمَةَ وَالْواهِبَ لِسُلَيْمانَ مُلْكاً لا يَنْبَغى لاَِحَد مِنْ بَعْدِهِ، يا مَنْ نَصَرَ ذَا الْقَرْنَيْنِ عَلَى الْمُلُوكِ الْجَبابِرَةِ،'
                      'يا مَنْ اَعْطَى الْخِضْرَ الْحَيوةَ، وَرَدَّ لِيٌوشَعَ بْنِ نوُن الشَّمْسَ بَعْدَ غرُوُبِها يا مَنْ رَبَطَ عَلى قَلْبِ اُمِّ مُوسى وَاَحْصَنَ فَرْجَ مَرْيَمَ ابْنَتِ عِمْرانَ، يا مَنْ حَصَّنَ يَحْيَى بْنَ زَكَرِيّا مِنَ الذَّنْبِ وَسَكَّنَ عَنْ مُوسَى الْغَضَبَ، يا مَنْ بَشَّرَ زَكَرِيّا بِيَحْيى، يا مَنْ فَدا اِسْماعيلَ مِنَ الذَّبْحِ بِذِبْح عَظيم، يا مَنْ قَبِلَ قُرْبانَ هابيلَ وَجَعَلَ اللَّعْنَةَ عَلى قابيلَ، يا هازِمَ الاَْحْزابِ لُِمحَمَّد صَلَّى اللهُ عَلَيْهِ وَآلِهِ، صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّدِ وَ عَلى جَميعِ الْمُرْسَلينَ وَمَلائِكَتِكَ الْمُقَرَّبينَ وَاَهْلِ طاعَتِكَ اَجْمَعينَ، وَاَسْأَلُكَ بِكُلِّ مَسْأَلَة سَأَلَكَ بِها اَحَدٌ مِمَّنْ رَضيتَ عَنْهُ، فَحَتَمْتَ لَهُ عَلَى الاِْجابَةِ يا اَللهُ يا اَللهُ يا اَللهُ، يا رَحْمنُ يا رَحمنُ يا رَحْمنُ، يا رَحيمُ يا رَحيمُ يا رَحيمُ، يا ذَا الْجَلالِ وَالاِْكُرامِ يا ذَا الْجَلالِ وَ الاِْكْرامِ يا ذَا الْجَلالِ وَالاِْكْرامِ،'
                      'بِهِ اَسْأَلُكَ بِكُلِّ اسْم سَمَّيْتَ بِهِ نَفْسَكَ اَوْ اَنْزَلْتَهُ فى شَْيء مِنْ كُتُبِكَ اَوِ اسْتَأثَرْتَ بِهِ فِى عِلْمِ الْغَيْبِ عِنْدَكَ، وَبِمَعاقِدِ الْعِزِّ مِنْ عَرْشِكَ، وَبِمُنْتَهَى الرَّحْمَةِ مِنْ كِتابِكَ، وَبِما لَوْ اَنَّ ما فِى الاَْرْضِ مِنْ شَجَرَة اَقْلامٌ وَالْبَحْرُ يَمُدُّهُ مِنْ بَعْدِهِ سَبْعَةُ اَبْحُر ما نَفِدَتْ كَلِماتُ اللهِ اِنَّ اللهَ عَزيزٌ حَكيمٌ وَ اَسْأَلُكَ بِاَسْمآئِكَ الْحُسْنَى الَّتى نَعَتَّها فى كِتابِكَ فَقُلْتَ وَللهِ الاَْسْمآءُ الْحُسْنى فَادْعوُهُ بِها، وَقُلْتَ اُدْعُونى اَسْتَجِبْ لَكُمْ،وَقُلْتَ وَاِذا سَأَلَكَ عِبادى عَنّى فَانّى قَريبٌ اُجيبُ دَعْوَةَ الدّاعِ اِذا دَعانِ، وَقُلْتَ يا عِبادِىَ الّذَينَ اَسْرَفوُا عَلى اَنْفُسِهِمْ لا تَقْظَوُا مِنْ رَحْمَةِ اللهِ اِنَّ اللهَ يَغْفِرُ الذُّنُوبَ جَميعاً اِنَّهُ هُوَ الْغَفُورُ الرَّحيمُ، وَاَنَا اَسْاَلُكَ يا اِلـهى وَاَدْعُوكَ يا رَبِّ وَاَرْجُوكَ يا سَيِّدى وَاَطْمَعُ فى اِجابَتى يا مَوْلاىَ كَما وَعَدْتَنى، وَقَدْ دَعَوْتُكَ كَما اَمَرْتَنى فَافْعَلْ بى ما اَنْتَ اَهْلُهُ يا كَريمُ، وَالْحَمْدُ للهِِ رَبِّ الْعالَمينَ وَصَلَّى اللهُ عَلى مُحَمَّد وَآلِهِ اَجْمَعينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'ثُمّ سَلْ حاجتك فَاِنَّها تُقضى ان شاء الله تعالى، وفي الرّواية المروية في مهج الدّعوات لا تدعو بهذا الدّعاء الاّ متطهّراً.',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: DouaaYastashir.screenRoute,
        pushBack: DouaaAlsimat.screenRoute,
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
