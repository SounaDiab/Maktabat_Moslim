import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al5asa.dart';
import 'a3mal_allayla_alwahida_wal3eshrin.dart';
import 'hadis_2alkisa2.dart';

class A3malAllaylaLatasi3a3ashar extends StatefulWidget {
  static String screenRoute = 'a3mal_allayla_latasi3a_3ashar_screen';
  const A3malAllaylaLatasi3a3ashar({super.key});

  @override
  State<A3malAllaylaLatasi3a3ashar> createState() =>
      _A3malAllaylaLatasi3a3asharState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malAllaylaLatasi3a3asharState
    extends State<A3malAllaylaLatasi3a3ashar> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_a3mal_allayla_latasi3a_3ashar_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_a3mal_allayla_latasi3a_3ashar_screen', value);
  }

      Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Al2a3malAl5asa.screenRoute);
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
                      .addFavorite('اعمال الليلة التاسعة عشر',
                          A3malAllaylaLatasi3a3ashar.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'اعمال الليلة التاسعة عشر',
                          A3malAllaylaLatasi3a3ashar.screenRoute,
                          A3malAllaylaLatasi3a3ashar.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اعمال الليلة التاسعة عشر',
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
              Center(
                child: Text(
                  'بسم الله الرحمن الرحيم',
                  style: TextStyle(
                    fontSize: isTablet ? _fontSizeTablet + 10 : _fontSize,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'أعمال الليلة التاسعة عشرة ما يخصّ كلّ ليلة من ليالي القدر إضافة إلى الأعمال العامة المذكورة فهو كما يلي:',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الأول:',
                  subtitle:
                      'تقول مئة مرة: أَسْتَغْفِرُ اللهَ رَبِّي وَأَتُوبُ إِلَيْهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني:',
                  subtitle:
                      'تقول مئة مرة: اللّهُمَّ، الْعَنْ قَتَلَةَ أَمِيرِ الْمُؤْمِنِينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث:',
                  subtitle: 'دعاء الإمام محمد التقي عليه السلام:\n'
                      'يا ذَا الَّذِي كانَ قَبْلَ كُلِّ شَيْءٍ، ثُمَّ خَلَقَ كُلَّ شَيْءٍ، ثُمَّ يَبْقَى وَيَفْنَى كُلُّ شَيْءٍ. يا ذَا الَّذِي لَيْسَ كَمِثْلِهِ شَيْءٌ، وَيا ذا الَّذِي لَيْسَ فِي السَّماواتِ الْعُلَى، وَلا فِي الْأَرَضِين السُّفْلَى، وَلا فَوْقَهُنَّ، وَلا تَحْتَهُنَّ، وَلا بَيْنَهُنَّ، إِلهٌ يُعْبَدُ غَيْرُهُ. لَكَ الْحَمْدُ حَمْداً لا يَقْوَى عَلَى إِحْصائِهِ إِلّا أَنْتَ، فَصَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، صَلاةً لا يَقْوَى عَلَى إِحْصائِها إِلّا أَنْتَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع: تقول:',
                  subtitle:
                      'اللّهُمَّ، اجْعَلْ فِيما تَقْضِي وَتُقَدِّرُ مِنَ الْأَمْرِ الْمَحْتُومِ، وَفِيما تَفْرُقُ مِنَ الْأَمْرِ الْحَكِيمِ، فِي لَيْلَةِ الْقَدْرِ، وَفِي الْقَضاءِ الَّذِي لا يُرَدُّ وَلا يُبَدَّلُ، أَنْ تَكْتُبَنِي مِنْ حُجَّاجِ بَيْتِكَ الْحَرامِ، الْمَبْرُورِ حَجُّهُمُ، الْمَشْكُورِ سَعْيُهُمُ، الْمَغْفُورِ ذُنُوبُهُمُ، الْمُكَفَّرِ عَنْهُمْ سَيِّئاتُهُمْ، وَاجْعَلْ فِيما تَقْضِي وَتُقَدِّرُ، أَنْ تُطِيلَ عُمْرِي وَتُوَسِّعَ عَلَيَّ فِي رِزْقِي، وَتَفْعَلَ بِي كَذا وَكَذا. ويسأل حاجته عوض هذه الكلمة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: A3malAllaylaAlwahidaWal3eshrin.screenRoute,
          pushBack: Hadis2alkisa2.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اعمال الليلة التاسعة عشر.mp3',
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
