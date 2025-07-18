import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'al2oula_almo5asasa.dart';
import 'alsalisa_almo5asasa.dart';

class AlsaniaAlmo5asasa extends StatefulWidget {
  static String screenRoute = 'alsania_almo5asasa_screen';
  const AlsaniaAlmo5asasa({super.key});

  @override
  State<AlsaniaAlmo5asasa> createState() => _AlsaniaAlmo5asasaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlsaniaAlmo5asasaState extends State<AlsaniaAlmo5asasa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_alsania_almo5asasa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alsania_almo5asasa_screen', value);
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
          .pushReplacementNamed(ZiyaratAlhousseinWa2adabiha.screenRoute);
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
                      .addFavorite('الثانية المخصوصة: زيارة النصف من رجب',
                          AlsaniaAlmo5asasa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الثانية المخصوصة: زيارة النصف من رجب',
                          AlsaniaAlmo5asasa.screenRoute,
                          AlsaniaAlmo5asasa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الثانية المخصوصة: زيارة النصف من رجب',
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
                      'وهي زيارة اُخرى غير ما مرّ ، أوردها المى(قدس سرهما)(رحمه الله) في المزار للنّصف من رجب خاصّة ويسمّى (أي النّصف من رجب) بالغفيلة لغفلة عامّة النّاس عن فضله، فاذا أردت ذلك وأتيت الصّحن فادخل أي ادخل الرّوضة وكبّر الله تعالى ثلاثاً وقِف على القبر وقُل :\n\n'
                      'اَلسَّلامُ عَلَيْكُمْ يا آلَ اللهِ، اَلسَّلامُ عَلَيْكُمْ يا صَفْوَةَ اللهِ، اَلسَّلامُ عَلَيْكُمْ يا خِيَرَةَ اللهِ مِنْ خَلْقِهِ، اَلسَّلامُ عَلَيْكُمْ يا سادَةَ السّاداتِ، اَلسَّلامُ عَلَيْكُمْ يا لُيُوثَ الْغاباتِ، اَلسَّلامُ عَلَيْكُمْ يا سُفُنَ النَّجاةِ، اَلسَّلامُ عَلَيْكَ يا اَبا عَبْدِاللهِ الْحُسَيْنِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ عِلْمِ الاَْنْبِياءِ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَلسَّلامُ عَلَيْكَ يا وارِثَ آدَمَ صَفْوَةِ اللهِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ نُوح نَبِيِّ اللهِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ اِبْراهيمَ خَليلِ اللهِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ اِسْماعيلَ ذَبيحِ اللهِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ مُوسى كَليمِ اللهِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ عيسى رُوحِ اللهِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ مُحَمَّد حَبيبِ اللهِ، اَلسَّلامُ عَلَيْكَ يَا بْنَ مُحَمَّد الْمُصْطَفى، اَلسَّلامُ عَلَيْكَ يَا بْنَ عَلِيِّ الْمُرْتَضى، اَلسَّلامُ عَلَيْكَ يَا بْنَ فاطِمَةَ الزَّهْراءِ، اَلسَّلامُ '
                      'عَلَيْكَ يَا بْنَ خَديجَةَ الكُبرى، اَلسَّلامُ عَلَيْكَ يا شَهيدُ ابْنَ الشَّهيدِ، اَلسَّلامُ عَلَيْكَ يا قَتيلُ ابْنَ الْقَتيلِ ،اَلسَّلامُ عَلَيْكَ يا وَلِيَّ اللهِ وَابْنَ وَلِيِّهِ، اَلسَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ وَابْنَ حُجَّتِهِ عَلى خَلْقِهِ، اَشْهَدُ اَنَّكَ قَدْ اَقَمْتَ الصَّلاةَ وَآتَيْتَ الزَّكاةَ وَاَمَرْتَ بِالْمَعْرُوفِ وَنَهَيْتَ عَنْ الْمُنْكَرِ، وَرُزِئْتَ بِوالِديكَ وَجاهَدْتَ عَدُوَّكَ، وَاَشْهَدُ اَنَّكَ تَسْمَعُ الْكَلامَ وَتَرُدُّ الْجَوابَ، وَاَنَّكَ حَبيبُ اللهِ وَخَليلُهُ وَنَجيبُهُ وَصَفِيُّهُ وَابْنُ صَفِيِّهِ، يا مَوْلايَ وَابْنَ مَوْلايَ، زُرْتُكَ مُشْتاقاً فَكُنْ لي شَفيعاً اِلى اللهِ يا سَيِّدي وَاَسْتَشْفِعُ اِلَى اللهِ بِجَدِّكَ سَيِّدِ النَّبِيّينَ، وَبِأبيكَ سَيِّدِ الْوَصِيّينَ، وَبِاُمِّكَ فاطِمَةَ سَيِّدَةِ نِساءِ الْعالَمينَ، اَلا لَعَنَ اللهُ قاتِليكَ وَلَعَنَ اللهُ ظالِميكَ وَلَعَنَ اللهُ سالِبيكَ وَمُبْغِضيكَ مِنَ الاْوَّلينَ وَالاْخِرينَ، وَصَلَّى اللهُ عَلى سَيِّدِنا مُحَمِّد وَآلِهِ الطَّيِّبينَ الطّاهِرينَ.\n\n'
                      'ثمّ قبّل القبر الطّاهر وتوجّه الى قبر عليّ بن الحسين (عليهما السلام) فزره وقُل:\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا مَوْلايَ وَابْنَ مَوْلايَ، لَعَنَ اللهُ قاتِليكَ وَلَعَنَ اللهُ ظالِميكَ، اِنّي اَتَقَرَّبُ اِلَى اللهِ بِزِيارَتِكُمْ وَبِمَحَبَّتِكُمْ وَاَبَرَأُ اِلَى اللهِ مِنْ اَعْدائِكُمْ، وَالسَّلامُ عَلَيْكَ يا مَوْلايَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.\n\n'
                      'ثمّ امض الى قبُور الشّهداء رضوان الله عليهم، فاذا بلغتها فقف وقُل:\n\n'
                      'اَلسَّلامُ عَلَى الاَْرْواحِ المُنيخَةِ بِقَبْرِ اَبي عَبْدِاللهِ الْحُسَيْنِ عَلَيْهِ اَلسَّلامُ، اَلسَّلامُ عَلَيْكُمْ يا طاهِرينَ مِنَ الدَّنَسِ، اَلسَّلامُ عَلَيْكُمْ يا مَهْدِيُّونَ، اَلسَّلامُ عَلَيْكُمْ يا اَبْرارَ اللهِ، اَلسَّلامُ عَلَيْكُمْ وَعَلَى الْمَلائِكَةِ الْحافِّينَ بِقُبُورِكُمْ اَجْمَعينَ، جَمَعَنَا اللهُ وَاِيّاكُمْ فِي مُسْتَقَرِّ رَحْمَتِهِ وَتَحْتَ عَرْشِهِ اِنَّهُ اَرْحَمُ الرَّاحِمينَ، وَاَلسَّلامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.\n\n'
                      'ثمّ امض الى حرم العبّاس بن امير المؤمنين (عليهما السلام) فاذا بلغته فقِف على باب قبّته وقُل : سَلامُ اللهِ وَسَلامُ مَلائِكَتِهِ الْمُقَرَّبينَ الى آخر ما سبق من زيارته.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlsalisaAlmo5asasa.screenRoute,
          pushBack: Al2oulaAlmo5asasa.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الثانية المخصصة.mp3',
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
