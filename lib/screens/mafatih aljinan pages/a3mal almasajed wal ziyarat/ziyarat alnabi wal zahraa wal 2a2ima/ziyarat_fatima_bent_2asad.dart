import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alnabi_walzahraa_wal2a2ima.dart';
import 'zikr_sa2ir_alziyarat.dart';
import 'ziyarat_hamza.dart';

class ZiyaratFatimaBent2asad extends StatefulWidget {
  static String screenRoute = 'ziyarat_fatima_bent_2asad_screen';
  const ZiyaratFatimaBent2asad({super.key});

  @override
  State<ZiyaratFatimaBent2asad> createState() => _ZiyaratFatimaBent2asadState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratFatimaBent2asadState extends State<ZiyaratFatimaBent2asad> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_fatima_bent_2asad_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_fatima_bent_2asad_screen', value);
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
          .pushReplacementNamed(ZiyaratAlnabiWalzahraaWal2a2ima.screenRoute);
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
                      .addFavorite(
                          'زيارة فاطمة بنت أسد والدة أمير المؤمنين (عليه السلام)',
                          ZiyaratFatimaBent2asad.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة فاطمة بنت أسد والدة أمير المؤمنين (عليه السلام)',
                          ZiyaratFatimaBent2asad.screenRoute,
                          ZiyaratFatimaBent2asad.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة فاطمة بنت أسد والدة أمير المؤمنين (عليه السلام)',
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
                  subtitle: 'تقف عند قبرها وتقول :\n\n'
                      'اَلسَّلامُ عَلى نَبِيِّ اللهِ، اَلسَّلامُ عَلى رَسُولِ اللهِ، اَلسَّلامُ عَلى مُحَمَّد سَيِّدِ الْمُرْسَلينَ، اَلسَّلامُ عَلى مُحَمَّد سَيِّدِ الاَْوَّلينَ، اَلسَّلامُ عَلى مُحَمَّد سَيِّدِ الاْخِرينَ، اَلسَّلامُ عَلى مَنْ بَعَثَهُ اللهُ رَحْمَةً لِلْعالَمينَ، اَلسَّلامُ عَلَيْكَ اَيُّهَا النَّبِيُّ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَلسَّلامُ عَلى فاطِمَةَ بِنْتِ اَسَد الْهاشِمِيَّةِ، اَلسَّلامُ عَلَيْكِ اَيَّتُهَا الصِّدّيقَةُ الْمَرْضِيَّةُ، اَلسَّلامُ عَلَيْكِ اَيَّتُهَا التَّقِيَّةُ النَّقِيَّةُ، اَلسَّلامُ عَلَيْكِ اَيَّتُهَا الْكَريمَةُ الرَّضِيَّةُ، اَلسَّلامُ عَلَيْكِ يا كافِلَةَ مُحَمَّد خاتَمِ النَّبِيّينَ، اَلسَّلامُ عَلَيْكِ يا والِدَةَ سَيِّدِ الْوَصِيّينَ، اَلسَّلامُ عَلَيْكِ يا مَنْ ظَهَرَتْ شَفَقَتُها عَلى رَسُولِ اللهِ خاتَمِ النَّبيّينَ، اَلسَّلامُ عَلَيْكِ يا مَنْ تَرْبِيَتُها لِوَلِىِّ اللهِ الاَْمينِ، اَلسَّلامُ عَلَيْكِ وَعَلى رُوحِكِ وَبَدَنِكِ الطّاهِرِ، اَلسَّلامُ عَلَيْكِ وَعَلى وَلَدِكِ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَشْهَدُ اَنَّكِ اَحْسَنْتِ الْكِفالَةَ، وَاَدَّيْتِ الاَْمانَةَ، وَاجْتَهَدْتِ في مَرْضاتِ اللهِ، وَبالَغْتِ في حِفْظِ رَسُولِ اللهِ، عارِفَةً بِحَقِّهِ، مُؤْمِنَةً بِصِدْقِهِ، مُعْتَرِفَةً بِنُبُوَّتِهِ، مُسْتَبْصِرَةً بِنِعْمَتِهِ، كافِلَةً بِتَرْبِيَتِهِ، مُشْفِقَةً عَلى نَفْسِهِ، واقِفَةً عَلى خِدْمَتِهِ، مُخْتارَةً رِضاهُ، وَاَشْهَدُ اَنَّكِ مَضَيْتِ عَلَى الاِْيْمانِ وَالَّتمَسُّكِ بِاَشْرَفِ الاَْدْيانِ، راضِيَةً مَرْضِيَّةً طاهِرَةً زَكِيَّةً تَقِيَّةً نَقِيَّةً، فَرَضِيَ اللهُ عَنْكِ وَاَرْضاكِ، وَجَعَلَ الْجَنَّةَ مَنْزِلَكِ وَمَأواكِ اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَانْفَعْني بِزِيارَتِها، وَثَبِّتْني عَلى مَحَبَّتِها، وَلا تَحْرِمْني شَفاعَتَها، وَشَفاعَةَ الاَْئِمَّةِ مِنْ ذُرِّيَّتِها، وَارْزُقْني مُرافَقَتَها، وَاحْشُرْني مَعَها وَمَعَ اَوْلادِهَا الطّاهِرينَ، اَللّـهُمَّ لا تَجْعَلْهُ آخِرَ الْعَهْدِ مِنْ زِيارَتي اِيّاها، وَارْزُقْنِي الْعَوْدَ اِلَيْها اَبَداً ما اَبْقَيْتَني، وَاِذا تَوَفَّيْتَني فَاحْشُرْني في زُمْرَتِها، وَاَدْخِلْني في شَفاعَتِها، بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمِينَ، اَللّـهُمَّ بِحَقِّها عِنْدَكَ وَمَنْزِلَتَها لَدَيْكَ، اِغْفِرْ لي وَلِوالِدَىَّ وَلِجَمِيعِ الْمُؤْمِنينَ وَالْمُؤْمِناتِ، وَآتِنا فِي الدُّنْيا حَسَنَةً وَفِي الاْخِرَةِ حَسَنَةً وَقِنا بِرَحْمَتِكَ عَذابَ النّارِ.\n\n'
                      'ثمّ تصلّي ركعتين للزّيارة وتدعُو بما تشاء وتنصرف.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiyaratHamza.screenRoute,
          pushBack: ZikrSa2irAlziyarat.screenRoute,
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
