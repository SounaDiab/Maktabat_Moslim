import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/a3mal%20layali%20kadr/sowar%20kor2aneya/sourat_al3ankabout.dart';
import 'package:maktabat_almoslim/screens/a3mal%20layali%20kadr/sowar%20kor2aneya/sourat_alroum.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../alsowar_alkor2aneya.dart';

class SouratAldo5an extends StatefulWidget {
  static String screenRoute = 'suorat_aldo5an_screen';
  const SouratAldo5an({super.key});

  @override
  State<SouratAldo5an> createState() => _SouratAldo5anState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SouratAldo5anState extends State<SouratAldo5an> {
  bool isIcon = true;
  String music = '';
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_suorat_aldo5an_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_suorat_aldo5an_screen', value);
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
          .pushReplacementNamed(AlsowarAlkor2aneya.screenRoute);
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
                      .addFavorite('سورة الدخان', SouratAldo5an.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('سورة الدخان', SouratAldo5an.screenRoute,
                          SouratAldo5an.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'سورة الدخان',
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
                    fontFamily: 'UthmanicHafs',
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'حمٓ (1) وَٱلۡكِتَٰبِ ٱلۡمُبِينِ (2) إِنَّآ أَنزَلۡنَٰهُ فِي لَيۡلَةٖ مُّبَٰرَكَةٍۚ إِنَّا كُنَّا مُنذِرِينَ (3) فِيهَا يُفۡرَقُ كُلُّ أَمۡرٍ حَكِيمٍ (4) أَمۡرٗا مِّنۡ عِندِنَآۚ إِنَّا كُنَّا مُرۡسِلِينَ (5) رَحۡمَةٗ مِّن رَّبِّكَۚ إِنَّهُۥ هُوَ ٱلسَّمِيعُ ٱلۡعَلِيمُ (6) رَبِّ ٱلسَّمَٰوَٰتِ وَٱلۡأَرۡضِ وَمَا بَيۡنَهُمَآۖ إِن كُنتُم مُّوقِنِينَ (7) لَآ إِلَٰهَ إِلَّا هُوَ يُحۡيِۦ وَيُمِيتُۖ رَبُّكُمۡ وَرَبُّ ءَابَآئِكُمُ ٱلۡأَوَّلِينَ (8) بَلۡ هُمۡ فِي شَكّٖ يَلۡعَبُونَ (9) فَٱرۡتَقِبۡ يَوۡمَ تَأۡتِي ٱلسَّمَآءُ بِدُخَانٖ مُّبِينٖ (10) يَغۡشَى ٱلنَّاسَۖ هَٰذَا عَذَابٌ أَلِيمٞ (11) رَّبَّنَا ٱكۡشِفۡ عَنَّا ٱلۡعَذَابَ إِنَّا مُؤۡمِنُونَ (12) أَنَّىٰ لَهُمُ ٱلذِّكۡرَىٰ وَقَدۡ جَآءَهُمۡ رَسُولٞ مُّبِينٞ (13) ثُمَّ تَوَلَّوۡاْ عَنۡهُ وَقَالُواْ مُعَلَّمٞ مَّجۡنُونٌ (14) إِنَّا كَاشِفُواْ ٱلۡعَذَابِ قَلِيلًاۚ إِنَّكُمۡ عَآئِدُونَ (15) يَوۡمَ نَبۡطِشُ ٱلۡبَطۡشَةَ ٱلۡكُبۡرَىٰٓ إِنَّا مُنتَقِمُونَ (16) ۞وَلَقَدۡ فَتَنَّا قَبۡلَهُمۡ قَوۡمَ فِرۡعَوۡنَ وَجَآءَهُمۡ رَسُولٞ كَرِيمٌ (17) أَنۡ أَدُّوٓاْ إِلَيَّ عِبَادَ ٱللَّهِۖ إِنِّي لَكُمۡ رَسُولٌ أَمِينٞ (18) وَأَن لَّا تَعۡلُواْ عَلَى ٱللَّهِۖ إِنِّيٓ ءَاتِيكُم بِسُلۡطَٰنٖ مُّبِينٖ (19) وَإِنِّي عُذۡتُ بِرَبِّي وَرَبِّكُمۡ أَن تَرۡجُمُونِ (20) وَإِن لَّمۡ تُؤۡمِنُواْ لِي فَٱعۡتَزِلُونِ (21) فَدَعَا رَبَّهُۥٓ أَنَّ هَٰٓؤُلَآءِ قَوۡمٞ مُّجۡرِمُونَ (22) فَأَسۡرِ بِعِبَادِي لَيۡلًا إِنَّكُم مُّتَّبَعُونَ (23) وَٱتۡرُكِ ٱلۡبَحۡرَ رَهۡوًاۖ إِنَّهُمۡ جُندٞ مُّغۡرَقُونَ (24) كَمۡ تَرَكُواْ مِن جَنَّٰتٖ وَعُيُونٖ (25) وَزُرُوعٖ وَمَقَامٖ كَرِيمٖ (26) وَنَعۡمَةٖ كَانُواْ فِيهَا فَٰكِهِينَ (27) كَذَٰلِكَۖ وَأَوۡرَثۡنَٰهَا قَوۡمًا ءَاخَرِينَ (28) فَمَا بَكَتۡ عَلَيۡهِمُ ٱلسَّمَآءُ وَٱلۡأَرۡضُ وَمَا كَانُواْ مُنظَرِينَ (29) وَلَقَدۡ نَجَّيۡنَا بَنِيٓ إِسۡرَٰٓءِيلَ مِنَ ٱلۡعَذَابِ ٱلۡمُهِينِ (30) مِن فِرۡعَوۡنَۚ إِنَّهُۥ كَانَ عَالِيٗا مِّنَ ٱلۡمُسۡرِفِينَ (31) وَلَقَدِ ٱخۡتَرۡنَٰهُمۡ عَلَىٰ عِلۡمٍ عَلَى ٱلۡعَٰلَمِينَ (32) وَءَاتَيۡنَٰهُم مِّنَ ٱلۡأٓيَٰتِ مَا فِيهِ بَلَٰٓؤٞاْ مُّبِينٌ (33) إِنَّ هَٰٓؤُلَآءِ لَيَقُولُونَ (34) إِنۡ هِيَ إِلَّا مَوۡتَتُنَا ٱلۡأُولَىٰ وَمَا نَحۡنُ بِمُنشَرِينَ (35) فَأۡتُواْ بِـَٔابَآئِنَآ إِن كُنتُمۡ صَٰدِقِينَ (36) أَهُمۡ خَيۡرٌ أَمۡ قَوۡمُ تُبَّعٖ وَٱلَّذِينَ مِن قَبۡلِهِمۡ أَهۡلَكۡنَٰهُمۡۚ إِنَّهُمۡ كَانُواْ مُجۡرِمِينَ (37) وَمَا خَلَقۡنَا ٱلسَّمَٰوَٰتِ وَٱلۡأَرۡضَ وَمَا بَيۡنَهُمَا لَٰعِبِينَ (38) مَا خَلَقۡنَٰهُمَآ إِلَّا بِٱلۡحَقِّ وَلَٰكِنَّ أَكۡثَرَهُمۡ لَا يَعۡلَمُونَ (39) إِنَّ يَوۡمَ ٱلۡفَصۡلِ مِيقَٰتُهُمۡ أَجۡمَعِينَ (40) يَوۡمَ لَا يُغۡنِي مَوۡلًى عَن مَّوۡلٗى شَيۡـٔٗا وَلَا هُمۡ يُنصَرُونَ (41) إِلَّا مَن رَّحِمَ ٱللَّهُۚ إِنَّهُۥ هُوَ ٱلۡعَزِيزُ ٱلرَّحِيمُ (42) إِنَّ شَجَرَتَ ٱلزَّقُّومِ (43) طَعَامُ ٱلۡأَثِيمِ (44) كَٱلۡمُهۡلِ يَغۡلِي فِي ٱلۡبُطُونِ (45) كَغَلۡيِ ٱلۡحَمِيمِ (46) خُذُوهُ فَٱعۡتِلُوهُ إِلَىٰ سَوَآءِ ٱلۡجَحِيمِ (47) ثُمَّ صُبُّواْ فَوۡقَ رَأۡسِهِۦ مِنۡ عَذَابِ ٱلۡحَمِيمِ (48) ذُقۡ إِنَّكَ أَنتَ ٱلۡعَزِيزُ ٱلۡكَرِيمُ (49) إِنَّ هَٰذَا مَا كُنتُم بِهِۦ تَمۡتَرُونَ (50) إِنَّ ٱلۡمُتَّقِينَ فِي مَقَامٍ أَمِينٖ (51) فِي جَنَّٰتٖ وَعُيُونٖ (52) يَلۡبَسُونَ مِن سُندُسٖ وَإِسۡتَبۡرَقٖ مُّتَقَٰبِلِينَ (53) كَذَٰلِكَ وَزَوَّجۡنَٰهُم بِحُورٍ عِينٖ (54) يَدۡعُونَ فِيهَا بِكُلِّ فَٰكِهَةٍ ءَامِنِينَ (55) لَا يَذُوقُونَ فِيهَا ٱلۡمَوۡتَ إِلَّا ٱلۡمَوۡتَةَ ٱلۡأُولَىٰۖ وَوَقَىٰهُمۡ عَذَابَ ٱلۡجَحِيمِ (56) فَضۡلٗا مِّن رَّبِّكَۚ ذَٰلِكَ هُوَ ٱلۡفَوۡزُ ٱلۡعَظِيمُ (57) فَإِنَّمَا يَسَّرۡنَٰهُ بِلِسَانِكَ لَعَلَّهُمۡ يَتَذَكَّرُونَ (58) فَٱرۡتَقِبۡ إِنَّهُم مُّرۡتَقِبُونَ (59)',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SouratAl3ankabout.screenRoute,
          pushBack: SouratAlroum.screenRoute,
          soud: music,
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
