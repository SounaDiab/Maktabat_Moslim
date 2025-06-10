import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_al7aja_al5amisa.dart';
import 'salat_al7oja_fi_jamkaran.dart';

class SalatAlisti8asa extends StatefulWidget {
  static String screenRoute = 'salat_alisti8asa_screen';
  const SalatAlisti8asa({super.key});

  @override
  State<SalatAlisti8asa> createState() => _SalatAlisti8asaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAlisti8asaState extends State<SalatAlisti8asa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_alisti8asa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_alisti8asa_screen', value);
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
                          'صلاة الاستغاثة', SalatAlisti8asa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الاستغاثة',
                          SalatAlisti8asa.screenRoute,
                          SalatAlisti8asa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الاستغاثة',
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
                      'في (المكارم) : إذا هممت بالنوم في الليل فضع عند رأسك إناءً نظيفا فيه ماء طاهر وغطّه بخرقة نظيفة فإذا انتبهت لصلاتك في الليل فاشرب من الماء ثلاث جرع ثم توضأ بباقيه وتوجه إلى القبلة وأذن وأقم وصلِّ ركعتين تقرأ فيهما ماشئت من سور القرآن فإذا فرغت فاركع وقل في ركوعك خمسا وعشرين مرة: ياغِياثَ المُسْتَغِيثِينَ. ثم ترفع رأسك فتقولها خمسا وعشرين مرة وتؤدي مثل ذلك في السجدة الأولى وإذا رفعت رأسك منها وفي السجدة الثانية وبعد رفع رأسك منها، ثم تنهض إلى الثانية وتفعل كفعلك في الأولى وتسلم وقد أكملت ثلاثمائة مرة ثم تتشهد وتسلم ثم ترفع رأسك إلى السماء وتقول ثلاثين مرة: مِنَ العَبْدِ الذَّليلِ إِلى المَولى الجَليلِ وتذكر حاجتك فإنّ الاجابة تسرع بإذن الله تعالى.\n\n'
                      'صلاة الاستغاثة بالبتول (صلّى الله عليها): إذا كانت لك حاجة إلى الله تعالى وضاق صدرك منها فصلّ ركعتين فإذا سلّمت كبر ثلاثا وسبّح تسبيح فامة (سلام الله عليها) ثم اسجد وقل مائة مرة: يامَولاتي يافاطِمَةُ أغيثيني ثم ضع خدّك الايمن على الارض وقلها مائة مرة ثم ضع الخد الايسر وقلها مائة مرة ثم عد إلى السجود وقلها مائة وعشر مرّات واذكر حاجتك فان الله تعالى يقضيها إن شاء الله تعالى.\n\n'
                      'أقول : قال الشيخ حسن بن فضل الطبرسي في كتاب (مكارم الاخلاق) صلاة الاستغاثة بالبتول (عليها السلام) : تصلّي ركعتين ثم تسجد وتقول: يافاطمة مائة مرة، ثم تضع خدك الايمن على الارض وتقولها مائة مرة، ثم تضع الايسر وتقول مثل ذلك ثم تعود إلى السجود وتقولها مائة وعشر مرات ثم تقول بعد ذلك:\n\n'
                      'ياآمِنا مِنْ كُلِّ شَيٍ وَكُلُّ شَيٍ مِنْكَ خائِفٌ حَذِرٌ، أسْأَلَكَ بِأمْنِكَ مِنْ كُلِّ شَيٍ وَخَوفِ كُلِّ شَيٍ مِنْكَ أنْ تُصَلّيَ عَلى مُحَمَّدٍ وَأنْ تُعْطيَني أمانا لِنَفْسي وَأهْلي وَمالي وَوَلَدي حَتّى لاأخافَ أحَداً وَلاأحْذَرَ مِنْ شَيٍ أبَداً إنَّكَ عَلى كُلِّ شَيٍ قَديرٌ.\n\n'
                      'وأيضاً في هذا الكتاب الشريف عن الصادق (عليه السلام) قال : من أراد منكم أن يستغيث إلى الله عزَّ وجلَّ فليصلِّ ركعتين ثم يسجد ويقول: يامُحَمَّدُ يارَسولَ الله ياعَليُّ ياسَيّدي المؤمنينَ والمؤمِناتِ بِكُما أسْتَغيثُ إِلى الله تَعالى يامُحَمَّدُ ياعَليُّ أسْتَغيثُ بِكُما ياغَوثاهُ بِالله وَبِمُحَمَّدٍ وبِعَليٍّ وَفاطِمَةَ، وتسمي كلاً من ائمتك ثم تقول: بِكُمْ أتَوَسَّلُ إِلى الله تَعالى فإنّهم يغيثونك لساعتك إن شاء الله تعالى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAl7ojaFiJamkaran.screenRoute,
          pushBack: SalatAl7ajaAl5amisa.screenRoute,
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
