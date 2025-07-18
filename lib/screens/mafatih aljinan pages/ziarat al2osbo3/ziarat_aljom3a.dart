import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ziarat_al2osbou3.dart';
import 'ziarat_al5amis.dart';
import 'ziarat_alsabt.dart';

class ZiaratAljom3a extends StatefulWidget {
  static String screenRoute = 'ziarat_aljom3a_screen';
  const ZiaratAljom3a({super.key});

  @override
  State<ZiaratAljom3a> createState() => _ZiaratAljom3aState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiaratAljom3aState extends State<ZiaratAljom3a> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ziarat_aljom3a_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziarat_aljom3a_screen', value);
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
                          'زيارة يوم الجمعة', ZiaratAljom3a.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('زيارة يوم الجمعة',
                          ZiaratAljom3a.screenRoute, ZiaratAljom3a.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة يوم الجمعة',
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
                      'وَهُو يَوم صاحِب الزّمان صلوات الله عليه وباسمه وهُو اليوم الذي يظهر فيه عجّل الله فرجه ; فقل في زيارته:',
                  subtitle:
                      'اَلسَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ في اَرْضِهِ، اَلسَّلامُ عَلَيْكَ يا عَيْنَ اللهِ في خَلْقِهِ، اَلسَّلامُ عَلَيْكَ يا نُورَ اللهِ الَّذي يَهْتَدي بِهِ الْمُهْتَدُونَ وَيُفَرَّجُ بِهِ عَنِ الْمُؤْمِنينَ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الْمُهَذَّبُ الْخائِفُ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الْوَلِيُّ النّاصِحُ، اَلسَّلامُ عَلَيْكَ يا سَفينَةَ النَّجاةِ، اَلسَّلامُ عَلَيْكَ يا عَيْنَ الْحَياةِ، اَلسَّلامُ عَلَيْكَ صَلَّى اللهُ عَلَيْكَ وَعَلى آلِ بَيْتِكَ الطَّيِّبينَ الطّاهِرينَ، اَلسَّلامُ عَلَيْكَ عَجَّلَ اللهُ لَكَ ما وَعَدَكَ مِنَ النَّصْرِ وَظُهُورِ الاَْمْرِ، اَلسَّلامُ عَلَيْكَ يا مَوْلايَ، اَنَا مَوْلاكَ عارِفٌ بِاُولاكَ وَاُخْراكَ اَتَقَرَّبُ اِلَى اللهِ تَعالى بِكَ وَبِآلِ بَيْتِكَ، وَاَنْتَظِرُ ظُهُورَكَ وَظُهُورَ الْحَقِّ عَلى يَدَيْكَ وَأَسْأَلُ اللهَ اَنْ يُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاَنْ يَجْعَلَنى مِنَ الْمُنْتَظِرينَ لَكَ وَالتّابِعينَ وَالنّاصِرينَ لَكَ عَلى اَعْدائِكَ وَالْمُسْتَشْهَدينَ بَيْنَ يَدَيْكَ في جُمْلَةِ اَوْلِيائِكَ، يا مَوْلايَ يا صاحِبَ الزَّمانِ صَلَواتُ اللهِ عَلَيْكَ وَعَلى آلِ بَيْتِكَ هذا يَوْمُ الْجُمُعَةِ وَهُوَ يَوْمُكَ الْمُتَوَقَّعُ فيهِ ظُهُورُكَ وَالْفَرَجُ فيهِ لِلْمُؤْمِنينَ عَلى يَدَيْكَ وَقَتْلُ الْكافِرينَ بِسَيْفِكَ وَاَنَا يا مَوْلايَ فيهِ ضَيْفُكَ وَجارُكَ وَاَنْتَ يا مَوْلايَ كَريمٌ مِنْ اَوْلادِ الْكِرامِ وَمَأْمُورٌ بِالضِّيافَةِ وَالاِْجارَةِ فَاَضِفْني وَاَجِرْني صَلَواتُ اللهِ عَلَيْكَ وَعَلى اَهْلِ بَيْتِكَ الطّاهِرينَ.',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title:
                      'قال السيّد ابن طاووس وأنا اتمثّل بعد هذه الزّيارة بهذا الشعر واشير اليه (عليه السلام) وأقول :',
                  subtitle:
                      'نَـزيلُكَ حَيـْثُ مَا اتَّجَهَتْ رِكابى     وَضَيْفـُكَ حَيْثُ كُنْتُ مـِنَ الْبِلادِ',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize + 3,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiaratAlsabt.screenRoute,
          pushBack: ZiaratAl5amis.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة الجمعة.mp3',
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
