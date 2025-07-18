import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alkazimin.dart';
import 'fi_fadl_ziyarat_lkazimin.dart';
import 'ziyarat_2o5ra_lmohamad_altaki.dart';

class Ziyarat2o5raLmousa extends StatefulWidget {
  static String screenRoute = 'ziyarat_2o5ra_lmousa_screen';
  const Ziyarat2o5raLmousa({super.key});

  @override
  State<Ziyarat2o5raLmousa> createState() => _Ziyarat2o5raLmousaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Ziyarat2o5raLmousaState extends State<Ziyarat2o5raLmousa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ziyarat_2o5ra_lmousa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_2o5ra_lmousa_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiyaratAlkazimin.screenRoute);
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
                      .addFavorite('زيارة أخرى لموسى بن جعفر (عليه السلام)',
                          Ziyarat2o5raLmousa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة أخرى لموسى بن جعفر (عليه السلام)',
                          Ziyarat2o5raLmousa.screenRoute,
                          Ziyarat2o5raLmousa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة أخرى لموسى بن جعفر (عليه السلام)',
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
                      'قال المفيد والشّهيد ومحمّد ابن المشهدي : اذا أردت زيارته ببغداد فاغتسل للزّيارة واقصد المشهد وقِف على الباب الشّريف واستأذن ثمّ ادخُل وأنت تقول :\n\n'
                      'بِسْمِ اللهِ وَبِاللهِ وَفي سَبيلِ اللهِ وَعَلى مِلَّةِ رَسُولِ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ وَالسَّلامُ عَلى اَوْلِياءِ اللهِ، ثمّ امضِ حتّى تستقبل قبر موسى بن جعفر (عليهما السلام) فاذا وقفت عند قبره فقُل :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا نُورَ اللهِ في ظُلُماتِ الاَْرْضِ، اَلسَّلامُ عَلَيْكَ يا وَلِيَّ اللهِ، اَلسَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ، اَلسَّلامُ عَلَيْكَ يا بابَ اللهِ، اَشْهَدُ اَنَّكَ اَقَمْتَ الصَّلاةَ، وَآتَيْتَ الزَّكاةَ، وَاَمَرْتَ بِالْمَعْرُوفِ وَنَهَيْتَ عَنِ الْمُنْكَرِ، وَتَلَوْتَ الْكِتابَ حَقَّ تِلاوَتِهِ، وَجاهَدْتَ في اللهِ حَقَّ جِهادِهِ، وَصَبَرْتَ عَلَى الاَْذى في جَنْبِهِ مُحْتَسِباً، وَعَبَدْتَهُ مُخْلِصاً حَتّى أتاكَ الْيَقينُ، اَشْهَدُ اَنَّكَ اَوْلى بِاللهِ وِبِرَسُولِهِ وَاَنَّكَ اِبْنُ رَسُولِ اللهِ حَقّاً اَبْرَأُ اِلَى اللهِ مِنْ اَعْدائِكَ، وَاَتَقَرَّبُ اِلَى اللهِ بِمُوالاتِكَ، اَتَيْتُكَ يا مَوْلايَ عارِفاً بِحَقِّكَ، مُوالِياً لاَِوْلِيائِكَ، مُعادِياً لاَِعْدائِكَ، فَاشْفَعْ لي عِنْدَ رَبِّكَ.\n\n'
                      'ثمّ انكبّ على القبر وقبّله وضَع خدّيك عليه وتحوّل الى عند الرّأس وقِف وقُل : اَلسَّلامُ عَلَيْكَ يا بْنَ رَسُولِ اللهِ، اَشْهَدُ اَنَّكَ صادِقٌ اَدَّيْتَ ناصِحاً وَقُلْتَ اَميناً وَمَضَيْتَ شَهيداً، لَمْ تُؤْثِرْ عَمىً عَلَى الْهُدى وَلَمْ تَمِلْ مِنْ حَقٍّ اِلى باطِل، صَلَّى اللهُ عَلَيْكَ وَعَلى آبائِكَ وَاَبْنائِكَ الطّاهِرينَ، ثمّ قبّل القبر وصلّ ركعتين وصلّ بعدهما ما أحببت واسجُد وقُل : اَللّـهُمَّ اِلَيْكَ اعْتَمَدْتُ وَاِلَيْكَ قَصَدْتُ وَبِفَضْلِكَ رَجَوْتُ، وَقَبْرَ اِمامِيَ الَّذي اَوْجَبْتَ عَلَيَّ طاعَتَهُ زُرْتُ، وَبِهِ اِلَيْكَ تَوَسَّلْتُ، فَبِحَقِّهِمُ الَّذي اَوْجَبْتَ عَلى نَفْسِكَ اغْفِرْ لي وَلِوالِدَيَّ وَلِلْمُؤْمِنينَ يا كَريمُ، ثمّ أقلب خدك الايمن وقل: الّلهمَّ قَدْ عَلِمتَ حَوائِجِي فَصَلِّ على مُحَمَّد وآلِ مُحَمَّد وَاقْضِها، ثُمَّ أقلب خدّك الايسر وقُل : اَللّـهُمَّ قَدْ اَحْصَيْتَ ذُنُوبي فَبِحَقِّ مُحَمَّد وَآلِ مُحَمَّد صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاغْفِرْها وَتَصَدَّقْ عَلَيَّ بِما اَنْتَ اَهْلُهُ، ثمّ عُد الى السّجود وقُل : شُكْراً شُكْراً مائة مرّة، ثمّ ارفع رأسك من السّجود وادعُ بما شئت لمن شئت وأحببت.\n\n'
                      'أقول : قد أورد الجليل السّيد عليّ بن طاوُس (رضي الله عنه) في كتاب مصباح الزّائر عند ذكر بعض زيارات الامام مُوسى بن جعفر (عليهما السلام) صلاة يصلّى بها عليه تحوي ذكر نبذ من فضائله ومناقبه وعباداته ومصائبه ينبغي للزّائر أن لا يفوته فضل الصّلاة بها عليه وهي :\n\n'
                      'اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَاَهْلِ بَيْتِهِ، وَصَلِّ عَلى مُوسَى بْنِ جَعْفَر وَصِيِّ الاَْبْرارِ، وَاِمامِ الاَْخْيارِ، وَعَيْبَةِ الاَْنْوارِ، وَوارِثِ السَّكِينَةِ وَالْوَقارِ وَالْحِكَمِ وَالاْثارِ الَّذي كانَ يُحْيِي اللَّيْلَ بِالسَّهَرِ اِلَى السَّحَرِ بِمُواصَلَةِ الاْسْتِغْفارِ، حَليفِ السَّجْدَةِ الطَّويلَةِ، وَالدُّمُوعِ الْغَزيرَةِ، وَالْمُناجاةِ الْكَثيرَةِ، وَالضَّراعاتِ الْمُتَّصِلَةِ، وَمَقَرِّ النُّهى وَالْعَدْلِ وَالْخَيْرِ وَالْفَضْلِ وَالنَّدى وَالْبَذْلِ، وَمَألَفِ الْبَلْوى وَالصَّبْرِ، وَالْمُضْطَهَدِ بِالظُّلْمِ، وَالْمَقْبُورِ بِالْجَوْرِ، وَالْمُعَذَّبِ في قَعْرِ السُّجُونِ، وَظُلَمِ الْمَطاميرِ ذِي السّاقِ الْمَرْضُوضِ بِحَلَقِ الْقُيُودِ، وَالْجِنازَةِ الْمُنادى عَلَيْها بِذُلِّ الاِْسْتِخْفافِ، وَالْوارِدِ عَلى جَدِّهِ الْمُصْطَفى وَاَبيهِ الْمُرْتَضى وَاُمِّهِ سَيِّدَةِ النِّساءِ بِإرْث مَغْصُوب '
                      'وَوَلاء مَسْلُوب وَاَمْر مَغْلُوب وَدَم مَطْلُوب وَسَمٍّ مَشْرُوب، اَللّـهُمَّ وَكَما صَبَرَ عَلى غَليظِ الِْمحَنِ وَتَجَرَّعَ غُصَصَ الْكُرَبِ، وَاسْتَسْلَمَ لِرِضاكَ وَاَخْلَصَ الطّاعَةَ لَكَ، وَمَحَضَ الْخُشُوعَ، وَاسْتَشْعَرَ الْخُضُوعَ، وَعادَى الْبِدْعَةَ وَاَهْلَها وَلَمْ يَلْحَقْهُ في شَيء مِنْ اَوامِرِكَ وَنَواهيكَ لَوْمَةُ لائِم، صَلِّ عَلَيْهِ صَلاةً نامِيَةً مُنْيفَةً زاكِيَةً تُوجِبُ لَهُ بِها شَفاعَةَ اُمَم مِنْ خَلْقِكَ، وَقُرُون مِنْ بَراياكَ، وَبَلِّغْهُ عَنّا تَحِيَّةً وَسَلاماً، وَآتِنا مِنْ لَدُنْكَ في مُوالاتِهِ فَضْلاً وَاِحْساناً وَمَغْفِرَةً وَرِضْواناً، اِنَّكَ ذُوا الْفَضْلِ الْعَميمِ، وَالتَّجاوُزِ الْعَظيمِ، بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.\n\n'
                      'وأمّا الزّيارة الخاصّة بالامام محمّد التّقي (عليه السلام) فقد قال فيها الاجلاّء الثّلاثة ايضاً ثمّ توجّه نحو قبر أبي جعفر محمّد بن عليّ الجواد (عليهما السلام) وهو بظهر جدّه (عليه السلام) فاذا وقفت عليه فقُل :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا وَلِيَّ اللهِ، اَلسَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ، اَلسَّلامُ عَلَيْكَ يا نُورَ اللهِ في ظُلُماتِ الاَْرْضِ، اَلسَّلامُ عَلَيْكَ يَا بْنَ رَسُولِ اللهِ، اَلسَّلامُ عَلَيْكَ وَعَلى آبائِكَ، اَلسَّلامُ عَلَيْكَ وَعَلى اَبْنائِكَ، اَلسَّلامُ عَلَيْكَ وَعَلى اَوْلِيائِكَ، اَشْهَدُ اَنَّكَ قَدْ اَقَمْتَ الصَّلاةَ، وَآتَيْتَ الزّكاةَ، وَاَمَرْتَ بِالْمَعْرُوفِ، وَنَهَيْتَ عَنِ الْمُنْكَرِ، وَتَلَوْتَ الْكِتابَ حَقَّ تِلاوَتِهِ، وَجاهَدْتَ في اللهِ حَقَّ جِهادِهِ، وَصَبَرْتَ عَلَى الاْذى في جَنْبِهِ حَتّى أتاكَ الْيَقينُ، اَتَيْتُكَ زائِراً عارِفاً بِحَقِّكَ مُوالِياً لاَِوْلِيائِكَ مُعادِياً لاَِعْدائِكَ فَاشْفَعْ لي عِنْدَ رَبِّكَ.\n\n'
                      'ثمّ قبّل القبر وضَع خدّيك عليه، ثمّ صلّ ركعتين للزّيارة وصلّ بعدهما ما شئت ثمّ اسجد وقُل : اِرْحَمْ مَنْ اَساءَ وَاقْتَرَفَ وَاسْتَكانَ وَاعْتَرَفَ، ثمّ اقلب خدّك الايمن وقُل : اِنْ كُنْتُ بِئْسَ الْعَبْدُ فَاَنْتَ نِعْمَ الرَّبُّ ثمّ اقلب خدّك الايسر وقُل : عَظُمَ الذَّنْبُ مِنْ عَبْدِكَ فَلْيَحْسُنِ الْعَفْوُ مِنْ عِنْدِكَ يا كَريمُ، ثمّ عُد الى السّجود وقُل : شُكْراً شُكْراً مائة مرّة ثمّ انصرف.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Ziyarat2o5raLmohamadAltaki.screenRoute,
          pushBack: FiFadlZiyaratLkazimin.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة اخرى لموسى.mp3',
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
