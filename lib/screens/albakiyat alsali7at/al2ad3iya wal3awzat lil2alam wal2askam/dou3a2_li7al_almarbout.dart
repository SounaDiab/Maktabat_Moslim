import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'awzat_al7oma.dart';
import 'dou3a2_lilso2lol_wlilawram.dart';

class Dou3a2Li7alAlmarbout extends StatefulWidget {
  static String screenRoute = 'dou3a2_li7al_almarbout_screen';
  const Dou3a2Li7alAlmarbout({super.key});

  @override
  State<Dou3a2Li7alAlmarbout> createState() =>
      _Dou3a2Li7alAlmarboutState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Li7alAlmarboutState
    extends State<Dou3a2Li7alAlmarbout> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_dou3a2_li7al_almarbout_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_dou3a2_li7al_almarbout_screen', value);
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
                      .addFavorite('دعاء لحل المربوط‍',
                          Dou3a2Li7alAlmarbout.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء لحل المربوط‍',
                          Dou3a2Li7alAlmarbout.screenRoute,
                          Dou3a2Li7alAlmarbout.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء لحل المربوط‍',
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
                      'يكتب أول سورة الفتح إلى مُسْتَقيما، وسورة : إذا جَاءَ نَصرُ الله ، وهذه الآية : وَمِنْ آياتِهِ أنْ جَعَلَ لَكُمْ مِنْ أنْفُسِكُمْ أزْواجا لِتَسْكُنوا إليها وَجَعَلَ بَيْنَكُمْ مَوَدَّةً وَرَحْمَةً إنَّ في ذلِكَ لاياتٍ لِقَوْمٍ يَتَفَكَّرونَ. ثُمَّ ادْخُلوا عَلَيهِمْ البابَ فَإذا دَخَلْتُموهُ فَإنَّكُمْ غالِبونَ. فَفَتَحْنا أبْوابَ السَّماء بِماءٍ مُنْهَمِرٍ وَفَجَّرْنا الارْضَ عُيونا فَالْتَقى الماءُ عَلى أمْرٍ قَدْ قُدِرْ. رَبِّ اشْرَحْ لي صَدْري وَيَسِرْ لي أمْري وَاحْلُلْ عُقْدَةً مِنْ لِساني يَفْقَهوا قَولي.\n\n'
                      'وَتَرَكْنا بَعْضَهُمْ يَومَئِذٍ يَموجُ في بَعْضٍ. وَنُفِخَ في الصورِ فَجَمَعْناهُمْ جَمْعا كَذلِكَ حَلَلْت فُلان بن فُلان عَنْ بِنْتِ فُلانَةَ لَقَدْ جأَكُمْ رَسُولٌ مِنْ أنْفُسِكُمْ عَزيزٌ عَلَيهِ ماعَنِتُّمْ حَريصٌ عَلَيْكُمْ بِالمؤمِنينَ رَؤوفٌ رَحيمٌ. فِإنْ تَوَلّوا فُقُلْ حَسْبيَ الله لا إلهَ إِلاّ هوَ عَلَيهِ تَوَكَلْتُ وَهوَ رَبُّ العَرْشِ العَظيمِ. ثم يعلق الكتاب عليه. وفي كتاب (طب الأئمة) دعاء مروي عن موسى بن جعفر (عليهما السلام) علمه إسحاق الصحّاف نعرض عنه لطوله.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AwzatAl7oma.screenRoute,
          pushBack: Dou3a2Lilso2lolWlilawram.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء لحل المربوط.mp3',
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
