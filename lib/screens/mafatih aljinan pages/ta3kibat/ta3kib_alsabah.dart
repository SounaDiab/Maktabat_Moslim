import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/favorites_provider.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_screen.dart';
import '../ta3kibat.dart';
import 'ta3kib_aldohr.dart';
import 'ta3kibat_3ama.dart';

class Ta3kibAlsabah extends StatefulWidget {
  static String screenRoute = 'ta3kib_alsabah_screen';
  final String route;

  Ta3kibAlsabah({required this.route});

  @override
  State<Ta3kibAlsabah> createState() => _Ta3kibAlsabahState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Ta3kibAlsabahState extends State<Ta3kibAlsabah> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    // setState(() {
    //   isIcon = prefs.getBool('isFavoriteTa3kibAlsabah') ?? true;
    // });
    bool? savedState = prefs.getBool('isFavorite_ta3kib_alsabah_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ta3kib_alsabah_screen', value);
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
                          'تعقيب صلاة الصبح', Ta3kibAlsabah.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('تعقيب صلاة الصبح',
                          Ta3kibAlsabah.screenRoute, Ta3kibAlsabah.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'تعقيب صلاة الصبح',
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
                      'اللَّهُمَّ إِنِّي أَسْأَلُكَ يَا عَالِماً بِكُلِّ خَفِيَّةٍ ، يَا مَنِ السَّمَاءُ بِقُدْرَتِهِ مَبْنِيَّةٌ ، يَا مَنِ الْأَرْضُ بِقُدْرَتِهِ مَدْحِيَّةٌ ، يَا مَنِ الشَّمْسُ وَ الْقَمَرُ بِنُورِ جَلَالِهِ مُضِيئَةٌ ، يَا مَنِ الْبِحَارُ بِقُدْرَتِهِ مَجْرِيَّةٌ  يَا مُنْجِيَ يُوسُفَ مِنْ رِقِّ الْعُبُودِيَّةِ ، يَا مَنْ يَصْرِفُ كُلَّ نَقِمَةٍ وَ بَلِيَّةٍ ، يَا مَنْ حَوَائِجُ السَّائِلِينَ عِنْدَهُ مَقْضِيَّةٌ ، يَا مَنْ لَيْسَ لَهُ حَاجِبٌ يُغْشَى ، وَ لَا وَزِيرٌ يُرْشَى ، صَلِّ عَلَى مُحَمَّدٍ وَ آلِ مُحَمَّدٍ ، وَ احْفَظْنِي فِي سَفَرِي وَ حَضَرِي ، وَ لَيْلِي وَ نَهَارِي ، وَ يَقَظَتِي وَ مَنَامِي ، وَ نَفْسِي وَ أَهْلِي ، وَ مَالِي وَ وُلْدِي ، وَ الْحَمْدُ لِلَّهِ وَحْدَهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Ta3kibAldohr.screenRoute,
          pushBack: Ta3kibat3ama.screenRoute,
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
