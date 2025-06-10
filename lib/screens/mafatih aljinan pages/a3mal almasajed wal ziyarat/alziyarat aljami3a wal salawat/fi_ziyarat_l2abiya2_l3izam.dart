import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../alziyarat_aljami3a_walsalawat.dart';
import 'fi_ziyarat_kobour_lmo2minin.dart';
import 'ma_yozar_kol_2imam.dart';

class FiZiyaratL2abiya2L3izam extends StatefulWidget {
  static String screenRoute = 'fi_ziyarat_l2abiya2_l3izam_screen';
  const FiZiyaratL2abiya2L3izam({super.key});

  @override
  State<FiZiyaratL2abiya2L3izam> createState() =>
      _FiZiyaratL2abiya2L3izamState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiZiyaratL2abiya2L3izamState extends State<FiZiyaratL2abiya2L3izam> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_ziyarat_l2abiya2_l3izam_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_ziyarat_l2abiya2_l3izam_screen', value);
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
          .pushReplacementNamed(AlziyaratAljami3aWalsalawat.screenRoute);
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
                      .addFavorite('في زيارة الأنبياء العظام (عليهم السلام)',
                          FiZiyaratL2abiya2L3izam.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في زيارة الأنبياء العظام (عليهم السلام)',
                          FiZiyaratL2abiya2L3izam.screenRoute,
                          FiZiyaratL2abiya2L3izam.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في زيارة الأنبياء العظام (عليهم السلام)',
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
                      'اعلم انّ تكريم الانبياء (عليهم السلام) وتعظيمهم واجب عقلاً وشرعاً لا نفرّق بين أحد من رسله وزيارتهم راجحة مستحسنة والعلماء قد صرّحوا باستحباب زيارتهم وليس في الانبياء (عليهم السلام) وإن كثروا من يعرف موضع قبره الاّ القليلون وهم على ما أعهد آدم (عليه السلام) ، ونوح (عليه السلام) ، وهما مدفونان عند مرقد امير المؤمنين (عليه السلام) ، وابراهيم (عليه السلام) ، وقبره في القدس الخليل قُرب بيت المقدس وبجواره مراقد سارة زوجته واسحاق ويعقوب ويوسف (عليهم السلام) ، واسماعيل (عليه السلام) ، وامّه هاجر مدفونان في الحجر في المسجد الحرام وفيه قبور الانبياء (عليهم السلام) وعن الباقر (عليه السلام) قال : ما بين الركن والمقام مكتظ بقبور الانبياء.\n\n'
                      'وعن الصادق (عليه السلام) قال : ما بين الرّكن اليماني والحجر الاسود مراقد سبعين نبيّاً من الانبياء (عليهم السلام).\n\n'
                      'وفي بيت المقدّس قبور عدّة من الانبياء كداوُد (عليه السلام) وسليمان وغيرهما من الانبياء المعروفين هناك سلام الله عليهم أجمعين، وقبر زكريّا (عليه السلام) معروف في حلب، وليونس (عليه السلام) على شريعة الكوفة بقعة ذات قبّة معروفة ، وقبرا هود (عليه السلام)وصالح (عليه السلام) في النّجف الاشرف مشهوران، ومرقد ذي الكفل على شاطئ الفرات مشهور ، وهو يبعد عن الكوفة . والنّبي جرجيس قبره مدينة الموصل ، وفي خارج المدينة قبر شيث هبة الله ، وقبر النّبي دانيال في شوش ، وقبر يوشع مقابل مسجد براثا وغيرهم سلام الله عليهم أجمعين، وأمّا كيفية زيارتهم (عليهم السلام) ، فلم أظفر بزيارة مأثورة تخصّهم عدا ما سلف في باب زيارة أمير المؤمنين (عليه السلام) من زيارة آدم ونوح '
                      '(عليهما السلام) ، ولكن ما جعلناها الاولى من الزّيارات الجامعة يُزار بها الانبياء أيضاً (عليهم السلام) كما يبدو من روايتها ويشهد لذلك أن الشّيخ الجليل محمّد بن المشهدي والسّيد الاجلّ عليّ بن طاووس في مصباح الزّائر وغيرهما رضوان الله عليهم قد أوردوا هذه الزّيارة لمشهد يونس (عليه السلام) عند بيانهم آداب دخول مدينة الكوفة، والمظنون انّ ذكرهم هذه الزّيارة لهذا المشهد ليس الاّ لما يبدو من العموم من روايتها، وكيف كان فمن المناسب الزّيارة بها في المراقد الشّريفة للانبياء (صلى الله عليه وآله وسلم) وقد أثبتنا الزّيارة فيما سلف فلا حاجة الى اعادتها هنا فمن شاء فليرجع الى الزّيارة الجامعة الاولى وينتفع بفضلها العظيم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: MaYozarKol2imam.screenRoute,
          pushBack: FiZiyaratKobourLmo2minin.screenRoute,
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
