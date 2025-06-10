import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'fi_ad3iya_yod3a_bha_3ind_alnom_w3ind_l2intibah_menh.dart';
import 'fi_da3awat_ma2soura_kabl_salat_wfi_adbariha.dart';

class FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi
    extends StatefulWidget {
  static String screenRoute =
      'fi_zikr_3idat_da3awat_yod3a_bha_2iza_5araj_l2insan_men_manzlhi_screen';
  const FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi({super.key});

  @override
  State<FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi> createState() =>
      _FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhiState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhiState
    extends State<FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_zikr_3idat_da3awat_yod3a_bha_2iza_5araj_l2insan_men_manzlhi_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_zikr_3idat_da3awat_yod3a_bha_2iza_5araj_l2insan_men_manzlhi_screen',
        value);
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
                      .addFavorite(
                          'في ذكر عدة دعوات يدعى بها إذا خرج الانسان من منزله',
                          FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في ذكر عدة دعوات يدعى بها إذا خرج الانسان من منزله',
                          FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi
                              .screenRoute,
                          FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi
                              .screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في ذكر عدة دعوات يدعى بها إذا خرج الانسان من منزله',
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
                  title: 'وهي ثمانية أدعية :\n'
                      'الأول :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : إنّ الانسان إذا خرج من منزله، قال حين يريد أن يخرج، ثلاثا : الله أكْبَرُ، وثلاثا : بِالله أخْرُجُ وَبِالله أدْخُلُ وَعَلىْ الله أتَوَكَّلُ.\n\n'
                      'ثم يقول : اللّهُمَّ افْتَحْ لي في وَجْهي هذا بِخَيْرٍ وَاخْتِمْ لي بِخَيْرٍ وَقِني شَرَّ كُلِّ دابَةٍ أنْتَ آخِذٌ بِناصيَتِها. إنَّ رَبّي عَلى صِراطٍ مُسْتَقيمٍ. فإذا فعل ذلك، لم يزل في ضمان الله عزَّ وجلَّ، حتى يرده الله إلى المكان الذي كان فيه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'عن السجاد (عليه السلام) قال : تقول حين تخرج من باب الدار : بِسْمِ الله وَبِالله تَوَكَّلْتُ عَلى اللّهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'عن الباقر (عليه السلام) قال : من قال حين يخرج من منزله : بِسْمِ الله حَسْبيَ الله تَوَكَّلْتُ عَلى الله ، اللّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ أموري كُلِّها وَأعوذُ بِكَ مِنْ خِزْي الدُّنْيا وَعَذابِ الاخِرَةِ، كفاه الله ماأهمّه من أمر دنياه واَّخرته.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : إذا خرجت من منزلك فقل : بِسْمِ الله تَوَكَّلْتُ عَلى الله لاحَوْلَ وَلاقوَّةَ إِلاّ بِالله ، اللّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ ما خَرَجْتُ لَهُ، اللّهُمَّ أوْسِعْ عَليَّ مِنْ فَضْلِكَ وَأتْمِمْ عَليَّ نِعْمَتَكَ وَاسْتَعْمِلْني في طاعَتِكَ وَاجْعَلْ رَغْبَتي فيما عِنْدَكَ، وَتَوَفَني عَلى مِلَّتِكَ وَمِلَّةِ رَسولِكَ صَلّى الله عَلَيْهِ وَآلِهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'عن الرضا (عليه السلام) قال : كان أبي (عليه السلام) إذا خرج من منزله قال: بِسْمِ الله الرَّحْمنِ الرَّحيمِ خَرَجْتُ بِحَوْلِ الله وَقوَّتِهِ لابِحَوْلٍ مِنّي وَلاقوَّتي، بَلْ بِحَوْلِكَ وَقوَّتِكَ يارَبِّ مُتَعَرِّضا لِرِزْقِكَ فَاتِني بِهِ في عافيةٍ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : من قرأ قل هو الله أحد حين يخرج من منزله عشر مرات لم يزل في حفظ الله عزَّ وجلَّ وكلاته حتى يرجع إلى منزله.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'عن أبي الحسن موسى (عليه السلام) قال : إذا أردت السفر فقف على باب دارك واقرأ فاتحة الكتاب أمامك وعن يمينك وعن شمالك، وكذلك قل هو الله أحد، وكذلك قل أعوذ برب الناس، وقل أعوذ برب الفلق ثم قل : اللّهُمَّ احْفَظْني وَاحْفَظْ مامَعي وَسَلِّمْني وَسَّلِّمْ مامَعي وَبَلِّغْني وَبَلِّغْ مامَعي بَلاغاً حَسَناً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن :',
                  subtitle:
                      'عنه (عليه السلام) أيضاً قال : إذا خرجت من منزلك في سفر أو حضر فقل: بِسْمِ الله آمَنْتُ بِالله وَتَوَكَّلْتُ عَلى الله ماشاءَ الله لاحَوْلَ وَلاقوَّةَ إِلاّ بِاللّهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext:
              FiDa3awatMa2souraKablSalatWfiAdbariha.screenRoute,
          pushBack: FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh.screenRoute,
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
