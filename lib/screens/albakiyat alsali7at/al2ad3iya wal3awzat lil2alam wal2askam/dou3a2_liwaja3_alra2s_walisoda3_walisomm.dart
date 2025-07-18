import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'awzat_wadou3a2_lilamrad.dart';
import 'dou3a2_liwaja3_alfam.dart';

class Dou3a2Liwaja3Alra2sWalisoda3Walisomm extends StatefulWidget {
  static String screenRoute = 'dou3a2_liwaja3_alra2s_walisoda3_walisomm_screen';
  const Dou3a2Liwaja3Alra2sWalisoda3Walisomm({super.key});

  @override
  State<Dou3a2Liwaja3Alra2sWalisoda3Walisomm> createState() =>
      _Dou3a2Liwaja3Alra2sWalisoda3WalisommState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Liwaja3Alra2sWalisoda3WalisommState
    extends State<Dou3a2Liwaja3Alra2sWalisoda3Walisomm> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs
        .getBool('isFavorite_dou3a2_liwaja3_alra2s_walisoda3_walisomm_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_dou3a2_liwaja3_alra2s_walisoda3_walisomm_screen', value);
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
                      .addFavorite('دعاء لوجع الرأس وللصداع وللصّمم',
                          Dou3a2Liwaja3Alra2sWalisoda3Walisomm.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء لوجع الرأس وللصداع وللصّمم',
                          Dou3a2Liwaja3Alra2sWalisoda3Walisomm.screenRoute,
                          Dou3a2Liwaja3Alra2sWalisoda3Walisomm.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء لوجع الرأس وللصداع وللصّمم',
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
                  title: 'لوجع الرأس',
                  subtitle:
                      'يقرأ على قدح فيه ماء : أوَلَمْ يَرَ الَّذينَ كَفَروا أنَّ السَّماواتِ وَالارضِ كانَتا رَتْقا فَفَتَقْناهُما وَجَعَلْنا مِنَ الماءِ كُلَّ شَيٍ حيٍّ أفلا يؤمِنونَ ثم يشربه. وروي ان النبي (صلّى الله عليه وآله وسلم) كان إذا أصيب بمرض أو صداع بسط يديه، فقرأ الفاتحة والمعوّذتين فمسح بهما وجهه فذهب عنه الوجع.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'وللصداع أيضاً',
                  subtitle:
                      'امسح على رأس المريض وقل : إنَّ الله يُمْسِكُ السَّماواتِ وَالارضَ أنْ تَزولا وَلَئِنْ زالَتا أنْ أمْسَكَهُما مِنْ أحَدٍ مِنْ بَعْدِهِ إنَّهُ كانَ حَلِيماً غَفوراً. وعن كتاب (ربيع الابرار) أن المأمون أصابه في طرطوس صداع لم يعالج فبعث إليه قيصر الروم بقلنسوة وكتب إليه أنبئت بصداعك فبعثت إليك بهذه القلنسوة تضعها على رأسك، ليسكن الالم، فخشي المأمون أن تكون قد دُس فيها السمّ، فأمر أن توضع على رأس حامله فلم تضره فأمر أن توضع على رأس من به صداع فسكن فاستعملها المأمون لرأسه فسكن صداعه، فتعجب من ذلك فحلّها فوجد فيها مكتوبا : بِسْمِ اللهِ الرَّحْمنِ الرَّحيمِ كَمْ مِنْ نِعْمَةٍ لله في عِرْقٍ ساكِنٍ حَّمَّ عَّسَّقَّ لايُصَدَّعونَ عَنها وَلا يُنْزِفونَ مِنْ كَنْزِ الرَّحْمنِ خَمَدَتْ النّيرانُ وَلاحَوْلَ وَلاقوَةَ إِلاّ بِالله وَجالَ نَفْعُ الدَواءِ فِيكَ كَما يَجُولُ ماءُ الرّبِيعِ في الغُصْنِ.\n\n'
                      'عوذة للشقيقة ضع يدك على الشق الذي يعتريك ألمه وقل ثلاثا : ياظاهِراً مَوجوداً وَياباطِنا غَيْرَ مَفْقُودٍ أرْدُدْ عَلى عَبْدِكَ الضَعيفِ أياديكَ الجَّميلَةُ عِنْدَهُ وَأذْهِبْ عَنْهُ مابِهِ مِنْ أذى إنَّكَ رَحيمٌ قَديرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'للصّمم',
                  subtitle:
                      'عن باقر العلوم (عليه السلام) ضع يدك عليه واقرأ: لو أنْزَلْنا هذا القُرآنَ عَلى جَبَلٍ… الى آخر السورة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Liwaja3Alfam.screenRoute,
          pushBack: AwzatWadou3a2Lilamrad.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء لوجع الرأس والصداع وللصمم.mp3',
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
