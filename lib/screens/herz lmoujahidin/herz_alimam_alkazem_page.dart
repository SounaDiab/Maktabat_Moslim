import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz%20lmoujahidin/herz_alrasoul_wal_aimma_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'herz_alimam_alrida_page.dart';
import 'herz_alimam_alsadek_page.dart';

class HerzAlimamAlkazemPage extends StatefulWidget {
  static String screenRoute = 'herzalimamalkazem_screen';
  HerzAlimamAlkazemPage({super.key});

  @override
  State<HerzAlimamAlkazemPage> createState() => _HerzAlimamAlkazemPageState();
}

class _HerzAlimamAlkazemPageState extends State<HerzAlimamAlkazemPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_herzalimamalkazem_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzalimamalkazem_screen', value);
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
          .pushReplacementNamed(HerzAlrasoulWalAimmaPage.screenRoute);
      return false;
    }
  }

  double _fontSize = 18;
  double _fontSizeTablet = 30;
  @override
  Widget build(BuildContext context) {
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
                      .addFavorite('حرز الإمام الكاظم (ع)',
                          HerzAlimamAlkazemPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'حرز الإمام الكاظم (ع)',
                          HerzAlimamAlkazemPage.screenRoute,
                          HerzAlimamAlkazemPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حرز الإمام الكاظم (ع)',
            style: TextStyle(
              fontSize: isTablet ? 40 : 19,
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
              bottom: 10,
            ),
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Center(
                    child: Text(
                      'بسم الله الرحمن الرحيم',
                      style: TextStyle(
                        fontSize: isTablet ? _fontSizeTablet : _fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: '',
                    subtitle:
                        'يا الله يا حافظ، يا حفيظ، يا قريب، يا حيّ، يا قيّوم، برحمتك أغثني، ولا تكلني إلى نفسي طرفة عينٍ أبداً وأصلح لي شأني كلّه.\n\n'
                        'إلهي من عدوٍّ شحذ لي ظُبَةَ مدينته، وأرهف لي شبا حدِّه وداف لي قواتل سمومه ولم تنم عنِّي عين حراسته، فلمّا رأيت ضعفي عن احتمال الفوادح، وعجزي عن مُالِمّات الجوائح، صرفت ذلك عنِّي بحولك وقوَّتك، لا بحولٍ منِّي ولا قوَّةٍ، فألقيته في الحفير الذي احتفره لي خائباً ممّا أمَّله في الدنيا، متباعداً ممّا رجاه في الآخرة، فلك الحمد على ذلك قدر استحقاقك سيّدي، اللَّهمَّ فخُذْهُ بعزَّتك، وافلل حدَّه عنِّي بقُدرتك، واجعل له شُغلاً فيما يليه، وعجزاً عمّا يناوبه، اللهم وأعدني عليه عدوى حاضرةً تكون من غيظي شفاءً، ومن حنقي عليه وقاءً، وصل اللهم دعائي بالإجابة، وانظم شكايتي بالتغيير وعرّفه عمّا قليلٍ، ما أوعدت الظالمين، وعرِّفني ما وعدت في إجابة المضطرّين، إنك ذو الفضل العظيم، والمنِّ الكريم.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HerzAlimamAlridaPage.screenRoute,
          pushBack: HerzAlimamAlsadekPage.screenRoute,
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
