import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../moharam.dart';
import 'alyawm_al3asher.dart';
import 'alyawm_altase3.dart';

class AllaylaAl3ashira extends StatefulWidget {
  static String screenRoute = 'allayla_al3ashira_screen';
  const AllaylaAl3ashira({super.key});

  @override
  State<AllaylaAl3ashira> createState() => _AllaylaAl3ashiraState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AllaylaAl3ashiraState extends State<AllaylaAl3ashira> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_allayla_al3ashira_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_allayla_al3ashira_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Moharam.screenRoute);
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
                          'الليلة العاشرة', AllaylaAl3ashira.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الليلة العاشرة',
                          AllaylaAl3ashira.screenRoute,
                          AllaylaAl3ashira.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الليلة العاشرة',
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
                      'ليلة العاشُوراء ، وقد أورد السّيد في الاقبال لهذه اللّيلة أدعية وصلوات كثيرة بما لها من وافر الفضل منها الصّلاة مائة ركعة كلّ ركعة بالحمد وقُلْ هُوَ اللهُ اَحَدٌ ثلاث مرّات ويقول بعد الفراغ من الجميع سُبْحانَ اللهِ وَالْحَمْدُ للهِ وَلا اِلـهَ اِلاَّ اللهُ وَاللهُ اَكْبَرُ وَلا حَوْلَ وَلا قُوَّةَ اِلاّ بِاللهِ الْعَلىِّ الْعَظيمِ سبعين مرّة وقد ورد الاستغفار ايضاً بعد كلمة (الْعَلىِّ الْعَظيمِ) في رواية أخرى ومنها الصّلاة أربع ركعات في آخر اللّيل يقرأ في كلّ ركعة بعد الحمد كلاً من آية الكرسي والتّوحيد والفلق والنّاس عشر مرّات ويقرأ التّوحيد بعد السّلام مائة مرّة ومنها الصّلاة أربع ركعات يقرأ في كلّ ركعة الحمد والتّوحيد خمسين مرّة وهذه الصّلاة تطابق صلاة أمير المؤمنين صلوات الله وسلامه عليه ذات الفضل العظيم.\n\n'
                      'وقال السّيد بعد ذكر هذه الصّلاة : فاذا سلّمت من الرّابعة فأكثر ذكر الله تعالى والصّلاة على رسوله واللّعن على اعدائهم ما استطعت وروي في فضل احياء هذه اللّيلة انّ من أحياها فكأنّما عبد الله عبادة جميع الملائكة وأجر العامل فيها يعدل سبعين سنة ومن وفّق في هذه اللّيلة لزيارة الحُسين (عليه السلام) بكربلاء والمبيت عنده حتى يصبح حشره الله يوم القيامة ملطّخاً بدم الحسين (عليه السلام) في جملة الشّهداء معه (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAl3asher.screenRoute,
        pushBack: AlyawmAltase3.screenRoute,
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
