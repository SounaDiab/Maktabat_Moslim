import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_al7aja_alsaniya.dart';
import 'salat_lziyadat_alrizk.dart';

class SalatAl7ajaAl2oula extends StatefulWidget {
  static String screenRoute = 'salat_al7aja_al2oula_screen';
  const SalatAl7ajaAl2oula({super.key});

  @override
  State<SalatAl7ajaAl2oula> createState() => _SalatAl7ajaAl2oulaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAl7ajaAl2oulaState extends State<SalatAl7ajaAl2oula> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_al7aja_al2oula_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_al7aja_al2oula_screen', value);
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
                          'صلاة الحاجة الاولى', SalatAl7ajaAl2oula.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الحاجة الاولى',
                          SalatAl7ajaAl2oula.screenRoute,
                          SalatAl7ajaAl2oula.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الحاجة الاولى',
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
                      'نقلاً عن (المكارم) : إذا انتصف الليل فاغتسل وصلِّ ركعتين واقرأ في كلتا الركعتين الحمد وخمسمائة مرة سورة التوحيد، وفي الثانية إذا فرغت من التوحيد فاقرأ اَّخر سورة الحشر وهو : لو أنزلنا هذا القرآن على جبل… إلى اَّخر السورة، وست اَّيات من أوّل سورة الحديد، وقل بعدها وأنت قائم كما كنت : إياك نعبد وإياك نستعين ألف مرة، ثم أتم الصلاة وأثن على الله تعالى فإن قضيت حاجتك فهي وإِلاّ فكررها ثانية، فإن لم تقض فأت بها ثالثة فإنّها تقضى إن شاء الله تعالى.\n\n'
                      'صلاة أخرى روى ثقة الاسلام الكليني رض في الكافي بسند معتبر عن عبد الرحيم القصير قال: دخلت على الصادق (عليه السلام) فقلت : جعلت فداك إنّي اخترعت دعاء.\n\n'
                      'قال : دعني من اختراعك إذا نزل بك أمر فافزع إلى رسول الله (صلّى الله عليه وآله وسلم) وصلِّ ركعتين تهديهما إلى رسول الله (صلّى الله عليه وآله وسلم) قلت كيف أصنع ؟ قال: تغتسل وتصلّي ركعتين تستفتح بهما افتتاح الفريضة وتشهد تشهُّد الفريضة فإذا فرغت من التشهد وسلّمت قلت: اللَّهُمَّ أنْتَ السَّلامُ وَمِنْكَ السَّلامُ وإلَيْكَ يَرجِعُ السَّلامُ، اللَّهُمَّ صَلِّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَبَلِّغْ روحَ مُحَمَّدٍ منِي السَّلامُ وَأرْواحِ الأَئِمَّةِ الصّادِقينَ سَلامي وَأرْدُدْ عَليّ مِنْهُمْ السَّلامُ وَالسَّلامُ عَلَيْهِمْ وَرَحْمَةُ الله وَبَرَكاتُهُ، اللَّهُمَّ إنَّ هاتَيْنِ الرِّكْعَتينِ هَدِّيةٌ مِني إِلى رِسولِ الله صَلّى الله عَلَيْهِ وَآلِهِ فَأثِبْني عَلَيْهِما ماأمَّلْتُ وَرَجَوْتُ فيكَ وَفي رَسولِكَ يأوليّ المؤمِنينَ ثم تخر ساجداً.\n\n'
                      'وتقول أربعين مرة : ياحي ياقَيومُ ياحَيا لايَموتُ ياحَيا لا إلهَ إِلاّ أنْتَ ياذا الجَلالِ وَالاكْرامِ ياأرْحَمَ الرّاحِمينَ.\n\n'
                      'ثم ضع خدّك الايمن فتقولها أربعين مرة ثم ضع خدّك الايسر فتقولها أربعين مرة ثم ترفع رأسك وتمدّ يدك وتقول أربعين مرة ثم تردّ يدك إلى رقبتك وتلوذ بسبابتك وتقول ذلك أربعين مرة ثم خذ لحيتك بيدك اليسرى وابك أو تباك وقل: يامُحَمَّدُ يارَسولَ الله أشْكو إِلى الله وَإلَيْكَ حاجَتي وإِلى أهْلِ بَيْتِكَ الرّاشِدينَ حاجَتي وَبِكُمْ أتَوَجَّهُ إِلى الله في حاجَتي.\n\n'
                      'ثم تسجد وتقول: ياالله ياالله حتى ينقطع النفس ثم قل: صَلِّ عَلى مُحَمَّدٍ وَآل مُحَمَّدٍ وَافْعَلْ بي كَذا وَكَذا. قال الصادق (عليه السلام) فأنا الضامن على الله عزَّ وجلَّ أن لايبرح حتى تقضى حاجته.\n\n'
                      'أقول : سنذكر في الباب الرابع دعوات كثيرة لقضاء حوائج الدنيا والاخرة. وقال الكفعمي في (البلد الامين): تكتب للحوائج الهامّة هذه الكلمات في رقعة فترمي بها في الماء: بِسْمِ الله الرَّحْمنِ الرَّحيمِ مِنَ العَبْدِ الذَّليلِ إِلى المَوْلى الجَليلِ: رَبِّ إِنِّي مَسَّني الضُّرُّ وَأنْتَ أرْحَمُ الرّاحِمينَ بِحَقِّ مُحَمَّدٍ وَآلِهِ صَلِّ عَلى مُحَمَّدٍ وَآلِهِ وَاكْشِفْ هَمّي وَفَرِّجْ عَنِّي غَمِّي بِرَحْمَتِكَ ياأرْحَمْ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAl7ajaAlsaniya.screenRoute,
          pushBack: SalatLziyadatAlrizk.screenRoute,
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
