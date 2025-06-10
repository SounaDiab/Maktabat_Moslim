import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al5asa.dart';
import 'a3mal_allayla_alwahida_wal3eshrin.dart';
import 'dou3a2_allayla_alwahida_wal3ishrin.dart';

class Dou3a2AlimamAlsadek extends StatefulWidget {
  static String screenRoute = 'dou3a2_alimam_alsadek_screen';
  const Dou3a2AlimamAlsadek({super.key});

  @override
  State<Dou3a2AlimamAlsadek> createState() => _Dou3a2AlimamAlsadekState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2AlimamAlsadekState extends State<Dou3a2AlimamAlsadek> {
  bool isIcon = true;
  String music = '';
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou3a2_alimam_alsadek_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou3a2_alimam_alsadek_screen', value);
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
                          'دعاء الامام الصادق عليه السلام في العشر الأواخر',
                          Dou3a2AlimamAlsadek.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء الامام الصادق عليه السلام في العشر الأواخر',
                          Dou3a2AlimamAlsadek.screenRoute,
                          Dou3a2AlimamAlsadek.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء الامام الصادق عليه السلام في العشر الأواخر',
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
                      '"اللّهُمَّ، إِنَّكَ قُلْتَ فِي كِتابِكَ الْمُنْزَلِ: ﴿شَهْرُ رَمَضانَ الَّذِي أُنْزِلَ فِيهِ الْقُرْآنُ هُدَىً لِلنَّاسِ وَبَيِّناتٍ مِنَ الْهُدَى وَالْفُرْقان﴾ فَعَظَّمْتَ حُرْمَةَ شَهْرِ رَمَضانَ، بِما أَنْزَلْتَ فِيهِ مِنَ الْقُرْآنَ، وَخَصَصْتَهُ بِلَيْلَةِ الْقَدْرِ، وَجَعَلْتَها خَيْراً مِنْ أَلْفِ شَهْرٍ. اللّهُمَّ، وَهذِهِ أَيَّامُ شَهْرِ رَمَضانَ قَدِ انْقَضَتْ، وَلَيالِيهِ قَدْ تَصَرَّمَتْ، وَقَدْ صِرْتُ يا إِلهِي مِنْهُ إِلَى ما أَنْتَ أَعْلَمُ بِهِ مِنِّي، وَأَحْصَى لِعَدَدِهِ مِنَ الْخَلْقِ أَجْمَعِينَ، فَأَسْأَلُكَ بِما سَأَلَكَ بِهِ مَلائِكَتُكَ الْمُقَرَّبُونَ، وَأَنْبِياؤُكَ الْمُرْسَلُونَ، وَعِبادُكَ الصَّالحُونَ، أَنْ تُصَلِّيَ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، وَأَنْ تَفُكَّ رَقَبَتِي مِنَ النَّارِ، وَتُدْخِلَنِي الْجَنَّةَ بِرَحْمَتِكَ، وَأَنْ تَتَفَضَّلَ عَلَيَّ بِعَفْوِكَ وَكَرَمِكَ، وَتَتَقَبَّلَ تَقَرُّبِي، وَتَسْتَجِيبَ دُعائِي، وَتَمُنَّ عَلَيَّ بِالْأَمْنِ يَوْمَ الْخَوْفِ مِنْ كُلِّ هَوْلٍ أَعْدَدْتَهُ لِيَوْمِ الْقِيامَةِ. إِلهِي، وَأَعُوذُ بِوَجْهِكَ الْكَرِيمِ، وَبِجَلالِكَ الْعَظِيمِ، أَنْ يَنْقَضِيَ أَيَّامُ شَهْرِ رَمَضانَ وَلَيالِيهِ، وَلَكَ قِبَلِي تَبِعَةٌ أَوْ ذَنْبٌ تُؤاخِذُنِي بِهِ، أَوْ خَطِيئَةٌ تُرِيدُ أَنْ تَقْتَصَّها مِنِّي، لَمْ تَغْفِرْها لِي. سَيِّدِي سَيِّدِي سَيِّدِي، أَسْأَلُكَ يا لا إِلهَ إِلّا أَنْتَ، إِذْ لا إِلهَ إِلّا أَنْتَ، إِنْ كُنْتَ رَضَيْتَ عَنِّي فِي هذَا الشَّهْرِ، فَازْدَدْ عَنِّي رِضَىً، وَإِنْ لَمْ تَكُنْ رَضيتَ عَنِّي، فَمِنَ الآنَ فَارْضَ عَنِّي، يا أَرْحَمَ الرَّاحِمِينَ، يا اللهُ يا أَحَدُ يا صَمَدُ، يا مَنْ لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُنْ لَهُ كُفُواً أَحَدٌ. وأكثر من قول: يا مُلَيِّنَ الْحَدِيدِ لِداوُودَ عَلَيْهِ السَّلامُ، يا كاشِفَ الضُّرِّ وَالْكُرَبِ الْعِظامِ عَنْ أَيُّوبَ عَلَيْهِ السَّلامُ، أَيْ مُفَرِّجَ هَمِّ يَعْقُوبَ عَلَيْهِ السَّلامُ، أَيْ مُنَفِّسَ غَمِّ يُوسُفَ عَلَيْهِ السَّلامُ، صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، كَما أَنْتَ أَهْلُهُ، أَنْ تُصَلِّيَ عَلَيْهِمْ أَجْمَعِينَ، وَافْعَلْ بِي ما أَنْتَ أَهْلُهُ، وَلا تَفْعَلْ بِي ما أَنَا أَهْلُهُ. ومنها ما رواه في الكافي مسنداً وفي المقنعة، والمصباح مرسلاً، تقول أول ليلة منها ، أي في الليلة الحادية والعشرين:يا مُولِجَ اللَّيْلِ فِي النَّهارِ، وَمُولِجَ النَّهارِ فِي اللَّيْلِ، وَمُخْرِجَ الْحَيِّ مِنَ الْمَيِّتِ، وَمُخْرِجَ الْمَيِّتِ مِنَ الْحَيِّ. يا رازِقَ مَنْ يَشاءُ بِغَيْرِ حِسابٍ يا اللهُ، يا رَحْمنُ، يا اللهُ يا رَحِيمُ، يا اللهُ يا اللهُ يا اللهُ، لَكَ الْأَسْماءُ الْحُسْنَى، وَالْأَمْثالُ الْعُلْيا، وَالْكِبْرِياءُ وَالآلاءُ، أَسْأَلُكَ أَنْ تُصَلِّيَ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، وَأَنْ تَجْعَلَ اسْمِي فِي هذِهِ اللَّيْلَةِ فِي السُّعَداءِ، وَرُوحِي مَعَ الشُّهَداءِ، وَإِحْسانِي فِي عِلِّيِّينَ، وَإِساءَتِي مَغْفُورَة، وَأَنْ تَهَبَ لِي يَقِيناً تُباشِرُ بِهِ قَلْبِي، وَإِيْماناً يُذْهِبُ الشَّكَّ عَنِّي، وَتُرْضِينِي بِما قَسَمْتَ لِي، وَآتِنا فِي الدُّنْيا حَسَنَةً، وَفِي الآخِرَةِ حَسَنَةً، وَقِنا عَذابَ النَّارِ الْحَرِيقِ، وَارْزُقْنِي فِيها ذِكْرَكَ، وَشُكْرَكَ، وَالرَّغْبَةَ إِلَيْكَ، وَالْإِنابَةَ وَالتَّوْفِيقَ لِما وَفَّقْتَ لَهُ مُحَمَّداً وَآلَ مُحَمَّدٍ، عَلَيْهِ وَعَلَيْهِمُ السَّلامُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2AllaylaAlwahidaWal3ishrin.screenRoute,
          pushBack: A3malAllaylaAlwahidaWal3eshrin.screenRoute,
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
