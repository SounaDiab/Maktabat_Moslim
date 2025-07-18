import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'awza_liwaja3_al3ain.dart';
import 'awza_liwaja3_al3awra.dart';

class AwzaLiwaja3Alrokba extends StatefulWidget {
  static String screenRoute = 'awza_liwaja3_alrokba_screen';
  const AwzaLiwaja3Alrokba({super.key});

  @override
  State<AwzaLiwaja3Alrokba> createState() =>
      _AwzaLiwaja3AlrokbaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AwzaLiwaja3AlrokbaState
    extends State<AwzaLiwaja3Alrokba> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_awza_liwaja3_alrokba_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_awza_liwaja3_alrokba_screen', value);
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
                      .addFavorite('عوذة لوجع الركبة',
                          AwzaLiwaja3Alrokba.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'عوذة لوجع الركبة',
                          AwzaLiwaja3Alrokba.screenRoute,
                          AwzaLiwaja3Alrokba.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'عوذة لوجع الركبة',
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
                      'عن كتاب (طب الأئمة) عن جابر الجعفي، عن الإمام الباقر (عليه السلام) قال :\n\n'
                      'كنت عند الحسين بن علي (عليهما السلام) إذ أتاه رجل من بني أميّة من شيعتنا فقال له : يابن رسول الله ماقدرت أن أمشي إليك من وجع رجلي. قال : فأين أنت من عوذة الحسن بن علي (عليه السلام). قال : ياابن رسول الله وما ذاك قال: إنّا فَتَحْنا لَكَ فَتْحاً مُبيناً إلى وَكان الله عَزيزاً حَكيماً. قال ففعلت ما أمرني به، فما أحسست بعد ذلك بشي. وروي أيضاً لوجع الركبة أنّه إذا صليت فقل : ياأجْوَدَ مَنْ أعْطى ياخَيْرَ مَنْ سُئِلْ وَياأرْحَمَ مَنْ أُسْتُرْحِمْ، إرْحَمْ ضَعْفي وَقِلَّةَ حيلَتي وَاعْفِني مِنْ وَجَعي. وروي لوجع الساقين أن عوذهما بهذه الآية سبع مرات : وَأُتْلُ ما أوْحي إلَيْكَ مِنْ كِتاب رَبِّكَ لامُبَدِّلَ لِكَلِماتِهِ وَلَنْ تَجِدَ مِنْ دونِهِ مُلْتَحَداً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AwzaLiwaja3Al3ain.screenRoute,
          pushBack: AwzaLiwaja3Al3awra.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/عوذة لوجع الركبة.mp3',
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
