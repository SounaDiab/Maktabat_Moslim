import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al3ama.dart';
import 'dou3a2_abi_hamza_alsamali.dart';
import 'dou3a2_idris.dart';

class Dou3a2Ya3odati extends StatefulWidget {
  static String screenRoute = 'dou32_ya_3odati_screen';
  const Dou3a2Ya3odati({super.key});

  @override
  State<Dou3a2Ya3odati> createState() => _Dou3a2Ya3odatiState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Ya3odatiState extends State<Dou3a2Ya3odati> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_dou32_ya_3odati_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_dou32_ya_3odati_screen', value);
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
                      .addFavorite('دعاء يا عدتي', Dou3a2Ya3odati.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء يا عدتي', Dou3a2Ya3odati.screenRoute,
                          Dou3a2Ya3odati.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء يا عدتي',
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
                      'يا عُدَّتِي فِي كُرْبَتِي، وَيا صاحِبِي فِي شِدَّتِي، وَيا وَلِيِّي فِي نِعْمَتِي، وَيا غايَتِي فِي رَغْبَتِي، أَنْتَ السَّاتِرُ عَوْرَتِي، وَالْمُؤْمِنُ رَوْعَتِي، وَالْمُقِيلُ عَثْرَتِي، فَاغْفِرْ لِي خَطِيئَتِي. اللّهُمَّ، إِنِّي أَسْأَلُكَ خُشُوعَ الْإِيْمانِ قَبْلَ خُشُوعِ الذُّلِّ فِي النَّارِ، يا واحِدُ يا أَحَدُ. يا صَمَدُ، يا مَنْ لَمْ يَلِدْ وَلَمْ يُولَدْ، وَلَمْ يَكُنْ لَهُ كُفُواً أَحَدٌ يا مَنْ يُعْطِي مَنْ سَأَلَهُ تَحَنُّناً مِنْهُ وَرَحْمَةً، وَيَبْتَدِىءُ بِالْخَيْرِ مَنْ لَمْ يَسْأَلْهُ تَفَضُّلاً مِنْهُ وَكَرَماً، بِكَرَمِكَ الدَّائِمِ صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، وَهَبْ لِي رَحْمَةً واسِعَةً جامِعَةً، أَبْلُغُ بِها خَيْرَ الدُّنْيا وَالآخِرَةِ. اللّهُمَّ، إِنِّي أَسْتَغْفِرُكَ لِما تُبْتُ إِلَيْكَ مِنْهُ ثُمَّ عُدْتُ فِيهِ، وَأَسْتَغْفِرُكَ لِكُلِّ خَيْرٍ أَرَدْتُ بِهِ وَجْهَكَ فَخَالَطَنِي فِيهِ ما لَيْسَ لَكَ. اللّهُمَّ، صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، وَاعْفُ عَنْ ظُلْمِي وَجُرْمِي بِحِلْمِكَ وَجُودِكَ. يا كَرِيمُ، يا مَنْ لا يَخِيبُ سائِلُهُ، وَلا يَنْفَدُ نائِلُهُ، يا مَنْ عَلا فَلا شَيْءَ فَوْقَهُ، وَدَنا فَلا شَيْءَ دُونَهُ، صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، وَارْحَمْنِي يا فالِقَ الْبَحْرِ لِمُوسَى، اللَّيْلَةَ اللَّيْلَةَ اللَّيْلَةَ، السَّاعَةَ السَّاعَةَ السَّاعَةَ. اللّهُمَّ، طَهِّرْ قَلْبِي مِنَ النِّفاقِ، وَعَمَلِي مِنَ الرِّياءِ، وَلِسانِي مِنَ الْكَذِب، وَعَيْنِي مِنَ الْخِيانَةِ، فَإِنَّكَ تَعْلَمُ خائِنَةَ الْأَعْيُنِ وَما تُخْفِي الصُّدُورُ. يا رَبِّ، هذَا مَقامُ الْعائِذِ بِكَ مِنَ النَّارِ، هذَا مَقامُ الْمُسْتَجِيرِ بِكَ مِنَ النَّارِ، هَذا مَقامُ الْمُسْتَغِيثِ بِكَ مِنَ النَّارِ، هذَا مَقامُ الْهارِبِ إِلَيْكَ مِنَ النَّارِ، هَذا مَقامُ مَنْ يَبُوءُ لَكَ بِخَطِيئَتِهِ، وَيَعْتَرِفُ بِذَنْبِهِ، وَيَتُوبُ إِلَى رَبِّهِ، هَذا مَقامُ الْبائِسِ الْفَقِيرِ، هَذا مَقامُ الْخَائِفِ الْمُسْتَجِيرِ، هَذا مَقامُ الْمَحْزُونِ الْمَكْروبِ، هَذا مَقامُ الْمَغْمُومِ (المَحْزُونِ) الْمَهْمُومِ، هَذا مَقامُ الْغَرِيبِ الْغَرِيقِ، هَذا مَقامُ الْمُسْتَوْحِشِ الْفَرِقِ، هَذا مَقامُ مَنْ لا يَجِدُ لِذَنْبِهِ غافِراً غَيْرَكَ، وَلا لِضَعْفِهِ مُقَوِّياً إِلّا أَنْتَ، وَلا لِهَمِّهِ مُفَرِّجاً سِواكَ. يا اللهُ يا كَرِيمُ، لا تُحْرِقْ وَجْهِي بِالنَّارِ بَعْدَ سُجُودِي لَكَ، وَتَعْفِيرِي بِغَيْرِ مَنٍّ مِنِّي عَلَيْكَ؛ بَلْ لَكَ الْحَمْدُ وَالْمَنُّ وَالتَّفَضُّلُ عَلَيَّ. ارْحَمْ، أَيْ رَبِّ أَيْ رَبِّ أَيْ رَبِّ (حتى ينقطع النفس) ضَعْفِي، وَقِلَّةَ حِيلَتِي، وَرِقَّةَ جِلْدِي، وَتَبَدُّدَ أَوْصالِي، وَتَناثُرَ لَحْمِي وَجِسْمِي وَجَسَدِي، وَوَحْدَتِي وَوَحْشَتِي فِي قَبْرِي، وَجَزَعِي مِنْ صَغِيرِ الْبَلاءِ. أَسْأَلُكَ، يا رَبِّ، قُرَّةَ الْعَيْنِ، وَالاغْتَباطَ يَوْمَ الْحَسْرَةِ وَالنَّدامَةِ. بَيِّضْ وَجْهِي، يا رَبِّ، يَوْمَ تَسْوَدُّ الْوُجُوهُ، آمِنِّي مِنَ الْفَزَعِ الْأَكْبَرِ، أَسْأَلُكَ الْبُشْرَى يَوْمَ تُقَلَّبُ الْقُلُوبُ وَالْأَبْصارُ، وَالْبُشْرَى عِنْدَ فِراقِ الدُّنْيا. الْحَمْدُ لِلَّهِ الَّذِي أَرْجُوهُ عَوْناً لِي فِي حَياتِي، وَأُعِدُّهُ ذُخْراً لِيَوْمِ فاقَتِي. الْحَمْدُ لِلَّهِ الَّذِي أَدْعُوهُ وَلا أَدْعُو غَيْرَهُ، وَلَوْ دَعَوْتُ غَيْرَهُ لَخَيَّبَ دُعائِي. الْحَمْدُ لِلَّهِ الَّذِي أَرْجُوهُ وَلا أَرْجُو غَيْرَهُ، وَلَوْ رَجَوْتُ غَيْرَهُ لأَخْلَفَ رَجائِي. الْحَمْدُ لِلَّهِ، الْمُنْعِمِ الْمُحْسِنِ، الْمُجْمِلِ الْمُفْضِلِ، ذِي الْجَلالِ وَالْإِكْرامِ، وَلِيِّ كُلِّ نِعْمَةٍ، وَصاحِبِ كُلِّ حَسَنَةٍ، وَمُنْتَهَى كُلِّ رَغْبَةٍ، وَقاضِي كُلِّ حاجَةٍ. اللّهُمَّ، صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، وَارْزُقْنِي الْيَقِينَ وَحُسْنَ الظَّنِّ بِكَ وَأَثْبِتْ رَجاءَكَ فِي قَلْبِي، وَاقْطَعْ رَجائِي عَمَّنْ سِواكَ، حَتَّى لا أَرْجُوَ غَيْرَكَ، وَلا أَثِقَ إِلّا بِكَ. يا لَطِيفاً لِما تَشاءُ (يَشَاءُ)، الْطُفْ لِي فِي جَمِيعِ أَحْوالِي، بِما تُحِبُّ وَتَرْضَى. يا رَبِّ، إِنِّي ضَعِيفٌ عَلَى النَّارِ فَلا تُعَذِّبْنِي بِالنَّارِ، يا رَبِّ، ارْحَمْ دُعائِي وَتَضَرُّعِي، وَخَوْفِي وَذُلِّي وَمَسْكَنَتِي، وَتَعْويذِي وَتَلْويذِي. يا رَبِّ، إِنِّي ضَعِيفٌ عَنْ طَلَبِ الدُّنْيا، وَأَنْتَ واسِعٌ كَرِيمٌ. أَسْأَلُكَ، يا رَبِّ، بِقُوَّتِكَ عَلَى ذلِكَ، وَقُدْرَتِكَ عَلَيْهِ، وَغِناكَ عَنْهُ، وَحاجَتِي إِلَيْهِ، أَنْ تَرْزُقَنِي فِي عامِي هَذا، وَشَهْرِي هَذا، وَيَوْمِي هَذا، وَساعَتِي هَذِهِ، '
                      'رِزْقاً تُغْنِينِي بِهِ عَنْ تَكَلُّفِ ما فِي أَيْدِي النَّاسِ مِنْ رِزْقِكَ الْحَلالِ الطَّيِّبِ. (أي) رَبِّ، مِنْكَ أَطْلُبُ، وَإِلَيْكَ أَرْغَبُ، وَإِيَّاكَ أَرْجُو، وَأَنْتَ أَهْلُ ذلِكَ، لا أَرْجُو غَيْرَكَ، وَلا أَثِقُ إِلّا بِكَ، يا أَرْحَمَ الرَّاحِمِينَ. أَيْ رَبِّ، ظَلَمْتُ نَفْسِي فَاغْفِرْ لِي وَارْحَمْنِي وَعافِنِي، يا سامِعَ كُلِّ صَوْتٍ، وَيا جامِعَ كُلِّ فَوْت، وَيا بارِىءَ النُّفُوسِ بَعْدَ الْمَوْتِ، يا مَنْ لا تَغْشاهُ الظُّلُماتُ، وَلا تَشْتَبِهُ عَلَيْهِ الْأَصْواتُ، وَلا يَشْغَلُهُ شَيْءٌ عَنْ شَيْءٍ، أَعْطِ مُحَمَّداً صَلَّى اللهُ عَلَيْهِ وَآلِهِ، أَفْضَلَ ما سَأَلَكَ، وَأَفْضَلَ ما سُئِلْتَ لَهُ، وَأَفْضَلَ ما أَنْتَ مَسْؤُولٌ لَهُ إِلَى يَوْمِ الْقِيامَةِ، وَهَبْ لِيَ الْعافِيَةَ حَتَّى تُهَنِّئَنِي الْمَعِيشَةَ، وَاخْتِمْ لِي بِخَيْرٍ حَتَّى لا تَضُرَّنِي الذُّنُوبُ. اللّهُمَّ، رَضِّنِي بِما قَسَمْتَ لِي حَتَّى لا أَسْأَلَ أَحَداً شَيْئَاً. اللّهُمَّ، صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، وَافْتَحْ لِي خَزائِنَ رَحْمَتِكَ، وَارْحَمْنِي رَحْمَةً لا تُعَذِّبُنِي بَعْدَها أَبَداً فِي الدُّنْيا وَالآخِرَةِ، وَارْزُقْنِي مِنْ فَضْلِكَ الْواسِعِ، رِزْقاً حَلالاً طَيِّباً، لا تُفْقِرُنِي إِلَى أَحَدٍ بَعْدَهُ سِواكَ، تَزِيدُنِي بِذَلِكَ شُكْرَاً، وَإِلَيْكَ فاقَةً وَفَقْراً، وَبِكَ عَمَّنْ سِواكَ غِنَىً وَتَعَفُّفاً. يا مُحْسِنُ يا مُجْمِلُ، يا مُنْعِمُ يا مُفْضِل، يا مَلِيكُ يا مُقْتَدِرُ، صَلِّ عَلَى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، وَاكْفِنِي الْمُهِمَّ كُلَّهُ، وَاقْضِ لِي بِالْحُسْنَى، وَبارِكْ لِي فِي جَمِيعِ أُمُورِي، وَاقْضِ لِي جَمِيعَ حَوائِجِي. اللّهُمَّ، يَسِّرْ لِي ما أَخَافُ تَعْسِيرَهُ (تَعَسُّرَهُ)، فَإِنَّ تَيْسِيرَ ما أَخافُ تَعْسِيرَهُ (تَعَسُّرَهُ) عَلَيْكَ سَهْلٌ يَسِيرٌ، وَسَهِّلْ لِي ما أَخافُ حُزُونَتَهُ، وَنَفِّسْ عَنِّي ما أَخافُ ضِيقَهُ، وَكُفَّ عَنِّي ما أَخافُ هَمَّهُ (غَمَّهُ)، وَاصْرِفْ عَنِّي ما أَخافُ بَلِيَّتَهُ، يا أَرْحَمَ الرَّاحِمِينَ. اللّهُمَّ، امْلأْ قَلْبِي حُبَّاً لَكَ، وَخَشْيَةً مِنْكَ، وَتَصْدِيقاً لَكَ، وَإِيماناً بِكَ، وَفَرَقاً مِنْكَ، وَشَوْقاً إِلَيْكَ، يا ذا الْجَلالِ وَالْإِكْرامِ. اللّهُمَّ، إِنَّ لَكَ حُقُوقاً فَتَصَدَّقْ بِها عَلَيَّ، وَلِلَّناسِ قِبَلِي تَبِعاتٌ فَتَحَمَّلْها عَنِّي، وَقَدْ أَوْجَبْتَ لِكُلِّ ضَيْفٍ قِرىً، وَأَنَا ضَيْفُكَ، فَاجْعَلْ قِرَايَ اللَّيْلَةَ الْجَنَّةَ، يا وَهَّابَ الْجَنَّةِ، يا وَهَّابَ الْمَغْفِرَةِ، وَلا حَوْلَ وَلا قُوَّةَ إِلّا بِكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Idris.screenRoute,
          pushBack: Dou3a2AbiHamzaAlsamali.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء يا عدتي.mp3',
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
