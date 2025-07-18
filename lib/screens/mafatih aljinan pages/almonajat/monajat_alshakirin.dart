import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'monajat_almoti3in_lillah.dart';
import 'monajat_alra8ibin.dart';

class MonajatAlshakirin extends StatefulWidget {
  static String screenRoute = 'monajat_alshakirin_screen';
  const MonajatAlshakirin({super.key});

  @override
  State<MonajatAlshakirin> createState() => _MonajatAlshakirinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAlshakirinState extends State<MonajatAlshakirin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_monajat_alshakirin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_alshakirin_screen', value);
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
                          'مناجات الشاكرين', MonajatAlshakirin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجات الشاكرين',
                          MonajatAlshakirin.screenRoute,
                          MonajatAlshakirin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات الشاكرين',
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
                      'اِلـهي اَذْهَلَني عَنْ اِقامَةِ شُكْرِكَ تَتابُعُ طَوْلِكَ، وَاَعْجَزَني عَنْ اِحْصاءِ ثَنائِكَ فَيْضُ فَضْلِكَ، وَشَغَلَني عَنْ ذِكْرِ مَحامِدِكَ تَرادُفُ عَوائِدِكَ، وَاَعْياني عَنْ نَشْرِ عَوارِفِكَ تَوالي اَياديكَ، وَهذا مَقامُ مَنِ اعْتَرَفَ بِسُبُوغِ النَّعْماءِ وَقابَلَها بِالتَّقْصيرِ، وَشَهِدَ عَلى نَفْسِهِ بِالاِْهْمالِ وَالتَّضْييعِ، وَاَنْتَ الرَّؤوفُ الرَّحيمُ الْبَّرُ الْكَريمُ، الَّذي لا يُخَيِّبُ قاصِديهِ وَلا يَطْرُدُ عَنْ فِنائِهِ امِليهِ، بِساحَتِكَ تَحُطُّ رِحالُ الرّاجينَ، وَبِعَرْصَتِكَ تَقِفُ امالُ الْمُسْتَرْفِدينَ، فَلا تُقابِلْ امالَنا بِالتَّخْييبِ وَالاِْياسِ، وَلا تُلْبِسْنا سِرْبالَ الْقُنُوطِ وَالاِْبْلاسِ، اِلـهي تَصاغَرَ عِنْدَ تَعاظُمِ الائِكَ شُكْري وَتَضاءَلَ في جَنْبِ اِكْرامِكَ اِيّايَ ثَنائي وَنَشْري، جَلَّلَتْني نِعَمُكَ مِنْ اَنْوارِ الاْيمانِ حُلَلاً، وَضَرَبَتْ عَلَيَّ لَطائِفُ بِرّكَ مِنَ الْعِزِّ كِلَلاً، وَقَلَّدَتْني مِنَنُكَ قَلائِدَ لا تُحَلُّ، وَطَوَّقَتْني اَطْواقاً لا تُفَلُّ فَآلاؤُكَ جَمَّةٌ ضَعُفَ لِساني عَنْ اِحْصائِها، وَنَعْماؤُكَ كَثيرَةٌ قَصُرَ فَهْمي عَنْ اِدْراكِها فَضْلاً عَنِ اسْتِقْصائِها، فَكَيْفَ لي بِتَحْصيلِ الشُّكْرِ وَشُكْري اِيّاكَ يَفْتَقِرُ اِلى شُكْر، فَكُلَّما قُلْتُ لَكَ الْحَمْدُ وَجَبَ لِذلِكَ اَنْ اَقُولَ لَكَ الْحَمْدُ، اِلـهي فَكَما غَذَّيْتَنا بِلُطْفِكَ وَرَبَّيْتَنا بِصُنْعِكَ فَتَمِّمْ عَلَيْنا سَوابِـغَ النِّعَمِ وَادْفَعْ عَنّا مَكارِهَ النِّقَمِ، وَآتِنا مِنْ حُظُوظِ الدّارَيْنِ اَرْفَعَها وَاَجَلَّها عاجِلاً وَآجِلاً، وَلَكَ الْحَمْدُ عَلى حُسْنِ بَلائِكَ وَسُبُوغِ نَعْمائِكَ حَمْداً يُوافِقُ رِضاكَ، وَيَمتَرِى الْعَظيمَ مِنْ بِرِّكَ وَنَداكَ، يا عَظيمُ يا كَريمُ بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlmoti3inLillah.screenRoute,
        pushBack: MonajatAlra8ibin.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/مناجاة الشاكرين.mp3',
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
