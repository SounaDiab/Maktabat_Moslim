import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ramadan.dart';
import 'fi_fadel_shaher_ramadan_wa2a3maloh.dart';
import 'ma_yosta7ab_2itanoh_fi_layali_shaher_ramadan.dart';

class MaYa3omAllayaliWal2ayam extends StatefulWidget {
  static String screenRoute = 'ma_ya3om_allayali_wal2ayam_screen';
  const MaYa3omAllayaliWal2ayam({super.key});

  @override
  State<MaYa3omAllayaliWal2ayam> createState() =>
      _MaYa3omAllayaliWal2ayamState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MaYa3omAllayaliWal2ayamState extends State<MaYa3omAllayaliWal2ayam> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ma_ya3om_allayali_wal2ayam_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ma_ya3om_allayali_wal2ayam_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ramadan.screenRoute);
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
                      .addFavorite('ما يعم الليالي والأيام',
                          MaYa3omAllayaliWal2ayam.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'ما يعم الليالي والأيام',
                          MaYa3omAllayaliWal2ayam.screenRoute,
                          MaYa3omAllayaliWal2ayam.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'ما يعم الليالي والأيام',
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
                      'روى السّيد ابن طاووس (رحمه الله) عن الصّادق والكاظم (عليهما السلام) قالا : تقول في شهر رمضان من أوّله الى آخره بعد كلّ فريضة:\n\n'
                      'اَللّـهُمَّ ارْزُقْني حَجَّ بَيْتِكَ الْحَرامِ فِي عامي هذا وَفي كُلِّ عام ما اَبْقَيْتَني في يُسْر مِنْكَ وَعافِيَة، وَسَعَةِ رِزْق، وَلا تُخْلِني مِنْ تِلْكَ الْمواقِفِ الْكَريمَةِ، وَالْمَشاهِدِ الشَّريفَةِ، وَزِيارَةِ قَبْرِ نَبِيِّكَ صَلَواتُكَ عَلَيْهِ وَآلِهِ، وَفي جَميعِ حَوائِجِ الدُّنْيا وَالاْخِرَةِ فَكُنْ لي، اَللّـهُمَّ اِنّي اَساَلُكَ فيـما تَقْضي وَتُقَدِّرُ مِنَ الاَمْرِ الَْمحْتُومِ في لَيْلَةِ الْقَدْرِ، مِنَ الْقَضاءِ الَّذي لا يُرَدُّ وَلا يُبَدَّلُ، اَنْ تَكْتُبَني مِنْ حُجّاجِ بَيْتِكَ الْحَرامِ، الْمَبْرُورِ حَجُّهُمْ، الْمَشْكُورِ سَعْيُهُمْ، الْمَغْفُورِ ذُنُوبُهُمْ، الْمُكَفَّرِ عَنْهُمْ سَيِّئاتُهُمْ، واجْعَلْ فيـما تَقْضي وَتُقَدِّرُ، اَنْ تُطيلَ عُمْري، وَتُوَسِّعَ عَلَيَّ رِزْقي، وَتُؤدِّى عَنّي اَمانَتي وَدَيْني آمينَ رَبَّ الْعالَمين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MaYosta7ab2itanohFiLayaliShaherRamadan.screenRoute,
        pushBack: FiFadelShaherRamadanWa2a3maloh.screenRoute,
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
