import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'a3mal_al2ostwana_alsabi3a.dart';
import 'a3mal_bait_altast.dart';

class ZikrAlsalatWaldou3aaFiWasatAlmasjid extends StatefulWidget {
  static String screenRoute = 'zikr_alsalat_waldou3aa_fi_wasat_almasjid_screen';
  const ZikrAlsalatWaldou3aaFiWasatAlmasjid({super.key});

  @override
  State<ZikrAlsalatWaldou3aaFiWasatAlmasjid> createState() =>
      _ZikrAlsalatWaldou3aaFiWasatAlmasjidState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZikrAlsalatWaldou3aaFiWasatAlmasjidState
    extends State<ZikrAlsalatWaldou3aaFiWasatAlmasjid> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs
        .getBool('isFavorite_zikr_alsalat_waldou3aa_fi_wasat_almasjid_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_zikr_alsalat_waldou3aa_fi_wasat_almasjid_screen', value);
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
          .pushReplacementNamed(FadlLakoufaWmasjidoha.screenRoute);
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
                      .addFavorite('ذكر الصلاة والدعاء في وسط المسجد',
                          ZikrAlsalatWaldou3aaFiWasatAlmasjid.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'ذكر الصلاة والدعاء في وسط المسجد',
                          ZikrAlsalatWaldou3aaFiWasatAlmasjid.screenRoute,
                          ZikrAlsalatWaldou3aaFiWasatAlmasjid.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'ذكر الصلاة والدعاء في وسط المسجد',
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
                      'تُصلّي هناك ركعتين تقرأ في الاولى الحمد والتّوحيد (قُلْ هُوَ اللهُ اَحَدٌ) وفي الثّانية الحمد والجحد (قُلْ يا اَيُّهَا الْكافِرُونَ) فاذا سلّمت وسبّحت فقُل :\n\n'
                      'اَللّـهُمَّ اَنْتَ السَّلامُ وَمِنْكَ السَّلامُ وَاِلَيْكَ يَعُودُ السَّلامُ وَدارُكَ دارُ السَّلامِ، حَيِّنا رَبَّنا مِنْكَ بِالسَّلامِ، اَللّـهُمَّ اِنّي صَلَّيْتُ هذِهِ الصَّلاةَ ابْتِغاءَ رَحْمَتِكَ وَرِضْوانِكَ وَمَغْفِرَتِكَ، وَتَعْظيماً لِمَسْجِدِكَ، اَللّـهُمَّ فَصَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَارْفَعْها في عِلِّيّينَ وَتَقَبَّلها مِنّي يا اَرْحَمَ الرّاحِمينَ.\n\n'
                      'أقول : قد دعى هذا المقام بدكّة المِعراج ووجه التسمية على ما يظهر انّ رسول الله (صلى الله عليه وآله وسلم) استأذن الله تعالى ليلة المعراج فهبط الى الارض في هذه البُقعة فصلّى ركعتين، والرّواية قد أثبتناها في أوّل الفصل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: A3malAl2ostwanaAlsabi3a.screenRoute,
          pushBack: A3malBaitAltast.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/ذكر الصلاة والدعاء في وسط المسجد.mp3',
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
