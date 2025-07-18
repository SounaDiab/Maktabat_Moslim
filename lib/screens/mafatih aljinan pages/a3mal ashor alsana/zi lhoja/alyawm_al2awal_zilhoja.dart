import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../zi_lhoja.dart';
import 'alyawm_alsabi3_zilhoja.dart';
import 'fi_a3mal_shaher_zilhoja.dart';

class AlyawmAl2awalZilhoja extends StatefulWidget {
  static String screenRoute = 'alyawm_al2awal_zilhoja_screen';
  const AlyawmAl2awalZilhoja({super.key});

  @override
  State<AlyawmAl2awalZilhoja> createState() => _AlyawmAl2awalZilhojaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlyawmAl2awalZilhojaState extends State<AlyawmAl2awalZilhoja> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alyawm_al2awal_zilhoja_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alyawm_al2awal_zilhoja_screen', value);
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
                      .addFavorite(
                          'اليوم الأول', AlyawmAl2awalZilhoja.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'اليوم الأول',
                          AlyawmAl2awalZilhoja.screenRoute,
                          AlyawmAl2awalZilhoja.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اليوم الأول',
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
                padding: EdgeInsets.all(20),
                child: Text(
                  'يوم شريف جدّاً وقد ورد فيه عدّة أعمال :',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle: 'الصّيام فانّه يعدَل صوم ثمانين شهراً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle:
                      'صلاة فاطمة (عليها السلام) ، قال الشّيخ : روي انّها أربع ركعات بسلامين وهي كصلاة أمير المؤمنين (عليه السلام) يقرأ في كلّ ركعة الحمد مرّة والتّوحيد خمسين مرّة ويسبّح بعد السّلام تسبيحها (عليها السلام) ويقول :\n\n'
                      'سُبْحانَ ذِى الْعِزِّ الشّامِخِ الْمُنيفِ، سُبْحانَ ذِى الْجَلالِ الْباذِخِ الْعَظيمِ، سُبْحانَ ذِى الْمُلكِ الْفاخِرِ الْقَديمِ، سُبْحانَ مَنْ يَرى اَثَرَ الَّنمْلَةِ فِى الصَّفا، سُبْحانَ مَنْ يَرى وَقْعَ الطَّيْرِ فِى الْهَوآءِ، سُبْحانَ مَنْ هُوَ هَكَذا وَلا هُكَذا غَيْرُهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle:
                      'الصّلاة ركعتان قبل الزّوال بنِصف ساعة، يقرأ في كلّ ركعة الحمد مرّة وكلاً من التّوحيد وآية الكرسي والقدر عشر مرّات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle:
                      'من خاف ظالماً فقال في هذا اليوم : حَسْبى حَسْبى حَسْبى مِنْ سُؤالى عِلْمُكَ بِحالى كفاه الله شرّه، واعلم انّ في هذا اليوم ولد ابراهيم الخليل (عليه السلام) وعلى رواية الشّيخين كان فيه أيضاً تزويج فاطمة من أمير المؤمنين (عليهما السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAlsabi3Zilhoja.screenRoute,
        pushBack: FiA3malShaherZilhoja.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اليوم الاول من ذي الحجة.mp3',
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
