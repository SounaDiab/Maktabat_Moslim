import 'package:flutter/material.dart';
import '../../widgets/bloc_builder_herz_almoujahidin.dart';
import '../../widgets/scroll_title.dart';
import '../herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'aawzat_alnabi_yawm_wadi_alkora_page.dart';
import 'ayat_alhefz_men_saif_alaadow_page.dart';

class HerzAlimamAljawadPage extends StatefulWidget {
  static String screenRoute = 'herzalimamaljawad_screen';
  HerzAlimamAljawadPage({super.key});

  @override
  State<HerzAlimamAljawadPage> createState() => _HerzAlimamAljawadPageState();
}

class _HerzAlimamAljawadPageState extends State<HerzAlimamAljawadPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_herzalimamaljawad_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzalimamaljawad_screen', value);
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
                color: isIcon ? Theme.of(context).iconTheme.color : Colors.red,
              ),
              onPressed: () async {
                setState(() {
                  isIcon = !isIcon;
                });
                await _saveFavoriteState(isIcon);

                if (!isIcon) {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .addFavorite('حرز الإمام الجواد (ع)',
                          HerzAlimamAljawadPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'حرز الإمام الجواد (ع)',
                          HerzAlimamAljawadPage.screenRoute,
                          HerzAlimamAljawadPage.screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(title: 'حرز الإمام الجواد (ع)'),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilderHerzAlmoujahidin(
                text: 'حرز الامام الجواد عليه السلام',
                isKoraan: false,
                firstTitle: 'تعريف',
                secondTitle: 'آثاره',
                thirdTitle: 'الحرز:',
                fontSize: _fontSize,
                fontSizeTablet: _fontSizeTablet,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 29, vertical: 5),
                child: Text(
                  'وإذا أردت شدّه على عضدك  فلتشدّه على عضدك الأيمن, ولتتوضأ وضوءاً حسناً سابغاً, وصلِّ أربع ركعات وتقرأ في كلّ ركعة:\n'
                  'فاتحة الكتاب, - مرّة -, وآية الكرسي - سبع مرّات -, وآية شهد الله - سبع مرّات -, والشمس وضحاها - سبع مرات -, والليل إذا يغشى - سبع مرّات -, وقل هوالله أحد - سبع مرّات -.\n'
                  'فإذا فرغت فشدّه على عضدك الأيمن وينبغي أن لا يكون طلوع القمر في برج العقرب.\n'
                  'ولَّا كان الحرز مجهزاً يباع في الأسواق فنكتفي بهذا دون تدين نصّ الحرز ومن أراد الاطلاع فليراجع المهج.',
                  style: TextStyle(
                    fontSize: isTablet ? _fontSizeTablet : _fontSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AawzatAlnabiYawmWadiAlkoraPage.screenRoute,
          pushBack: AyatAlhefzMenSaifAlaadowPage.screenRoute,
          soud:
              'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/حرز الإمام الجواد.mp3',
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
