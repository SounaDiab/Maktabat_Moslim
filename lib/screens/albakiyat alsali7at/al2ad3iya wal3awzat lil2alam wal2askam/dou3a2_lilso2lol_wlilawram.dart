import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'dou3a2_lita3asor_alwilada.dart';
import 'dou3a2_liwaja3_albaten_walcolon.dart';

class Dou3a2Lilso2lolWlilawram extends StatefulWidget {
  static String screenRoute = 'dou3a2_lilso2lol_wlilawram_screen';
  const Dou3a2Lilso2lolWlilawram({super.key});

  @override
  State<Dou3a2Lilso2lolWlilawram> createState() =>
      _Dou3a2Lilso2lolWlilawramState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Lilso2lolWlilawramState
    extends State<Dou3a2Lilso2lolWlilawram> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_dou3a2_lilso2lol_wlilawram_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_dou3a2_lilso2lol_wlilawram_screen', value);
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
                      .addFavorite('دعاء للثؤلول و للاورام',
                          Dou3a2Lilso2lolWlilawram.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء للثؤلول و للاورام',
                          Dou3a2Lilso2lolWlilawram.screenRoute,
                          Dou3a2Lilso2lolWlilawram.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء للثؤلول و للاورام',
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
                  title: 'للثؤلول',
                  subtitle:
                      'وهو خراج ناتي يظهر في اليد غالبا خذ لكل ثؤلول سبع شعيرات وأقرأ على كل شعيرة من أول سورة الواقعة إلى قوله : هَباءً مُنْبَثا. وَيَسْأَلونَكَ عِنِ الجِبّالِ فَقُلْ يَنْسِفُها رَبّي نَسْفا فَيَذَرُها قاعا صَفْصَفا لاتَرى فيها عِوجا وَلا أمْتا. سبعا ثم خذ شعيرة شعيرة وامسح بها على الثؤلول ثم صيرها في خرقة واربط على الخرقة حجراً وألقها في البئر.\n\n'
                      'قيل : وينبغي أن تعمل ذلك في محاق الشهر. ونقل أيضاً أنه ياخذ المصاب بالثؤلول قطعة من الملح فيمسح بها الثؤلول ويتلو عليه ثلاثا : لَوْ أنْزَلْنا هذا القُرآنَ عَلى جَبَلٍ إلى آخر سورة الحشر، فيلقيها في تنور ويمر عنه مسرعا فيزول إن شاء اللّه. وفي (الخزائن) ان طلي الثؤلول بالنورة يزيله.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'للاورام',
                  subtitle:
                      'روي أنك تقرأ عليها وانت طاهر قد أعددت وضؤك لصلاة الفريضة ؛ قبل الصلاة وبعدها : لَوْ أنْزَلْنا هذا القُرآنَ عَلى جَبَلٍ… إلى آخر السورة، وتدبرها وأنت تتلوها فتسكن إن شاء اللّه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Lita3asorAlwilada.screenRoute,
          pushBack: Dou3a2Liwaja3AlbatenWalcolon.screenRoute,
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
