import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../da3awat_monta5aba_men_kitab_alkafi_alsharif.dart';
import 'fi_3ida_men_al2ad3iya_allati_yod3a_biha_saba7an_wmasa2an.dart';
import 'fi_zikr_3idat_da3awat_yod3a_bha_2iza_5araj_l2insan_men_manzlhi.dart';

class FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh extends StatefulWidget {
  static String screenRoute =
      'fi_ad3iya_yod3a_bha_3ind_alnom_w3ind_l2intibah_menh_screen';
  const FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh({super.key});

  @override
  State<FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh> createState() =>
      _FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenhState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenhState
    extends State<FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_ad3iya_yod3a_bha_3ind_alnom_w3ind_l2intibah_menh_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_ad3iya_yod3a_bha_3ind_alnom_w3ind_l2intibah_menh_screen',
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
          Da3awatMonta5abaMenKitabAlkafiAlsharif.screenRoute);
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
                          'في أدعية يدعى بها عند النوم وعند الانتباه منه',
                          FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في أدعية يدعى بها عند النوم وعند الانتباه منه',
                          FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh
                              .screenRoute,
                          FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh
                              .screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في أدعية يدعى بها عند النوم وعند الانتباه منه',
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
                  title: 'الاول :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : من قال حين يأخذ مضجعه ثلاث مرات :\n\n'
                      'الحَمْدُ لله الَّذي عَلا فَقَهَرَ وَالحَمْدُ لله الَّذي بَطَنَ فَخَبَرَ، وَالحَمْدُ لله الَّذي مَلَكَ فَقَدَرَ، وَالحَمْدُ لله الَّذي يُحْيي المَوْتى وَيُميتُ الاحْياءَ وهوَ عَلى كُلِّ شَيٍ قَديرٌ. خرج من الذنوب كهيئة يوم ولدته امه. والشيخ والصدوق أيضا، قد رويا هذه الرواية في (عدة الداعي) عن الصادق (عليه السلام) قال : هذا أدنى ما يجزيك من الحمد، وفي هذه الرواية قد أتى التحميد الثاني تلو الحمد الثالث.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'وعنه (عليه السلام) قال : إن رسول الله (صلّى الله عليه وآله وسلم) كان إذا أوى إلى فراشه يقرأ اَّية الكرسي ويقول: بِسْمِ الله آمَنْتُ بِالله وَكَفَرْتُ بِالطّاغوتِ، اللّهُمَّ إحْفَظْنىِّ في مَنامي وَفي يَقْظَتي.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'عن المفضل بن عمر قال : قال لي الصادق إن استطعت أن لاتبيت ليلة حتى تعوّذ بأحد عشر حرفا ؛ قلت أخبرني بها، قال قل : أعوذُ بِعِزَّةِ الله وَأعوذُ بِقُدْرَةِ الله وَأعوذُ بِسُلْطانِ الله وَأعوذُ بِجَمالِ الله وَأعوذُ بِدَفْعِ الله وَأعوذُ بِمَنْعِ الله وَأعوذُ بِجَمْعِ الله وَأعوذُ بِمُلْكِ الله وَأعوذُ بِرَسولِ الله صَلّى الله عَلَيْهِ وَآلِهِ مِنْ شَرِّ ما خَلَقَ وَبَرَأَ وَذَرَاءَ. وتعوّذ به كلما شئت.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'عن الصادق (صلوات الله وسلامه عليه) قال: من قرأ قل هو الله أحد مائة مرة، إذا أوى إلى فراشه، غفر الله له من ذنوبه ذنوب خمسين سنة، وعنه (عليه السلام) أيضاً أن من قرأ حين يأوي إلى مضجعه قل ياأيها الكافرون، وقل هو الله أحد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال النبي صلّى الله عليه واله : من أراد شَيْئاً من قيام الليل وأخذ مضجعه فليقل : اللّهُمَّ لاتؤمِنّي مَكْرَكَ وَلاتُنْسِني ذِكْرَكَ وَلاتَجْعَلْني مِنَ الغافِلينَ أقُومُ ساعَةَ كَذا وَكَذا، فإن فعل ذلك وكّل الله عزَّ وجلَّ به ملكا ينبهه تلك الساعة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'وعنه (عليه السلام) أيضاً قال : إذا قام أحدكم من الليل فقل : سُبْحانَ الله رَبِّ النَبيين وَإلهِ المُرْسَلينَ وَرَبِّ المُسْتَضْعَفينَ، وَالحَمْدُ لله الَّذي يُحْيي المَوتى وَهوَ عَلى كُلِّ شَيٍ قَديرٌ. فإذا قال ذلك يقول الله عزَّ وجلَّ صدق عبدي وشكر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'عن عبد الرحمن بن الحجاج قال : كان الصادق (عليه السلام) إذا قام اَّخر الليل يرفع صوته حتى يسمع أهل الدار ويقول : اللّهُمَّ أعِنّي عَلى هَوْلِ المُطَّلَعِ وَوَسِّعْ عَليَّ ضيقَ المُضْطَجَعِ، وَإرْزُقْني خَيْرَ ما قَبْلَ المَوْتِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext:
              FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi.screenRoute,
          pushBack:
              Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في ادعية يدعى بها عند النوم عند الانتباه منه.mp3',
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
