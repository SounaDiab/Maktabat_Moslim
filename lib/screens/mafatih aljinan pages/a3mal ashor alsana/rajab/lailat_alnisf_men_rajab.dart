import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../rajab.dart';
import 'allayla_alsalisa_3ashara.dart';
import 'yawm_alnisf_men_rajab.dart';

class LailatAlnisfMenRajab extends StatefulWidget {
  static String screenRoute = 'lailat_alnesf_men_rajab_screen';
  const LailatAlnisfMenRajab({super.key});

  @override
  State<LailatAlnisfMenRajab> createState() => _LailatAlnisfMenRajabState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _LailatAlnisfMenRajabState extends State<LailatAlnisfMenRajab> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_lailat_alnesf_men_rajab_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_lailat_alnesf_men_rajab_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Rajab.screenRoute);
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
                          'التعقيبات العامة', LailatAlnisfMenRajab.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'التعقيبات العامة',
                          LailatAlnisfMenRajab.screenRoute,
                          LailatAlnisfMenRajab.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'ليلة النصف من رجب',
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
                padding: EdgeInsets.all(20),
                child: Text(
                  'وهي ليلة شريفة وردت فيها أعمال :',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle: 'الغُسل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle: 'احياؤها بالعبـادة كما قال العلاّمة المجلسي.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle: 'زيـارة الحسين (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle:
                      'الصّلاة ستّ ركعات التّي قد مرّت عند ذكر الليلة الثّالثة عشرة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'الصّلاة ثلاثون ركعة، يقرأ في كلّ ركعة الفاتحة مرّة، والتّوحيد عشر مرّات، وقد روى السّيد هذه الصّلاة عن النّبي (صلى الله عليه وآله وسلم)وروى لهـا فضلاً كثيراً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس :',
                  subtitle:
                      'الصّلاة اثنتا عشرة ركعة، تسلم بين كلّ ركعتين، تقرأ في كلّ ركعة كلّاً من سور الفاتحة والتّوحيد والفلق والنّاس وآية الكرسي وسورة (انّا أنزلناهُ) أربع مرّات، ثمّ تسلّم وتقول بعد الفراغ أربع مرّات: اَللهُ اَللهُ رَبّي لا اُشْرِكُ بِهِ شَيْئاً، وَلاَ اَتَّخِذُ مِنْ دُونِه وَلِيّاً، ثمّ تدعو بما أحببت، وقد روى السّيد هذه الصّلاة عن الصّادق (عليه السلام)بهذه الصّفة ولكن الشّيخ قال في المصباح : روى داوُد بن سرحان عن الصّادق (عليه السلام) قال : تصلّي ليلة النّصف من رجب اثنتي عشرة ركعة تقرأ في كلّ ركعة الحمد وسورة، فاذا فرغت من الصّلاة قرأت بعد ذلك الحمد والمعوّذتين وسورة الاخلاص وآية الكرسي أربع مرّات، وتقول بعد ذلك : سُبْحانَ اللهِ وَالْحَمْدُ للهِ وَلا اِلـهَ إلاَّ اللهُ وَاللهُ اَكْبَرُ أربع مرّات، ثمّ تقول : اَللهُ اَللهُ رَبّي لا اُشْرِكُ بِهِ شَيْئاً، وَما شاءَ اللهُ لا قُوَّةَ إِلاّ بِاللهِ الْعَلِيِّ الْعَظيمِ، وتقول في ليلة سبع وعشرين مثلها.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: YawmAlnisfMenRajab.screenRoute,
        pushBack: AllaylaAlsalisa3ashara.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/ليلة النصف من رجب.mp3',
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
