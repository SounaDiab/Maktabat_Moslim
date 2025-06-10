import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../a3mal_wa2ad3iyat_ayam_ramadan.dart';
import 'alyawm_2al2awal.dart';
import 'alyawm_2altasi3_wal3ishrin.dart';

class Alyawm2alsalasin extends StatefulWidget {
  static String screenRoute = 'alyawm_2alsalasin_screen';
  const Alyawm2alsalasin({super.key});

  @override
  State<Alyawm2alsalasin> createState() => _Alyawm2alsalasinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Alyawm2alsalasinState extends State<Alyawm2alsalasin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_alyawm_2alsalasin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alyawm_2alsalasin_screen', value);
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
          .pushReplacementNamed(A3malWa2ad3iyatAyamRamadan.screenRoute);
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
                          'اليوم الثلاثين', Alyawm2alsalasin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'اليوم الثلاثين',
                          Alyawm2alsalasin.screenRoute,
                          Alyawm2alsalasin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اليوم الثلاثين',
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
                  title: 'الأول :',
                  subtitle:
                      'اَللّـهُمَّ اجْعَلْ صِيامى فيهِ بِالشُّكْرِ وَالْقَبُولِ عَلى ما تَرْضاهُ وَيَرْضاهُ الرَّسُولُ، مُحْكَمَةً فُرُوعُهُ بِالاُْصُولِ، بِحَقِّ سَيِّدِنا مُحَمَّد وَآلِهِ الطّاهِرينَ، وَالْحَمْدُ للهِ رَبِّ الْعالَمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'روى السّيد لليوم الاخير من الشّهر دعاءاً أوّله اَللّـهُمَّ اِنَّكَ اَرْحَمَ، الرّاحِمينَ ويختم القرآن غالباً في هذا اليوم، فينبغي أن يدعى عند الختم بالدّعاء الثّاني والاربعين من الصّحيفة الكاملة ولمن شاء أن يدعو بهذا الدّعاء الوجيز الذي رواه الشّيخ عن أمير المؤمنين صلوات الله وسلامه عليه: اَللّـهُمَّ اشْرَحْ بِالْقُرْآنِ صَدْري وَاسْتَعْمِلْ بِالْقُرآنِ بَدَني، وَنَوِّرْ بِالْقُرآنِ بَصَري، وَاَطْلِقْ بِالْقُرآنِ لِساني، وَاَعَنّي عَلَيْهِ ما اَبْقَيْتَني، فَاِنَّهُ لا حَوْلَ وَلا قُوَّةَ إلاّ بِكَ، ويدعو أيضاً بهذا الدّعاء المروي عن أمير المؤمنين (عليه السلام) :\n\n'
                      'اَللّـهُمَّ اِنِّي اَسْاَلُكَ اِخْباتَ الُْمخْبِتينَ، وَاِخْلاصَ الْمُوقِنينَ، وَمُرافَقَةَ الاَْبْرارِ، وَاسْتِحْقاقَ حَقائِقِ الاِيمانِ، وَالْغَنيمَةَ مِنْ كُلِّ بِرٍّ، وَالسَّلامَةَ مِنْ كُلِّ اِثْم، وَوُجُوبَ رَحْمَتِكَ، وَعَزآئِمَ مَغْفِرَتِكَ، وَالْفَوْزَ بِالْجَنَّةِ وَالنَّجاةَ مِنَ النّارِs.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Alyawm2al2awal.screenRoute,
          pushBack: Alyawm2altasi3Wal3ishrin.screenRoute,
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
