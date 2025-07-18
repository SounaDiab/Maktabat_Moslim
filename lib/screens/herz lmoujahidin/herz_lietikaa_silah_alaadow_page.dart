import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'ayat_alhefz_men_saif_alaadow_page.dart';
import 'douaa_lilkhalas_men_alkatl_page.dart';

class HerzLietikaaSilahAlaadowPage extends StatefulWidget {
  static String screenRoute = 'herzlietikaasilahalaadow_screen';
  HerzLietikaaSilahAlaadowPage({super.key});

  @override
  State<HerzLietikaaSilahAlaadowPage> createState() =>
      _HerzLietikaaSilahAlaadowPageState();
}

class _HerzLietikaaSilahAlaadowPageState
    extends State<HerzLietikaaSilahAlaadowPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_herzlietikaasilahalaadow_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzlietikaasilahalaadow_screen', value);
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
                      .addFavorite('حرز لاتقاء سلاح العدوّ',
                          HerzLietikaaSilahAlaadowPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'حرز لاتقاء سلاح العدوّ',
                          HerzLietikaaSilahAlaadowPage.screenRoute,
                          HerzLietikaaSilahAlaadowPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حرز لاتقاء سلاح العدوّ',
            style: TextStyle(
              fontSize: isTablet ? 40 : 22,
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
                        'ذكر السيد علي خان في الكلم الطيب وقال: إنه وصل إليه ممَّن يقر ب من السلطان الصفوي يومذاك الذي كان قد انتزعه من عضد أحد قوَّاده لمَّا أراد قتله وكان مكتوباً في رقّ ظبي.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'آثاره:',
                    subtitle: 'وقال في الكلم الطيب:\n'
                        'وممَّا اشتهر في زماننا أن سلطان العجم الشاه سليمان بن عباس الصفوي أمر بضرب عنق أحد أمرائه وهو جمشيد خان في سنة ثمان وسبعين بعد الألف بملأ من الناس، حتّى أخبر هو بنفسه أنَّ في عضده خرزاً فخلوه وضرب عنقه وعمل فيه السيف، أخبرني بذلك بعض من كان حاضراًضرب عنقه.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'الحرز:',
                    subtitle:
                        'أفوِّض أمري إلى الله إن الله بصيرٌ بالعباد فوقاه الله سيئات ما مكروا وحاق بآل فرعون سوء العذاب.\n\n'
                        'اللهم بك أستكفي شرورهم وأدرأ في نحورهم فاكفهم كيف شِئت وأنّى شِئت بحولٍ منك وقوَّةٍ يا أرحم الراحمين.\n\n'
                        'اللهم يا ذا السلطان العظيم وذا المنِّ القديم وذا الكلمات التّامّات والدَّعوات المستجابات عاف - فلان ابن فلان - من أنْنفُس الجنِّ وأعين الإنس بمحمدٍ وعلى فاطمة والحسن والحسين صلوات الله وسلامه عليه وعليهم.\n\n'
                        'يا سامع كل صوت ويا جامع كل فوت يا محيي العظام وهي رميم بعد الموت بخلدك الأبدي ودوامك السرمدي وحياتك التي لا تموت صلِّ على محمدٍ وآل محمدٍ وأغثني وفرِّج عنّي نا أنا فيه بلا إله إلّا أنت عليك توكَّلت وأنت رب العرش العظيم.\n\n'
                        'يا شديد القوى يا شديد المحال يا عزيز أذللت بعزَّتك جميع من خلقت صل على محمدٍ وآل محمدٍ واكفني مؤونة - فلان - بما شئت.\n\n'
                        'اللهم احفظ حامله من جميع الآفات وطوِّل عُمُرَه بمحمدٍ وعليّ وفاطمة والحسن والحسين وعليّ ومحمدٍ وجعفرٍ وموسى وعليّ ومحمدٍ وعليّ والحسن ومحمدٍ المهديّ عليهم السلام.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AyatAlhefzMenSaifAlaadowPage.screenRoute,
          pushBack: DouaaLilkhalasMenAlkatlPage.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/حرز لاتقاء سلاح العدوّ.mp3',
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
