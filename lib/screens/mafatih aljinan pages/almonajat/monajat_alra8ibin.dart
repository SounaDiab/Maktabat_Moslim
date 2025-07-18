import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'monajat_alrajin.dart';
import 'monajat_alshakirin.dart';

class MonajatAlra8ibin extends StatefulWidget {
  static String screenRoute = 'monajat_alra8ibin_screen';
  const MonajatAlra8ibin({super.key});

  @override
  State<MonajatAlra8ibin> createState() => _MonajatAlra8ibinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAlra8ibinState extends State<MonajatAlra8ibin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_monajat_alra8ibin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_alra8ibin_screen', value);
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
                          'مناجات الراغبين', MonajatAlra8ibin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجات الراغبين',
                          MonajatAlra8ibin.screenRoute,
                          MonajatAlra8ibin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات الراغبين',
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
                      'اِلـهي اِنْ كانَ قَلَّ زادي فِي الْمَسيرِ اِلَيْكَ فَلَقَدْ حَسُنَ ظَنّي بِالتَّوَكُّلِ عَلَيْكَ، وَاِنْ كانَ جُرْمي قَدْ اَخافَني مِنْ عُقُوبَتِكَ فَاِنَّ رَجائي قَدْ اَشْعَرَني بِالاْمْنِ مِنْ نِقْمَتِكَ، وَاِنْ كانَ ذَنْبي قَدْ عَرَضَني لِعِقابِكَ فَقَدْ اذَنَني حُسْنُ ثِقَتي بِثَوابِكَ، وَاِنْ اَنامَتْنِي الْغَفْلَةُ عَنِ الاِْسْتِعْدادِ لِلِقائِكَ فَقَدْ نَبَّهَتْنِى الْمَعْرِفَةُ بِكَرَمِكَ وَآلائِكَ، وَاِنْ اَوْحَشَ ما بَيْني وَبَيْنَكَ فَرْط الْعِصْيانِ وَالطُّغْيانِ فَقَدْ انَسَني بُشْرَى الْغُفْرانِ وَالرِّضْوانِ، اَسْاَلُكَ بِسُبُحاتِ وَجْهِكَ وَبِاَنْوارِ قُدْسِكَ، وَاَبْتَهِلُ اِلَيْكَ بِعَواطِفِ رَحْمَتِكَ وَلَطائِفِ بِرِّكَ اَنْ تُحَقِّقَ ظَنّي بِما اُؤَمِّلُهُ مِنْ جَزيلِ اِكْرامِكَ، وَجَميلِ اِنْعامِكَ فِي الْقُرْبى مِنْكَ وَالزُّلْفى لَدَيْكَ وَالَّتمَتُعِّ بِالنَّظَرِ اِلَيْكَ، وَها اَنـَا مُتَعَرِّضٌ لِنَفَحاتِ رَوْحِكَ وَعَطْفِكَ، وَمُنْتَجِعٌ غَيْثَ جُودِكَ وَلُطْفِكَ، فارٌّ مِنْ سَخَطِكَ اِلى رِضاكَ، هارِبٌ مِنْكَ اِلَيْكَ، راج اَحْسَنَ ما لَدَيْكَ، مُعَوِّلٌ عَلى مَواهِبِكَ، مُفْتَقِرٌ اِلى رِعايَتِكَ، اِلـهي ما بَدَاْتَ بِهِ مِنْ فَضْلِكَ فَتَمِّمْهُ، وَما وَهَبْتَ لي مِنْ كَرَمِكَ فَلا تَسْلُبْهُ، وَما سَتَرْتَهُ عَلَيَّ بِحِلْمِكَ فَلا تَهْتِكْهُ، وَما عَلِمْتَهُ مِنْ قَبيحِ فِعْلي فَاغْفِرْهُ، اِلـهي اِسْتَشْفَعْتُ بِكَ اِلَيْكَ، وَاسْتَجَرْتُ بِكَ مِنْكَ، اَتَيْتُكَ طامِعاً في اِحْسانِكَ، راغِباً فِي امْتِنانِكَ، مُسْتَسقِياً وابِلَ طَوْلِكَ، مُسْتَمْطِراً غَمامَ فَضْلِكَ، طالِباً مَرْضاتَكَ، قاصِداً جَنابَكَ، وارِداً شَريعَةَ رِفْدِكَ، مُلْتَمِساً سَنِيَّ الْخَيْراتِ مِنْ عِنْدِكَ، وافِداً اِلى حَضْرَةِ جَمالِكَ، مُريداً وَجْهَكَ، طارِقاً بابَكَ، مُسْتَكيناً لِعَظَمَتِكَ وَجَلالِكَ، فَافْعَلْ بي ما اَنْتَ اَهْلُهُ مِنَ الْمَغْفِرَةِ وَالرَّحْمَةِ وَلا تَفْعَلْ بي ما اَنَا اَهْلُهُ مِنْ الْعَذابِ وَالنَّقْمَةِ بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlshakirin.screenRoute,
        pushBack: MonajatAlrajin.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/مناجاة الراغبين.mp3',
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
