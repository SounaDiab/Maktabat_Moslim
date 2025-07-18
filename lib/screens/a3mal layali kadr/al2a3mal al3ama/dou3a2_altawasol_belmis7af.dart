import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al3ama.dart';
import 'salat_rok3atain.dart';
import 'ziyarat_al2imam_alhussein.dart';

class Dou3a2AltawasolBelmis7af extends StatefulWidget {
  static String screenRoute = 'dou3a2_altawasol_belmis7af_screen';
  const Dou3a2AltawasolBelmis7af({super.key});

  @override
  State<Dou3a2AltawasolBelmis7af> createState() => _Dou3a2AltawasolBelmis7afState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2AltawasolBelmis7afState extends State<Dou3a2AltawasolBelmis7af> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou3a2_altawasol_belmis7af_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3a2_altawasol_belmis7af_screen', value);
  }

    Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Al2a3malAl3ama.screenRoute);
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
                      .addFavorite('دعاء التوسل بالمصحف', Dou3a2AltawasolBelmis7af.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء التوسل بالمصحف', Dou3a2AltawasolBelmis7af.screenRoute,
                          Dou3a2AltawasolBelmis7af.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء التوسل بالمصحف',
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
              Center(
                child: Text(
                  'بسم الله الرحمن الرحيم',
                  style: TextStyle(
                    fontSize: isTablet ? _fontSizeTablet + 10 : _fontSize,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'ثمّ تأخذ المصحف فتنشره وتضعه بين يديك، وتقول:"اللّهُمَّ، إِنّي أَسْأَلُكَ بِكِتَابِكَ الْمُنْزَلِ وَمَا فِيهِ، وَفيهِ اسْمُكَ الأَكْبَرُ، وَأَسْمَاؤُكَ الْحُسْنَى، وَمَا يُخَافُ وَيُرْجَى، أَنْ تَجْعَلَني مِنْ عُتَقَائِكَ مِنَ النّارِ" وتدعو بما بدا لك من حاجة.ثم تضع المصحف على رأسك، وقل:"اللّهُمَّ، بِحَقِّ هَذَا الْقُرْآنِ، وَبِحَقِّ مَنْ أَرْسَلْتَهُ بِهِ، وَبِحَقِّ كُلِّ مُؤْمِنٍ مَدَحْتَهُ فِيهِ، وَبِحَقِّكَ عَلَيْهِمْ، فَلا أَحَدَ أَعْرَفُ بِحَقِّكَ مِنْكَ".ثمّ قل عشر مرات: "بِكَ يَا اللّه"، وعشر مرات "بِمُحَمَّدٍ صلى الله عليه وآله وسلم"، وعشر مرات "بِعَلِيٍّ عليه السلام"، وعشر مرَّات "بِفَاطِمَةَ عليها السلام"، وعشر مرات "بِالْحَسَنِ عليه السلام"، وعشر مرات "بِالحُسَيْنِ عليه السلام"، وعشر مرات "بِعَلِيِّ بْنِ الحُسَيْنِ عليه السلام"، وعشر مرات "بِمُحَمَّدِ بْنِ عَلِيٍّ عليه السلام"، وعشر مرات "بِجَعْفَرِ بْنِ مُحَمَّدٍ عليه السلام" وعشر مرات "بِمُوسَى بْنِ جَعْفَرٍ عليه السلام"، وعشر مرات "بِعَلِيِّ بْنِ مُوسى عليه السلام"، وعشر مرات "بِمُحَمَّد بْنِ عَلِيٍّ عليه السلام"، وعشر مرات "بِعَلِيِّ بْنِ مُحَمَّدٍ عليه السلام"، وعشر مرات "بِالْحَسَنِ بْنِ عَلِيٍّ عليه السلام"، وعشر مرات "بِالحُجَّةِ عجل الله تعالى فرجه الشريف" وتسأل حاجتك.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiyaratAl2imamAlhussein.screenRoute,
          pushBack: SalatRok3atain.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء التوسل بالمصحف.mp3',
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
