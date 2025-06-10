import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al5asa.dart';
import 'a3mal_allayla_alsalisa_wal3ishrin.dart';
import 'dou3a2_ya_batinan.dart';

class ZyaratSa7ibAlzaman extends StatefulWidget {
  static String screenRoute = 'zyarat_sa7ib_alzaman_screen';
  const ZyaratSa7ibAlzaman({super.key});

  @override
  State<ZyaratSa7ibAlzaman> createState() => _ZyaratSa7ibAlzamanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZyaratSa7ibAlzamanState extends State<ZyaratSa7ibAlzaman> {
  bool isIcon = true;
  String music = '';
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_zyarat_sa7ib_alzaman_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_zyarat_sa7ib_alzaman_screen', value);
  }

    Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Al2a3malAl5asa.screenRoute);
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
                          'زيارة صاحب الزمان عجل الله تعالى فرجه الشريف (آل ياسين)',
                          ZyaratSa7ibAlzaman.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة صاحب الزمان عجل الله تعالى فرجه الشريف (آل ياسين)',
                          ZyaratSa7ibAlzaman.screenRoute,
                          ZyaratSa7ibAlzaman.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة صاحب الزمان عجل الله تعالى فرجه الشريف (آل ياسين)',
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
                      'سَلامٌ عَلَى آلِ يس. السَّلامُ عَلَيْكَ يا دَاعِيَ اللهِ وَرَبَّانِيَّ آياتِهِ، السَّلامُ عَلَيْكَ يا بابَ اللهِ وَدَيَّانَ دِينِهِ، السَّلامُ عَلَيْكَ يا خَلِيفَةَ اللهِ وَنَاصِرَ حَقِّهِ، السَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ وَدَلِيلَ إِرادَتِهِ، السَّلامُ عَلَيْكَ يا تالِيَ كِتَابِ اللهِ وَتَرْجُمَانَهُ، السَّلامُ عَلَيْكَ فِي آنَاءِ لَيْلِكَ وَأَطْرَافِ نَهارِكَ، السَّلامُ عَلَيْكَ يا بَقِيَّةَ اللهِ فِي أَرْضِهِ، السَّلامُ عَلَيْكَ يا مِيثاقَ اللهِ الَّذِي أَخَذَهُ وَوَكَّدَهُ، السَّلامُ عَلَيْكَ يا وَعْدَ اللهِ الَّذِي ضَمِنَهُ، السَّلامُ عَلَيْكَ أَيُّها الْعَلَمُ الْمَنْصُوبُ، وَالْعِلْمُ الْمَصْبُوبُ، وَالْغَوْثُ وَالرَّحْمَةُ الْواسِعَةُ، وَعْداً غَيْرَ مَكْذُوبٍ. السَّلامُ عَلَيْكَ حِينَ تَقُومُ، السَّلامُ عَلَيْكَ حِينَ تَقْعُدُ، السَّلامُ عَلَيْكَ حِينَ تَقْرَأُ وَتُبَيِّنُ، السَّلامُ عَلَيْكَ حِينَ تُصَلِّي وَتَقْنُتُ، السَّلامُ عَلَيْكَ حِينَ تَرْكَعُ وَتَسْجُدُ، السَّلامُ عَلَيْكَ حِينَ تُهَلِّلُ وَتُكَبِّرُ، السَّلامُ عَلَيْكَ حِينَ تَحْمَدُ وَتَسْتَغْفِرُ، السَّلامُ عَلَيْكَ حِينَ تُصْبِحُ وَتُمْسِي، السَّلامُ عَلَيْكَ فِي اللَّيلِ إِذا يَغْشَى، وَالنَّهارِ إِذَا تَجَلَّى. السَّلامُ عَلَيْكَ أَيُّها الْإِمامُ الْمَأْمُونُ، السَّلامُ عَلَيْكَ أَيُّها الْمُقَدَّمُ الْمَأْمُولُ، السَّلامُ عَلَيْكَ بِجَوامِعِ السَّلامُ. أُشْهِدُكَ، يا مَوْلايَ، أَنِّي أَشْهَدُ أَنْ لا إِلـهَ إِلّا اللهُ وَحْدَهُ لا شَرِيكَ لَهُ، وَأَنَّ مُحَمَّداً عَبْدُهُ وَرَسُولُهُ، لا حَبِيبَ إِلّا هُوَ وَأَهْلُهُ. وَأُشْهِدُكَ، يا مَوْلايَ، أَنَّ عَلِيّاً أَمِيرَ الْمُؤْمِنِينَ حُجَّتُهُ، وَالْحَسَنَ حُجَّتُهُ، وَالْحُسَيْنَ حُجَّتُهُ، وَعَلِيَّ بْنَ الْحُسَيْنِ حُجَّتُهُ، وَمُحَمَّدَ بْنَ عَلِيٍّ حُجَّتُهُ، وَجَعْفَرَ بْنَ مُحَمَّدٍ حُجَّتُهُ، وَمُوسَى بْنَ جَعْفَرٍ حُجَّتُهُ، وَعَلِيَّ بْنَ مُوسَى حُجَّتُهُ، وَمُحَمَّدَ بْنَ عَلِيٍّ حُجَّتُهُ، وَعَلِيَّ بْنَ مُحَمَّدٍ حُجَّتُهُ، وَالْحَسَنَ بْنَ عَلِيٍّ حُجَّتُهُ. وَأَشْهَدُ أَنَّكَ حُجَّةُ اللهِ، أَنْتُمُ الأَوَّلُ وَالآخِرُ، وَأَنَّ رَجْعَتَكُمْ حَقٌّ لا رَيْبَ فِيها، يَوْمَ لا يَنْفَعُ نَفْساً إِيْمانُهَا لَمْ تَكُنْ امَنَتْ مِنْ قَبْلُ أَوْ كَسَبَتْ فِي إِيْمانِها خَيْراً، وَأَنَّ الْمَوْتَ حَقٌّ، وَأَنَّ ناكِراً وَنَكِيراً حَقٌّ. وَأَشْهَدُ أَنَّ النَّشْرَ حَقٌّ، وَالْبَعْثَ حَقٌّ، وَأَنَّ الصِّراطَ حَقٌّ، وَالْمِرْصادَ حَقٌّ، وَالْمِيزانَ حَقٌّ، وَالْحَشْرَ حَقٌّ، وَالْحِسابَ حَقٌّ، وَالْجَنَّةَ وَالنَّارَ حَقٌّ، وَالْوَعْدَ وَالْوَعِيدَ بِهِما حَقٌّ. يا مَوْلايَ، شَقِيَ مَنْ خالَفَكُمْ، وَسَعِدَ مَنْ أَطاعَكُمْ، فَاشْهَدْ عَلَى ما أَشْهَدْتُكَ عَلَيْهِ، وَأَنَا وَلِيٌّ لَكَ، بَرِيءٌ مِنْ عَدُوِّكَ. فَالْحَقُّ ما رَضَيْتُمُوهُ، وَالْباطِلُ ما أَسْخَطْتُمُوهُ، وَالْمَعْرُوفُ ما أَمَرْتُمْ بِهِ، وَالْمُنْكَرُ مَا نَهَيْتُمْ عَنْهُ، فَنَفْسِي مُؤْمِنَةٌ بِاللهِ وَحْدَهُ لا شَرِيكَ لَهُ، وَبِرَسُولِهِ، وَبِأَمِيرِ الْمُؤْمِنِينَ، وَبِكُمْ يا مَوْلايَ، أَوَّلِكُمْ وَآخِرِكُمْ، وَنُصْرَتِي مُعَدَّةٌ لَكُمْ، وَمَوَدَّتِي خالِصَةٌ لَكُمْ، آمِينَ آمِينَ. دعاء يا باطناًيدعو بهذا الدُّعاء المروي في الإقبال:يا باطِناً فِي ظُهُورِهِ، وَيا ظاهِراً فِي بُطُونِهِ، وَيا باطِناً لَيْسَ يَخْفَى، وَيا ظاهِراً لَيْسَ يُرَى. يا مَوْصُوفاً لا يَبْلُغُ بِكَيْنُونَتِهِ مَوْصُوفٌ، وَلا حَدٌّ مَحْدُودٌ، وَيا غائِباً غَيْرَ مَفْقُودٍ، وَيا شاهِداً غَيْرَ مَشْهُودٍ يُطْلَبُ فَيُصابُ، وَلَمْ يَخْلُ مِنْهُ السَّماواتُ وَالْأَرْضُ وَما بَيْنَهُما طَرْفَةَ عَيْنٍ، لا يُدْرَكُ بِكَيْفٍ، وَلا يُؤَيَّنُ بِأَيْنٍ وَلا بِحَيْثٍ. أَنْتَ نُورُ النُّورِ، وَرَبُّ الْأَرْبابِ، أَحَطْتَ بِجَمِيعِ الأُمُورِ. سُبْحانَ مَنْ لَيْسَ كَمِثِلهِ شَيْءٌ، وَهُوَ السَّمِيعُ الْبَصِيرُ، سُبْحانَ مَنْ هُوَ هَكَذا، وَلا هَكَذا غَيْرُهُ. ثمّ تدعو بما تشاء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2YaBatinan.screenRoute,
          pushBack: A3malAllaylaAlsalisaWal3ishrin.screenRoute,
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
