import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../lailat_aljom3a_wnaharaha_w2a3malaha.dart';
import 'a3mal_lailat_aljom3a.dart';
import 'salat_al2imam_al3askari.dart';

class Salat2imamAlmahdi extends StatefulWidget {
  static String screenRoute = 'salat_al2imam_almahdi_screen';
  const Salat2imamAlmahdi({super.key});

  @override
  State<Salat2imamAlmahdi> createState() => _Salat2imamAlmahdiState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Salat2imamAlmahdiState extends State<Salat2imamAlmahdi> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_al2imam_almahdi_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_al2imam_almahdi_screen', value);
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
          .pushReplacementNamed(LailatAljom3aWnaharahaW2a3malaha.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (previousPage == 'favorite_screen') {
                Navigator.of(context)
                    .pushReplacementNamed(FavoritesScreen.screenRoute);
              } else {
                Navigator.of(context).pushReplacementNamed(
                    LailatAljom3aWnaharahaW2a3malaha.screenRoute);
              }
            },
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
                      .addFavorite('صلاة الحجة القائم ودعاؤه (عج)',
                          Salat2imamAlmahdi.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الحجة القائم ودعاؤه (عج)',
                          Salat2imamAlmahdi.screenRoute,
                          Salat2imamAlmahdi.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الحجة القائم ودعاؤه (عج)',
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
                      'ركعتان تقرأ في كل ركعة فاتحة الكتاب الى (إياك نعبد وإياك نستعين) ثم تكرر هذه الاية مائة مرة ثم تتم قراءة الفاتحة وتقرأ بعدها الاخلاص (قل هو الله أحد) مرة واحدة وتدعو عقيبهما فتقول:\n\n'
                      'اللهم عظم البلاء وبرح الخفاء وانكشف الغطاء وضاقت الارض بما وسعت السماء وإليك يا رب المشتكى وعليك المعول في الشدة والرخاء اللهم صل على محمد وآل محمد الذين أمرتنا بطاعتهم وعجل اللهم فرجهم بقائمهم واظهر اعزازه يا محمد يا علي يا علي يا محمد اكفياني فانكما كافياي يا محمد يا علي يا علي يا محمد انصراني فانكما ناصراي يا محمد يا علي يا علي يا محمد احفظاني فانكما حافظاي يامولاي يا صاحب الزمان يا مولاي يا صاحب الزمان يا مولاي يا صاحب الزمان الغوث الغوث الغوث، ادركني ادركني ادركني، الامان الامان الامان.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: A3malLailatAljom3a.screenRoute,
        pushBack: SalatAl2imamAl3askari.screenRoute,
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
