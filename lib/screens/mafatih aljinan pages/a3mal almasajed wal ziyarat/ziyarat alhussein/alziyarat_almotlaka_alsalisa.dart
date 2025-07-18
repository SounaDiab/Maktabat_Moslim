import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'alziyarat_almotlaka_alrabi3a.dart';
import 'alziyarat_almotlaka_alsaniya.dart';

class AlziyaratAlmotlakaAlsalisa extends StatefulWidget {
  static String screenRoute = 'alziyarat_almotlaka_alsalisa_screen';
  const AlziyaratAlmotlakaAlsalisa({super.key});

  @override
  State<AlziyaratAlmotlakaAlsalisa> createState() =>
      _AlziyaratAlmotlakaAlsalisaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlziyaratAlmotlakaAlsalisaState
    extends State<AlziyaratAlmotlakaAlsalisa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alziyarat_almotlaka_alsalisa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_alziyarat_almotlaka_alsalisa_screen', value);
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
          .pushReplacementNamed(ZiyaratAlhousseinWa2adabiha.screenRoute);
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
                          'الزيارة المطلقة الثالثة للحسين (عليه السلام)',
                          AlziyaratAlmotlakaAlsalisa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الزيارة المطلقة الثالثة للحسين (عليه السلام)',
                          AlziyaratAlmotlakaAlsalisa.screenRoute,
                          AlziyaratAlmotlakaAlsalisa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الزيارة المطلقة الثالثة للحسين (عليه السلام)',
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
                      'هيَ ما رواها ابن طاوُس في المزار وروى لها فضلاً كثيراً ، قال بحذف الاسناد عن جابر الجُعفي ، قال : قال الصّادق (عليه السلام) لجابر : كَم بَيْنك وبين قبر الحسين (عليه السلام) ؟ قال : قلت: بأبي أنت وأمّي يوم وبعض يوم آخر ، قال : فتزُوره ؟ فقال : نعم ، قال : فقال : اَلا اُبشرك اَلا افرحك ببعض ثوابه ؟ قلت : بلى جعلتُ فداك ، قال : فقال لي: انّ الرّجُل منكم ليأخذ في جهازه ويتهيّأ لزيارته فيتباشر به أهل السّماء، فاذا خرج من باب منزله راكباً أو ماشياً وكّل الله به أربعة آلاف ملك من الملائكة يصلّون عليه حتّى يوافي الحسين (عليه السلام) ، يا مفضّل إنْ أتيت قبر الحسين بن علي (عليهما السلام) فقف بالباب وقُل هذه الكلمات فانّ لك بكلّ كلمة كفلاً من رحمة الله ، فقلت : ما هي جعلت فداك ؟ قال : تقول :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا وارِثَ آدَمَ صَفْوَةِ اللهِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ نُوح نَبِيِّ اللهِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ اِبْراهيمَ خَليلِ اللهِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ مُوسى كَليمِ اللهِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ عيسى رُوحِ اللهِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ مُحَمَّد سَيِّدِ رُسُلِ اللهِ، اَلسَّلامُ عَلَيْكَ يا وارِثَ عَليِّ اَميرِ الْمُؤْمِنينَ وَخَيْرِ الْوَصِيّينَ، اَلسَّلامُ عَلَيْكَ يا وارِثَ الْحَسَنِ الرَّضِيِّ الطّاهِرِ الرّاضِى الْمَرْضِيِّ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الْوَصِيُّ الْبَرُّ التَّقِيُّ، اَلسَّلامُ عَلَيْكَ وَعَلى الاَْرْواحِ الَّتي حَلَّتْ بِفِنائِكَ وَاَناخَتْ بِرَحْلِكَ، اَلسَّلامُ عَلَيْكَ وَعَلَى الْمَلائِكَةِ الْحافّينَ بِكَ، اَشْهَدُ اَنَّكَ قَدْ اَقَمْتَ الصَّلاةَ وَآتَيْتَ الزَّكاةَ وَاَمَرْتَ بِالْمَعْرُوفِ وَنَهَيْتَ عَنِ الْمُنْكَرِ وَجاهَدْتَ الْمُلْحِدينَ وَعَبَدْتَ اللهَ حَتّى اَتاكَ الْيَقينُ، اَلسَّلامُ عَلَيْكَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.\n\n'
                      'ثمّ تسعى الى القبر فَلَكَ بكلّ قدم رفعتها أو وضعتها كثواب المتشحّط بدمه في سبيل اللهِ، فاذا وصلت الى القبر ووقفت عنده فامرر عليه يدك وقُل : اَلسَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ فِي اَرْضِهِ، ثمّ تمضي الى صلاتِك ولك بكلّ ركعة ركعتها عنده كثواب مَنْ حجّ ألف حجّة واعتمر ألف عُمرة واعتق ألف رقبة، وكأنّما وقف في سبيل الله ألف مرّة مع نبيّ مُرسل … الخبر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlziyaratAlmotlakaAlrabi3a.screenRoute,
          pushBack: AlziyaratAlmotlakaAlsaniya.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الزيارة المطلقة الثالثة.mp3',
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
