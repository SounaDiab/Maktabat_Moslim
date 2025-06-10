import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'aawza_yataawaz_biha_aala_alaadaa_page.dart';
import 'alhayakel_sabea_page.dart';

class RokaatAljaybLilimamAlridaAalaihAlsalamPage extends StatefulWidget {
  static String screenRoute = 'rokaataljayblilimamalrida_screen';
  RokaatAljaybLilimamAlridaAalaihAlsalamPage({super.key});

  @override
  State<RokaatAljaybLilimamAlridaAalaihAlsalamPage> createState() =>
      _RokaatAljaybLilimamAlridaAalaihAlsalamPageState();
}

class _RokaatAljaybLilimamAlridaAalaihAlsalamPageState
    extends State<RokaatAljaybLilimamAlridaAalaihAlsalamPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_rokaataljayblilimamalrida_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_rokaataljayblilimamalrida_screen', value);
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
                      .addFavorite(
                          'رقعة الجيب للإمام الرضا (ع)',
                          RokaatAljaybLilimamAlridaAalaihAlsalamPage
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'رقعة الجيب للإمام الرضا (ع)',
                          RokaatAljaybLilimamAlridaAalaihAlsalamPage
                              .screenRoute,
                          RokaatAljaybLilimamAlridaAalaihAlsalamPage
                              .screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'رقعة الجيب للإمام الرضا (ع)',
            style: TextStyle(
              fontSize: isTablet
                  ? 40
                  : size > 1
                      ? 19
                      : 22,
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
            ),
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListOfNineVerses(
                    title: 'تعريف:',
                    subtitle:
                        'ذكرها السيد ابن طاوس في مهج الدعوات مسندة عن ياسر خادم المأمون, ونقلها عنه الشيخ القمّي في الباقيات الصالحات.\n'
                        'قال ياسر:\n'
                        'لما نزل أبو الحسن علي ابن موسى الرضا (ع) قصر حميد بن قحطبة نزع ثيابه وناولها حميداً, فاحتملها وناوها جارية لتغسلها, فما لبثت أن جاءت ومعها رقعة, فناولتها حميداً, وقالت: وجدتها في جيب قميس أبي الحسن (ع), فسأل حميد عنها أبو الحسن, فقال (ع): يا حميد هذه عوذة لا أعزلها عن نفسي.\n'
                        'وقد ذكر في المهج لرقعة الجيب رواية أخرى تختلف بعض الشيء عن هذه, فراجع.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'آثاره:',
                    subtitle:
                        'قال (ع): هذه عوذة من أمسكها في جيبه كانالباء مدفوعاً عنه, وكانت له حرزاً من الشيطان الرجيم.\n'
                        'ولهذا الحرز حكاية عجيبة رواها أبو الصلت الهروي, قال:\n'
                        'كان مولاي علي ابن موسى الرضا (ع), ذات يوم جالساً في منزله إذ دخل عليه رسول المأمون فقال: أجب دعوة الأمير, فقام علي ابن موسى الرضا (ع) فقال لي: يا أبا الصلت, إنه لا يدعوني في هذا الوقت إلا لداهية والله لا يمكنه أن يعمل بي شيئاًأكرهه بكلمات وقعت إليّ من جدي رسول الله (ص), '
                        'قال أبوالصلت فخرجت معه إلى المأمون فلما بصرهالرضا (ع) قرا هذا الحرز إلى آخره, فلما وقفبين يديه نظر إليه المأمون وقال:'
                        'يا أبا الحسن قد أمرنا لك بمئةألف درهم واكتب حوائجك, فلمّا ولّى الإمام عنه نظر المأمون إليه في قفاه فقال: أردت وما أراد الله, وما أراد الله خير.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'العوذة:',
                    subtitle:
                        'بسم الله الرحمن الرحيم بسم الله إني أعوذ بالرحمن منك إن كنت تقياً، أو غير تقيّ، أخذت بالله السميع البصير على سمعك وبصرك، لا سلطان لك عليّ ولا على سمْعي، ولا على بصري ولا على شعري، ولا على بشري، ولا لحمي، ولا على دمي، ولا على مخّي، ولا على عصبي، ولا على عظامي ولا على مالي ولا على أهلي ولا على ما رزقني ربي سترت على بيني وبينك بستر النبوة الذي استتر أنبياء الله به من سطوات الجبابرة والفراعنة، جبرئيلعن يميني، وميكائيل عن يساري، وإسرافيل من ورائي، ومحمد صلّى الله عليه وآله أمامي، والله مطَّلعٌ عليَّ، يمنعك منّي ويمنع الشيطان منّي، اللهم لا يغلب جهله أناتك أن يستفزَّني ويستخفَّني؛ اللهم إليك التجأت، اللهم إليك التجأت، اللهم إليك التجأت.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AawzaYataawazBihaAalaAlaadaaPage.screenRoute,
          pushBack: AlhayakelSabeaPage.screenRoute,
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
