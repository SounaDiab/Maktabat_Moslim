import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ziarat_al2osbou3.dart';
import 'ziarat_al2a7ad.dart';
import 'ziarat_alsoulasa2.dart';

class ZiaratAl2isnain extends StatefulWidget {
  static String screenRoute = 'ziarat_al2isnain_screen';
  const ZiaratAl2isnain({super.key});

  @override
  State<ZiaratAl2isnain> createState() => _ZiaratAl2isnainState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiaratAl2isnainState extends State<ZiaratAl2isnain> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ziarat_al2isnain_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziarat_al2isnain_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiaratAl2osbou3.screenRoute);
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
                Navigator.of(context)
                    .pushReplacementNamed(ZiaratAl2osbou3.screenRoute);
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
                      .addFavorite(
                          'زيارة يوم الإثنين', ZiaratAl2isnain.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة يوم الإثنين',
                          ZiaratAl2isnain.screenRoute,
                          ZiaratAl2isnain.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة يوم الإثنين',
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
                  'يَوْم الاثنينِ وَهُوَ بِاسْمِ الحسنِ وَالحُسينِ (عليهما السلام)',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'زِيارةُ الحَسَنِ (عليه السلام):',
                  subtitle:
                      'اَلسَّلامُ عَلَيْكَ يَابْنَ رَسُولِ رَبِّ الْعالَمينَ اَلسَّلامُ عَلَيْكَ يَابْنَ اَميرِ الْمُؤْمِنينَ اَلسَّلامُ عَلَيْكَ يَابْنَ فاطِمَةَ الزَّهْراءِ اَلسَّلامُ عَلَيْكَ يا حَبيبَ اللهِ اَلسَّلامُ عَلَيْكَ يا صِفْوَةَ اللهِ اَلسَّلامُ عَلَيْكَ يا اَمينَ اللهِ اَلسَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ اَلسَّلامُ عَلَيْكَ يا نُورَ اللهِ اَلسَّلامُ عَلَيْكَ يا صِراطَ اللهِ اَلسَّلامُ عَلَيْكَ يا بَيانَ حُكْمِ اللهِ اَلسَّلامُ عَلَيْكَ يا ناصِرَ دينِ اللهِ اَلسَّلامُ عَلَيْكَ اَيُّهَا السَّيِدُ الزَّكِيُّ اَلسَّلامُ عَلَيْكَ اَيُّهَا الْبَرُّ الْوَفِيُّ اَلسَّلامُ عَلَيْكَ اَيُّهَا الْقائِمُ الاَْمينُ اَلسَّلامُ عَلَيْكَ اَيُّهَا الْعالِمُ بِالتَّأْويلِ اَلسَّلامُ عَلَيْكَ اَيُّهَا الْهادِي الْمَهْديُّ اَلسَّلامُ عَلَيْكَ اَيُّهَا الطّاهِرُ الزَّكِيُّ اَلسَّلامُ عَلَيْكَ اَيُّهَا التَّقِيُّ النَّقِيُّ السَّلامُ عَلَيْكَ اَيُّهَا الْحَقُّ الْحَقيقُ اَلسَّلامُ عَلَيْكَ اَيُّهَا الشَّهيدُ الصِّدّيقُ اَلسَّلامُ عَلَيْكَ يا اَبا مُحَمَّد الْحَسَنَ بْنَ عَلِيٍّ وَ رَحْمَةُ اللهِ وَبَرَكاتُهُ.',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'زِيارة الحُسَينِ (عليه السلام):',
                  subtitle:
                      'اَلسَّلامُ عَلَيْكَ يَابْنَ رَسُولِ اللهِ اَلسَّلامُ عَلَيْكَ يَابْنَ اَميرِ الْمُؤْمِنينَ اَلسَّلامُ عَلَيْكَ يَابْنَ سَيِّدَةِ نِساءِ الْعالَمينَ اَشْهَدُ اَنـَّكَ اَقَمْتَ الصلاةَ وَ آتَيْتَ الزَّكوةَ وَاَمَرْتَ بِالْمَعْرُوفِ وَنَهَيْتَ عَنِ الْمُنْكَرِ وَعَبَدْتَ اللهَ مُخْلِصاً وَجاهَدْتَ فِي اللهِ حَقَّ جِهادِهِ حَتّى أتاكَ الْيَقينُ فَعَلَيْكَ السَّلامُ مِنّي ما بَقيتُ وَبَقِيَ اللَّيْلُ وَالنَّهارُ وَعَلى آلِ بَيْتِكَ الطَّيِّبينَ الطّاهِرينَ، اَنَا يا مَوْلايَ مَوْلىً لَكَ وَلاِلِ بَيْتِكَ سِلْمٌ لِمَنْ سالَمَكُمْ وَحَرْبٌ لِمَنْ حارَبَكُمْ مُؤْمِنٌ بِسِرِّكُمْ وَجَهْرِكُمْ وَظاهِرِكُمْ وَباطِنِكُمْ لَعَنَ اللهُ اَعْداءَكُمْ مِنَ الاَْوَّلينَ وَالاْخِرينَ وَاَنـَا أبْرَأُ اِلَى اللهِ تَعالى مِنْهُمْ يا مَوْلايَ يا اَبا مُحَمَّد يا مَوْلايَ يا اَبا عَبْدِ اللهِ هذا يَوْمُ الاِْثْنَيْنِ وَهُوَ يَوْمُكُما وَبِاسْمـِكُما وَاَنـَا فيهِ ضَيْفُكُما فَاَضيفانى وَاَحْسِنا ضِيافَتى فَنِعْمَ مَنِ اسْتُضيفَ بِهِ اَنْتُما وَاَنـَا فيهِ مِنْ جِوارِكُما فَاَجيرانى فَاِنَّكُما مَأْمُورانِ بِالضِّيافَةِ وَالاِْجارَةِ فَصَلَّى اللهُ عَلَيْكُما وَآلِكُمَا الطَّيِّبينَ.',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiaratAlsoulasa2.screenRoute,
          pushBack: ZiaratAl2a7ad.screenRoute,
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
