import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ta3kibat.dart';
import 'ta3kib_aldohr.dart';
import 'ta3kib_alma8rib.dart';

class Ta3kibAl3asr extends StatefulWidget {
  static String screenRoute = 'ta3kib_al3asr_screen';
  const Ta3kibAl3asr({super.key});

  @override
  State<Ta3kibAl3asr> createState() => _Ta3kibAl3asrState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Ta3kibAl3asrState extends State<Ta3kibAl3asr> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ta3kib_al3asr_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ta3kib_al3asr_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ta3kibat.screenRoute);
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
                    .pushReplacementNamed(Ta3kibat.screenRoute);
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
                          'تعقيب صلاة العصر', Ta3kibAl3asr.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('تعقيب صلاة العصر',
                          Ta3kibAl3asr.screenRoute, Ta3kibAl3asr.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'تعقيب صلاة العصر',
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
                      'أَسْتَغْفِرُ اللَّهَ الَّذِي لَا إِلَهَ إِلَّا هُوَ الْحَيُّ القَيُّومُ الرَّحمنِ الرَّحِيمُ ذُو الجَلالِ وَالإِكْرَامِ وَأَسْأَلُهُ أَن يَتُوبَ عَلَيَّ تَوبَةَ عَبْدٍ ذَلِيلٍ خاضع فقير بائِسٍ مِسْكِينِ مُسْتَكِينِ مُسْتَجِيرٍ لَا يَمْلِكُ لِنَفْسِهِ نَفْعاً وَلَا ضَرَّاً ولا موتاً وَلَا حَيَاةً وَلَا نُشُورا.\n'
                      'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنْ نَفْسٍ لَا تَشْبَعُ وَمِن قَلبِ لَا يَخْشَعُ وَمِن علم لا يَنفَعُ وَمِن صَلاةٍ لا تُرفَعُ وَمِن دُعَاءِ لَا يُسْمَعُ . اللَّهُمَّ إِنِّي أَسْأَلُكَ اليُسْرَ بَعدَ العُسْرِ وَالفَرَجَ بَعدَ الكَرْبِ وَالرَّخْاءَ بَعدَ الشَّدَّةِ . اللَّهُمَّ مَا بِنَا مِن نِعْمَةٍ فَمِنكَ لَا إِلَهَ إِلَّا أَنتَ أَسْتَغْفِرُكَ وَأَتُوبُ إِلَيكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Ta3kibAlma8rib.screenRoute,
          pushBack: Ta3kibAldohr.screenRoute,
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
