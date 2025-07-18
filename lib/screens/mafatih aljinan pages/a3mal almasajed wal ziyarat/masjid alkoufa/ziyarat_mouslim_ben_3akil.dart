import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'mounajat_amir_almo2minin.dart';
import 'ziyarat_hani_ben_3orwa.dart';

class ZiyaratMouslimBen3akil extends StatefulWidget {
  static String screenRoute = 'ziyarat_mouslim_ben_3akil_screen';
  const ZiyaratMouslimBen3akil({super.key});

  @override
  State<ZiyaratMouslimBen3akil> createState() => _ZiyaratMouslimBen3akilState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratMouslimBen3akilState extends State<ZiyaratMouslimBen3akil> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_mouslim_ben_3akil_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_mouslim_ben_3akil_screen', value);
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
                          'زيارة مسلم بن عقيل (قدس الله روحه ونور ضريحه)',
                          ZiyaratMouslimBen3akil.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة مسلم بن عقيل (قدس الله روحه ونور ضريحه)',
                          ZiyaratMouslimBen3akil.screenRoute,
                          ZiyaratMouslimBen3akil.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة مسلم بن عقيل (قدس الله روحه ونور ضريحه)',
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
                      'فاذا فرغت من أعمال جامع الكوفة فامض الى قبر مسلم بن عقيل رضوان الله عليه وقِف عنده وقُل :\n\n'
                      'اَلْحَمْدُ للهِ الْمَلِكِ الْحَقِّ الْمُبينِ، الْمُتَصاغِرِ لِعَظَمَتِهِ جَبابِرَةُ الطّاغينَ، الْمُعْتَرِفِ بِرُبُوبِيَّتِهِ جَميعُ اَهْلِ السَّماواتِ وَالاَْرَضينَ، الْمُقِرِّ بِتَوْحيدِهِ سائِرُ الْخَلْقِ اَجْمَعينَ، وَصَلَّى اللهُ عَلى سَيِّدِ الاَْنامِ وَاَهْلِ بَيْتِهِ الْكِرامِ، صَلاةً تَقَرُّ بِها اَعْيُنُهُمْ، وَيَرْغَمُ بِها اَنْفُ شانِئِهِمْ مِنَ الْجِنِّ وَالاِْنْسِ اَجْمَعينَ، سَلامُ اللهِ الْعِليِّ الْعَظيمِ وَسَلامُ مَلائِكَتِهِ الْمُقَرَّبينَ وَاَنْبِيائِهِ الْمُرْسَلينَ وَاَئِمَّتِهِ الْمُنْتَجَبينَ وَعِبادِهِ الصّالِحينَ وَجَميعِ الشُّهَداءِ وَالصِّدّيقينَ، وَالزّاكِياتُ الطَّيِّباتُ فيـما تَغْتَدي وَتَرُوحُ عَلَيْكَ يا مُسْلِمَ بْنَ عَقيلِ بْنِ أبي طالِب وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَشْهَدُ اَنَّكَ اَقَمْتَ الصَّلاةَ، وَآتَيْتَ الزَّكاةَ، وَاَمَرْتَ بِالْمَعْرُوفِ، وَنَهَيْتَ عَنْ الْمُنْكَرِ، وَجاهَدْتَ فِي اللهِ حَقَّ جِهادِهِ، وَقُتِلْتَ عَلى مِنْهاجِ الُْمجاهِدينَ في سَبيلِهِ حَتّى لَقِيْتَ اللهَ عَزَّوَجَلَّ وَهُوَ عَنْكَ راض، وَاَشْهَدُ اَنَّكَ وَفَيْتَ بِعَهْدِ اللهِ، وَبَذَلْتَ نَفْسَكَ في نُصْرَةِ حُجَّةِ اللهِ وَابْنِ حُجَّتِهِ حَتّى اَتاكَ الْيَقينُ، اَشْهَدُ لَكَ بِالتَّسْليمِ وَالْوَفاءِ وَالنَّصيحَةِ لِخَلَفِ النَّبِيِّ الْمُرْسَلِ، وَالسِّبْطِ الْمُنْتَجَبِ، وَالدَّليلِ الْعالِمِ وَالْوَصِيِّ الْمُبَلِّغِ، '
                      'وَالْمَظْلُومِ الْمُهْتَضَمِ، فَجَزاكَ اللهُ عَنْ رَسُولِهِ وَعَنْ اَميرِ الْمُؤْمِنينَ وَعَنِ الْحَسَنِ وَالْحُسَيْنِ اَفْضَلَ الْجَزاءَ بِما صَبَرْتَ وَاحْتَسَبْتَ وَاَعَنْتَ فَنِعْمَ عُقْبَى الدّارِ، لَعَنَ اللهُ مَنْ قَتَلَكَ، وَلَعَنَ اللهُ مَنْ اَمَرَ بِقَتْلِكَ، وَلَعَنَ اللهُ مَنْ ظَلَمَكَ، وَلَعَنَ اللهُ مَنِ افْتَرى عَلَيْكَ، وَلَعَنَ اللهُ مَنْ جَهِلَ حَقَّكَ وَاسْتَخَفَّ بِحُرْمَتِكَ، وَلَعَنَ اللهُ مَنْ بايَعَكَ وَغَشَّكَ وَخَذَلَكَ وَاَسْلَمَكَ، وَمَنْ اَلَبَّ عَلَيْكَ وَمَنْ لَمْ يُعِنْكَ، اَلْحَمْدُ للهِ الَّذي جَعَلَ النّارَ مَثْواهُمْ وَبِئْسَ الْوِرْدُ الْمَوْرُودُ، اَشْهَدُ اَنَّكَ قُتِلْتَ مَظْلُوماً، وَاَنَّ اللهَ مُنْجِزٌ لَكُمْ ما وَعَدَكُمْ جِئْتُكَ زائِراً عارِفاً بِحَقِّكُمْ مُسَلِّماً لَكُمْ تابِعاً لِسُنَّتِكُمْ، وَنُصْرَتي لَكُمْ مُعَدَّةٌ حَتّى يَحْكُمَ اللهُ وَهُوَ خَيْرُ الْحاكِمينَ، فَمَعَكُمْ مَعَكُمْ لا مَعَ عَدُوِّكُمْ، صَلَواتُ اللهِ عَلَيْكُمْ وَعَلى اَرْواحِكُمْ وَاَجْسادِكُمْ وَشاهِدِكُمْ وَغائِبِكُمْ، وَالسَّلامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، قَتَلَ اللهُ اُمَّةً قَتَلَتْكُمْ بِالاَْيْدي وَالاَْلْسُنِ.\n\n'
                      'وجَعَلَ هذه الكلمات في المزار الكبير بمنزلة الاستئذان، وقال : بعد ذِكرِها : ثمّ ادخل وادنُ من القبر وعلى الرّواية السّابقة أشِر الى الضّريح ثمّ قُل:\n\n'
                      'اَلسَّلامُ عَلَيْكَ اَيُّهَا الْعَبْدُ الصّالِحُ الْمُطيعُ للهِ وَلِرَسُولِهِ وَلاَِميرِالْمُؤْمِنينَ وَالْحَسَنِ وَالْحُسَيْنِ عَلَيْهِمُ السَّلامُ، الْحَمْدُ لله وَسَلامٌ عَلى عِبادِهِ الَّذينَ اصْطَفى مُحَمَّد وَآلِهِ، وَالسَّلامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ وَمَغْفِرَتُهُ وَعَلى رُوحِكَ وَبَدَنِكَ، اَشْهَدُ اَنَّكَ مَضَيْتَ عَلى مامَضى عَلَيْهِ الْبَدْرِيُّونَ الُْمجاهِدُونَ في سَبيلِ اللهِ، الْمُبالِغُونَ في جِهادِ اَعْدائِهِ وَنُصْرَةِ اَوْلِيائِهِ، فَجَزاكَ اللهُ اَفْضَلَ الْجَزاءِ، وَاَكْثَرَ الْجَزاءِ، وَاَوْفَرَ جَزاءِ اَحَد مِمَّنْ وَفى بِبَيْعَتِهِ، وَاسْتَجابَ لَهُ دَعْوَتَهُ، وَاَطاعَ وُلاةَ اَمْرِهِ ،اَشْهَدُ اَنَّكَ قَدْ بالَغْتَ فِي النَّصيحَةِ وَاَعْطَيْتَ غايَةَ الَْمجْهُودِ حَتّى بَعَثَكَ اللهُ فِي الشُّهَداءِ، وَجَعَلَ رُوحَكَ مَعَ اَرْواحِ السُّعَداءِ، وَاَعْطاكَ مِنْ جِنانِهِ اَفْسَحَها مَنْزِلاً، وَاَفْضَلَها غُرَفاً، وَرَفَعَ ذِكْرَكَ فِي الْعِليّينَ، وَحَشَرَكَ مَعَ النَّبيّينَ وَالصِّدّيقينَ وَالشُّهَداءِ وَالصّالِحينَ وَحَسُنَ اوُلئِكَ رَفيقاً، اَشْهَدُ اَنَّكَ لَمْ تَهِنْ وَلَمْ تَنْكُلْ، وَاَنَّكَ قَدْ مَضَيْتَ عَلى بَصيرَة مِنْ اَمْرِكَ مُقْتَدِياً بِالْصّالِحينَ وَمُتَّبِعاً لِلنَّبيّينَ، فَجَمَعَ اللهُ بَيْنَنا وَبَيْنَكَ وَبَيْنَ رَسُولِهِ وَاَوْلِيائِهِ في مَنازِلِ الُْمخْبِتينَ فَاِنَّهُ اَرْحَمُ الرّاحِمينَ.\n\n'
                      'ثمّ صلّ ركعتين في جانب الرّأس واهدها الى جنابه ثمّ قل : اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَلا تَدَعْ لى ذَنْباً وهذا هو الدّعاء الّذي يدعى به في مرقد العبّاس وسيأتي ذكره فاذا شئت أن تودعه فودّعه بالوداع الّذي سيذكر في ذيل زيارة العبّاس.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: ZiyaratHaniBen3orwa.screenRoute,
        pushBack: MounajatAmirAlmo2minin.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة مسلم بن عقيل.mp3',
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
