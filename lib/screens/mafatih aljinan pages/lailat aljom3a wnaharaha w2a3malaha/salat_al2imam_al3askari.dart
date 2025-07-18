import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../lailat_aljom3a_wnaharaha_w2a3malaha.dart';
import 'salat_2imam_almahdi.dart';
import 'salat_al2imam_alhadi.dart';

class SalatAl2imamAl3askari extends StatefulWidget {
  static String screenRoute = 'salat_al2imam_al3askari_screen';
  const SalatAl2imamAl3askari({super.key});

  @override
  State<SalatAl2imamAl3askari> createState() => _SalatAl2imamAl3askariState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAl2imamAl3askariState extends State<SalatAl2imamAl3askari> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_salat_al2imam_al3askari_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_al2imam_al3askari_screen', value);
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
          .pushReplacementNamed(LailatAljom3aWnaharahaW2a3malaha.screenRoute);
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
                    LailatAljom3aWnaharahaW2a3malaha.screenRoute);
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
                      .addFavorite('صلاة الإمام الحسن العسكري ودعاؤه (ع)',
                          SalatAl2imamAl3askari.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الإمام الحسن العسكري ودعاؤه (ع)',
                          SalatAl2imamAl3askari.screenRoute,
                          SalatAl2imamAl3askari.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الإمام الحسن العسكري ودعاؤه (ع)',
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
                  title: 'صلاة الإمام الحَسن العسكري (عليه السلام)',
                  subtitle:
                      'أربع ركعات الرّكعتان الاوليان بالحمد مرّة واذا زلزلت خمس عشرة مرّة والاخيرتان كلّ ركعة بالحمد مرّة والاخلاص خمس عشرة مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'دُعاء الإمام الحَسن العسكري (عليه السلام)',
                  subtitle:
                      'َللّـهُمَّ اِنّي أَسْأَلُكَ بِاَنَّ لَكَ الْحَمْدَ لا اِلـهَ إلاّ اَنْتَ الْبَدىءُ قَبْلَ كُلِّ شَيء وَاَنْتَ الْحَيُّ الْقَيُّومُ وَلا اِلـهَ إلاّ اَنْتَ الَّذي لا يُذِلُّكَ شَيءٌ وَاَنْتَ كُلَّ يَوْم في شَاْن لا اِلـهَ إلاّ اَنْتَ خالِقُ ما يُرى وَما لا يُرى الْعالِمُ بِكُلِّ شَيء بِغَيْرِ تَعْليم أَسْأَلُكَ بالائِكَ وَنَعْمائِكَ بِاَنَّكَ اللهُ الرَّبُ الْواحِدُ لا اِلـهَ إلاّ اَنْتَ الرَّحْمنُ الرَّحيمُ وَأَسْئألُكَ بِاَنَّكَ اَنْتَ اللهُ لا اِلـهَ إلاّ اَنْتَ الْوِتْرُ الْفَرْدُ الاَحَدُ الصَّمَدُ الَّذي لَمْ يَلِدْ وَلَمْ يُولَدْ وَلَمْ يَكُنْ لَهُ كُفُواً اَحَدٌ وَأَسْأَلُكَ بِاَنَّكَ اللهُ لا اِلـهَ إلاّ اَنْتَ اللَّطيفُ الْخَبيرُ الْقائِمُ عَلى كُلِّ نَفْس بِما كَسَبَتْ الرَّقيبُ الْحَفيظُ، وَأَسْأَلُكَ بِاَنَّكَ اللهُ الاَوَّلُ قَبْلَ كُلِّ شَيء وَالاخِرُ بَعْدَ كُلِّ شَيء وَالْباطِنُ دُونَ كُلِّ شَيء الضّارُّ النّافِعُ الْحَكيمُ الْعَليمُ وَأَسْأَلُكَ بِاَنَّكَ اَنْتَ اللهُ لا اِلـهَ إلاّ اَنْتَ الْحَيُّ الْقَيُّومُ الْباعِثُ الْوارِثُ الْحَنّانُ الْمَنّانُ بَديعُ السَّماواتِ والاَرْضِ ذُو الْجَلالِ وَالاِكْرامِ وَذُو الطَّولِ وَذُو الْعِزَّةِ وَذُو السُّلْطانِ لا اِلـهَ إلاّ اَنْتَ اَحَطْتَ بِكُلِّ شَيء عِلْماً وَاَحْصَيْتَ كُلَّ شَيء عَدَداً صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: Salat2imamAlmahdi.screenRoute,
        pushBack: SalatAl2imamAlhadi.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/صلاة الامام العسكري.mp3',
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
