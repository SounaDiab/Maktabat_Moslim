import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ramadan.dart';
import 'allayla_alsalisa_wal3ishroun_ramadan.dart';
import 'dou3aa_allayla_al5amisa_wal3ishroun_ramadan.dart';

class Dou3aaAllaylaAlrabi3aWal3ishrounRamadan extends StatefulWidget {
  static String screenRoute =
      'dou3aa_allayla_alrabi3a_wal3ishroun_ramadan_screen';
  const Dou3aaAllaylaAlrabi3aWal3ishrounRamadan({super.key});

  @override
  State<Dou3aaAllaylaAlrabi3aWal3ishrounRamadan> createState() =>
      _Dou3aaAllaylaAlrabi3aWal3ishrounRamadanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3aaAllaylaAlrabi3aWal3ishrounRamadanState
    extends State<Dou3aaAllaylaAlrabi3aWal3ishrounRamadan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_dou3aa_allayla_alrabi3a_wal3ishroun_ramadan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_dou3aa_allayla_alrabi3a_wal3ishroun_ramadan_screen', value);
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
                      .addFavorite('دعاء الليلة الرابعة والعشرون',
                          Dou3aaAllaylaAlrabi3aWal3ishrounRamadan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء الليلة الرابعة والعشرون',
                          Dou3aaAllaylaAlrabi3aWal3ishrounRamadan.screenRoute,
                          Dou3aaAllaylaAlrabi3aWal3ishrounRamadan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء الليلة الرابعة والعشرون',
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
                      'يا فالِقَ الاِْصْباحِ، وَجاعِلَ اللَّيْلِ سَكَناً، وَالشَّمْسِ وَالْقَمَرِ حُسْباناً، يا عَزيزُ يا عَليمُ، يا ذَا المَنِّ وَالطَّوْلِ، وَالْقُوَّةِ وَالْحَوْلِ، وَالْفَضْلِ والاِْنْعامِ، وَالْجَلالِ وَالاِْكْرامِ، يا اَللهُ يا رَحْمـنُ، يا اَللهُ يا فَرْدُ يا وِتْرُ، يا اَللهُ يا ظاهِرُ يا باطِنُ، يا حَيُّ لا اِلـهَ إلاّ اَنْتَ، لَكَ الاَْسْماءُ الْحُسْنى، وَالاَْمْثالُ الْعُلْيا، وَالْكِبْرِياءُ وَالالاءُ، اَسْاَلُكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تَجْعَلَ اسْمي في هذِهِ اللَّيْلَةِ فِي السُّعَداءِ، وَرُوحي مَعَ الشُّهَداءِ، وَاِحْساني في عِلِّيّينَ، وَاِساءَتي مَغْفُورَةً، وَاَنْ تَهَبَ لي يَقيناً تُباشِرُ بِهِ قَلْبي، وَايماناً يَذْهَبُ بِالشَّكِّ عَنّي، وَرِضىً بِما قَسَمْتَ لي، وَآتِنا فِي الدُّنْيا حَسَنَةً وَفِي الاخِرَةِ حَسَنَهً، وَقِنا عَذابَ النّارِ الْحَريقِ، وَارْزُقْني فيها ذِكْرَكَ وَشُكْرَكَ وَالرَّغْبَةَ اِلَيْكَ، وَالانابَةَ وَالتَّوْبَهَ وَالتَّوْفيقَ لِما وَفَّقْتَ لَهُ مُحَمَّداً وَآلَ مُحَمَّد صَلَواتُكَ عَلَيْهِ وَعَلَيْهِمْ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: Dou3aaAllaylaAl5amisaWal3ishrounRamadan.screenRoute,
        pushBack: AllaylaAlsalisaWal3ishrounRamadan.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء الليلة الرابعة والعشرون من رمضان.mp3',
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
