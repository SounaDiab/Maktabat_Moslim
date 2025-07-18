import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../zi_lhoja.dart';
import 'allayla_al3ashira_zilhoja.dart';
import 'alyawm_al5amis_3ashar_zilhoja.dart';

class AlyawmAl3ashirZilhoja extends StatefulWidget {
  static String screenRoute = 'alyawm_al3ashir_zilhoja_screen';
  const AlyawmAl3ashirZilhoja({super.key});

  @override
  State<AlyawmAl3ashirZilhoja> createState() => _AlyawmAl3ashirZilhojaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlyawmAl3ashirZilhojaState extends State<AlyawmAl3ashirZilhoja> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alyawm_al3ashir_zilhoja_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alyawm_al3ashir_zilhoja_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiLhoja.screenRoute);
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
                          'اليوم العاشر', AlyawmAl3ashirZilhoja.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'اليوم العاشر',
                          AlyawmAl3ashirZilhoja.screenRoute,
                          AlyawmAl3ashirZilhoja.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اليوم العاشر',
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
                  'يوم عيد الاضحى وهو يوم ذو شرافة بالغة واعماله عديدة :',
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
                  subtitle:
                      'الغُسل وهو سنّة مؤكّدة في هذا اليوم وقد أوجبه بعض العلماء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle:
                      'أداء صلاة العيد كما وصفناها في عيد الفطر ولكن يستحبّ أن يؤخّر في هذا اليوم الافطار عن الصّلاة كما يستحبّ أن يفطر على لحم الاضحية.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle:
                      'قراءة الدّعوات المأثورة قبل صلاة العيد وبعدها وهي مذكورة في كتاب الاقبال، ولعلّ أفضل الادعية في هذا اليوم هو الدّعاء الثّامن والاربعون من الصّحيفة الكاملة أوّلها اَللّـهُمَّ هـذا يَوْمٌ مُبارَكٌ فادع به وادع أيضاً بالدّعاء السّادس والاربعين يا مَنْ يَرْحَمُ مَنْ لا يَرْحَمُهُ الْعِبادُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle: 'قراءة دعاء النّدبة وسيأتي ان شاء الله تعالى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle: 'التّضحية وهي سنّة مؤكّدة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس :',
                  subtitle:
                      'أن يكبرّ بالتّكبيرات الاتية عقيب خمس عشرة فريضة اوّلها فريضة ظهر العيد وآخرها فريضة فجر اليوم الثّالث عشر ، هذا لمن كان في مِنى وأمّا من كان في سائر البلاد فيكبر بها عقيب عشر فرائض تبدأ من فريضة ظهر العيد وتنتهي بفجر اليوم الثّاني عشر والتّكبيرات على رواية الكافي الصّحيحة كما يلي : اللهُ اَكْبَرُ اللهُ اَكْبَرُ لا اِلـهَ اِلاَّ اللهُ، وَاللهُ اَكْبَرُاللهُ اَكْبَرُاللهُ اَكْبَرُ وللهِ الْحَمْدُ، اللهُ اَكْبَرُ عَلى ما هَدانا، اَللهُ اَكْبَرُ عَلى ما رَزَقَنا مِنْ بَهيمَةِ الاَنْعامِ، وَالْحَمْدُ للهِ عَلى ما اَبْلانا ويستحبّ تكرار هذه التكبيرات عقيب الفرائض ما تيسّر، كما يستحبّ التّكبير بها بعد النّوافل أيضاً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAl5amis3asharZilhoja.screenRoute,
        pushBack: AllaylaAl3ashiraZilhoja.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اليوم العاشر من ذي الحجة.mp3',
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
