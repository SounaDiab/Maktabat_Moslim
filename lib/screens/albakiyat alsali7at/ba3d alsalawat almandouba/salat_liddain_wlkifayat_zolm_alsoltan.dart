import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_al2isti5ara_zat_alrka3.dart';
import 'salat_al7aja.dart';

class SalatLiddainWlkifayatZolmAlsoltan extends StatefulWidget {
  static String screenRoute = 'salat_liddain_wlkifayat_zolm_alsoltan_screen';
  const SalatLiddainWlkifayatZolmAlsoltan({super.key});

  @override
  State<SalatLiddainWlkifayatZolmAlsoltan> createState() =>
      _SalatLiddainWlkifayatZolmAlsoltanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatLiddainWlkifayatZolmAlsoltanState
    extends State<SalatLiddainWlkifayatZolmAlsoltan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs
        .getBool('isFavorite_salat_liddain_wlkifayat_zolm_alsoltan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_salat_liddain_wlkifayat_zolm_alsoltan_screen', value);
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
                      .addFavorite('الصلاة للدَيْنِ ولكفاية ظلم السلطان',
                          SalatLiddainWlkifayatZolmAlsoltan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الصلاة للدَيْنِ ولكفاية ظلم السلطان',
                          SalatLiddainWlkifayatZolmAlsoltan.screenRoute,
                          SalatLiddainWlkifayatZolmAlsoltan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الصلاة للدَيْنِ ولكفاية ظلم السلطان',
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
                      'روى الطوسي أنّه جاء رجل إلى الصادق (عليه السلام) فقال له : ياسيّدي أشكو إليك دينا ركبني وسلطانا غشمني وأريد أن تعلّمني دعاءً أغتنم به غنيمة أقضي بها ديني وأكفي بها ظلم سلطاني.\n\n'
                      'فقال : إذا جنّك الليل فصلّ ركعتين إقرأ في الركعة الأولى منهما الحمد وآية الكرسي وفي الركعة الثانية الحمد واَّخر الحشر لو أنزلنا هذا القرآن على جبل إلى خاتمة السورة.\n\n'
                      'ثم خذ المصحف فدعه على رأسك وقل : بِحَقِّ هذا القُرآنَ وَبِحَقِّ مَنْ أرْسَلْتَهُ بِهِ وَبِحَقِّ كُلَّ مؤمِنٍ مَدَحْتَهُ فيهِ وَبِحَقِّكَ فَلا أحَدَ أعْرَفُ بِحَقِّكَ مِنْكَ. وقل : بِكَ ياالله عشر مرات. يامُحَمَّدُ عشر مرات.\n\n'
                      'ياعَليُّ عشر مرات. يافاطِمَةُ عشر مرات. ياحَسَنُ عشر مرات. ياحُسينُ عشر مرات. ياعَليَّ بْنَ الحُسَينِ عشر مرات. يامُحَمَّدَ بْنَ عَليٍّ عشر مرات. ياجَعْفَرَ بْنَ مُحَمَّدٍّ عشر مرات. ياموسى بْنَ جَعْفَرٍ عشر مرات. ياعَليَّ بْنَ موسى عشر مرات. يامُحَمَّدَ بْنَ عَليٍ عشر مرات. ياعَليَّ بْنَ مُحَمَّدٍ عشر مرات. ياحَسَنَ بْنَ عَليٍّ عشر مرات. بِالحُجَّةِ عشر مرات. ثم تسأل حاجتك. قال الراوي: فمضى الرجل فعاد اليه بعد مدّة قد قضي دينه وصلح له سلطانه وعظم يساره.\n\n'
                      'أقول : الظاهر أن هذا العمل يؤتى به عقيب الصلاة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAl7aja.screenRoute,
          pushBack: SalatAl2isti5araZatAlrka3.screenRoute,
          soud:
              'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/صلاة للدين ولكفاية ظلم السلطان.mp3',
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
