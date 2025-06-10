import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import '../herz_almoujahidin_home_screen.dart';
import 'ayat_listekfaa_page.dart';
import 'douaa_lidafea_kaid_aladow_wsharoh_page.dart';

class DouaaIkhdaaRikabAljababiraPage extends StatefulWidget {
  static String screenRoute = 'douaaikhdaarikabaljababira_screen';
  DouaaIkhdaaRikabAljababiraPage({super.key});

  @override
  State<DouaaIkhdaaRikabAljababiraPage> createState() =>
      _DouaaIkhdaaRikabAljababiraPageState();
}

class _DouaaIkhdaaRikabAljababiraPageState
    extends State<DouaaIkhdaaRikabAljababiraPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_douaaikhdaarikabaljababira_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaaikhdaarikabaljababira_screen', value);
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
          .pushReplacementNamed(HerzAlmoujahidinHomeScreen.screenRoute);
      return false;
    }
  }

  double _fontSize = 18;
  double _fontSizeTablet = 30;
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
                      .addFavorite('دعاء إخضاع رقاب الجبابرة',
                          DouaaIkhdaaRikabAljababiraPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء إخضاع رقاب الجبابرة',
                          DouaaIkhdaaRikabAljababiraPage.screenRoute,
                          DouaaIkhdaaRikabAljababiraPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء إخضاع رقاب الجبابرة',
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
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 10,
              right: 30,
              left: 30,
            ),
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListOfNineVerses(
                    title: 'تعريف:',
                    subtitle:
                        'أورده السيد علي خان قدِّس سرُّه في كتابه الكلم الطيِّب والغيث الصيِّب',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'آثاره:',
                    subtitle:
                        'قال في الكلم الطيِّب:\nمن أراد أن تظهر له العجائب وتخضع له رقاب الجبابرة فليكتب هذا الدعاء ويعلِّقه على نفسه, ثم قال بعد ذكر الدعاء: وليداوم على قراءته بعد كل صلاة فإنه مجرَّب',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'الدعاء:',
                    subtitle:
                        'اللّهم انه ليس في السماوات دورات ولا في الأرض غمرات ولا في الشجر ورقات ولا في الاجسام حركات ولا في العيون لحظات ولا في النفوس خطرات, الا وهي بك عارفات ولك شاهدات وعليك دالات وفي ملكك متحيرات، فبالقدرة التي سخرت بها اهل السماوات والأرض سخر لي قلوب المخلوقات إنك على كل شيء قدير وبالإجابة جدير, وصلَّى الله على محمد وآله أجمعين',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: DouaaLidafeaKaidAladowWsharohPage.screenRoute,
          pushBack: AyatListekfaaPage.screenRoute,
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
