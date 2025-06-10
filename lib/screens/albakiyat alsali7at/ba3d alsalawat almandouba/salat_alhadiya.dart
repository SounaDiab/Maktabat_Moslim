import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_al2a3rabi.dart';
import 'salat_lailat_aldafn.dart';

class SalatAlhadiya extends StatefulWidget {
  static String screenRoute = 'salat_alhadiya_screen';
  const SalatAlhadiya({super.key});

  @override
  State<SalatAlhadiya> createState() => _SalatAlhadiyaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAlhadiyaState extends State<SalatAlhadiya> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_alhadiya_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_alhadiya_screen', value);
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
                      .addFavorite(
                          'صلاة الهدية', SalatAlhadiya.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الهدية',
                          SalatAlhadiya.screenRoute,
                          SalatAlhadiya.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الهدية',
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
                      'روي عن المعصومين (عليهم السلام) أنه يصلي العبد في يوم الجمعة ثماني ركعات، أى يسلم بين كل ركعتين: أربعا منها تهدى إلى رسول الله (صلّى الله عليه وآله وسلم) وأربعا تهدى إلى فاطمة (عليها السلام)، ويصلي يوم السبت أربع ركعات تهدى إلى أمير المؤمنين (صلوات الله وسلامه عليه)، ثم كذلك كل يوم تهدى إلى واحد من الأئمة المعصومين (عليهم السلام)، إلى يوم الخميس أربع ركعات تهدى إلى جعفر بن محمد الصادق (عليه السلام) ثم يوم الجمعة أيضاً ثماني ركعات: أربعا تهدى إلى رسول الله (صلّى الله عليه وآله وسلم)، وأربع ركعات تهدى إلى فاطمة (عليها السلام). ثم يوم السبت أربع ركعات تهدى إلى موسى بن جعفر (عليه السلام) ثمّ كذلك إلى يوم الخميس أربع ركعات تهدى إلى صاحب الزمان (صلوات الله وسلامه عليه).\n\n'
                      'الدعاء بين كل ركعتين منها هو: اللَّهُمَّ أنْتَ السَّلامُ وَمِنْكَ السَّلامُ وإلَيْكَ يَعودُ السَّلامُ حَيِّنا رَبَّنا مِنْكَ بِالسَّلامِ، اللَّهُمَّ إنَّ هذِهِ الرَّكَعاتِ هَديَّةٌ مَنّا إِلى وَليّكَ (فُلان)، فصَلِّ عَلى مُحَمَّدٍ وَآل مُحَمَّدٍ وَبَلِّغْهُ إيّاها، وَأعْطِني أفْضَلَ أمَلي وَرَجائي فيكَ وَفي رَسولِكَ صَلَواتُ الله وَسَلامُهُ عَلَيْهِ. وفيه وتدعو بما أحببت وسم الإمام الذي تهدي إليه الصلاة عوضا عن كلمة فلان.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatLailatAldafn.screenRoute,
          pushBack: SalatAl2a3rabi.screenRoute,
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
