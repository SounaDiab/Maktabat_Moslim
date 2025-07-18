import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iyat_al2osbo3.dart';
import 'dou3a2_al2a7ad.dart';
import 'dou3a2_alsoulasa2.dart';

class Dou3a2Al2isnain extends StatefulWidget {
  static String screenRoute = 'dou3a2_al2isnain_screen';
  const Dou3a2Al2isnain({super.key});

  @override
  State<Dou3a2Al2isnain> createState() => _Dou3a2Al2isnainState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Al2isnainState extends State<Dou3a2Al2isnain> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou3a2_al2isnain_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3a2_al2isnain_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ad3iyatAl2osbo3.screenRoute);
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
                    .pushReplacementNamed(Ad3iyatAl2osbo3.screenRoute);
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
                          'دعاء يوم الإثنين', Dou3a2Al2isnain.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء يوم الإثنين',
                          Dou3a2Al2isnain.screenRoute,
                          Dou3a2Al2isnain.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء يوم الإثنين',
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
                      'بِسْمِ الله الرَّحْمنِ الرَّحِيمِ الحَمْدُ للهِ الَّذِي لَمْ يُشْهِدْ أَحَداً حِينَ فَطَرَ السَّماواتِ وَالاَرْضَ ، وَلا اتَّخَذَ مُعِيناً حِينَ بَرَأَ النَّسَماتِ. لَمْ يُشارَكْ فِي الاِلهِيَّةِ، وَلَمْ يُظاهَرْ فِي الوِحْدانِيَّةِ. كَلَّتِ الاَلْسُنُ عَنْ غايَةِ صِفَتِهِ وَالعُقُولُ عَنْ كُنْهِ مَعْرِفَتِهِ، وَتَواضَعَتِ الجَبابِرَةُ لِهَيْبَتِهِ، وَعَنَتِ الوُجُوهُ لِخَشْيَتِهِ، وَانْقادَ كُلُّ عَظِيمٍ لِعَظَمَتِهِ. فَلَكَ الحَمْدُ مُتَواتِراً مُتَّسِقاً ومُتَوالِياً مُسْتَوْسِقاً وَصَلَواتُهُ عَلى رَسُولِهِ أَبَداً وَسَلامُهُ دائِماً سَرْمَداً. اللّهُمَّ اجْعَلْ أَوَّلَ يَوْمِي هذا صَلاحاً وَأَوْسَطَهُ فَلاحاً وَآخِرَهُ نَجاحاً، وَأَعُوذُ بِكَ مِنْ يَوْمٍ أَوَّلَهُ فَزَعٌ، وَأَوْسَطُهُ جَزَعٌ وَآخِرُهُ وَجَعٌ.\n\n'
                      'اللّهُمَّ إِنِّي اسْتَغْفِرُكَ لِكُلِّ نَذْرٍ نَذَرْتُهُ وَكُلِّ وَعْدٍ وَعَدْتُهُ، وَكُلِّ عَهْدٍ عاهَدْتُهُ ثُمَّ لَمْ أَفِ بِهِ، وَأَسأَلُكَ فِي مَظالِمِ عِبادِكَ عِنْدِي فَأَيُّما عَبْدٍ مِنْ عَبِيدِكَ أَو أَمَةٍ مِنْ إِمائِكَ كانَتْ لَهُ قِبَلِي مَظْلِمَةٌ ظَلَمْتُها إِيّاهُ فِي نَفْسِهِ، أَوْ فِي عِرْضِهِ أَوْ فِي مالِهِ أَوْ فِي أَهْلِهِ وَوَلَدِهِ، أَوْ غيْبَةٌ اغْتَبْتُهُ بِها، أَوْ تَحامِلٌ عَلَيْهِ بِمَيْلٍ أَوْ هَوَىً أَوْ أَنَفَةٍ أَوْ حَمِيَّةٍ أَوْ رِياءٍ أَوْ عَصَبِيَّةٍ غائِباً كانَ أَوْ شاهِداً أَوْ حَيّاً كانَ أَوْ مَيِّتاً، فَقَصُرَتْ يَدِي وَضاقَ وُسْعِي عَنْ رَدِّها إِلَيْهِ والتَحَلُّلِ مِنْهُ، فَأَسْأَلُكَ يامَنْ يَمْلِكُ الحاجاتِ وَهِي مُسْتَجِيبَةٌ بمَشيئَتِهِ وَمُسْرِعَةٌ إِلى إِرادَتِهِ أَنْ تُصَلِّيَّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَأَنْ تُرْضِيَهُ عَنِّي بِما شِئْتَ، وَتَهَبَ لِي مِنْ عِنْدِكَ رَحْمَةً إِنَّهُ لاتَنْقُصُكَ المَغْفِرَةُ ولاتَضُرُّكَ المَوْهِبَةُ، ياأَرْحَمَ الرَّاحِمِينَ اللّهُمَّ أَوْلِنِي فِي كُلِّ يَوْمِ اثْنِينِ نِعْمَتَيْنِ مِنْكَ ثِنْتَيْنِ: سَعادَةَ فِي أَوَّلِهِ بِطاعَتِكَ، وَنِعْمَةً فِي آخِرِهِ بِمَغْفِرَتِكَ، يامَنْ هُوَ الاِلهُ وَلا يَغْفِرُ الذُّنُوبَ سِواهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Alsoulasa2.screenRoute,
          pushBack: Dou3a2Al2a7ad.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء الاثنين.mp3',
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
