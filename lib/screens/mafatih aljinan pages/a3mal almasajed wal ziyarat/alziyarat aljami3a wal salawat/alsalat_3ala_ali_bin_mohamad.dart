import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../alziyarat_aljami3a_walsalawat.dart';
import 'alsalat_3ala_lhassan_al3askari.dart';
import 'alsalat_3ala_mohamad_bin_ali_bin_moussa.dart';

class Alsalat3alaAliBinMohamad extends StatefulWidget {
  static String screenRoute = 'alsalat_3ala_ali_bin_mohamad_screen';
  const Alsalat3alaAliBinMohamad({super.key});

  @override
  State<Alsalat3alaAliBinMohamad> createState() =>
      _Alsalat3alaAliBinMohamadState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Alsalat3alaAliBinMohamadState extends State<Alsalat3alaAliBinMohamad> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alsalat_3ala_ali_bin_mohamad_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_alsalat_3ala_ali_bin_mohamad_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context)
          .pushReplacementNamed(AlziyaratAljami3aWalsalawat.screenRoute);
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
                      .addFavorite('الصلاة على علي بن محمد (عليهما السلام)',
                          Alsalat3alaAliBinMohamad.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الصلاة على علي بن محمد (عليهما السلام)',
                          Alsalat3alaAliBinMohamad.screenRoute,
                          Alsalat3alaAliBinMohamad.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الصلاة على علي بن محمد (عليهما السلام)',
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
                      'اَللّـهُمَّ صَلِّ عَلى عَلِىِّ بْنِ مُحَمَّد، وَصِىِّ الاَْوْصِياءِ وَاِمامِ الاَْتْقِياءِ، وَخَلَفِ اَئِمَّةِ الدّينِ وَالْحُجَّةِ عَلَى الْخَلائِقِ اَجْمَعينَ، اَللّـهُمَّ كَما جَعَلْتَهُ نُوراً يَسْتَضيءُ بِهِ الْمُؤْمِنُونَ، فَبَشَّرَ بِالْجَزيلِ مِنْ ثَوابِكَ وَاَنْذَرَ بِالاَْليمِ مِنْ عِقابِكَ، وَحَذَّرَ بَأسَكَ وَذَكَّرَ بِاياتِكَ وَاَحَلَّ حَلالَكَ وَحَرَّمَ حَرامَكَ، وَبَيَّنَ شَرايِعَكَ وَفَرايِضَكَ، وَحَضَّ عَلى عِبادَتِكَ وَاَمَرَ بِطاعَتِكَ وَنَهى عَنْ مَعْصِيَتِكَ، فَصَلِّ عَلَيْهِ اَفْضَلَ ما صَلَّيْتَ عَلى اَحَد مِنْ اَوْلِيائِكَ وَذُرِّيَّةِ اَنْبِيائِكَ، يا اِلـهَ الْعالَمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Alsalat3alaLhassanAl3askari.screenRoute,
          pushBack: Alsalat3alaMohamadBinAliBinMoussa.screenRoute,
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
