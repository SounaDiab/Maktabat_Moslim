import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../da3awat_monta5aba_men_kitab_alkafi_alsharif.dart';
import 'fi_ba3d_ala7raz_wal3owaz.dart';
import 'fi_zikr_ba3d_ma_warad_lilham_wal8am_wal5awf_wa8airaha.dart';

class FiAd3iyatAl3ilalWalmarad extends StatefulWidget {
  static String screenRoute = 'fi_ad3iyat_al3ilal_walmarad_screen';
  const FiAd3iyatAl3ilalWalmarad({super.key});

  @override
  State<FiAd3iyatAl3ilalWalmarad> createState() =>
      _FiAd3iyatAl3ilalWalmaradState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiAd3iyatAl3ilalWalmaradState extends State<FiAd3iyatAl3ilalWalmarad> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_ad3iyat_al3ilal_walmarad_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_ad3iyat_al3ilal_walmarad_screen', value);
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
                      .addFavorite('في أدعية العلل والامراض',
                          FiAd3iyatAl3ilalWalmarad.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في أدعية العلل والامراض',
                          FiAd3iyatAl3ilalWalmarad.screenRoute,
                          FiAd3iyatAl3ilalWalmarad.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في أدعية العلل والامراض',
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
                  title: 'الأول :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : تقول للاوجاع : بِسْمِ الله وَبِالله كَمْ مِنْ نِعْمَةٍ لله في عِرْقٍ ساكِنٍ وَغَيْرِ ساكِنٍ عَلى عَبْدٍ شاكِرٍ وَغَيْرَ شاكِرٍ، وتأخذ لحيتك بيدك اليمنى بعد صلاة مفروضة وتقول ثلاث مرات : اللّهُمَّ فَرِّجْ عَنّي كُرْبَتي وَعَجِّلْ عافيَتي وَاكْشِفْ ضُرّي، واحرص أن يكون ذلك مع دموع وبكاء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : ضع يدك على موضع الالم فقل : بِسْمِ الله وَبِالله مُحَمَّدٌ رَسولُ الله صَلّى الله عَلَيْهِ وَآلِهِ وَلاحَوْلَ وَلاقوَّةَ إِلاّ بِالله ، اللّهُمَّ إمْسَحْ عَنّي ما أجِدُ، وتمسح بيدك اليمنى موضع الوجع ثلاث مرات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'عن الباقر (عليه السلام) قال : مرض علي (عليه السلام) فأتاه رسول الله (صلّى الله عليه وآله وسلم)، فقال له : قل : اللّهُمَّ إِنِّي أَسْأَلُكَ تَعْجيلَ عافيتِكَ وَصَبْراً عَلى بَليّتِكَ وَخُروجا إِلى رَحْمَتِكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : تضع يدك على موضع الوجع، وتقول ثلاث مرات : اللّهُمَّ إِنِّي أَسْأَلُكَ بِحَقِّ القُرآنِ العَظيمِ الَّذي نَزَلَ بِهِ الرّوحُ الامينُ وَهوَ عِنْدَكَ في أمِّ الكِتابِ عَلّيٌ حَكيمٌ أنْ تَشْفيني بِشِفائِكَ وَتُداويني بِدَوائِكَ وَتُعافيني مِنْ بَلائِكَ وَتُصَلّيَ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ عَلَيْهِمْ السَّلامُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'عن أبي حمزة قال: عرض لي وجع في ركبتي، فشكوت ذلك إلى الباقر (عليه السلام) فقال : إذا أنت صلّيت فقل : ياأجْوَدَ مَنْ أعْطى وَيا أرْحَمَ مَنْ إسْتُرْحِمَ ارْحَمْ ضُعْفي وَقِلَّةَ حيلَتي، إعْفِني مِنْ وَجَعي. قال ففعلته، وعوفيت.\n\n'
                      'أقول : قد أوردنا في الباب الثالث ص1071 دعوات يدعى بها للعلل والاسقام.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiBa3dAla7razWal3owaz.screenRoute,
          pushBack: FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha.screenRoute,
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
