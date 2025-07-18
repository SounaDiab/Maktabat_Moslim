import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'awza_lil3akrab.dart';
import 'awzat_wadou3a2_lilamrad.dart';

class Dou3a2Al3afiya extends StatefulWidget {
  static String screenRoute = 'dou3a2_al3afiya_screen';
  const Dou3a2Al3afiya({super.key});

  @override
  State<Dou3a2Al3afiya> createState() => _Dou3a2Al3afiyaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Al3afiyaState extends State<Dou3a2Al3afiya> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou3a2_al3afiya_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3a2_al3afiya_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(
          Al2ad3iyaWal3awzatLil2alamWal2askam.screenRoute);
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
                      .addFavorite('دعاء العافية', Dou3a2Al3afiya.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء العافية',
                          Dou3a2Al3afiya.screenRoute,
                          Dou3a2Al3afiya.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء العافية',
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
                      'روى الكفعمي في (مصباح المتهجد) أن من طلب العافية من وجع به فليقل في السجدة الثانية من الركعتين الأوليين من صلاة الليل : ياعَليُّ ياعَظيمُ يارَحْمنُ يارَحيمُ ياسَميعَ الدَّعَواتِ يامُعْطي الخَيراتِ، صَلِّ عَلى مُحَمَّدٍ وَآلِهِ وَاعْطِني مِنْ خَيْرِ الدُّنْيا وَالاخِرَةِ ماأنْتَ أهْلَهُ، وَإصْرِفْ عَنِّي مِنْ شَرِّ الدُّنْيا وَالاخِرَةِ ماأنْتَ أهْلَهُ، وَأَذْهِبْ عَنّي هذا الوَجَعْ، وليسم الوجع: فَإنَّهُ قَدْ غاظَنِي وَأَحْزَنَنِي، وليلح في الدعاء فان العافية تعجل إن شاء الله تعالى.\n\n'
                      'وعن كتاب (عدة الداعي) عن الصادق (عليه السلام) : قل عند العلة وأنت بارز تحت السماء رافع يديك : اللّهُمَّ إنَّكَ عَيَّرْتَ أقْواما في كِتابِكَ فَقُلْتَ : قُلْ ادْعوا الَّذينَ زَعَمْتُمْ مِنْ دونِهِ فَلا يَمْلِكونَ كَشْفَ الضُرِّ عَنْكُمْ وَلاتَحْويلاً فَيامَنْ لا يَمْلِكُ كَشْفَ ضُرِّي وَلا تَحْويلِهِ عَنِّي أحَدْ غَيْرُهُ صَلِّ عَلى مُحَمَّدٍ وَآلِهِ واكْشِفْ ضُرِّي وَحَوِّلْهُ إِلى مَنْ يَدْعو مَعَكَ إلها آخَرَ فَإنّي أشْهَدُ أنْ لا إلهَ غَيْرُكَ. وروي أن أيّما مؤمن كان به مرض أو علة فليمسح بيده موضع الوجع ويقول مخلصا : ونُنَزِّلُ مِنَ القُرْآنِ ماهوَ شِفاءٌ وَرَحْمَةٌ لِلمؤمِنينَ وَلا يَزيدُ الظّالِمينَ إِلاّ خَساراً. فإنّه يعافى مهما كانت العلة. وتصديق ذلك في الآية نفسها : شفاءٌ ورحمة للمؤمنين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AwzatWadou3a2Lilamrad.screenRoute,
          pushBack: AwzaLil3akrab.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء العافية.mp3',
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
