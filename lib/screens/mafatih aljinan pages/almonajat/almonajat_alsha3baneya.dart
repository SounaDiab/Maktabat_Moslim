import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'almonajat_bikashf_alzolm.dart';
import 'monajat_alta2ibin.dart';

class AlmonajatAlsha3baneya extends StatefulWidget {
  static String screenRoute = 'almonajat_alsha3baneya_screen';
  const AlmonajatAlsha3baneya({super.key});

  @override
  State<AlmonajatAlsha3baneya> createState() => _AlmonajatAlsha3baneyaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlmonajatAlsha3baneyaState extends State<AlmonajatAlsha3baneya> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_almonajat_alsha3baneya_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_almonajat_alsha3baneya_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Almonajat.screenRoute);
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
                    .pushReplacementNamed(Almonajat.screenRoute);
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
                      .addFavorite('المناجات الشعبانية',
                          AlmonajatAlsha3baneya.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'المناجات الشعبانية',
                          AlmonajatAlsha3baneya.screenRoute,
                          AlmonajatAlsha3baneya.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'المناجات الشعبانية',
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
                  title:
                      'وهي مناجاة أمير المؤمنين والأئمة من ولده عليهم السلام كانوا يدعون بها في شعبان:',
                  subtitle:
                      'اللهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَاسْمَعْ دُعائِي إِذا دَعَوْتُكَ وَاسْمَعْ نِدَائِي إِذا نادَيْتُكَ وَأَقْبِلْ عَلَيَّ إِذا ناجَيْتُكَ فَقَدْ هَرَبْتُ إِلَيْكَ وَوَقَفْتُ بَيْنَ يَدَيْكَ مُسْتَكِيناً لَكَ مُتَضَرِّعاً إِلَيْكَ راجِياً لِمَا لَدَيْكَ ثَوَابِي وَتَعْلَمُ ما فِي نَفْسِي وَتَخْبُرُ حاجَتِي وَتَعْرِفُ ضَمِيرِي وَلا يَخْفَى عَلَيْكَ أَمْرُ مُنْقَلَبِي وَمَثْوايَ وَما أُرِيدُ أَنْ أُبْدِىءَ بِهِ مِنْ مَنْطِقِي وَأَتَفَوَّهَ بِهِ مِنْ طَلِبَتِي وَأَرْجُوَهُ لِعاقِبَتِي وَقَدْ جَرَتْ مَقادِيرُكَ عَلَيَّ يا سَيِّدِي فِيما يَكُونُ مِنِّي إِلَى آخِرِ عُمْرِي مِنْ سَرِيرَتِي وَعَلانِيَتِي وَبِيَدِكَ لا بِيَدِ غَيْرِكَ زِيادَتِي وَنَقْصِي وَنَفْعِي وَضَرِّي.\n\n'
                      'إِلهِي إِنْ حَرَمْتَنِي فَمَنْ ذا الَّذِي يَرْزُقُنِي وَ إِنْ خَذَلْتَنِي فَمَنْ ذا الَّذِي يَنْصُرُنِي، إِلهِي أَعُوذُ بِكَ مِنْ غَضَبِكَ وَحُلُولِ سَخَطِكَ، إِلهِي إِنْ كُنْتُ غَيْرَ مُسْتَأْهِلٍ لِرَحْمَتِكَ فَأَنْتَ أَهْلٌ أَنْ تَجُودَ عَلَيَّ بِفَضْلِ سَعَتِكَ، إِلهِي كَأَنِّي بِنَفْسِي واقِفَةٌ بَيْنَ يَدَيْكَ وَقَدْ أَظَلَّها حُسْنُ تَوَكُّلِي عَلَيْكَ فَقُلْتَ ما أَنْتَ أَهْلُهُ وَتَغَمَّدْتَنِي بِعَفْوِكَ.\n\n'
                      'إِلهِي إِنْ عَفَوْتَ فَمَنْ أَوْلَى مِنْكَ بِذلِكَ وَ إِنْ كَانَ قَدْ دَنا أَجَلِي وَلَمْ يُدْنِنِي مِنْكَ عَمَلِي فَقَدْ جَعَلْتُ الإِقْرارَ بِالذَّنْبِ إِلَيْكَ وَسِيلَتِي، إِلهِي قَدْ جُرْتُ عَلَى نَفْسِي فِي النَّظَرِ لَها فَلَها الْوَيْلُ إِنْ لَمْ تَغْفِرْ لَها، إِلهِي لَمْ يَزَلْ بِرُّكَ عَلَيَّ أَيَّامَ حَياتِي فَلاَ تَقْطَعْ بِرَّكَ عَنِّي فِي مَماتِي، إِلهِي كَيْفَ آيَسُ مِنْ حُسْنِ نَظَرِكَ لِي بَعْدَ مَماتِي وَأَنْتَ لَمْ تُوَلِّنِي إِلاَّ الْجَمِيلَ فِي حَياتِي.\n\n'
                      'إِلهِي تَوَلَّ مِنْ أَمْرِي ما أَنْتَ أَهْلُهُ وَعُدْ عَلَيَّ بِفَضْلِكَ عَلَى مُذْنِبٍ قَدْ غَمَرَهُ جَهْلُهُ، إِلهِي قَدْ سَتَرْتَ عَلَيَّ ذُنُوباً فِي الدُّنْيا وَأَنَا أَحْوَجُ إِلَى سَتْرِها عَلَيَّ مِنْكَ فِي الأُخْرَى إِذْ لَمْ تُظْهِرْها لأَحَدٍ مِنْ عِبادِكَ الصَّالِحِينَ فَلا تَفْضَحْنِي يَوْمَ الْقِيامَةِ عَلَى رُؤُوسِ الأَشْهادِ.\n\n'
                      'إِلهِي جُودُكَ بَسَطَ أَمَلِي وَعَفْوُكَ أَفْضَلُ مِنْ عَمَلِي، إِلهِي فَسُرَّنِي بِلِقائِكَ يَوْمَ تَقْضِي فِيهِ بَيْنَ عِبادِكَ، إِلهِي اعْتِذارِي إِلَيْكَ اعْتِذارُ مَنْ لَمْ يَسْتَغْنِ عَنْ قَبُولِ عُذْرِهِ فَاقْبَلْ عُذْرِي يا أَكْرَمَ مَنِ اعْتَذَرَ إِلَيْهِ الْمُسِيئُونَ، إِلهِي لا تَرُدَّ حاجَتِي وَلا تُخَيِّبْ طَمَعِي وَلا تَقْطَعْ مِنْكَ رَجائِي وَأَمَلِي، إِلهِي لَوْ أَرَدْتَ هَوانِي لَمْ تَهْدِني وَلَوْ أَرَدْتَ فَضِيحَتِي لَمْ تُعافِني.\n\n'
                      'إِلهِي ما أَظُنُّكَ تَرُدُّنِي فِي حاجَةٍ قَدْ أَفْنَيْتُ عُمْرِي فِي طَلَبِها مِنْكَ إِلهِي فَلَكَ الْحَمْدُ أَبَداً دائِماً سَرْمَداً يَزِيدُ وَلا يَبِيدُ كَما تُحِبُّ وَتَرْضَىْ. إِلهِي إِنْ أَخَذْتَنِي بِجُرْمِي أَخَذْتُكَ بِعَفْوِكَ وَ إِنْ أَخَذْتَنِي بِذُنُوبِي أَخَذْتُكَ بِمَغْفِرَتِكَ وَإِنْ أَدْخَلْتَنِي النَّارَ أَعْلَمْتُ أَهْلَها أَنِّي أُحِبُّكَ، إِلهِي إِنْ كانَ صَغُرَ فِي جَنْبِ طاعَتِكَ عَمَلِي فَقَدْ كَبُرَ فِي جَنْبِ رَجائِكَ أَمَلِي.\n\n'
                      'إِلهِي كَيْفَ أَنْقَلِبُ مِنْ عِنْدِكَ بِالْخَيْبَةِ مَحْرُوماً وَقَدْ كانَ حُسْنُ ظَنِّي بِجُودِكَ أَنْ تَقْلِبَنِي بِالنَّجاةِ مَرْحُوماً، إِلهِي وَقَدْ أَفْنَيْتُ عُمْرِي فِي شِرَّةِ السَّهْوِ عَنْكَ وَأَبْلَيْتُ شَبابِي فِي سَكْرَةِ التَّباعُدِ مِنْكَ، إِلهِيفَلَمْ أَسْتَيْقِظْ أَيَّامَ اغْتِرارِي بِكَ وَرُكُونِي إِلَى سَبِيلِ سَخَطِكَ.\n\n'
                      'إِلهِي وَأَنَا عَبْدُكَ وَابْنُ عَبْدِكَ قائِمٌ بَيْنَ يَدَيْكَ مُتَوَسِّلٌ بِكَرَمِكَ إِلَيْكَ، إِلهِي أَنَا عَبْدٌ أَتَنَصَّلُ إِلَيْكَ مِمَّا كُنْتُ أُواجِهُكَ بِهِ مِنْ قِلَّةِ اسْتِحْيائِي مِنْ نَظَرِكَ وَأَطْلُبُ الْعَفْوَ مِنْكَ إِذِ الْعَفْوُ نَعْتٌ لِكَرَمِكَ، إِلهِي لَمْ يَكُنْ لِي حَوْلٌ فَأَنْتَقِلُ بِهِ عَنْ مَعْصِيَتِكَ إِلاَّ فِي وَقْتٍ أَيْقَظْتَنِي لِمَحَبَّتِكَ وَكَما أَرَدْتَ أَنْ أَكُونَ كُنْتُ فَشَكَرْتُكَ بِإِدْخالِي فِي كَرَمِكَ وَلِتَطْهِيرِ قَلْبِي مِنْ أَوْساخِ الْغَفْلَةِ عَنْكَ.\n\n'
                      'إِلهِي انْظُرْ إِلَيَّ نَظَرَ مَنْ نادَيْتَهُ فَأَجابَكَ وَاسْتَعْمَلْتَهُ بِمَعُونَتِكَ فَأَطاعَكَ يا قَرِيباً لا يَبْعُدُ عَنِ الْمُغْتَرِّ بِهِ وَيا جَواداً لا يَبْخَلُ عَمَّنْ رَجا ثَوابَهُ، إِلهِي هَبْ لِي قَلْباً يُدْنِيهِ مِنْكَ شَوْقُهُ وَلِسانَاً يُرْفَعُ إِلَيْكَ صِدْقُهُ وَنَظَراً يُقَرِّبُهُ مِنْكَ حَقُّهُ، إِلهِي إِنَّ مَنْ تَعَرَّفَ بِكَ غَيْرُ مَجْهُولٍ وَمَنْ لاذَ بِكَ غَيْرُ مَخْذُولٍ وَمَنْ أَقْبَلْتَ عَلَيْهِ غَيْرُ مَمْلُولٍ.\n\n'
                      'إِلهِي إِنَّ مَنِ أنْتَهَجَ بِكَ لَمُسْتَنِيرٌ وَ إِنَّ مَنِ اعْتَصَمَ بِكَ لَمُسْتَجِيرٌ وَقَدْ لُذْتُ بِكَ يا إِلهِي فَلا تُخَيِّبْ ظَنِّي مِنْ رَحْمَتِكَ وَلا تَحْجُبْنِي عَنْ رَأْفَتِكَ إِلهِي أَقِمْنِي فِي أَهْلِ وِلايَتِكَ مُقامَ مَنْ رَجَا الزِّيادَةَ مِنْ مَحَبَّتِكَ، إِلهِي وَأَلْهِمْنِي وَلَهاً بِذِكْرِكَ إِلَى ذِكْرِكَ وَهِمَّتِي فِي رَوْحِ نَجاحِ أَسْمائِكَ وَمَحَلِّ قُدْسِكَ، إِلهِي بِكَ عَلَيْكَ إِلاَّ أَلْحَقْتَنِي بِمَحَلِّ أَهْلِ طاعَتِكَ وَالْمَثْوَى الصَّالِحِ مِنْ مَرْضاتِكَ فَإِنِّي لا أَقْدِرُ لِنَفْسِي دَفْعاً وَلا أَمْلِكُ لَها نَفْعاً.\n\n'
                      'إِلهِي أَنَا عَبْدُكَ الضَّعِيفُ الْمُذْنِبُ وَمَمْلُوكُكَ الْمُنِيبُ فَلا تَجْعَلْنِي مِمَّنْ صَرَفْتَ عَنْهُ وَجْهَكَ وَحَجَبَهُ سَهْوُهُ عَنْ عَفْوِكَ، إِلهِي هَبْ لِي كَمالَ الانْقِطاعِ إِلَيْكَ وَأَنِرْ أَبْصارَ قُلُوبِنا بِضِياءِ نَظَرِها إِلَيْكَ حَتَّى تَخْرِقَ أَبْصارُ الْقُلُوبِ حُجُبَ النُّورِ فَتَصِلَ إِلَى مَعْدِنِ الْعَظَمَةِ وَتَصِيرَ أَرْواحُنا مُعَلَّقَةً بِعِزِّ قُدْسِكَ.\n\n'
                      'إِلهِي وَاجْعَلْنِي مِمَّنْ نادَيْتَهُ فَأَجابَكَ وَلاحَظْتَهُ فَصَعِقَ لِجَلالِكَ فَناجَيْتَهُ سِرّاً وَعَمِلَ لَكَ جَهْراً، إِلهِي لَمْ أُسَلّطْ عَلَى حُسْنِ ظَنّي قُنُوطَ الأَياسِ وَلا انْقَطَعَ رَجائِي مِنْ جَمِيلِ كَرَمِكَ، إِلهِي إِنْ كانَتِ الْخَطايا قَدْ أَسْقَطَتْنِي لَدَيْكَ فَاصْفَحْ عَنِّي بِحُسْنِ تَوَكُّلِي عَلَيْكَ، إِلهِي إِنْ حَطَّتْنِي الذُّنُوبُ مِنْ مَكارِمِ لُطْفِكَ فَقَدْ نَبَّهَنِي الْيَقِينُ إِلَى كَرَمِ عَطْفِكَ، إِلهِي إِنْ أَنَامَتْنِي الْغَفْلَةُ عَنِ الاسْتِعْدادِ لِلِقائِكَ فَقَدْ نَبَّهَتْنِي الْمَعْرِفَةُ بِكَرَمِ أَلآئِكَ.\n\n'
                      'إِلهِي إِنْ دَعانِي إِلَى النَّارِ عَظِيمُ عِقابِكَ فَقَدْ دَعانِي إِلَى الْجَنَّةِ جَزِيلُ ثَوابِكَ، إِلهِي فَلَكَ أَسْأَلُ وَ إِلَيْكَ أَبْتَهِلُ وَأَرْغَبُ وَأَسْأَلُكَ أَنْ تُصَلِّيَ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَأَنْ تَجْعَلَنِي مِمَّنْ يُدِيمُ ذِكْرَكَ وَلا يَنْقُضُ عَهْدَكَ وَلا يَغْفُلُ عَنْ شُكْرِكَ وَلا يَسْتَخِفُّ بِأَمْرِكَ.\n\n'
                      'إِلهِي وَأَلْحِقْنِي بِنُورِ عِزِّكَ الأَبْهَجِ فَأَكُونَ لَكَ عارِفاً وَعَنْ سِواكَ مُنْحَرِفاً وَمِنْكَ خائِفاً مُراقِباً يا ذا الْجَلالِ وَالإِكْرامِ وَصَلَّى اللهُ عَلَى مُحَمَّدٍ رَسُولِهِ وَآلِهِ الطَّاهِرِينَ وَسَلَّمَ تَسْلِيماً كَثِيراً.\n\n',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlta2ibin.screenRoute,
        pushBack: AlmonajatBikashfAlzolm.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/المناجاة الشعبانية.mp3',
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
