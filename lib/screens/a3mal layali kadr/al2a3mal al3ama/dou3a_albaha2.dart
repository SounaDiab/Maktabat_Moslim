import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/a3mal%20layali%20kadr/al2a3mal_al3ama.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import 'a3mal_ashar_ramdan.dart';
import 'dou3a2_abi_hamza_alsamali.dart';

class Dou3aAlbaha2 extends StatefulWidget {
  static String screenRoute = 'dou32_albaha2_screen';
  const Dou3aAlbaha2({super.key});

  @override
  State<Dou3aAlbaha2> createState() => _Dou3aAlbaha2State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3aAlbaha2State extends State<Dou3aAlbaha2> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou32_albaha2_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou32_albaha2_screen', value);
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
                      .addFavorite('دعاء البهاء', Dou3aAlbaha2.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء البهاء', Dou3aAlbaha2.screenRoute,
                          Dou3aAlbaha2.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء البهاء',
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
                      'اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ بَهائِكَ بِأَبْهاهُ، وَكُلُّ بَهائِكَ بَهِيٌّ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِبَهائِكَ كُلِّهِ. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ جَمالِكَ بِأَجْمَلِهِ، وَكُلُّ جَمالِكَ جَمِيلٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِجَمالِكَ كُلِّهِ. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ جَلالِكَ بِأَجَلِّهِ، وَكُلُّ جَلالِكَ جَلِيلٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِجَلالِكَ كُلِّهِ.اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ عَظَمَتِكَ بِأَعْظَمِها، وَكُلُّ عَظَمَتِكَ عَظِيمَةٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِعَظَمَتِكَ كُلِّها. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ نُورِكَ بِأَنْوَرِهِ، وَكُلُّ نُورِكَ نَيِّرٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِنُورِكَ كُلِّهِ. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ رَحْمَتِكَ بِأَوْسَعِها، وَكُلُّ رَحْمَتِكَ واسِعَةٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِرَحْمَتِكَ كُلِّها. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ كَلِماتِكَ بِأَتَمِّها، وَكُلُّ كَلِماتِكَ تامَّةٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِكَلِماتِكَ كُلِّها. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ كَمالِكَ بِأَكْمَلِهِ، وَكُلُّ كَمالِكَ كامِلٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِكَمالِكَ كُلِّهِ. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ أَسْمائِكَ بِأَكْبِرِها، وَكُلُّ أَسْمائِكَ كَبِيرَةٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِأَسْمائِكَ كُلِّها. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ عِزَّتِكَ بِأَعَزِّها، وَكُلُّ عِزَّتِكَ عَزِيزَةٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِعِزَّتِكَ كُلِّها. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ مَشِيئَتِكَ بِأَمْضاها، وَكُلُّ مَشِيئَتِكَ ماضِيَةٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِمَشِيئَتِكَ كُلِّها. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ قُدْرَتِكَ بِالْقُدْرَةِ الَّتِي اسْتَطَلْتَ بِها عَلَى كُلِّ شَيْءٍ، وَكُلُّ قُدْرَتِكَ مُسْتَطِيلَةٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِقُدْرَتِكَ كُلِّها. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ عِلْمِكَ بِأَنْفَذِهِ، وَكُلُّ عِلْمِكَ نافِذٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِعِلْمِكَ كُلِّهِ. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ قَوْلِكَ بِأَرْضاهُ، وَكُلُّ قَوْلِكَ رَضِيٌّ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِقَوْلِكَ كُلِّهِ. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ مَسائِلِكَ بِأَحَبِّها إِلَيْكَ، وَكُلُّ مَسائِلِكَ إِلَيْكَ حَبِيبةٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِمَسائِلِكَ كُلِّها. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ شَرَفِكَ بِأَشْرَفِهِ، وَكُلُّ شَرَفِكَ شَرِيفٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِشَرَفِكَ كُلِّهِ. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ سُلْطانِكَ بِأَدْوَمِهِ، وَكُلُّ سُلْطانِكَ دائِمٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِسُلْطانِكَ كُلِّهِ. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ مُلْكِكَ بِأَفْخَرِهِ، وَكُلُّ مُلْكِكَ فاخِرٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِمُلْكِكَ كُلِّهِ. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ عُلُوِّكَ بِأَعْلاهُ، وَكُلُّ عُلُوِّكَ عالٍ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِعُلُوِّكَ كُلِّهِ. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ مَنِّكَ بِأَقْدَمِهِ، وَكُلُّ مَنِّكَ قَدِيمٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِمَنِّكَ كُلِّهِ. اللّهُمَّ، إِنِّي أَسْأَلُكَ مِنْ آياتِكَ بِأَكْرَمِها، وَكُلُّ آياتِكَ كَرِيمَةٌ، اللّهُمَّ، إِنِّي أَسْأَلُكَ بِآياتِكَ كُلِّها. اللّهُمَّ، إِنِّي أَسْأَلُكَ بِما أَنْتَ فِيهِ مِنَ الشَّأْنِ وَالْجَبَرُوتِ، وَأَسْأَلُكَ بِكُلِّ شَأْنٍ وَحْدَهُ وَجَبَرُوتٍ وَحْدَها. اللّهُمَّ، إِنِّي أَسْأَلُكَ بِما تُجِيبُنِي بِهِ حِينَ أَسْأَلُكَ، فَأَجِبْنِي يا اللهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2AbiHamzaAlsamali.screenRoute,
          pushBack: A3malAsharRamdan.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء البهاء.mp3',
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
