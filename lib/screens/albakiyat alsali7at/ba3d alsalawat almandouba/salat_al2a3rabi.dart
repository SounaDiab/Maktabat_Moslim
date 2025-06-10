import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_al3afo.dart';
import 'salat_alhadiya.dart';

class SalatAl2a3rabi extends StatefulWidget {
  static String screenRoute = 'salat_al2a3rabi_screen';
  const SalatAl2a3rabi({super.key});

  @override
  State<SalatAl2a3rabi> createState() => _SalatAl2a3rabiState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAl2a3rabiState extends State<SalatAl2a3rabi> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_al2a3rabi_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_al2a3rabi_screen', value);
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
          .pushReplacementNamed(Ba3dAlsalawatAlmandouba.screenRoute);
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
                          'صلاة الاعرابي', SalatAl2a3rabi.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الاعرابي',
                          SalatAl2a3rabi.screenRoute,
                          SalatAl2a3rabi.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الاعرابي',
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
                      'روى السيد ابن طاووس في جمال الاسبوع عن الشيخ التلعكبري بسنده عن زيد بن ثابت قال: قام رجل من الاعراب فقال: بأبي أنت وأمي يارسول الله إنّا نكون في هذه البادية وبعيداً من المدينة ولانقدر أن نأتيك في كل جمعة فدلّني على عمل فيه فضل صلاة يوم الجمعة إذا مضيت إلى أهلي أخبرهم به. فقال رسول الله (صلّى الله عليه وآله وسلم): إذا كان ارتفاع النهار فصلّ ركعتين تقرأ في أول ركعة منها الحمد مرّة واحدة وقل أعوذ برب الفلق سبع مرات، واقرأ في الثانية الحمد مرة وقل أعوذ برب الناس سبع مرات فإذا سلمت فاقرأ آية الكرسي سبع مرات، ثم قم فصلّ ثماني ركعات بتسليمتين وتجلس في كل ركعتين منها ولا تسلم فإذا أتممت أربع ركعات سلّمت ثم صليت الاربع ركعات الاخرى كما صلّيت الأولى، واقرأ في كل ركعة الحمد مرة واحدة وإذا جاء نصر الله مرة واحدة وقل هو الله أحد خمساً وعشرين مرة، فإذا أتممت ذلك تشهدت وسلّمت ودعوت بهذا الدعاء سبع مرات وهو: ياحَيُّ ياقَيّومُ ياذا الجَلالِ وَالاكْرامِ ياإلهَ الأولينَ وَالاخِرينَ ياأرْحَمَ الرّاحِمينَ يارَحْمانَ الدُّنْيا وَالاخِرَةِ وَرَحيمَهُما يارَبِّ يارَبِّ يارَبِّ يارَبِّ يارَبِّ يارَبِّ يارَبِّ ياالله ياالله ياالله ياالله ياالله ياالله ياالله صَلِّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَاغْفِرْ لي. واذكر حاجتك، قل سبعين مرة: لا حَوْلَ وَلا قوَةَ إِلاّ بِالله العَليّ العَظيمِ، وقل: سُبْحانَ الله رَبِّ العَرْشِ الكَريمِ.\n\n'
                      'فوالذي بعثني واصطفاني بالحق مامن مؤمن ولامؤمنة يصلي هذه الصلاة يوم الجمعة كما أقول إِلاّ وأنا ضامن له الجنة ولايقوم من مقامه حتى يغفر له ذنوبه ولابويه ذنوبهما وأعطاه الله تعالى ثواب من صلّى في ذلك اليوم في أمصار المسلمين وكتب له أجر من صام وصلى في ذلك اليوم في مشارق الارض ومغاربها وأعطاه الله مالا عين رأت ولا أذن سمعت.\n\n'
                      'أقول: هذه الصلاة قد رواها الطوسي أيضاً في (المصباح)، ولكن من دون الدعاء المذكور فقال: إذا فرغت من الصلاة فقل: سُبْحانَ الله رَبِّ العَرْشِ الكَريمِ وَلا حَوْلَ وَلا قوَةَ إِلاّ بِالله العَليّ العَظيمِ سبعين مرة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAlhadiya.screenRoute,
          pushBack: SalatAl3afo.screenRoute,
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
