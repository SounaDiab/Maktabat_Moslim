import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'a3mal_bait_altast.dart';
import 'a3mal_jami3_alkoufa.dart';

class A3malDikatAlkada2WbaitAltast extends StatefulWidget {
  static String screenRoute = 'a3mal_dikat_alkada2_wbait_altast_screen';
  const A3malDikatAlkada2WbaitAltast({super.key});

  @override
  State<A3malDikatAlkada2WbaitAltast> createState() =>
      _A3malDikatAlkada2WbaitAltastState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malDikatAlkada2WbaitAltastState
    extends State<A3malDikatAlkada2WbaitAltast> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_a3mal_dikat_alkada2_wbait_altast_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_a3mal_dikat_alkada2_wbait_altast_screen', value);
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
                      .addFavorite('أعمال دكة القضاء وبيت الطست',
                          A3malDikatAlkada2WbaitAltast.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'أعمال دكة القضاء وبيت الطست',
                          A3malDikatAlkada2WbaitAltast.screenRoute,
                          A3malDikatAlkada2WbaitAltast.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال دكة القضاء وبيت الطست',
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
                      'واعلم انّ دكّة القضاء قد كانت بناءً في جامع الكوفة يشبه الحانوت يجلس عليها امير المؤمنين (عليه السلام) للقضاء والحكم، وكانت هُنالك اسطوانة قصيرة كتب عليها الاية اِنَّ اللهَ يَأمُرُ بِالْعَدْلِ وَالاِحْسانِ، وَبيت الطّست هو المكان الذي برزت منه معجزة لامير المؤمنين (عليه السلام) في بنت عزباء كانت قد غاصت في ماء فيهِ العلق فولجت في جوفها فنمت وكبرت ممّا امتصه من الدّم، فَعَلا بذلك بطن البنت فحسبها اخوتها حبلى، فراموا قتلها فأتوا أمير المؤمنين (عليه السلام) ليحكم بينهم، فأمر بستار فضرب في جانِب من المسجد وجعلت البنت خلفه وأمر بقابلة الكوفة ففحصتها واعلنت رأيها ، فقالت : يا أمير المؤمنين انّها حبلى تحمل جنيناً في جوفها، فأمر (عليه السلام) بطست من الحمأة فأجلست البنت عليه فاحسّت العلقة بذفر الحمأة فانسلّت من جوفها نحو الطّست، وفي بعض الرّوايات انّه (عليه السلام) مدّ يده فأتى بقطع من الثّلج من جبال الشّام وجعله عند الطّست فانسلّت العلقة، واعلم '
                      'ايضاً انّ المشهور في ترتيب اعمال جامع الكوفة هو أن تتلو أعمال وسط المسجد اعمال الاسطوانة الرّابعة فتؤخّر اعمال دكّة القضا وبيت الطّست عن جميع اعمال المسجد وتؤدّي عند الفراغ من أعمالِ دكّة الصّادق (عليه السلام)، ونحن نجاري في الترتيب السّيد ابن طاووس في مصباح الزّائر والعلامة المجلسي في البحار والشّيخ خضر في المزار، وأمّا من تابع المشهور فليؤخّر اعمال دكّة القضاء وبيت الطّست عن الكلّ وليأتها بعد أعمال دكّة الصّادق (عليه السلام)، وبالجملة نقول ثمّ امض الى دكّة القضا فصلّ عليها ركعتين تقرأ فيها بعد الحمد ما أردت من السّور فاذا فرغت منها وسبّحت تسبيح الزّهراء (عليها السلام) فقُل :\n\n'
                      'يا مالِكي وَمُمَلِّكي وَمُتَغَمِّدي بِالنِّعَمِ الْجِسامِ مِنْ غَيْرِ اسْتِحْقاق، وَجْهي خاضِعٌ لِما تَعْلُوهُ الاَْقْدامُ لِجَلالِ وَجْهِكَ الْكَريمِ، لا تَجْعَلْ هذِهِ الشِّدَّةَ وَلا هذِهِ الِْمحْنَةَ مُتَّصِلَةً بِاِسْتئصالِ الشَّأفَةِ وَامْنَحْني مِنْ فَضْلِكَ ما لَمْ تَمْنَحْ بِهِ اَحَداً مِنْ غَيْرِ مَسْأَلَة، اَنْتَ الْقَديمُ الاَْوَّلُ الَّذي لَمْ تَزَلْ وَلا تَزالُ، صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاغْفِرْ لي وَارْحَمْني وَزَكِّ عَمَلي، وَبارِكْ لي في اَجَلي، وَاجْعَلْني مِنْ عُتَقائِكَ وَطُلَقائِكَ مِنَ النّارِ بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: A3malBaitAltast.screenRoute,
          pushBack: A3malJami3Alkoufa.screenRoute,
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
