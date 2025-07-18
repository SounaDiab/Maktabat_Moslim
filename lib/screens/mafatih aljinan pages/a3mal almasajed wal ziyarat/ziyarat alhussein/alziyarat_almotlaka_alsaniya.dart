import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'alziyarat_almotlaka_al2oula.dart';
import 'alziyarat_almotlaka_alsalisa.dart';

class AlziyaratAlmotlakaAlsaniya extends StatefulWidget {
  static String screenRoute = 'alziyarat_almotlaka_alsaniya_screen';
  const AlziyaratAlmotlakaAlsaniya({super.key});

  @override
  State<AlziyaratAlmotlakaAlsaniya> createState() =>
      _AlziyaratAlmotlakaAlsaniyaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlziyaratAlmotlakaAlsaniyaState
    extends State<AlziyaratAlmotlakaAlsaniya> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alziyarat_almotlaka_alsaniya_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_alziyarat_almotlaka_alsaniya_screen', value);
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
          .pushReplacementNamed(ZiyaratAlhousseinWa2adabiha.screenRoute);
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
                          'الزيارة المطلقة الثانية للحسين (عليه السلام)',
                          AlziyaratAlmotlakaAlsaniya.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الزيارة المطلقة الثانية للحسين (عليه السلام)',
                          AlziyaratAlmotlakaAlsaniya.screenRoute,
                          AlziyaratAlmotlakaAlsaniya.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الزيارة المطلقة الثانية للحسين (عليه السلام)',
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
                  title:
                      'روى الشّيخ الكليني عن الامام علي النّقي (عليه السلام) قال : تقول عند الحسين (عليه السلام) :',
                  subtitle:
                      'اَلسَّلامُ عَلَيْكَ يا اَبا عَبْدِاللهِ، اَلسَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ فِي اَرْضِهِ وَشاهِدَهُ عَلى خَلْقِهِ، اَلسَّلامُ عَلَيْكَ يا بْنَ رَسُولِ اللهِ، اَلسَّلامُ عَلَيْكَ يا بْنَ عَليِّ الْمُرْتَضى، اَلسَّلامُ عَلَيْكَ يا بْنَ فاطِمَةَ الزَّهْراءِ، اَشْهَدُ اَنَّكَ قَدْ اَقَمْتَ الصَّلاةَ وَآتَيْتَ الزَّكاةَ، وَاَمَرْتَ بِالْمَعْرُوفِ وَنَهَيْتَ عَنِ الْمُنْكَرِ، وَجاهَدْتَ فِي سَبيلِ اللهِ حَتّى اَتاكَ الْيَقينُ، فَصَلّى اللهُ عَلَيْكَ حَيّاً وَميّتاً، ثمّ تضع خدّك الايمن على القبر وتقول : اَشْهَدُ اَنَّكَ عَلى بَيِّنَة مِنْ رَبِّكَ، جِئْتُ مُقِرّاً بِالذُّنُوبِ لِتَشْفَعَ لي عِنْدَ رَبِّكَ يَا بْنَ رَسُولِ اللهِ، ثم سمّ الائمة (عليهم السلام) بأسمائهم واحداً بعد واحد وقُل : اَشْهَدُ اَنَّكُمْ حُجَجُ اللهِ (ثمّ قُل) : اُكْتُبْ لي عِنْدَكَ ميثاقاً وَعَهْداً اِنّي اَتَيْتُكَ مُجَدِّداً الْميثاقَ فَاشْهَدْ لي عِنْدَ رَبِّكَ اِنَّكَ اَنْتَ الشّاهِدُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlziyaratAlmotlakaAlsalisa.screenRoute,
          pushBack: AlziyaratAlmotlakaAl2oula.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الزيارة المطلقة الثانية.mp3',
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
