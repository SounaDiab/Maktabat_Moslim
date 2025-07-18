import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'fadl_torbat_alhussein.dart';
import 'fi_fadl_ziyarat_alhussein.dart';

class Ziyarat3ashoraa extends StatefulWidget {
  static String screenRoute = 'ziyarat_3ashoraa_screen';
  const Ziyarat3ashoraa({super.key});

  @override
  State<Ziyarat3ashoraa> createState() => _Ziyarat3ashoraaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Ziyarat3ashoraaState extends State<Ziyarat3ashoraa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ziyarat_3ashoraa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_3ashoraa_screen', value);
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
          .pushReplacementNamed(ZiyaratAlhousseinWa2adabiha.screenRoute);
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
                          'زيارة عاشوراء', Ziyarat3ashoraa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة عاشوراء',
                          Ziyarat3ashoraa.screenRoute,
                          Ziyarat3ashoraa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة عاشوراء',
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
                      'السَّلام عَلَيْكَ يَا أبَا عَبْدِ اللهِ ، السَّلام عَلَيْكَ يَا ابْنَ رَسُولِ اللهِ ، السَّلام عَلَيْكَ يَا ابْنَ أمِيرِ المُؤْمِنينَ ، وَابْنَ سَيِّدِ الوَصِيِّينَ ، السَّلام عَلَيْكَ يَا ابْنَ فاطِمَةَ الزّهراءِ سَيِّدَةِ نِساءِ العالَمِينَ ، السَّلام عَلَيْكَ يَا ثَارَ اللهِ وابْنَ ثارِهِ وَالْوِتْرَ المَوْتُورَ ، السَّلام عَلَيْكَ وَعَلَى الأرواحِ الّتي حَلّتْ بِفِنائِكَ ، وَأنَاخَتْ بِرحْلِك عَلَيْكُمْ مِنّي جَميعاً سَلامُ اللهِ أبَداً ما بَقِيتُ وَبَقِيَ الليْلُ وَالنَّهارُ.\n\n'
                      'يَا أبَا عَبْدِ اللهِ ، لَقَدْ عَظُمَتِ الرَّزِيَّةُ ، وجَلّتْ وعَظُمَتْ المُصِيبَةُ بِكَ عَلَيْنا وَعَلَى جَمِيعِ أهْلِ الإسلام ، وَجَلَّتْ وَعَظُمَتْ مُصِيبَتُكَ فِي السَّمَوَاتِ عَلَى جَمِيعِ أهْلِ السَّمَوَاتِ ، فَلَعَنَ اللهُ اُمَّةً أسَّسَتْ أساسَ الظُّلْمِ وَالجَوْرِ عَلَيْكُمْ أهْلَ البَيْتِ ، وَلَعَنَ اللهُ اُمَّةً دَفَعَتْكُمْ عَنْ مَقامِكُمْ وَأزالَتْكُمْ عَنْ مَراتِبِكُمُ الّتِي رَتَّبَكُمُ اللهُ فِيها ، وَلَعَنَ اللهُ اُمَّةً قَتَلَتْكُمْ ، وَلَعَنَ اللهُ الْمُمَهِّدِينَ لَهُمْ بِالتَّمْكِينِ مِنْ قِتالِكُمْ ، بَرِئْتُ إلى اللهِ وَإلَيْكُمْ مِنْهُمْ وَمِنْ أشْياعِهِمْ وَأتْباعِهِمْ وَأوْلِيائِهِمْ.\n\n'
                      'يَا أبَا عَبْدِ اللهِ ، إنِّي سِلْمٌ لِمَنْ سالَمَكُمْ ، وَحَرْبٌ لِمَنْ حارَبَكُمْ وَوليٌ لِمَنْ والاكُم وعدوٌّ لِمَنْ عَاداكُمْ إلى يَوْمِ القِيامَةِ ، وَلَعَنَ اللهُ آل زِيَاد وَآلَ مَرْوانَ ، وَلَعَنَ اللهُ بَنِي اُمَيَّةَ قاطِبَةً ، وَلَعَنَ اللهُ ابْنَ مَرْجانَةَ ، وَلَعَنَ اللهُ عُمَرَ بْنَ سَعْد ، وَلَعَنَ اللهُ شِمْراً ، وَلَعَنَ اللهُ اُمَّةً أسْرَجَتْ وَألْجَمَتْ وَتَهيّأتْ وَتَنَقَّبَتْ لِقِتالِكَ ، بِأبِي أنْتَ وَاُمِّي لَقَدْ عَظُمَ مُصابِي بِكَ ، فَأسْالُ اللهَ الّذِي أكْرَمَ مَقامَكَ ، وَأكْرَمَنِي بِكَ ، أنْ يَرْزُقَني طَلَبَ ثارِكَ مَعَ إمام مَنْصُور مِنْ أهْلِ بَيْتِ مُحَمَّد صَلّى الله عَلَيْهِ وَآلِهِ.\n\n'
                      'اللهمّ اجْعَلْني عِنْدَكَ وَجِيهاً بِالحُسَيْنِ عَلَيهِ السَّلام فِي الدُّنْيا وَالآخِرَةِ مِنَ المقَرّبينْ.\n\n'
                      'يَا أبَا عَبْدِ اللهِ ، إنِّي أتَقَرَّبُ إلى اللهِ تعالى ، وَإلَى رَسُولِهِ ، وَإلى أمِيرِ المُؤْمِنينَ ، وَإلَى فاطِمَةَ ، وإلى الحَسَنِ وَإلَيْكَ بِمُوالاتِكَ ، ومُوالاةِ أَوليائِك وَبِالْبَرَاءَةِ مِمَّنْ قَاتَلَكَ وَنَصبَ لَكَ الحَربَ ، وبالْبَرَاءةِ مِمَّنْ أسَّسَ أساسَ الظُّلْمِ وَالجَوْرِ عَلَيْكُمْ ، وَعلى أشياعِكُم وَأبْرَأُ إلى اللهِ وَإلى رَسُولِهِ وَبِالبراءِةِ مِمَّنْ أسَّسَ أساسَ ذلِكَ ، وَبَنى عَلَيْهِ بُنْيانَهُ ، وَجَرَى في ظُلْمِهِ وَجَوْرِهِ عَلَيْكُمْ وَعَلَى أشْياعِكُمْ ، بَرِئْتُ إلى اللهِ وَإلَيْكُمْ مِنْهُمْ ، وَأتَقَرَّبُّ إلى اللهِ وَإلى رَسولِهِ ثُمَّ إلَيْكُمْ بِمُوالاتِكُم وَمُوالاةِ وَلِيِّكُمْ ، وَبِالْبَرَاءَةِ مِنْ أعْدائِكُمْ ،وَالنَّاصِبِينَ لَكُم الحَرْبَ ، وَبِالبَرَاءَةِ مِنْ أشْياعِهِمْ وَأتْباعِهِمْ ، يا أبا عَبدِ الله إنِّي سِلْمٌ لِمَنْ سالَمَكُمْ ، وَحَرْبٌ لِمَنْ حارَبَكُمْ ، وَوَلِيٌّ لِمَنْ والاكُمْ ، وَعَدُوٌّ لِمَنْ عاداكُمْ ، '
                      'فَأسْألُ اللهَ الّذِي أكْرَمَني بِمَعْرِفَتِكُمْ ، وَمَعْرِفَةِ أوْلِيائِكُمْ ، وَرَزَقَني البَراءَةَ مِنْ أعْدائِكُمْ ، أنْ يَجْعَلَني مَعَكُمْ في الدُّنْيا وَالآخِرَةِ ، وَأنْ يُثَبِّتَ لي عِنْدَكُمْ قَدَمَ صِدْق في الدُّنْيا وَالآخِرَةِ ، وَأسْألُهُ أنْ يُبَلِّغَنِي الْمقامَ الْمَحْمُودَ لَكُمْ عِنْدَ اللهِ ، وَأنْ يَرْزُقَنِي طَلَبَ ثَارِي مَعَ إمَام مَهْدِيٍّ ظَاهِر نَاطِق بالحقِّ مِنْكُمْ ، وَأسْألُ اللهَ بِحَقِّكُمْ وَبِالشَّأنِ الَّذِي لَكُمْ عِنْدَهُ أنْ يُعْطِيَنِي بِمُصابِي بِكُمْ أفْضَلَ ما يُعْطِي مصاباً بِمُصِيبَتِهِ ، يا لَها منْ مُصِيبَة مَا أعْظَمَها وَأعْظَمَ رَزِيّتهَا فِي الإسلام وَفِي جَمِيعِ أهلِ السَّموَاتِ وَالارْضِ.'
                      'اللهُمَّ اجْعَلْني في مَقامِي هذا مِمَّن تَنالُهُ مِنْكَ صَلَواتٌ وَرَحْمَةٌ وَمَغْفِرَةٌ.\n\n'
                      'اللهُمَّ اجْعَلْ مَحْيايَ مَحْيا مُحَمَّد وَآلِ مُحَمَّد ، وَمَماتي مَماتَ مُحَمَّد وَآل مُحَمَّد.\n\n'
                      'اللهُمَّ إنَّ هَذا يَوْمٌ تَبَرَّكَتْ بِهِ بَنُو اُمَيَّةَ وَابْنُ آكِلَةِ الاكْبادِ ، اللعِينُ بْنُ اللعِينِ عَلَى لِسانِكَ وَلِسانِ نَبِيِّكَ صَلّى الله عَلَيْهِ وَآلِهِ في كُلِّ مَوْطِن وَمَوْقِف وَقَفَ فِيهِ نَبيُّكَ ـ صَلّى الله عَلَيْهِ وَآلِهِ.\n\n'
                      'اللهُمَّ الْعَنْ أبَا سُفْيانَ وَمُعَاوِيَةَ وَيَزيدَ بْنَ مُعَاوِيَةَ وآلَ مَرْوَانَ عَلَيْهِمْ مِنْكَ اللعْنَةُ أبَدَ الآبِدِينَ ، وَهذا يَوْمٌ فَرِحَتْ بِهِ آلُ زِيَاد وَآلُ مَرْوانَ عَليهِمُ اللَّعْنةُ بِقَتلِهِمُ الحُسَيْنَ عَلَيْهِ السَّلام ، اللهُمَّ فَضاعِفْ عَلَيْهِمُ اللعْنَ وَالعَذابَ الأليم.\n\n'
                      'اللهُمَّ إنِّي أتَقَرَّبُّ إلَيْكَ في هذَا اليَوْمِ ، وَفِي مَوْقِفِي هَذا ، وَأيَّامِ حَيَاتِي بِالبَرَاءَةِ مِنْهُمْ ، وَاللعْنَةِ عَلَيْهِمْ ، وَبِالْمُوالاةِ لِنَبِيِّكَ وَآلِ نَبِيِّكَ عَلَيِه وعَلَيْهِمُ السَّلام.\n\n'
                      'ثمّ يقول : اللهُمَّ الْعَنْ أوّلَ ظالِم ظَلَمَ حَقَّ مُحَمَّد وَآلِ مُحَمَّد ، وَآخِرَ تَابِع لَهُ عَلَى ذلِكَ ، اللهُمَّ الْعَنِ العِصابَةَ الَّتِي جاهَدَتِ الْحُسَيْنَ عَلَيْهِ السَّلام وَشايَعَتْ وَبايَعَتْ وَتابَعَتْ عَلَى قَتْلِهِ. اللهُمَّ الْعَنْهم جَميعاً ( يقول ذلك مائة مرّة ).\n\n'
                      'ثمّ يقول : السَّلام عَلَيْكَ يَا أبا عَبْدِ اللهِ وَعلَى الأرواحِ الّتي حَلّتْ بِفِنائِكَ ، وَأنَاخَت برَحْلِك عَلَيْكَ مِنِّي سَلامُ اللهِ أبَداً مَا بَقِيتُ وَبَقِيَ الليْلُ وَالنَّهارُ ، وَلا جَعَلَهُ اللهُ آخِرَ العَهْدِ مِنِّي لِزِيَارَتِكُمْ أهْلَ البَيتِ ، السَّلام عَلَى الحُسَيْن ، وَعَلَى عَليِّ بْنِ الحُسَيْنِ ، وَعَلَى أوْلادِ الحُسَيْنِ ، وَعَلَى أصْحابِ الحُسَينِ الذينَ بَذَلُوا مُهَجَهُم دُونَ الحُسين ( يقول ذلك مائة مرّة ).\n\n'
                      'ثمّ يقول : اللهمَّ خُصَّ أنْتَ أوّلَ ظالم بِاللّعْنِ مِنِّي ، وَابْدَأْ بِهِ أوّلاً ، ثُمَّ الثَّانِي ، وَالثَّالِثَ وَالرَّابِع ، اللهُمَّ الْعَنْ يزِيَدَ خامِساً ، وَالْعَنْ عُبَيْدَ اللهِ بْنَ زِيَاد وَابْنَ مَرْجانَةَ وَعُمَرَ بْنَ سَعْد وَشِمْراً وَآلَ أبي سُفْيانَ وَآلَ زِيَاد وآلَ مَرْوانَ إلَى يَوْمِ القِيامَةِ.\n\n'
                      'ثم تسجد وتقول : اللهمَّ لَكَ الحَمْدُ حَمْدَ الشَّاكِرينَ لَكَ عَلَى مُصابِهِمْ ، الحَمْدُ للهِ عَلَى عَظِيمِ رَزِيّتي.\n\n'
                      'اللهُمَّ ارْزُقْني شَفاعَةَ الحُسَيْن عَلَيهِ السَّلام يَوْمَ الوُرُودِ ، وَثَبِّتْ لي قَدَمَ صِدْق عِنْدَكَ مَعَ الحُسَيْنِ وَأصْحابِ الحُسَيْن الّذِينَ بَذَلُوا مُهَجَهُمْ دُونَ الْحُسَيْن عَلَيْهِ السَّلام.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiFadlZiyaratAlhussein.screenRoute,
          pushBack: FadlTorbatAlhussein.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة عاشوراء.mp3',
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
