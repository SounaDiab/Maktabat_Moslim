import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../da3awat_monta5aba_men_kitab_alkafi_alsharif.dart';
import 'fi_ad3iyat_al3ilal_walmarad.dart';
import 'fi_da3awat_mojzat_ljami3_7wa2ej_aldonia_wal2a5ira.dart';

class FiBa3dAla7razWal3owaz extends StatefulWidget {
  static String screenRoute = 'fi_ba3d_ala7raz_wal3owaz_screen';
  const FiBa3dAla7razWal3owaz({super.key});

  @override
  State<FiBa3dAla7razWal3owaz> createState() =>
      _FiBa3dAla7razWal3owazState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiBa3dAla7razWal3owazState extends State<FiBa3dAla7razWal3owaz> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_ba3d_ala7raz_wal3owaz_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_ba3d_ala7raz_wal3owaz_screen', value);
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
                      .addFavorite('في بعض الاحراز والعوذ',
                          FiBa3dAla7razWal3owaz.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في بعض الاحراز والعوذ',
                          FiBa3dAla7razWal3owaz.screenRoute,
                          FiBa3dAla7razWal3owaz.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في بعض الاحراز والعوذ',
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
                      'روي أنّه شكا رجل إلى الصادق (عليه السلام) الوحشة. فقال (عليه السلام) : ألا أخبركم بشي إذا قلتموه، لم تستوحشوا بليل أو نهار : بِسْمِ الله وَبِالله وَتَوَكَّلْتُ عَلى الله إنَّهُ مَنْ يَتَوَكَّلْ عَلى الله فَهوَ حَسْبُهُ إنَّ الله بالِغُ أمْرِهِ قَدْ جَعَلَ الله لِكُلِّ شَيٍ قَدْراً، اللّهُمَّ اجْعَلْني في كَنَفِكَ وَفي جِوارِكَ وَاجْعَلْني في أمانِكَ وَفي مَنْعِكَ. وروي أن رجلاً قالها ثلاثين سنة وتركها ليلة فلسعته عقرب.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'روي أنّه من بات في دار أو غرفة وحده، فليقرأ اَّية الكرسي وليقل : اللّهُمَّ آنِسْ وَحْشَتي وَآمِنْ رَوْعَتي وَأعِنّي عَلى وَحْدَتي.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'روي أنّه رقى النبي (صلّى الله عليه وآله وسلم) حسناً وحسيناً (عليهما السلام) بهذه الكلمات : أعيذُكُما بِكَلِماتِ الله التّامَةِ وَأسْمائِهِ الحُسْنى كُلِّها عامَةً مِن شَرِّ السامَّةِ وَالهامَّةِ وَمِنْ شَرِّ كُلِّ عَينٍ لامّةٍ وَمِنْ شَرِّ حاسِدٍ إذا حَسَدَ. ثم قال (عليه السلام) هكذا كان يعوذ إبراهيم إسماعيل وإسحاق.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'روي أنّ رسول الله (صلّى الله عليه وآله وسلم) كان في بعض مغازيه، إذا شكوا إليه البراغيث أنها تؤذيهم، قال إذا أخذ أحدكم مضجعه، فليقل : أيُّها الاسوَدُ الوثّابُ الَّذي لايُبالي غَلْقا وَلابابا عَزَمْتُ عَلَيْكَ بِأُمِّ الكِتابِ أنْ لاتُؤذيني وَأصْحابي إِلى أنْ يَذْهَبُ اللَّيْلُ وَيَجيَ الصُّبْحُ بِما جاءَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'روي أن أمير المؤمنين (عليه السلام) قال : إذا رأيت السَّبع فقل : أعوذُ بِرَبِّ دانيالَ وَالجُبِّ مِنْ كُلِّ أسَدٍ مُسْتأسِدٍ.\n\n'
                      'وعن الصادق (عليه السلام) أنك إذا لقيت سبعا، فاقرأ في وجهه اَّية الكرسي، وقل له : عَزَمْتُ عَلَيْكَ بِعَزيمَةِ الله وعَزيمَةِ مُحَمَّدٍ صَلّى الله عَلَيْهِ وَآلِهِ وَعَزيمَةِ سُلَيمانَ بِنِ داودَ وَعَزيمَةِ أميرِ المؤمِنينَ عَليِّ بِنْ أبي طالِبٍ عَلَيْهِ السَّلامِ وَالأَئِمَّةِ الطّاهرينَ عَلَيْهِمْ السَّلامُ مِنْ بَعْدِهِ، فانه سينصرف عنك إن شاء الله تعالى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'عن رسول الله (صلّى الله عليه وآله وسلم) أنه قال لأمير المؤمنين (عليه السلام)، إذا وقعت في ورطة أو بليّة فقل : بِسْمِ الله الرَّحْمنِ الرّحيمِ وَلاحَوْلَ وَلاقوَّةَ إِلاّ بِالله العَليّ العظيمِ، فان الله عزَّ وجلَّ يصرف عنك مايشاء من أنواع البلاء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5ira.screenRoute,
          pushBack: FiAd3iyatAl3ilalWalmarad.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في بعض الاحراز العوذ.mp3',
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
