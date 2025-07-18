import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_liddain_wlkifayat_zolm_alsoltan.dart';
import 'salat_lilmohemat.dart';

class SalatAl7aja extends StatefulWidget {
  static String screenRoute = 'salat_al7aja_screen';
  const SalatAl7aja({super.key});

  @override
  State<SalatAl7aja> createState() => _SalatAl7ajaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAl7ajaState extends State<SalatAl7aja> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_al7aja_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_al7aja_screen', value);
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
                      .addFavorite('صلاة الحاجة', SalatAl7aja.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('صلاة الحاجة', SalatAl7aja.screenRoute,
                          SalatAl7aja.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الحاجة',
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
                      'عن دعوات الراوندي أنّ زين العابدين (عليه السلام) مرّ برجل وهو قاعد على باب رجل فقال له مايقعدك على باب هذا المترف الجبار ؟ فقال : البلا.\n\n'
                      'فقال : قم فأرشدك إلى باب خير من بابه وإلى ربٍّ خير منه فأخذ بيده حتى انتهى إلى المسجد، مسجد النبي (صلّى الله عليه وآله وسلم) ثم قال: استقبل القبلة فصلّ ركعتين ثم ارفع يديك إلى الله عزَّ وجلَّ فأثن عليه وصلِّ على رسوله ثم ادع باَّخر الحشر وست آيات من أول الحديد وبالايتين اللتين في اَّل عمران ثم سل الله فإنّك لاتسأل شَيْئاً إِلاّ أعطاك. قال الراوندي: لعل المراد بالايتين هما: قُلْ اللَّهُمَّ مالَكَ المُلْكِ أي إلى بِغَيْرِ حِسابٍ.\n\n'
                      'وقال المجلسي لعلّهما آية : قل اللهم، وآية : شهد اللّه. واعلم أنّه قد روي عن أمير المؤمنين (عليه السلام) قال : إذا أراد أحدكم الحاجة فليبكر في طلبها يوم الخميس وليقرأ إذا خرج من منزله اَّخر سورة اَّل عمران وآية الكرسي وإنا أنزلناه في ليلة القدر وسورة الحمد ، فان فيها قضاء حوائج الدنيا والاخرة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatLilmohemat.screenRoute,
          pushBack: SalatLiddainWlkifayatZolmAlsoltan.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/صلاة الحاجة.mp3',
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
