import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alnabi_walzahraa_wal2a2ima.dart';
import 'alwada3.dart';
import 'ziyarat_kobour_alshohada2.dart';

class ZikrAlmasajedAlmo3azama extends StatefulWidget {
  static String screenRoute = 'zikr_almasajed_almo3azama_screen';
  const ZikrAlmasajedAlmo3azama({super.key});

  @override
  State<ZikrAlmasajedAlmo3azama> createState() =>
      _ZikrAlmasajedAlmo3azamaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZikrAlmasajedAlmo3azamaState extends State<ZikrAlmasajedAlmo3azama> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_zikr_almasajed_almo3azama_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_zikr_almasajed_almo3azama_screen', value);
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
          .pushReplacementNamed(ZiyaratAlnabiWalzahraaWal2a2ima.screenRoute);
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
                      .addFavorite('ذكر المساجد المعظمة بالمدينة المنورة',
                          ZikrAlmasajedAlmo3azama.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'ذكر المساجد المعظمة بالمدينة المنورة',
                          ZikrAlmasajedAlmo3azama.screenRoute,
                          ZikrAlmasajedAlmo3azama.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'ذكر المساجد المعظمة بالمدينة المنورة',
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
                      'منها مسجد قبا الّذي اسّس على التّقوى من اوّل يوم، وروي انّ من ذهب اليه فصلّى فيه ركعتين رجع بثواب العمرة فأمض اليه وَصلّ فيه ركعتين للتحيّة وسبّح تسبيح الزّهراء (عليها السلام) ثمّ زر بالزّيارة الجامعة الّتي تفتح بالسّلام على أولياء الله، وقد جعلناها أولى الزّيارة الجامعة وستأتي في أواخر الباب ان شاء الله، ثمّ ادع الله وقل : يا كائِناً قَبْلَ كُلَّ شَىْء وهو دعاء طويل وايرادُه هنا ينافي ما نبغيه من الاختصار فليطلبه من شاء من مزار البحار، وتصلّي في مشربة امّ ابراهيم أي غرفة امّ ابراهيم ابن رسُول الله (صلى الله عليه وآله وسلم) وقد كانت هناك مسكن رسُول الله (صلى الله عليه وآله وسلم) ومصلاّه، وكذلك في مسجد الفضيخ وهُو قريب من مسجد قبا ويُسمّى ايضاً مسجد ردّ الشّمس، وفي مسجد الفتح أيضاً وتسمّى أيضاً بمسجد الاحزاب . وقُل اذا فرغت من الصّلاة في مسجد الفتح : يا صَريخَ الْمَكْرُوبينَ، وَيا مُجيبَ دَعْوَةِ الْمُضْطَرّينَ، وَيا مُغيثَ الْمَهْمُومينَ، اكْشِفْ عَنّي ضُرّي وَهَمّي وَكَرْبي وَغَمّي كَما كَشَفْتَ عَنْ نَبِيِّكَ صَلَّى اللهُ عَلَيْهِ وَآلِهِ هَمَّهُ، وَكَفَيْتَهُ هَوْلَ عَدُوِّهِ، وَاكْفِني ما اَهَمَّني مِنَ أَمْرِ الدُّنْيا وَالاْخِرَةِ، يا اَرْحَمَ الرّاحِمينَ.\n\n'
                      'وتصّلّي ما استطعت في دار الامام زين العابدين ودار الامام جعفر الصّادق (عليهما السلام) وفي مسجد سلمان ومسجد أمير المؤمنين (عليه السلام) المحاذي قبر حمزة ومسجد المباهلة وتدعُو بما تشاء ان شاء الله تعالى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Alwada3.screenRoute,
          pushBack: ZiyaratKobourAlshohada2.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/ذكر المساجد المعظمة.mp3',
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
