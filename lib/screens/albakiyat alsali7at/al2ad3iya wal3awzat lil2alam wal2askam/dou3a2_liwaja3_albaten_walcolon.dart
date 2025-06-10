import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'awza_liwaja3_alasnan.dart';
import 'dou3a2_lilso2lol_wlilawram.dart';

class Dou3a2Liwaja3AlbatenWalcolon extends StatefulWidget {
  static String screenRoute = 'dou3a2_liwaja3_albaten_walcolon_screen';
  const Dou3a2Liwaja3AlbatenWalcolon({super.key});

  @override
  State<Dou3a2Liwaja3AlbatenWalcolon> createState() =>
      _Dou3a2Liwaja3AlbatenWalcolonState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Liwaja3AlbatenWalcolonState
    extends State<Dou3a2Liwaja3AlbatenWalcolon> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_dou3a2_liwaja3_albaten_walcolon_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_dou3a2_liwaja3_albaten_walcolon_screen', value);
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
                      .addFavorite('دعاء لوجع البطن والقولنج',
                          Dou3a2Liwaja3AlbatenWalcolon.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء لوجع البطن والقولنج',
                          Dou3a2Liwaja3AlbatenWalcolon.screenRoute,
                          Dou3a2Liwaja3AlbatenWalcolon.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء لوجع البطن والقولنج',
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
                      'عن النبي (صلّى الله عليه وآله وسلم) يشرب شربة عسل بماء حار ويعوذه بفاتحة الكتاب سبع مرات أيضا، عن أمير المؤمنين (صلوات الله وسلامه عليه) يشرب ماءً حاراً ويقول : ياالله ياالله ياالله يارَحْمنُ يارَحيمُ يارّبَّ الاٌرْبابِ، ياإلهَ الالَهَةِ يامَلِكَ المُلوكِ ياسَيّدَ السّادَةِ إشْفِني بِشِفائِكَ مِنْ كُلِّ داً وَسَقْمٍ فَإنّي عَبْدُكَ وَابْنُ عَبْدِكَ أتَقَلَّبُ في قَبْضَتِكَ .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أيضاً لوجع البطن وغيره',
                  subtitle:
                      'يضع يده عليه ويقول سبعا: أعوذُ بِعِزَّةِ الله وَجَلالِهِ مِنْ شَرِّ ما أجِدُ. ويضع اليد اليمنى على الوجع ويقول ثلاثا : بِسْمِ اللّهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'للقولنج',
                  subtitle:
                      'يكتب على لوح أو كتف: الحمد والتوحيد والمعوذتين، يكتب تحتها : أعوذُ بِوَجْهِ الله العَظيمُ وبِعِزَّتِهِ التي لاتُرامُ وَبِقُدْرَتِهِ الَّتي لايَمْتَنِعُ مِنْها شَيٌ مِنْ شَرِّ هذا الوَجَعِ وَمِنْ شَرِّ مافِيهِ وَمِنْ شَرِّ ماأجِدُ مِنْهُ، ثم يغسله بماء السماء، فيشربه على الريق وعند النوم، فذلك مبارك نافع.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'لوجع البطن والقولنج',
                  subtitle:
                      'روي أن رجلاً شكى إلى رسول الله (صلّى الله عليه وآله وسلم) ماأصاب أخاه من وجع البطن، فقال له النبي (صلّى الله عليه وآله وسلم) : مر أخاك أن يشرب شرابا من العسل الممزوج بالماء الحار، فانطلق الرجل وعاد إليه بكرة فقال: قد أشربته الشراب فلم ينجع فقال (صلّى الله عليه وآله وسلم): صدق الله وكذب بطن أخيك. انطلق وأعطه الشراب، وعوذه بسورة الحمد سبع مرات، فلما مضى الرجل قال (صلّى الله عليه وآله وسلم) لعلي (عليه السلام) ياعلي إنّ أخاه رجل منافق ولاجل ذلك لم ينجع فيه الشراب.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Lilso2lolWlilawram.screenRoute,
          pushBack: AwzaLiwaja3Alasnan.screenRoute,
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
