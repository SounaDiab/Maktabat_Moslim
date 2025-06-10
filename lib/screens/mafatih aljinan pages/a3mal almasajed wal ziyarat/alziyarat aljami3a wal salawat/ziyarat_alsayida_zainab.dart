import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../alziyarat_aljami3a_walsalawat.dart';
import 'hadis_alkisa2.dart';
import 'salat_ja3far_altayar.dart';

class ZiyaratAlsayidaZainab extends StatefulWidget {
  static String screenRoute = 'ziyarat_alsayida_zainab_screen';
  const ZiyaratAlsayidaZainab({super.key});

  @override
  State<ZiyaratAlsayidaZainab> createState() => _ZiyaratAlsayidaZainabState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratAlsayidaZainabState extends State<ZiyaratAlsayidaZainab> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_alsayida_zainab_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_alsayida_zainab_screen', value);
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
                      .addFavorite('زيارة السيدة زينب الكبرى (عليها السلام)',
                          ZiyaratAlsayidaZainab.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة السيدة زينب الكبرى (عليها السلام)',
                          ZiyaratAlsayidaZainab.screenRoute,
                          ZiyaratAlsayidaZainab.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة السيدة زينب الكبرى (عليها السلام)',
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
                      'السلام عليك يا بنت سلطان الانبياء، السلام عليك يا بنت صاحب الحوض واللواء، السلام عليك يا بنت فاطمة الزهراء، السلام عليك يا بنت خديجة الكبرى، السلام عليك يا بنت سيد الاوصياء وركن الاولياء أمير المؤمنين، السلام عليك يا بنت ولي الله، السلام عليك يا ام المصائب يا زينب بنت علي ورحمة الله وبركاته.\n\n'
                      'السلام عليك أيتها الفاضلة الرشيدة، السلام عليك أيتها العاملة الكاملة، السلام عليك أيتها الجليلة الجميلة، السلام عليك أيتها التقية النقية، السلام عليك أيتها المظلومة المقهورة، السلام عليك أيتها الرضية المرضية، السلام عليك يا تالية المعصوم، السلام عليك يا ممتحنة في تحمل المصائب بالحسين المظلوم، السلام عليك أيتها البعيدة عن الآفاق، السلام عليك أيتها الاسيرة في البلدان، السلام على من شهد بفضلها الثقلان، السلام عليك أيتها المتحيرة في وقوفك في القتلى وناديت جدك رسول الله(ص) بهذا النداء: صلى عليك مليك السماء هذا حسين بالعراء مسلوب العمامة والرداء مقطع الاعضاء وبناتك سبايا،\n'
                      'السلام على روحك الطيبة وجسدك الطاهر، السلام عليك يا مولاتي وابنة مولاي وسيدتي وابنة سيدتي ورحمة الله وبركاته.\n\n'
                      'أشهد أنك قد أقمت الصلاة وآتيت الزكاة وأمرت بالمعروف ونهيت عن المنكر وأطعت الله ورسوله وصبرت على الاذي في جنب الله حتى أتاك اليقين، فلعن الله من جحدك ولعن الله من ظلمك ولعن الله من لم يعرف حقك ولعن الله أعداء آل محمد من الجن والانس من الاولين والآخرين وضاعف عليهم العذاب الاليم.\n\n'
                      'أتيتك يا مولاتي وابنة مولاي قاصدا وافدا عارفا بحقك فكوني شفيعا إلى الله في غفران ذنوبي، وقضاء حوائجي، واعطاء سؤلي وكشف ضري، وأن لك ولابيك وأجدادك الطاهرين جاها عظيما وشفاعة مقبولة، السلام عليك وعلى آبائك الطاهرين المطهرين وعلى الملائكة المقيمين في حرمكِ الشريف المبارك.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HadisAlkisa2.screenRoute,
          pushBack: SalatJa3farAltayar.screenRoute,
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
