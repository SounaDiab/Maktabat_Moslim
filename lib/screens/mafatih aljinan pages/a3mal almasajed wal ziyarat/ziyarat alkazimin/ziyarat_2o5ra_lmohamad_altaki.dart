import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alkazimin.dart';
import 'ziyarat_2o5ra_lmohamad_altaki_alsaniya.dart';
import 'ziyarat_2o5ra_lmousa.dart';

class Ziyarat2o5raLmohamadAltaki extends StatefulWidget {
  static String screenRoute = 'ziyarat_2o5ra_lmohamad_altaki_screen';
  const Ziyarat2o5raLmohamadAltaki({super.key});

  @override
  State<Ziyarat2o5raLmohamadAltaki> createState() =>
      _Ziyarat2o5raLmohamadAltakiState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Ziyarat2o5raLmohamadAltakiState
    extends State<Ziyarat2o5raLmohamadAltaki> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_2o5ra_lmohamad_altaki_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_ziyarat_2o5ra_lmohamad_altaki_screen', value);
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
                      .addFavorite(
                          'زيارة أخرى للإمام محمد بن علي التقي (عليهما السلام)',
                          Ziyarat2o5raLmohamadAltaki.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة أخرى للإمام محمد بن علي التقي (عليهما السلام)',
                          Ziyarat2o5raLmohamadAltaki.screenRoute,
                          Ziyarat2o5raLmohamadAltaki.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة أخرى للإمام محمد بن علي التقي (عليهما السلام)',
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
                      'قال السّيد ابن طاوُس في المزار: اذا زُرت الامام موسى الكاظم (عليه السلام) فقِف على قبر الجواد (عليه السلام) وقبّله وقُل :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا اَبا جَعْفَر مُحَمَّدَ بْنَ عَلِيٍّ الْبَرَّ التَّقِيَّ الاِْمامَ الْوَفِيَّ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الرَّضِيُّ الزَّكِيُّ، اَلسَّلامُ عَلَيْكَ يا وَلِيَّ اللهِ، اَلسَّلامُ عَلَيْكَ يا نَجِيَّ اللهِ، اَلسَّلامُ عَلَيْكَ يا سَفيرَ اللهِ، اَلسَّلامُ عَلَيْكَ يا سِرَّ اللهِ، اَلسَّلامُ عَلَيْكَ يا ضِياءَ اللهِ، اَلسَّلامُ عَلَيْكَ يا سَناءَ اللهِ، اَلسَّلامُ عَلَيْكَ يا كَلِمَةَ اللهِ، اَلسَّلامُ عَلَيْكَ يا رَحْمَةَ اللهِ، اَلسَّلامُ عَلَيْكَ اَيُّهَا النُّوُرُ السّاطِعُ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الْبَدْرُ الطّالِعُ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الطَّيِّبُ مِنَ الطَّيِّبينَ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الطّاهِرُ مِنَ الْمُطَهَّرينَ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الاْيَةُ الْعُظْمى، اَلسَّلامُ عَلَيْكَ اَيُّهَا الْحُجَّةُ الْكُبْرى، اَلسَّلامُ عَلَيْكَ اَيُّهَا الْمُطَهَّرُ مِنَ الزَّلاَّتِ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الْمُنَزَّهُ عَنِ الْمُعْضِلاتِ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الْعَلِىُّ عَنْ نَقْصِ الاَْوْصافِ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الرَّضِيُّ عِنْدَ الاَْشْرافِ، اَلسَّلامُ عَلَيْكَ يا عَمُودَ الدّينَ، اَشْهَدُ اَنَّكَ وَلِيَّ اللهِ وَحُجَّتُهُ في اَرْضِهِ وَأنَّكَ جَنْبُ اللهِ وَخيَرَةُ اللهِ وَمُسْتَوْدَعُ عِلْمِ اللهِ وَعِلْمِ الاَْنْبِياءِ، وَرُكْنُ الاْيمانِ وَتَرْجُمانُ الْقُرْآنِ، وَاَشْهَدُ اَنَّ مَنِ اتَّبَعَكَ عَلَى الْحَقِّ وَالْهُدى، وَاَنَّ مَنْ اَنْكَرَكَ وَنَصَبَ لَكَ الْعَداوَةَ عَلَى الضَّلالَةِ وَالرَّدى اَبْرَءُ اِلَى اللهِ وَاِلَيْكَ مِنْهُمْ في الدُّنْيا وَالاْخِرَةِ، وَاَلسَّلامُ عَلَيْكَ ما بَقيتُ وَبَقِيَ اللَّيْلُ وَالنَّهارُ.\n\n'
                      'وقل في الصّلاة عليه :\n\n'
                      'اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَاَهْلِ بَيْتِهِ، وَصَلِّ عَلى مُحَمَّد بْنِ عَلِيِّ الزَّكِيِّ التَّقِيِّ وَالْبَرِّ الْوَفِيِّ وَالْمُهَذَّبِ التَّقِيِّ هادِى الاُْمَّةِ، وَوارِثِ الاَْئِمَّةِ، وَخازِنِ الرَّحْمَةِ، وَيَنْبُوعِ الْحِكْمَةِ، وَقائِدِ الْبَرَكَةِ، وَعَديلِ الْقُرْآنِ في الطّاعَةِ، وَواحِدِ الاَْوْصِياءِ في الاِْخْلاصِ وَالْعِبادَةِ، وَحُجَّتِكَ الْعُلْيا وَمَثَلِكَ الاَْعْلى، وَكَلِمَتِكَ الْحُسْنى الدّاعي اِلَيْكَ، وَالدّالِّ عَلَيْكَ، الَّذي نَصَبْتَهُ عَلَماً لِعِبادِكَ، وَمُتَرْجِماً لِكِتابِكَ، وَصادِعاً بِاَمْرِكَ، وَناصِراً لِدينِكَ، وَحُجَّةً عَلى خَلْقِكَ، وَنُوراً تَخْرُقُ بِهِ الظُّلَمَ، وَقُدْوَةً تُدْرَكُ بِهَا الْهِدايَةُ، وَشَفيعاً تُنالُ بِهِ الْجَنَّةُ، اَللّـهُمَّ وَكَما اَخَذَ في خُشُوعِهِ لَكَ حَظَّهُ، وَاسْتَوْفى مِنْ خَشْيَتِكَ نَصيبَهُ، فَصَلِّ عَلَيْهِ اَضْعافَ ما صَلَّيْتَ عَلى وَلِيٍّ ارْتَضَيْتَ طاعَتَهُ، وَقَبِلْتَ خِدْمَتَهُ، وَبَلِّغْهُ مِنّا تَحِيَّةً وَسَلاماً، وَآتِنا في مُوالاتِهِ مِنْ لَدُنْكَ فَضْلاً وَاِحْساناً وَمَغْفِرَةً وَرِضْواناً، اِنَّكَ ذُو الْمَنِّ الْقَديمِ وَالصَّفْحِ الْجَميلِ.\n\n'
                      'ثمّ صلّ صلاة الزّيارة وقُل بعد السّلام : اَللّـهُمَّ اَنْتَ الرَّبُّ وَاَنَا الْمَرْبُوبُ .. الدعاء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Ziyarat2o5raLmohamadAltakiAlsaniya.screenRoute,
          pushBack: Ziyarat2o5raLmousa.screenRoute,
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
