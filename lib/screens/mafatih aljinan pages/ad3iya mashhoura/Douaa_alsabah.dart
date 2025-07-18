import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iya_mashhoura.dart';
import 'douaa_3alkama.dart';
import 'douaa_altawasol.dart';

class DouaaAlsabah extends StatefulWidget {
  static String screenRoute = 'douaa_alsabah_screen';
  const DouaaAlsabah({super.key});

  @override
  State<DouaaAlsabah> createState() => _DouaaAlsabahState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _DouaaAlsabahState extends State<DouaaAlsabah> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_alsabah_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_alsabah_screen', value);
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
          .pushReplacementNamed(Ad3iyaMashhoura.screenRoute);
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
                Navigator.of(context).pushReplacementNamed(
                    Ad3iyaMashhoura.screenRoute);
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
                      .addFavorite('دعاء الصباح لأمير المؤمنين',
                          DouaaAlsabah.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء الصباح لأمير المؤمنين',
                          DouaaAlsabah.screenRoute, DouaaAlsabah.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء الصباح لأمير المؤمنين',
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
                      'اَللّـهُمَّ يا مَنْ دَلَعَ لِسانَ الصَّباحِ بِنُطْقِ تَبَلُّجِهِ، وَسَرَّحَ قِطَعَ الّلَيْلِ الْمُظْلِمِ بِغَياهِبِ تَلَجْلُجِهِ، وَاَتْقَنَ صُنْعَ الْفَلَكِ الدَّوّارِ في مَقاديرِ تَبَرُّجِهِ، وَشَذعْشَعَ ضِياءَ الشَّمْسِ بِنُورِ تَاَجُّجِهِ،'
                      'يا مَنْ دَلَّ عَلى ذاتِهِ بِذاتِهِ وَتَنَزَّهَ عَنْ مُجانَسَةِ مَخْلُوقاتِهِ وَجَلَّ عَنْ مُلاءَمَةِ كَيْفِيّاتِهِ،'
                      'يا مَنْ قَرُبَ مِنْ خَطَراتِ الظُّنُونِ وَبَعُدَ عَنْ لَحَظاتِ الْعُيُونِ وَعَلِمَ بِما كانَ قَبْلَ اَنْ يَكُونَ،'
                      'يا مَنْ اَرْقَدَني في مِهادِ اَمْنِهِ وَاَمانِهِ وَاَيْقَظَني اِلى ما مَنَحَني بِهِ مِنْ مِنَنِهِ وَاِحْسانِهِ وَكَفَّ اَكُفَّ السُّوءِ عَنّي بِيَدِهِ وَسُلْطانِهِ،'
                      'صَلِّ اللّـهُمَّ عَلَى الدَّليلِ اِلَيْكَ فِي اللَّيْلِ الْاَلْيَلِ، وَالْماسِكِ مِنْ اَسْبَابِكَ بِحَبْلِ الشَّرَفِ الْاَطْوَلِ، وَالنّاصِعِ الْحَسَبِ في ذِرْوَةِ الْكاهِلِ الْاَعْبَلِ، وَالثّابِتِ الْقَدَمِ عَلى زَحاليفِها فِي الزَّمَنِ الْاَوَّلِ، وَعَلى آلِهِ الْاَخْيارِ الْمُصْطَفِيْنَ الْاَبْرارِ،'
                      'وَافْتَحِ اللّـهُمَّ لَنا مَصاريعَ الصَّباحِ بِمَفاتيحِ الرَّحْمَةِ وَالْفَلاحِ، وَاَلْبِسْنِي اللّـهُمَّ مِنْ اَفْضَلِ خِلَعِ الْهِدايَةِ وَالصَّلاحِ، وَاَغْرِسِ اللّـهُمَّ بِعَظَمَتِكَ في شِرْبِ جَناني يَنابيعَ الخُشُوعِ، وَاَجْرِ اللّـهُمَّ لِهَيْبَتِكَ مِنْ اماقي زَفَراتِ الدُّمُوعِ، وَاَدِّبِ اللّـهُمَّ نَزَقَ الْخُرْقِ مِنّي بِاَزِمَّةِ الْقُنُوعِ،'
                      'اِلـهي اِنْ لَمْ تَبْتَدِئنِي الرَّحْمَةُ مِنْكَ بِحُسْنِ التَّوْفيقِ فَمَنِ السّالِكُ بي اِلَيْكَ في واضِحِ الطَّريقِ، وَاِنْ اَسْلَمَتْني اَناتُكَ لِقائِدِ الْاَمَلِ وَالْمُني فَمَنِ الْمُقيلُ عَثَراتي مِنْ كَبَواتِ الْهَوى، وَاِنْ خَذَلَني نَصْرُكَ عِنْدَ مُحارَبَةِ النَّفْسِ وَالشَّيْطانِ فَقَدْ وَكَلَني خِذْلانُكَ اِلى حَيْثُ النَّصَبُ وَالْحِرْمانُ،'
                      'اِلـهي اَتَراني ما اَتَيْتُكَ إلاّ مِنْ حَيْثُ الاْمالِ اَمْ عَلِقْتُ بِاَطْرافِ حِبالِكَ إلاّ حينَ باعَدَتْني ذُنُوبي عَنْ دارِ الْوِصالِ، فَبِئْسَ الْمَطِيَّةُ الَّتي امْتَطَتْ نَفْسي مِنْ هَواهـا فَواهاً لَها لِما سَوَّلَتْ لَها ظُنُونُها وَمُناها، وَتَبّاً لَها لِجُرْاَتِها عَلى سَيِّدِها وَمَوْلاها'
                      'اِلـهي قَرَعْتُ بابَ رَحْمَتِكَ بِيَدِ رَجائي وَهَرَبْتُ اِلَيْكَ لاجِئاً مِنْ فَرْطِ اَهْوائي، وَعَلَّقْتُ بِاَطْرافِ حِبالِكَ اَنامِلَ وَلائى، فَاْصْفَحِ اللّـهُمَّ عَمّا كُنْتُ (كانَ) اَجْرَمْتُهُ مِنْ زَلَلي وَخَطائي، وَاَقِلْني مِنْ صَرْعَةِ رِدائي فَاِنَّكَ سَيِّدي وَمَوْلاي وَمُعْتَمَدي وَرَجائي وَاَنْتَ غايَةُ مَطْلُوبي وَمُناي في مُنْقَلَبي وَمَثْواىَ،'
                      'اِلـهي كَيْفَ تَطْرُدُ مِسْكيناً الْتَجَأَ اِلَيْكَ مِنَ الذُّنُوبِ هارِباً، اَمْ كَيْفَ تُخَيِّبُ مُسْتَرْشِداً قَصَدَ اِلى جَنابِكَ ساعِياً،'
                      'اَمْ كَيْفَ تَرُدُّ ظَمآناً وَرَدَ اِلى حِياضِكَ شارِباً كَلاّ وَحِياضُكَ مُتْرَعَةٌ في ضَنْكِ الْمُحُولِ، وَبابُكَ مَفْتُوحٌ لِلطَّلَبِ وَالْوُغُولِ، وَاَنْتَ غايَةُ الْمَسْؤولِ (السُّؤْلِ) وَنِهايَةُ الْمَأمُولِ،'
                      'اِلـهي هذِهِ اَزِمَّةُ نَفْسي عَقَلْتُها بِعِقالِ مَشِيَّتِكَ وَهذِهِ اَعْباءُ ذُنُوبي دَرَأتُها بِعَفْوِكَ وَرَحْمَتِكَ وَهذِهِ اَهْوائِي الْمُضِلَّةُ وَكَلْتُها اِلى جَنابِ لُطْفِكَ وَرَأفَتِكَ،'
                      'فَاجْعَلِ اللّـهُمَّ صَباحي هذا ناِزلاً عَلَي بِضِياءِ الْهُدى وَبِالسَّلامَةِ بالسلام فِي الدّينِ وَالدُّنْيا، وَمَسائي جُنَّةً مِنْ كَيْدِ الْعِدى (الْاَعْداءِ) وَوِقايَهً مِنْ مُرْدِياتِ الْهَوى اِنَكَ قادِرٌ عَلى ما تَشاءُ تُؤتِي الْمُلْكَ مَنْ تَشاءُ وَتَنْزِعُ الْمُلْكَ مِمَّنْ تَشاءُ وَتُعِزُّ مَنْ تَشاءُ وَتُذِلُّ مَنْ تَشاءُ، بِيَدِكَ الْخَيْرُ اِنَّـكَ عَلى كُلِ شَيْء قَديرٌ،'
                      'تُولِجُ اللَيْلَ في النَّهارِ وَتُولِجُ النَّهارَ فِي اللَّيْلِ وَتُخْرِجُ الْحَيَّ مِنَ الْمَيِّتِ وَتُخْرِجُ الْمَيِّتَ مِنَ الْحَي وَتَرْزُقُ مَنْ تَشاءُ بِغَيْرِ حِساب، لا اِلـهَ إلاّ اَنْتَ سُبْحانَكَ اللّـهُمَّ وَبِحَمْدِكَ'
                      'مَنْ ذا يَعْرِفُ قَدْرَكَ فَلا يَخافُكَ، وَمَن ذا يَعْلَمُ ما اَنْتَ فَلا يَهابُكَ، اَلَّفْتَ بِقُدْرَتِكَ الْفِرَقَ، وَفَلَقْتَ بِلُطْفِكَ الْفَلَقَ، وَاَنَرْتَ بِكَرَمِكَ دَياجِي الْغَسَقِ، وَاَنْهَرْتَ الْمِياهَ مِنَ الصُّمِّ الصَّياخيدِ عَذْباً وَاُجاجاً، وَاَنْزَلْتَ مِنَ الْمُعْصِراتِ ماءً ثَجّاجاً، وَجَعَلْتَ الشَّمْسَ وَالْقَمَرَ لِلْبَرِيَّةِ سِراجاً وَهّاجاً مِنْ غَيْرِ اَنْ تُمارِسَ فيما ابْتَدَأتَ بِهِ لُغُوباً وَلا عِلاجاً،'
                      'فَيا مَنْ تَوَحَّدَ بِالْعِزِّ وَالْبَقاءِ، وَقَهَرَ عِبادَهُ بِالْمَوْتِ وَالْفَناءِ صَلِّ عَلى مُحَمَّد وَآلِهِ الْاَتْقِياءِ، وَاسْمَعْ نِدائي وَاسْتَجِبْ دُعائي وَحَقِّقْ بِفَضْلِكَ اَمَلي وَرَجائي يا خَيْرَ مَنْ دُعِي لِكَشْفِ الضُّرِّ وَالْمَأمُولِ لِكُلِّ عُسْر وَيُسْر بِكَ اَنْزَلْتُ حاجَتي فَلا تَرُدَّني مِنْ سَنِيِّ مَواهِبِكَ خائِباً يا كَريمُ يا كَريمُ يا كَريمُ بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ وَصَلَّى اللهُ عَلى خَيْرِ خَلْقِهِ مُحَمَّد وَآلِهِ اَجْمَعينَ'
                      'ثمّ اسجد وقل: اِلـهي قَلْبي مَحْجُوبٌ، وَنَفْسي مَعْيُوبٌ، وَعَقْلي مَغْلُوبٌ، وَهَوائي غالِبٌ، وَطاعَتي قَليلٌ، وَمَعْصِيَتي كَثيرٌ، وَلِساني مُقِرٌّ بِالذُّنُوبِ فَكَيْفَ حيلَتي يا سَتّارَ الْعُيُوبِ وَيا عَلاّمَ الْغُيُوبِ وَيا كاشِفَ الْكُرُوبِ، اِغْفِرْ ذُنُوبي كُلَّها بِحُرْمَةِ مُحَمَّد وَآلِ مُحَمَّد يا غَفّارُ يا غَفّارُ يا غَفّارُ بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: DouaaAltawasol.screenRoute,
        pushBack: Douaa3alkama.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء الصباح.mp3',
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
