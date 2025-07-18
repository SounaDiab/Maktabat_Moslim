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
import 'dou3a2_allayla_alwahida_wal3ishrin.dart';

class ZyaratAmirMo2minin extends StatefulWidget {
  static String screenRoute = 'zyarat_amir_mo2minin_screen';
  const ZyaratAmirMo2minin({super.key});

  @override
  State<ZyaratAmirMo2minin> createState() => _ZyaratAmirMo2mininState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZyaratAmirMo2mininState extends State<ZyaratAmirMo2minin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_zyarat_amir_mo2minin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_zyarat_amir_mo2minin_screen', value);
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
                      .addFavorite('زيارة امير المؤمنين عليه السلام',
                          ZyaratAmirMo2minin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة امير المؤمنين عليه السلام',
                          ZyaratAmirMo2minin.screenRoute,
                          ZyaratAmirMo2minin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة امير المؤمنين عليه السلام',
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
                      'رَحِمَكَ اللهُ يا أَبَا الْحَسَنِ. كُنْتَ أَوَّلَ الْقَوْمِ إِسْلاماً، وَأَخْلَصَهُمْ إِيْماناً، وَأَشدَّهُم يَقِيناً، وَأَخْوَفَهُمْ لِلَّهِ عَزَّ وَجَلَّ، وَأَعْظَمَهُمْ عَناءً، وَأَحْوَطَهُمْ عَلَى رَسُولِ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ، وَآمَنَهُمْ عَلَى أَصْحابِهِ، وَأَفْضَلَهُمْ مَناقِبَ، وَأَكْرَمَهُمْ (وَأَكْثَرَهُمْ) سَوابِقَ، وَأَرْفَعَهُمْ دَرَجَةً، وَأَقْرَبَهُمْ مِنْ رَسُولِ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ، وَأَشْبَهَهُمْ بِهِ هَدْياً وَخُلُقاً ومنطقاً وَسَمْتاً وَفِعْلاً، وَأَشْرَفَهُمْ مَنْزِلَةً، وَأَكْرَمَهُمْ عَلَيْهِ، فَجَزاكَ اللهُ عَنِ الإِسْلامِ، وَعَنْ رَسُولِ اللهِ (رسوله) صَلَّى اللهُ عَلَيْهِ وَآلِهِ، وَعَنِ الْمُسْلِمِينَ خَيْراً. قَوِيْتَ حِيْنَ ضَعُفَ أَصْحابُه، وَبَرَزْتَ حِيْنَ اسْتَكَانُوا، وَنَهَضْتَ حِيْنَ وَهَنُوا، وَلَزِمْتَ مِنْهاجَ رَسُولِ اللهِ إِذْ هَمَّ أَصْحابُهُ، وَكُنْتَ خَلِيْفَتَهُ حَقّاً. لَمْ تُنازَعْ، وَلَمْ تُضْرَعْ، بِرَغْمِ الْمُنافِقِينَ، وَغَيْظِ الْكافِرِينَ، وَكُرْهِ الْحاسِدِينَ، وَصِغَرِ (وضِغنْ) الْفاسِقِينَ، فَقُمْتَ بِالأَمْرِ حِيْنَ فَشِلُوا، وَنَطَقْتَ حِيْنَ تَتَعْتَعُوا، وَمَضَيْتَ بِنُورِ اللهِ إِذْ وَقَفُوا، فَاتَّبَعُوكَ فَهُدُوا (فَلَوْ اتَّبَعُوكَ لَهُدُوا)، وَكُنْتَ أَخْفَضَهُمْ صَوْتاً، وَأَعْلاهُمْ قُنُوتاً، وَأَقَلَّهُمْ كَلاماً، وَأَصْوَبَهُمْ نُطْقَاً، وَأَكْبَرَهُمْ رَأْياً، وَأَشْجَعَهُمْ قَلْباً، وَأَشَدَّهُمْ يَقِيناً، وَأَحْسَنَهُمْ عَمَلاً، وَأَعْرَفَهُمْ بِالأَمُورِ. كُنْتَ وَاللهِ يَعْسُوباً لِلدّيْنِ، أَوَّلاً وَآخِراً: الأَوَّلُ حِيْنَ تَفَرَّقَ النَّاسُ، وَالآخِرُ حِيْنَ فَشِلُوا. كُنْتَ لِلْمُؤْمِنِينَ أَباً رَحِيماً إِذْ صارُوا عَلَيْكَ عِيالاً، فَحَمَلْتَ أَثْقالَ ما عَنْهُ ضَعَفُوا، وَحَفِظْتَ ما أَضَاعُوا، وَرَعَيْتَ ما أَهْمَلُوا، وَشَمَّرْتَ إِذِ اجْتَمَعُوا، وَعَلَوْتَ إِذْ هَلَعُوا، وَصَبَرْتَ إِذْ أَسْرَعُوا (جَزَعُوا)، وَأَدْرَكْتَ أَوْتارَ ما طَلَبُوا، وَنالُوا بِكَ ما لَمْ يَحْتَسِبُوا. كُنْتَ لِلْكافِرِينَ عَذاباً صَبّاً وَنَهْباً، وَلِلْمُؤْمِنِينَ عَمَداً وَحِصْناً (غَيْباً وَخَصْباً)، فَطِرْتَ وَاللهِ بِنِعْمائِها، وَفُزْتَ بِحِبائِها، وَأَحْرَزْتَ سَوابِقَها، وَذَهَبْتَ بِفَضائِلِها. لَمْ تَفْلَلْ حُجَّتُكَ، وَلَمْ يَزِغْ قَلْبُكَ، وَلَمْ تَضْعُفْ بَصِيْرَتُكَ، وَلَمْ تَجْبُنْ نَفْسُكَ، وَلَمْ تَخُنْ. كُنْتَ كَالْجَبَلِ لا تُحَرّكُهُ الْعَواصِفُ، وَكُنْتَ كَما قَالَ صَلّى اللهُ عَلَيْهِ وَآلِهِ. آمَنَ النَّاسُ فِي صُحْبَتِكَ وَذاتِ يَدِكَ، وَكُنْتَ كَما قَالَ صَلّى اللهُ عَلَيْهِ وَآلِهِ: ضَعِيفاً فِي بَدَنِكَ، قَوِيّاً فِي أَمْرِ اللهِ، مُتَواضِعاً فِي نَفْسِكَ، عَظِيْماً عِنْدَ اللهِ، كَبِيراً فِي الأَرْضِ، جَلِيلاً عِنْدَ الْمُؤْمِنِينَ. لَمْ يَكُنْ لأَحَدٍ فِيكَ مَهْمَزٌ وَلا لِقَائِلٍ فِيكَ مَغْمَزٌ وَلا لأَحَدٍ فِيكَ مَطْمَعٌ وَلا لأَحَدٍ عِنْدَكَ هَوادَةٌ الضَّعِيفُ الذَّلِيلُ عِنْدَكَ قَوِيٌّ عَزِيْزٌ حَتَّى تَأْخُذَ لَهُ بِحَقّهِ وَالْقَوِيُّ الْعَزِيْزُ عِنْدَكَ ضَعِيْفٌ ذَلِيلٌ حَتَّى تَأْخُذَ مِنْهُ الْحَقَّ وَالْقَرِيْبُ وَالْبَعِيدُ عِنْدَكَ فِي ذلِكَ سَواءٌ شَأْنُكَ الْحَقُّ وَالصّدْقُ وَالرّفْقُ، وَقَوْلُكَ حُكْمٌ وَحَتْمٌ وَأَمْرُكَ حِلْمٌ وَحَزْمٌ وَرَأْيُكَ عِلْمٌ وَعَزْمٌ فِيْما فَعَلْتَ (فَأَقْلَعْتَ)، وَقَدْ نَهَجَ بِكَ السَّبِيلُ وَسَهُلَ بِكَ الْعَسِيْرُ وَأُطْفِئَتْ بِكَ النَّيرانُ وَاعْتَدَلَ بِكَ الدّيْنُ، وَقَوِيَ بِكَ الإِسْلامُ وَالْمُؤْمِنُونَ وَسَبَقْتَ سَبْقاً بَعِيداً وَأَتْعَبْتَ مَنْ بَعْدَكَ تَعْباً شَدِيْداً، فَجَلَلْتَ عَنِ الْبُكاءِ وَعَظُمَتْ رَزِيَّتُكَ فِي السَّماءِ وَهَدَّتْ مُصِيْبَتُكَ الأَنامَ، فَإِنَّا لِلَّهِ وَإِنَّا إِلَيْهِ راجِعُونَ. رَضِينا عَنِاللهِ قَضَاءَهُ، وَسَلَّمْنا لِلَّهِ أَمْرَهُ فَوَاللهِ لَنْ يُصابَ الْمُسْلِمُونَ بِمِثْلِكَ أَبَداً كُنْتَ لِلْمُؤْمِنِينَ كَهْفاً وَحِصْناً وَقُنَّةً راسِياً وَعَلَى الْكافِرِينَ غِلْظَةً وَغَيْظاً فَأَلْحَقَكَ اللهُ بِنَبِيّهِ وَلا حَرَمَنا أَجْرَكَ وَلا أَضَلَّنا بَعْدَكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: A3malAllaylaAlsalisaWal3ishrin.screenRoute,
          pushBack: Dou3a2AllaylaAlwahidaWal3ishrin.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة امير المؤمنين عليه السلام.mp3',
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
