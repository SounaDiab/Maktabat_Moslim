import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../lailat_aljom3a_wnaharaha_w2a3malaha.dart';
import 'a3mal_nahar_aljom3a.dart';
import 'salat_amir_amo2minin.dart';

class SalatAlnabi extends StatefulWidget {
  static String screenRoute = 'salat_alnabi_screen';
  const SalatAlnabi({super.key});

  @override
  State<SalatAlnabi> createState() => _SalatAlnabiState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAlnabiState extends State<SalatAlnabi> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_alnabi_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_alnabi_screen', value);
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
          .pushReplacementNamed(LailatAljom3aWnaharahaW2a3malaha.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (previousPage == 'favorite_screen') {
                Navigator.of(context)
                    .pushReplacementNamed(FavoritesScreen.screenRoute);
              } else {
                Navigator.of(context).pushReplacementNamed(
                    LailatAljom3aWnaharahaW2a3malaha.screenRoute);
              }
            },
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
                      .addFavorite('صلاة النبي (ص)', SalatAlnabi.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('صلاة النبي (ص)', SalatAlnabi.screenRoute,
                          SalatAlnabi.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة النبي (ص)',
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
                      'رَوى السّيد ابن طاووس (رحمه الله) بسند معتبر عن الرّضا صلوات الله عليه انّه سئل عن صلاة جعفر الطّيّار (رحمه الله) فقال : أين أنت عن صلاة النّبي (صلى الله عليه وآله وسلم) فعسى رسُول الله (صلى الله عليه وآله وسلم) لم يصلّ صلاة جعفر قطّ، ولعلّ جعفراً لم يصلّ صلاة رسُول الله (صلى الله عليه وآله وسلم) قطّ ، فقلت : علّمنيها ، قال : تصلّي ركعتين تقرأ في كلّ ركعة فاتحة الكتاب وانّا أنزلناهُ في ليلة القدر خمس عشرة مرّة ثم تركع فتقرأها خمس عشرة مرة، وخمس عشرة مرة اذا استويت قائماً، وخمس عشرة مرّة إذا سجدت، وخمس عشرة مرّة اذا رفعت رأسك من السّجود، وخمس عشرة مرّة في السّجدة الثانية، وخمس عشرة مرّة اذا رفعت رأسك من الثّانية، ثمّ تنصرف وليس بينك وبين الله تعالى ذنب الاّ وقد غفر لك وتعطى جميع ما سألت، والدّعاء بعدها:\n\n'
                      'لا اِلـهَ إلاّ اللهُ رَبُّنا وَرَبُّ آبائِنَا الاَوَّلينَ لا اِلـهَ إلاّ اللهُ اِلهاً واحِداً وَنَحْنُ لَهُ مُسْلِمُونَ لا اِلـهَ إلاّ اللهُ لا نَعْبُدُ إلاّ اِيّاهُ مُخْلِصينَ لَهُ الدِّينَ وَلَوْ كَرِهَ الْمُشْرِكُونَ لا اِلـهَ إلاّ اللهُ وَحْدَهُ وَحْدَهُ وَحْدَهُ اَنْجَزَ وَعْدَهُ وَنَصَرَ عَبْدَهُ وَاَعَزَّ جُنْدَهُ وَهَزَمَ الاَحْزابَ وَحْدَهُ فَلَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلى كُلِّ شَيء قَديرٌ اَللّـهُمَّ اَنْتَ نُورُ السَّمواتِ وَالاَرْضِ وَمَنْ فيهِنَّ فَلَكَ الْحَمْدُ وَاَنْتَ قَيّامُ السَّمواتِ وَالاَرْضِ وَمَنْ فيهِنَّ فَلَكَ الْحَمْدُ وَاَنْتَ الْحَقُّ وَوَعْدُكَ الْحَقُّ (حَقٌّ) وَقَوْلُكَ حَقٌّ وِاِنْجازُكَ حَقٌّ وَالْجَنَّةُ حَقٌّ وَالنّارُ حَقٌّ اَللّـهُمَّ لَكَ أَسْلَمْتُ وَبِكَ آمَنْتُ وَعَلَيْكَ تَوَكَّلْتُ وَبِكَ خاصَمْتُ وَاِلَيْكَ حاكَمْتُ يا رَبِّ يا رَبِّ يا ربِّ اِغْفِرْ لى ما قَدَّمْتُ وَاَخَّرْتُ وَاَسْرَرْتُ وَاَعْلَنْتُ اَنْتَ اِلـهي لا اِلـهَ إلاّ اَنْتَ صَلِّ عَلى مُحَمّد وَآلِ مُحَمَّد وَاغْفِرْ لى وَارْحَمْنى وَتُبْ عَلَيَّ اِنَّكَ اَنْتَ التَّوابُ الرَّحيمُ . وفي المتهجّد كَريمٌ رَؤوفٌ رَحيمٌ بدل التَّوابُ الرَّحيمُ.\n\n'
                      'قال المجلسي (رحمه الله) : انّ هذه الصلاة مِنَ الصلوات المشهورة وقد رواها العامّة والخاصّة وعدّها بعضهم مِن صلوات يَوم الجُمعة ولم يظهر من الرّواية اختصاص به ويجزى عَلى الظّاهر أن يؤتى بها في سائر الايّام.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: SalatAmirAmo2minin.screenRoute,
        pushBack: A3malNaharAljom3a.screenRoute,
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
