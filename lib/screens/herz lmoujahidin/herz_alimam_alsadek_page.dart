import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz%20lmoujahidin/herz_alrasoul_wal_aimma_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'herz_alimam_albaker_page.dart';
import 'herz_alimam_alkazem_page.dart';

class HerzAlimamAlsadekPage extends StatefulWidget {
  static String screenRoute = 'herzalimamalsadek_screen';
  HerzAlimamAlsadekPage({super.key});

  @override
  State<HerzAlimamAlsadekPage> createState() => _HerzAlimamAlsadekPageState();
}

class _HerzAlimamAlsadekPageState extends State<HerzAlimamAlsadekPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_herzalimamalsadek_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzalimamalsadek_screen', value);
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
                      .addFavorite('حرز الإمام جعفر الصادق (ع)',
                          HerzAlimamAlsadekPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'حرز الإمام جعفر الصادق (ع)',
                          HerzAlimamAlsadekPage.screenRoute,
                          HerzAlimamAlsadekPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حرز الإمام جعفر الصادق (ع)',
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
                  child: Column(
                    children: [
                      ListOfNineVerses(
                        title: '',
                        subtitle:
                            'يا من إذا استعذت به اعانني، وإذا استجرت به عند الشدائد أجارني، وإذا استغثت به عند النوائب أغاثني، وإذا استنصرت به على عدوِّي نصرني وأعانني، إليك المفزع وأنت الثِّقة، فاقمع عنِّي من أرادني واغلب لي من كادني، يا من قال "إن ينصركم الله فلا غالي لكم"، يا من نجَّى نوحاً من القوم الظالمين، يا من نجّى لوطاً من القوم الفاسقين، يا من نجّى هوداً من القوم العادين، يا من نجّى محمداً صلّى الله عليه وآله من القوم الكافرين نجِّني من أعدائي وأعدائك، بأسمائك يا رحمن يا رحيم، لا سبيل لهم على من تعوَّذ بالقرآن، واستجار بالرّحمن الرحيم، "الرحمن على العرش استوى" " إن بطش ربِّك لشديد إنه هو يُبدِئُ ويعيدُ وهو الغفور الودود ذو العرش المجيد فعّالٌ لما يريد"، فإن تولُّوا فقل حسبي الله لا إله إلا هو عليه توكَّلت وهو رب العرش العظيم.',
                        weight: FontWeight.w600,
                        size: isTablet ? _fontSizeTablet : _fontSize,
                      ),
                      ListOfNineVerses(
                        title: '',
                        subtitle: 'وأيضاً عن الإمام الصادق (ع):',
                        weight: FontWeight.w400,
                        size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                      ),
                      ListOfNineVerses(
                        title: '',
                        subtitle:
                            'بسم الله الرحمن الرحيم، العزيز المنان الشديد البرهان، العظيم السلطان "كلَّ يومٍ هو في شأنٍ"، إني أعوذ بك من الطعن والطاعون، والوباء، وموت الفجأة، وأعوذ بك من درك الشقاء، وشماتة الأعداء وسوء القضاء بحق محمد وآله صلّى الله عليه وعلى آله الطيبين الطاهرين المعصومين أجمعين.',
                        weight: FontWeight.w600,
                        size: isTablet ? _fontSizeTablet : _fontSize,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HerzAlimamAlkazemPage.screenRoute,
          pushBack: HerzAlimamAlbakerPage.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/حرز الإمام جعفر الصادق.mp3',
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
