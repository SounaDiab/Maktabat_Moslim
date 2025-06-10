import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/favorites_screen.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../zi_lhoja.dart';
import 'alyawm_alrabi3_wal3ishroun_zilhoja.dart';
import 'ziyarat_amir_almo2minin_yawm_al8adir.dart';

class AlyawmAl2a5irMenZilhoja extends StatefulWidget {
  static String screenRoute = 'alyawm_al2a5ir_men_zilhoja_screen';
  const AlyawmAl2a5irMenZilhoja({super.key});

  @override
  State<AlyawmAl2a5irMenZilhoja> createState() =>
      _AlyawmAl2a5irMenZilhojaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlyawmAl2a5irMenZilhojaState extends State<AlyawmAl2a5irMenZilhoja> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alyawm_al2a5ir_men_zilhoja_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alyawm_al2a5ir_men_zilhoja_screen', value);
  }

    Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiLhoja.screenRoute);
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
                      .addFavorite('اليوم الأخير من ذي الحجة',
                          AlyawmAl2a5irMenZilhoja.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'اليوم الأخير من ذي الحجة',
                          AlyawmAl2a5irMenZilhoja.screenRoute,
                          AlyawmAl2a5irMenZilhoja.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اليوم الأخير من ذي الحجة',
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
                      'يوم الختام للسّنة العربيّة. ذكر السّيد في الاقبال طِبقاً لبعض الرّوايات انّه يُصلّي فيه ركعتان بفاتحة الكتاب وعشر مرّات سورة قُلْ هُوَ اللهُ اَحَدٌ وعشر مرّات آية الكرسي ثمّ يدعى بعد الصّلاة بهذا الدّعاء :\n\n'
                      'اَللّـهُمَّ ما اَللّـهُمَّ ما عَمِلْتُ فى هذِهِ السَّنَةِ مِنْ عَمَل نَهَيْتَنى عَنْهُ وَلَمْ تَرْضَهُ وَنَسيتَهُ وَلَمْ تَنْسَهُ وَدَعَوْتَنى اِلَى التَّوْبَةِ بَعْدَ اجْتِرائى عَلَيْكَ اَللّـهُمَّ فَاِنّى اَسْتَغْفِرُكَ مِنْهُ فَاغْفِر لى وَما عَمِلْتُ مِنْ عَمَل يُقَرِّبُنى اِلَيْكَ فَاقْبَلْهُ مِنّى وَلا تَقْطَعْ رَجآئى مِنْكَ يا كَريمُ.\n\n'
                      'فاذا قلت هذا قال الشّيطان يا ويلي ما تعبت فيه هذه السّنة هدمه أجمع بهذه الكلمات وشهدت له السّنة الماضية انّه قد ختمها بخيْر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: ZiyaratAmirAlmo2mininYawmAl8adir.screenRoute,
        pushBack: AlyawmAlrabi3Wal3ishrounZilhoja.screenRoute,
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
