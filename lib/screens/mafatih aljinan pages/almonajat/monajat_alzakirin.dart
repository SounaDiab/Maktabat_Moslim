import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'monajat_al3arifin.dart';
import 'monajat_almo3tasimin.dart';

class MonajatAlzakirin extends StatefulWidget {
  static String screenRoute = 'monajat_alzakirin_screen';
  const MonajatAlzakirin({super.key});

  @override
  State<MonajatAlzakirin> createState() => _MonajatAlzakirinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAlzakirinState extends State<MonajatAlzakirin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_monajat_alzakirin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_alzakirin_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Almonajat.screenRoute);
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
                    .pushReplacementNamed(Almonajat.screenRoute);
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
                          'مناجات الذاكرين', MonajatAlzakirin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجات الذاكرين',
                          MonajatAlzakirin.screenRoute,
                          MonajatAlzakirin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات الذاكرين',
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
                      'اِلـهي لَوْلاَ الْواجِبُ مِنْ قَبُولِ اَمْرِكَ لَنَزَّهْتُكَ مِنْ ذِكْري اِيّاكَ عَلى اَنَّ ذِكْري لَكَ بِقَدْري لا بِقَدْرِكَ، وَما عَسى اَنْ يَبْلُغَ مِقْداري حَتّى اُجْعَلَ مَحَلاًّ لِتَقْديسِكَ، وَمِنْ اَعْظَمِ النِّعَمِ عَلَيْنا جَرَيانُ ذِكْرِكَ عَلى اَلْسِنَتِنا، وَاِذْنُكَ لَنا بِدُعائِكَ وَتَنْزيهِكَ وَتَسْبيحِكَ، اِلـهي فَاَلْهِمْنا ذِكْرَكَ فِي الْخَلاءِ وَالْمَلاءِ وَاللَّيْلِوَالنَّهارِ، وَالاِْعْلانِ وَالاِْسْرارِ، وَفِي السَّرّاءِ وَالضَّرّاءِ، وَآنِسْنا بِالذِّكْرِ الْخَفِيِّ، وَاسْتَعْمِلْنا بِالْعَمَلِ الزَّكِيِّ، وَالسَّعْيِ الْمَرْضِيِّ، وَجازِنا بِالْميزانِ الْوَفِيِّ، اِلـهي بِكَ هامَتِ الْقُلُوبُ الْوالِهَةُ، وَعَلى مَعْرِفَتِكَ جُمِعَتِ الْعُقُولُ الْمُتَبايِنَةُ، فَلا تَطْمَئِنُّ الْقُلُوبُ اِلاّ بِذِكْراكَ، وَلا تَسْكُنُ النُّفُوسُ اِلاّ عِنْدَ رُؤْياكَ، اَنْتَ الْمُسَبَّحُ في كُلِّ مَكان، وَالْمَعْبُودُ في كُلِّ زَمان، وَالْمَوْجُودُ في كُلِّ اَوان، وَالْمَدْعُوُّ بِكُلِّ لِسان، وَالْمُعَظَّمُ في كُلِّ جَنان، وَاَسْتَغْفِرُكَ مِنْ كُلِّ لَذَّة بِغَيْرِ ذِكْرِكَ، وَمِنْ كُلِّ راحَة بِغَيْرِ اُنْسِكَ، وَمِنْ كُلِّ سُرُور بِغَيْرِ قُرْبِكَ، وَمِنْ كُلِّ شُغْل بِغَيْرِ طاعَتِكَ، اِلـهي اَنْتَ قُلْتَ وَقَوْلُكَ الْحَقُّ «يا اَيُّهَا الَّذينَ امَنُوا اذْكُرُوا اللهَ ذِكْراً كَثيراً وَسَبِّحُوهُ بُكْرَةً وَاَصيلاً» وَقُلْتَ وَقَوْلُكَ الْحَقُّ «فَاذْكُرُوني اَذْكُرْكُمْ» فَاَمَرْتَنا بِذِكْرِكَ، وَوَعَدْ تَنا عَلَيْهِ اَنْ تَذْكُرَنا تَشْريفاً لَنا وَتَفْخيماً وَاِعْظاماً، وَها نَحْنُ ذاكِرُوكَ كَما اَمَرْتَنا، فَاَنْجِزْ لَنا ما وَعَدْتَنا، يا ذاكِرَ الذّاكِرينَ وَيا اَرْحَمَ الرّحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlmo3tasimin.screenRoute,
        pushBack: MonajatAl3arifin.screenRoute,
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
