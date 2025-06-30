import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../salat_allayl.dart';
import 'sawabaha_wa_fawa2idaha.dart';
import 'waktaha_wakaifyatiha.dart';

class Dou3aa7azin extends StatefulWidget {
  static String screenRoute = 'dou3aa_7azin_screen';
  const Dou3aa7azin({super.key});

  @override
  State<Dou3aa7azin> createState() => _Dou3aa7azinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3aa7azinState extends State<Dou3aa7azin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou3aa_7azin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3aa_7azin_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(SalatAllayl.screenRoute);
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
                      .addFavorite('دعاء الحزين', Dou3aa7azin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء الحزين', Dou3aa7azin.screenRoute,
                          Dou3aa7azin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء الحزين',
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
                      ' أُناجِيكَ يا مَوْجُوداً فِي كُلِّ مَكانٍ لَعَلَّكَ تَسْمَعُ نِدائِي، فَقَدْ عَظُمَ جُرْمي وَقَلَّ حَيائِي. مَوْلايَ يا مَوْلايَ، أَيَّ الاهْوالِ أتَذَكَّرُ وَأيَّها أنْسى؟ وَلَوْ لَمْ يَكُنْ إِلاّ المَوْتُ لَكَفى! كَيْفَ وَما بَعْدَ المَوْتِ أعْظَمُ وَأدْهى؟! مَوْلايَ يا مَوْلايَ، حَتّى مَتى وَإِلى مَتى أقُولُ لَكَ العُتْبى مَرَّةً بَعْدَ أخْرى ثُمَّ لا تَجِدُ عِنْدِي صِدْقا وَلا وَفاءً فَياغَوْثَاهُ ثُمَّ وَاغَوْثاهُ بِكَ يا الله مِنْ هَوىً قَدْ غَلَبَني وَمِنْ عَدُوٍّ قَدْ اسْتَكْلَبَ عَلَيَّ وَمِنْ دُنْيا قَدْ تَزَيَّنَتْ لِي وَمِنْ نَفْسٍ أمَّارَةٍ بِالسُّوءِ إِلاّ مارَحِمَ رَبِّي. مَولايَ يا مَولايَ، إنْ كُنْتَ رَحِمْتَ مِثْلِي فَارْحَمْنِي وَإنْ كُنْتَ قَبِلْتَ مِثْلي فَاقْبَلْني! يا قابِلَ السَّحَرَةِ اقْبَلْني! يا مَنْ لَمْ أزَلْ أتَعَرَّفُ مِنْهُ الحُسْنى يا مَنْ يُغَذِّيَني بِالنِعَمِ صَباحا وَمَساءً ارْحَمْني، يَوْمَ آتِيكَ فَرْداً شاخِصا إلَيْكَ بَصَري مُقَلَّداً عَمَلِي قَدْ تَبَرَّأَ جَميعُ الخَلْقِ مِنِّي. نَعَمْ، وَأبِي وَأمِّي وَمَنْ كانَ لَهُ كَدِّي وَسَعْيِي. فَإنْ لَمْ تَرْحَمْنِي فَمَنْ يَرْحَمُنِي؟ وَمَنْ يُؤْنِسُ فِي القَبْرِ وَحْشَتِي؟ وَمَنْ يُنْطِقُ لِسانِي إذا خَلَوْتُ بِعَمَلِي وَسائَلْتَنِي عَمَّا أنْتَ أعْلَمُ بِهِ مِنِّي؟ فَإنْ قُلْتُ: نَعَمْ، فَأيْنَ المَهْرَبُ مِنْ عَدْلِكَ؟ وَإنْ قُلْتُ: لَمْ أفْعَلْ، قُلْتَ: ألَمْ أكُنْ الشَّاهِدَ عَلَيْكَ؟ فَعَفْوُكَ عَفْوُكَ يا مَوْلايَ قَبْلَ سَرابِيلِ القَطِرانِ، عَفْوُكَ عَفْوُكَ يا مَوْلايَ قَبْلَ جَهَنَّمَ وَالنِّيرانِ، عَفْوُكَ عَفْوُكَ يا مَولايَ قَبْلَ أنْ تُغَلَّ الايْدِي إِلى الاعْناقِ يا أرْحَمَ الرَّاحِمِينَ وَخَيْرَ الغافِرينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SawabahaWaFawa2idaha.screenRoute,
          pushBack: WaktahaWakaifyatiha.screenRoute,
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
