import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'aldou3a2_likarakir_albatn.dart';
import 'awza_liwaja3_al3awra.dart';

class Aldou3a2Lilbaras extends StatefulWidget {
  static String screenRoute = 'aldou3a2_lilbaras_screen';
  const Aldou3a2Lilbaras({super.key});

  @override
  State<Aldou3a2Lilbaras> createState() =>
      _Aldou3a2LilbarasState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Aldou3a2LilbarasState
    extends State<Aldou3a2Lilbaras> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_aldou3a2_lilbaras_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_aldou3a2_lilbaras_screen', value);
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
                      .addFavorite('الدعاء للبرص',
                          Aldou3a2Lilbaras.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الدعاء للبرص',
                          Aldou3a2Lilbaras.screenRoute,
                          Aldou3a2Lilbaras.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الدعاء للبرص',
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
                      'عن يونس قال : أصابني بياض بين عيني فدخلت على الصادق (عليه السلام) فشكوت ذلك إليه فقال : تطهر وصلّ ركعتين وقل : ياالله يارَحْمنُ يارَحيمُ ياسَميعَ الدَّعَواتِ يامُعْطي الخَيْراتِ، أعْطِني خَيْرَ الدُّنيا وَخَيْرَ الاخِرَةِ وَقِني شَرَّ الدُّنيا وشَرَّ الاخِرَةِ وَأَذْهِبْ عَنّي ماأجِدُ فَقَدْ غاضَني الأمْرُ وَأخْوَفَني. قال يونس : ففعلت ما أمرني به فأذهب الله عني ذلك وله الحمد.\n\n'
                      'وفي رواية (عدة الداعي) انه قال (عليه السلام) : إذا كان الثلث الاخير من الليل في أوله فتوضّأ وقم الى صلاتك التي تصلّيها فإذا كنت في‌السجدة الاخيرة من الركعتين الأوليين فقل وأنت ساجد : ياعَليُّ ياعَظيمُ يارَحْمنُ يارَحيمُ ياسامِعَ الدَّعَواتِ يامُعْطي الخَيراتِ صَلِّ عَلى مُحَمَّدٍ وَآلِهِ، وَأَعْطِنِي مِنْ خَيْرِ الدُّنْيا وَالاخِرَةِ ماأنْتَ أهْلَهُ، وَاصْرِفْ عَنِّي مِنْ شَرِّ الدُّنْيا وَالاخِرَةِ ماأنْتَ أهْلَهُ، وَأَذْهِبْ عَنّي هذا الوَجَعْ فَإنَّهُ قَدْ غاضَنى وَأحْزَنَني وألح في الدعاء. قال يونس : فما وصلت الى الكوفة حتى ذهب الله به عني كله.\n\n'
                      'وقد ورد لذلك أيضا: أن اكتب يَّس بالعسل في جامٍ واغسله واشربه، كما ورد هذا للبواسير أيضاً وورد أيضاً أن يأخذ طين قبر الحسين (عليه السلام) بماء السماء. وروي أيضا: أن يطلي بمزيج من الحناء والنورة للجرب والدّمل والقوباء وهي التهاب في الجسد او حكة شديدة ـ ويقال لها بالفارسية (داد) ـ روي أنّه يقرأ عليه ويكتب ويعلق عليه: بِسْمِ الله الرَّحْمنِ الرَّحيمِ وَمَثَلُ كَلِمَةٍ خَبيثَةٍ كَشَجَرَةٍ خَبيثَةٍ أُجْتُثَّتْ مِنْ فَوقِ الارضِ مالَها مِنْ قَرارٍ… الى آخر الآية: مِنْها خَلَقْناكُمْ وَفيها نُعيدَكُمْ وَمنها نُخْرِجَكُمْ تارَةً أخْرى الله أكْبَرُ وَأنْتَ لاتَكْبَرُ، وَالله يَبْقى وَأنْتَ لا تَبْقى، وَالله عَلى كُلِّ شَيٍ قَديرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AwzaLiwaja3Al3awra.screenRoute,
          pushBack: Aldou3a2LikarakirAlbatn.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الدعاء للبرص.mp3',
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
