import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'dou3a2_liwaja3_albaten_walcolon.dart';
import 'dou3a2_liwaja3_alfam.dart';

class AwzaLiwaja3Alasnan extends StatefulWidget {
  static String screenRoute = 'awza_liwaja3_alasnan_screen';
  const AwzaLiwaja3Alasnan({super.key});

  @override
  State<AwzaLiwaja3Alasnan> createState() => _AwzaLiwaja3AlasnanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AwzaLiwaja3AlasnanState extends State<AwzaLiwaja3Alasnan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_awza_liwaja3_alasnan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_awza_liwaja3_alasnan_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(
          Al2ad3iyaWal3awzatLil2alamWal2askam.screenRoute);
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
                          'عوذة لوجع الاسنان', AwzaLiwaja3Alasnan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'عوذة لوجع الاسنان',
                          AwzaLiwaja3Alasnan.screenRoute,
                          AwzaLiwaja3Alasnan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'عوذة لوجع الاسنان',
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
                      'عن الصادق (عليه السلام) يقرأ عليه بعد وضع اليد : الحمد، والتوحيد، والقدر، وقوله تبارك وتعالى : وتَرى الجِبالَ تَحْسَبُها ساكِنَةً وَهي تَمُرُّ مَرَّ السَّحابِ صُنْعَ الله الَّذي أتْقَنَ كُلَّ شَيٍ إنَّهُ خَبيرٌ بِما تَفْعَلونَ.\n\n'
                      'أيضا : عن أمير المؤمنين (صلوات الله وسلامه عليه) : إمسح موضع سجودك ثم امسح السِّنّ الموجع وقل : بِسْمِ الله والشّافي الله ، وَلا حَولَ وَلاقوَةَ إِلاّ بِالله العَليّ العَظيمِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'عوذة مجربة لوجع الاسنان',
                  subtitle:
                      'تقرأ الحمد والمعوذتين والتوحيد وتقرأ مع كل من السور: بِسْمِ الله الرَّحْمنِ الرَّحيمِ وتقول بعد التوحيد: بِسْمِ اللّهِ الرَّحْمنِ الرَّحيمِ وَلَهُ ماسَكَنَ في اللَّيْلِ وَالنَّهارِ وَهوَ السَّميعُ العَليمُ، قُلْنا يانارُ كوني بَرداً وَسَلاما عَلى إبْراهيمَ وَأرادوا بِهِ كَيْداً فَجَعَلناهُمُ الاخْسَرينَ، نُوديَ أنْ بورِكَ مَنْ في النّارِ وَمَنْ حَوْلَها وَسُبْحانَ اللّهِ ربِّ العالَمينَ. ثم تقول: اللّهُمَّ ياكافِياً مِنْ كُلِّ شَيٍ وَلا يَكْفي مِنْكَ شَيٌ إكْفِ عَبْدَكَ وَإبْنَ أمَتِكَ مِنْ شَرِّ ما يَخافُ وَيَحْذَرُ وَمِنْ شَرِّ الوَجَعِ الَّذي يَشْكُوهُ إليكَ. وروي أيضاً أنّه يأخذ مدية أو ورقا من النخل ويمسح على الشق الذي به الالم ويقول سبعاً : بِسْمِ اللّهِ الرَّحْمنِ الرَّحيمِ، بِسْمِ الله وَبِالله مُحَمَّدٌ رَسولُ الله وَإبْراهيمُ خَليلُ الله ، اسْكُنْ بِالَّذي سَكَنَ لَهُ مافي اللَّيلِ وَالنَّهارِ بِإذْنِهِ وَهوَ عَلى كُلِّ شَيٍ قَديرٌ. وروي أيضاً أنّه يضع عوداً أو حديدة على السن ويرقيه من جانبه سبع مرات: بِسْمِ اللّهِ الرَّحْمنِ الرَّحيمِ العَجَبٌ كُلُّ العَجَبِ دودَةٌ تَكُونُ في الفَمِ تَأكُلُ العَظْمَ وَتُنْزِلُ الدَّمَ، أنا الرّاقي وَالله الشّافي وَالكافي، لا إلهَ إِلاّ الله والحَمْدُ لله ربِّ العالَمينَ. وَإذْ قَتَلْتُمْ نَفْسا فَادْارَأتُمْ فيها… يقرأ إلى لَعَلَّكُمْ تَعْقِلونَ سبع مرات يفعل ما قدمناه.\n\n'
                      'وروي لوجع الصدر الآية : وَإذْ قَتَلْتُمْ نَفْسا فَادْارَأتُمْ إلى لَعَلَّكُمْ تَعْقِلونَ. وفي الحديث استشف بالقرآن فإنّه تعالى يقول: فيه شفاءٌ لِما في الصُدورِ.\n\n'
                      'وقد روي للسعال دعاء جامع وهو : اللّهُمَّ أنْتَ رَجائي وَأنْتَ ثِقَتي وعِمادي. وهو دعاء طويل فيطلب من المأخذ وهو كتاب الدعاء من (البحار).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Liwaja3AlbatenWalcolon.screenRoute,
          pushBack: Dou3a2Liwaja3Alfam.screenRoute,
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
