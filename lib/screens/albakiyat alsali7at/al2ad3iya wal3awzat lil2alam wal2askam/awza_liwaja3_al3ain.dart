import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'al3awza_libtal_alsi7r.dart';
import 'awza_liwaja3_alrokba.dart';

class AwzaLiwaja3Al3ain extends StatefulWidget {
  static String screenRoute = 'awza_liwaja3_al3ain_screen';
  const AwzaLiwaja3Al3ain({super.key});

  @override
  State<AwzaLiwaja3Al3ain> createState() =>
      _AwzaLiwaja3Al3ainState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AwzaLiwaja3Al3ainState
    extends State<AwzaLiwaja3Al3ain> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_awza_liwaja3_al3ain_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_awza_liwaja3_al3ain_screen', value);
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
                      .addFavorite('عوذة لوجع العين',
                          AwzaLiwaja3Al3ain.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'عوذة لوجع العين',
                          AwzaLiwaja3Al3ain.screenRoute,
                          AwzaLiwaja3Al3ain.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'عوذة لوجع العين',
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
                      'في روايات عديدة أنه قل في دبر الفجر ودبر المغرب : اللّهُمَّ إِنِّي أَسْأَلُكَ بِحَقِّ مُحَمَّدٍ وَآلِ مُحَمَّدٍ عَلَيكَ أنْ تُصَلّي عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَأنْ تَجْعَلَ النورَ في بَصَري وَالبَصيرَةَ في ديني وَاليَقينَ في قَلْبي والاخْلاصَ في عَمَلي وَالسَّلامَةَ في نَفْسي وَالسَّعِةَ في رِزْقي وَالشُّكْرَ لَكَ أبَداً ما أبْقَيْتَني.\n\n'
                      'وروى البزنطي عن يونس بن ظبيان، قال : دخلنا على الصادق (عليه السلام) وهو أرمد شديد الرّمد، فاغتممنا لذلك، ثم أصبحنا من الغد فدخلنا عليه فإذا لا رمد بعينيه، فقلنا: جعلنا فداك، هل عالجت عينك بشي ؟ فقال : نعم بما هو من العلاج. فقلنا : ماهو ؟ فقال : عوذة فكتبناها وهي: أعوذُ بِعِزَّةِ الله وَأعوذُ بِقُوَّةِ الله وَأعوذُ بِقُدْرَةِ الله وَأعوذُ بِنُورِ الله وَأعوذُ بِعَظَمَةِ الله وَأعوذُ بِجَلالِ الله وَأعوذُ بِجَمالِ الله وَأعوذُ بِبَهاءِ الله وَأعوذُ بِجَمْعِ اللّهِ. قلنا : وما جمع الله ؟ قال: بِكُلِّ الله وَأعوذُ بِعَفْوِ الله وَأعوذُ بِرَسولِ الله وَأعوذُ بِالائِمَةِ.. وسمّى واحداً واحداً، ثم قال: عَلى مانَشاءُ مِنْ شَرِّ ماأجِدُ. اللّهُمَّ رَبَّ المُطيعينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أيضاً لوجع العين',
                  subtitle:
                      'روي ليقرأ اَّية الكرسي وليضمر في نفسه أنها تبري وإذا وضع قبل قراءة الآية يده على عينيه وقال: أعيذُ نورَ بَصَري بِنورِ الله الَّذي لايُطْفَاء، نفعه ذلك.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'ولضعف الباصره والشبكور (العشاوة)',
                  subtitle:
                      'روي أن يكتب اَّيه النور مرات في جام، ثم اغسله وصيره في قارورة واكتحل به. وروي أنه من قرأ في المصحف نظراً متّع ببصره.\n\n'
                      'وروي أيضاً أنّه من كان يقول في كل يوم: فَجَعَلْناهُ سَميعاً بَصيراً ؛ تسلم عينيه من الافات. قال الكفعمي قد جرّب أنّ التوسل بالإمام موسى (عليه السلام) ينفع لوجع العين ولاوجاع سائر الاعضاء.\n\n'
                      'وللرعاف يصب على رأس المرعوف وجبهته ماءً بارداً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Al3awzaLibtalAlsi7r.screenRoute,
          pushBack: AwzaLiwaja3Alrokba.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/عوذة لوجع العين.mp3',
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
