import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'al7erz_men_al3ain.dart';
import 'awza_liwaja3_al3ain.dart';

class Al3awzaLibtalAlsi7r extends StatefulWidget {
  static String screenRoute = 'al3awza_libtal_alsi7r_screen';
  const Al3awzaLibtalAlsi7r({super.key});

  @override
  State<Al3awzaLibtalAlsi7r> createState() =>
      _Al3awzaLibtalAlsi7rState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Al3awzaLibtalAlsi7rState
    extends State<Al3awzaLibtalAlsi7r> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_al3awza_libtal_alsi7r_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_al3awza_libtal_alsi7r_screen', value);
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
                      .addFavorite('عوذة لابطال السحر',
                          Al3awzaLibtalAlsi7r.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'عوذة لابطال السحر',
                          Al3awzaLibtalAlsi7r.screenRoute,
                          Al3awzaLibtalAlsi7r.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'عوذة لابطال السحر',
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
                      'عن أمير المؤمنين (عليه السلام) قال: أكتب في رقّ ظبي وعلّقه عليك: بِسْمِ الله وَبِالله بِسْمِ الله ماشاءَ الله وَلاحَولَ وَلاقوَةَ إِلاّ بِاللّهِ. قالَ موسى ما جِئْتُمْ بِهِ السِّحْرُ إنَّ الله سَيُبْطِلَهُ إنَّ الله لايُصْلِحُ عَمَلُ المُفْسِدينَ فَوَقَعَ الحَقُّ وَبَطَلَ ما كانوا يَعْمَلونَ فَغَلَبوا هُنالِكَ وَانْقَلَبوا صاغِرينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أيضاً لدفع الشياطين والسحرة',
                  subtitle:
                      'روي عن النبي (صلّى الله عليه وآله وسلم) اقرأ اَّية السُّخرةِ وهي: إنَّ رَبُّكُمْ الله الَّذي خَلَقَ السَّماواتِ وَالارضِ في سِتَّةِ أيّامٍ ثُمَّ اسْتَوى عَلى العَرْشِ يُغْشي اللَّيْلَ النَّهارِ يَطْلِبَهُ حَثيثا وَالشَّمْسُ وَالقَمَرُ وَالنُّجومُ مُسَخَّراتٍ بِأمْرِهِ ألا لَهُ الخَلْقُ وَالامْرُ تَبارَكَ الله ربُّ العالَمينَ أَدْعُوا رَبَّكُمْ تَضَرُّعا وَخُفْيَةً إنَّهُ لا يُحبُّ المُعْتَدينَ وَلا تُفْسِدوا في الارضِ بَعْدَ إصْلاحِها وادْعوهُ خَوفا وَطَمَعا إنَّ رَحْمَة الله قَريبٌ مِنَ الُمحْسنينَ. وفي بعض الروايات اقرأها إلى : تَبارَكَ الله ربِّ العالَمينَ.\n\n'
                      'وعن النبي (صلّى الله عليه وآله وسلم): ماأنبت الحرمل من شجرة ولا ورقة ولا ثمرة إِلاّ وملك موكّل بها، حتى تصير حطاما، وأنّ في أصلها وفرعها نشرة (حرز من الغم والسحر) وأنّ في حبّها الشفاء من اثنين وسبعين داءً فتداووا بها وبالكندر.\n\n'
                      'وروي عن الرضا (عليه السلام) أنّه رأى مصروعا فدعا له بقدح فيه ماء، ثم قرأ عليه الحمد والمعوذتين، ونفث في القدح، ثم أمر فصبّ الماء على رأسه ووجهه، فأفاق وقال له: لايعود إليك أبداً.\n\n'
                      'وعن النبي (صلّى الله عليه وآله وسلم) قال: من رمي أو رمته الجنّ، فليأخذ الحجر الذي رمي به فليرم من حيث رمي وليقل: حَسْبيَ الله وَكَفى وَسَمِعَ الله لِمَنْ دَعا لَيْسَ وَراءَ الله مُنْتَهى.\n\n'
                      'وينفع للامن من الجنّ اتخاذ الدجاج والديك والجدي في البيت وللامن من الجنّ في الاسفار والصحاري والمواضع المفزعة منها.\n\n'
                      'روي عن الصادق (عليه السلام) أنه قال: ضع يدك على أمّ رأسك واقرأ برفيع صوتك: أفَغَيْرَ دِينِ الله يَبْغونَ وَلَهُ أسْلَمَ مَنْ في السَّماواتِ وَالارضِ طَوْعا وَكُرْها وَإليهِ يُرْجَعونَ. وروي أيضاً أنّه إذا تغوّلت الغيلان فأذّنوا بأذان الصلاة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Al7erzMenAl3ain.screenRoute,
          pushBack: AwzaLiwaja3Al3ain.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/العوذة لابطال السحر.mp3',
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
