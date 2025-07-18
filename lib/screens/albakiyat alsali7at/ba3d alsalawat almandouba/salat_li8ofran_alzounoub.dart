import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_alwasiya.dart';
import 'salat_lilzaka2_wjoudat_alhofez.dart';

class SalatLi8ofranAlzounoub extends StatefulWidget {
  static String screenRoute = 'salat_li8ofran_alzounoub_screen';
  const SalatLi8ofranAlzounoub({super.key});

  @override
  State<SalatLi8ofranAlzounoub> createState() => _SalatLi8ofranAlzounoubState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatLi8ofranAlzounoubState extends State<SalatLi8ofranAlzounoub> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_salat_li8ofran_alzounoub_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_li8ofran_alzounoub_screen', value);
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
                      .addFavorite('الصلاة لغفران الذنوب',
                          SalatLi8ofranAlzounoub.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الصلاة لغفران الذنوب',
                          SalatLi8ofranAlzounoub.screenRoute,
                          SalatLi8ofranAlzounoub.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الصلاة لغفران الذنوب',
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
                      'يصلي ركعتين يقرأ في كل ركعة منهما قل هو الله أحد ستين مرة فاذا فرغ من الصلاة غفرت ذنوبه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة أخرى',
                  subtitle:
                      'قال الطوسي في (المصباح) في خلال أعمال يوم الجمعة: روي عن عبد الله بن مسعود قال: قال النبي (صلّى الله عليه وآله وسلم) من صلى يوم الجمعة بعد العصر ركعتين يقرأ في الأولى الفاتحة وآية الكرسي وقل أعوذ برب الفلق خمسا وعشرين مرة وفي الثانية الفاتحة وقل هو الله أحد وقل أعوذ برب الناس خمسا وعشرين مرة فإذا فرغ من الصلاة قال خمساً وعشرين مرة: لاحَوْلَ وَلاقوَةَ إِلاّ بِالله العَليّ العَظيمِ لم يخرج من الدنيا إِلاّ وقد أراه الله تعالى الجنّة في منامه وأراه مكانه فيها.\n\n'
                      'أقول: روى السيد ابن طاووس في الفصل الثالث والثلاثين من (جمال الاسبوع) صلاة لغفران الذنوب وقال في شأنها إن هذه صلاة جليلة القدر عظيمة الشأن يعرفها حملة الاسرار الربوبية فإيّاك أن تتهاون فيها فمن رغب فيها فليطلبها من الكتاب المذكور.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAlwasiya.screenRoute,
          pushBack: SalatLilzaka2WjoudatAlhofez.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/صلاة لغفران الذنوب.mp3',
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
