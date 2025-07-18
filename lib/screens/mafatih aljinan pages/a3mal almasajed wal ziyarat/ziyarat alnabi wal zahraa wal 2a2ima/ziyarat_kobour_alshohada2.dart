import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alnabi_walzahraa_wal2a2ima.dart';
import 'zikr_almasajed_almo3azama.dart';
import 'ziyarat_hamza.dart';

class ZiyaratKobourAlshohada2 extends StatefulWidget {
  static String screenRoute = 'ziyarat_kobour_alshohada2_screen';
  const ZiyaratKobourAlshohada2({super.key});

  @override
  State<ZiyaratKobourAlshohada2> createState() =>
      _ZiyaratKobourAlshohada2State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratKobourAlshohada2State extends State<ZiyaratKobourAlshohada2> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_kobour_alshohada2_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_kobour_alshohada2_screen', value);
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
                      .addFavorite('زيارة قبور الشهداء رضوان الله عليهم بأحد',
                          ZiyaratKobourAlshohada2.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة قبور الشهداء رضوان الله عليهم بأحد',
                          ZiyaratKobourAlshohada2.screenRoute,
                          ZiyaratKobourAlshohada2.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة قبور الشهداء رضوان الله عليهم بأحد',
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
                  subtitle: 'تقول في زيارتهم :\n\n'
                      'اَلسَّلامُ عَلى رَسُول اللهِ، اَلسَّلامُ عَلى نَبِيِّ اللهِ، اَلسَّلامُ عَلى مُحَمَّد بنِ عَبْدِاللهِ، اَلسَّلامُ عَلى اَهْلِ بَيْتِهِ الطّاهِرينَ، اَلسَّلامُ عَلَيْكُمْ اَيُّهَا الشُّهَداءُ الْمُؤْمِنُونَ، اَلسَّلامُ عَلَيْكُمْ يا اَهْلَ بَيْتِ الاْيمانِ وَالتَّوْحيدِ، اَلسَّلامُ عَلَيْكُمْ يا اَنْصارَ دينِ اللهِ وَاَنْصارَ رَسُولِهِ عَلَيْهِ وَآلِهِ السَّلامُ، سَلامٌ عَلَيْكُمْ بِما صَبَرْتُمْ فَنِعْمَ عُقْبَى الدّارِ، اَشْهَدُ اَنَّ اللهَ اخْتارَكُمْ لِدينِهِ، وَاصْطَفاكُمْ لِرَسُولِهِ، وَاَشْهَدُ اَنَّكُمْ قَدْ جاهَدْتُمْ فِي اللهِ حَقَّ جِهادِهِ، وَذَبَبْتُمْ عَنْ دينِ اللهِ وَعَنْ نَبِيِّهِ، وَجُدْتُمْ بِاَنْفُسِكُمْ دُونَهُ، وَاَشْهَدُ اَنَّكُم قُتِلْتُمْ عَلى مِنْهاجِ رَسُولِ اللهِ، فَجَزاكُمُ اللهُ عَنْ نَبِيِّهِ وَعَنِ الاِْسْلامِ وَاَهْلِهِ اَفْضَلَ الْجَزاءِ، وَعَرَّفَنا وُجُوهَكُمْ في مَحَلِّ رِضْوانِهِ، وَمَوْضِعِ اِكْرامِهِ، مَعَ النَّبِيّينَ وَالصِّدّيقينَ وَالشُّهَداءِ وَالصّالِحينَ وَحَسُنَ اُولئِكَ رَفيقاً، اَشْهَدُ اَنَّكُمْ حِزْبُ اللهِ، وَاَنَّ مَنْ حارَبَكُمْ فَقَدْ حارَبَ اللهَ، وَاَنَّكُمْ لِمَنَ الْمُقَرَّبينَ الْفائِزينَ الَّذينَ هُمْ اَحْياءٌ عِنْدَ رَبِّهِمْ يُرْزَقُونَ، فَعَلى مَنْ قَتَلَكُمْ لَعْنَةُ اللهِ وَالْمَلائِكَةِ وَالنّاسِ اَجْمَعينَ، اَتَيْتُكُمْ يا اَهْلَ التَّوْحيدِ زائِراً، وَبِحَقِّكُمْ عارِفاً، وِبِزِيارَتِكُمْ اِلَى اللهِ مُتَقَرِّباً، وَبِما سَبَقَ مِنْ شَريفِ الاَْعْمالِ وَمَرْضِيِّ الاَْفْعالِ عالِماً، فَعَلَيْكُمْ سَلامُ اللهِ وَرَحْمَتُهُ وَبَرَكاتُهُ، وَعَلى مَنْ قَتَلَكُمْ لَعْنَةُ اللهِ وَغَضَبُهُ وَسَخَطُهُ، اَللّـهُمَّ انْفَعْني بِزِيارَتِهِمْ، وَثَبِّتْني عَلى قَصْدِهِمْ، وَتَوَفَّني عَلى ما تَوَفَّيْتَهُمْ عَلَيْهِ، وَاجْمَعْ بَيْني وَبَيْنَهُم في مُسْتَقَرِّ دارِ رَحْمَتِكَ، اَشْهَدُ اَنَّكُمْ لَنا فَرَطٌ وَنَحْنُ بِكُمْ لاحِقُونَ.\n\n'
                      'وتكرّر سورة اِنّا اَنْزَلْناهُ في لَيلَةِ الْقَدرِ ما تمكّنت، وقال البعض: تصلّي عند كلّ مزور ركعتين وترجع ان شاء الله تعالى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: ZikrAlmasajedAlmo3azama.screenRoute,
        pushBack: ZiyaratHamza.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة قبور الشهداء.mp3',
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
