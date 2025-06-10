import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'douaa_lilkhalas_men_alkatl_page.dart';
import 'rokaat_aljayb_lilimam_alrida_aalaih_alsalam_page.dart';

class AawzaYataawazBihaAalaAlaadaaPage extends StatefulWidget {
  static String screenRoute = 'aawzayataawazbihaaalaalaadaa_screen';
  AawzaYataawazBihaAalaAlaadaaPage({super.key});

  @override
  State<AawzaYataawazBihaAalaAlaadaaPage> createState() =>
      _AawzaYataawazBihaAalaAlaadaaPageState();
}

class _AawzaYataawazBihaAalaAlaadaaPageState
    extends State<AawzaYataawazBihaAalaAlaadaaPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_aawzayataawazbihaaalaalaadaa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_aawzayataawazbihaaalaalaadaa_screen', value);
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
          .pushReplacementNamed(HerzAlmoujahidinHomeScreen.screenRoute);
      return false;
    }
  }

  double _fontSize = 18;
  double _fontSizeTablet = 30;
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
                      .addFavorite('عوذة يتعوذ بها على الأعداء',
                          AawzaYataawazBihaAalaAlaadaaPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'عوذة يتعوذ بها على الأعداء',
                          AawzaYataawazBihaAalaAlaadaaPage.screenRoute,
                          AawzaYataawazBihaAalaAlaadaaPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'عوذة يتعوذ بها على الأعداء',
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
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 10,
              right: 30,
              left: 30,
              bottom: 10,
            ),
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListOfNineVerses(
                    title: 'تعريف:',
                    subtitle:
                        'ذكرها السيد ابن طاوس في المهج، وقال: عوذة وجدت في ثياب الإمام الرضا (ع) لما مات، وفي آخرها أسماء الله عزَّ وجلَّ.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'آثاره:',
                    subtitle:
                        'عن الرضا (ع) قال: إن آباعه (ع) كانوا يقولون: إن جدهم علياً (ع) كان يتعوذ بها من الأعداء وكانت معلَّقة في قراب سيفه وفي آخرها أسماء الله عزَّ جلَّ وإنه (ع) شرط على ولده وأهله أن لا يدعوا بها على أحد فإن من دعا بها لم يحجب دعاؤه عن الله لَّ اسمه وتقدَّست أسماؤه.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Column(
                  children: [
                    ListOfNineVerses(
                      title: 'العوذة:',
                      subtitle:
                          'اللهم بك أستفتح وبك أستنجح وبمحمد صلّى الله عليه وآله أتوجه، اللهم سهِّل لي حُزونته وكل حُزونة وذلِّل لي صعوبته وكل صعوبة واكفني مؤونته وكلَّ كؤونة وارزقني معروفه ووُدَّه واصرف عنّي ضرَّه ومعرَّته إنك تمحو ما تشاء وتُثْبِتُ وعندك أم الكتاب، ألا إن أولياء الله لا خوفٌ عليهم ولا هم يحزنون إنا رُسُلُ ربِّك لن يصلوا إليك، طه حم لا يبصرون وجعلنا في أعناقهم أغلالاً فهي إلى الأذقان فهم مقّمحون، وجعلنا من بين أيديهم سداً ومن خلفهم سداً فأغشيناهم فهم لا يبصرون أولئك الذين طبع الله على قلوبهم وسمعهم وأبصارهم وأولئك هم الغافلون، لا جَرَمَ أن الله يعلم نا يسرون وما يعلنون فسيكفيكهم الله وهو السميع العليم وتراهم ينظرون إليك وهم لا يبصرون صمّّ بكمٌ عميٌ فهم لا يعقلون طسم تلك آيات الكتاب المبين لعلّك باخعٌ نفسك ألا يكونوا مؤمنين إن نشأ تُنَّزِلْ عليهم من السماء آية فظلَّتْ أعماقهم لها خاضعين.\n'
                          'الأسماء: اللهم إني أسألك بالعين التي لا تنام، وبالعِزِّ الذي لا يرام، وبالمُلك الذي لا يُضام، وبالنور الذي لا يطفى، وبالوجه الذي لا يبلى، وبالحياة التي لا تموت، وبالصَّمديَّة التي لا تقهر، وبالدَّيموميَّة التي لا تفنى، وبالإسم الذي لا يُرَدُّ، والرُّبوبيّة التي لا تستذلُّ، أن تصلِّي على محمدٍ وآل محمد وأن تفعل بي، كذا وكذا.',
                      weight: FontWeight.w600,
                      size: isTablet ? _fontSizeTablet : _fontSize,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '(وتَذكر حاجتك تُقضى إن شاء الله تعالى.)',
                        style: TextStyle(
                          fontSize:
                              isTablet ? _fontSizeTablet - 2 : _fontSize - 2,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: DouaaLilkhalasMenAlkatlPage.screenRoute,
          pushBack: RokaatAljaybLilimamAlridaAalaihAlsalamPage.screenRoute,
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
