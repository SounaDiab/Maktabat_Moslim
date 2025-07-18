import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../da3awat_monta5aba_men_kitab_alkafi_alsharif.dart';
import 'fi_3ida_men_al2ad3iya_allati_yod3a_biha_saba7an_wmasa2an.dart';
import 'fi_da3awat_mojzat_ljami3_7wa2ej_aldonia_wal2a5ira.dart';

class Dou3a2Al2i7tijabAmirAlmo2minin extends StatefulWidget {
  static String screenRoute = 'dou3a2_al2i7tijab_amir_almo2minin_screen';
  const Dou3a2Al2i7tijabAmirAlmo2minin({super.key});

  @override
  State<Dou3a2Al2i7tijabAmirAlmo2minin> createState() =>
      _Dou3a2Al2i7tijabAmirAlmo2mininState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2Al2i7tijabAmirAlmo2mininState
    extends State<Dou3a2Al2i7tijabAmirAlmo2minin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_dou3a2_al2i7tijab_amir_almo2minin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_dou3a2_al2i7tijab_amir_almo2minin_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(
          Da3awatMonta5abaMenKitabAlkafiAlsharif.screenRoute);
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
                      .addFavorite('دعاء احتجاب أمير المؤمنين عليه السلام',
                          Dou3a2Al2i7tijabAmirAlmo2minin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء احتجاب أمير المؤمنين عليه السلام',
                          Dou3a2Al2i7tijabAmirAlmo2minin.screenRoute,
                          Dou3a2Al2i7tijabAmirAlmo2minin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء احتجاب أمير المؤمنين عليه السلام',
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
                      'ٱحْتَجَبْتُ بِنُورِ وَجْهِ اللهِ الْقَدِيمِ الْكَامِلِ وَتَحَصَّنْتُ بِحِصْنِ اللهِ الْقَوِيِّ ٱلشَّامِلِ وَرَمَيْتُ مَنْ بَغَىٰ عَلَيَّ بِسَهْمِ اللهِ وَسَيْفِهِ الْقَاتِلِ.\n\n'
                      'أَللّهُمَّ يَا غَالِباً عَلَىٰ أَمْرِهِ وَيَا قَائِماً فَوْقَ خَلْقِهِ وَيَا حَائِلاً بَيْنَ الْمَرْءِ وَقَلْبِهِ حُلْ بَيْنِي وَبَيْنَ ٱلشَّيْطَانِ وَنَزْغِهِ وَبَيْنَ مَالاَ طَاقَةَ لِي بِهِ مِنْ أَحَدٍ مِنْ عِبَادِكَ كُفَّ عَنِّي أَلْسِنَتَهِمْ وَٱغْلُلْ أَيَدِيَهِمْ وَأَرْجُلَهِمْ وَٱجْعَلْ بَيْنِي وَبَيْنَهُمْ سَدّاً مِنْ نُورِ عَظَمَتِكَ وَحِجَاباً مِنْ قُوَّتِكَ وَجُنْداً مِنْ سُلْطَانِكَ فَإِنَّكَ حَيَّ قَادِرٌ.\n\n'
                      'أَللّهُمَّ أَغْشِ عَنِّي أَبْصَارَ ٱلنَّاظِرِينَ حَتَّىٰ أَرِدَ الْمَوَارِدَ وَٱغْشِ عَنِّي أَبْصَارَ ٱلنُّورِ وَأَبْصَارَ ٱلظُّلْمِةَ وَأَبْصَارَ الْمُرِيدِينَ لِيَ ٱلسُّوءَ حَتَّىٰ لاَ أُبَالِي مِنْ أَبْصَارِهِمْ ﴿يَكَادُ سَنَا بَرْقِهِ يَذْهَبُ بِالأَبْصَارِ * يُقَلِّبُ اللهُ اللَّيْلَ وَالنَّهَارَ إِنَّ فِي ذَلِكَ لَعِبْرَةً لأُوْلِي الأَبْصَارِ﴾ بِسْمِ اللهِ ٱلرَّحْمٰنِ ٱلرِّحَيِمِ كَهَيَعِصَ كِفَايَتُنَا وَهُوَ حَسْبِي، بِسْمِ اللهِ ٱلرَّحْمٰنِ ٱلرِّحَيِمِ، حَمِعَسِقَ حِمَايَتُنَا وَهُوَ حَسْبِي ﴿كَمَاء أَنزَلْنَاهُ مِنَ السَّمَاءِ فَاخْتَلَطَ بِهِ نَبَاتُ الأَرْضِ فَأَصْبَحَ هَشِيماً تَذْرُوهُ الرِّيَاحُ﴾ ﴿هُوَ اللهُ الَّذِي لاَ إِلَهَ إِلاَّ هُوَ عَالِمُ الْغَيْبِ وَالشَّهَادَةِ هُوَ الرَّحْمٰنُ الرَّحِيمُ ﴾ ﴿يَوْمَ الآزِفَةِ إِذِ الْقُلُوبُ لَدَى الْحَنَاجِرِ كَاظِمِينَ مَا لِلظَّالِمِينَ مِنْ حَمِيمٍ وَلاَ شَفِيعٍ يُطَاعُ﴾ ﴿عَلِمَتْ نَفْسٌ مَّا أَحْضَرَتْ * فَلاَ أُقْسِمُ بِالْخُنَّسِ * الْجَوَارِ الْكُنَّسِ * وَاللَّيْلِ إِذَا عَسْعَسَ * وَالصُّبْحِ إِذَا تَنَفَّسَ﴾ ﴿ص وَالْقُرْآنِ ذِي الذِّكْرِ * بَلِ الَّذِينَ كَفَرُوا فِي عِزَّةٍ وَشِقَاقٍ﴾ (شَاهَتِ الْوُجُوهُ – ثلاث مرات) كَلَّتِ ٱلأَلْسُنُ وَعَمِيَتِ ٱلأَبْصَارُ أَللّهُمَّ ٱجْعَلْ خَيْرَهُمْ بَيْنَ عَيْنَيْهِمْ وَشَرَّهُمْ تَحْتَ قَدَمَيْهِمْ وَخَاتَمَ سُلَيْمَانَ بَيْنَ أَكْتَافِهِمْ ﴿فَسَيَكْفِيكَهُمُ اللهُ وَهُوَ السَّمِيعُ الْعَلِيمُ * صِبْغَةَ اللهِ وَمَنْ أَحْسَنُ مِنَ اللهِ صِبْغَةً﴾ كَهَيَعِصَ ٱكْفِنَا حَمِعَعَسِقَ ٱحْمِنَا سُبْحَانَ الْقَادِرِ الْقَاهِرِ الْكَافِي ﴿وَجَعَلْنَا مِن بَيْنِ أَيْدِيهِمْ سَدّاً وَمِنْ خَلْفِهِمْ سَدّاً فَأَغْشَيْنَاهُمْ فَهُمْ لاَ يُبْصِرُونَ﴾ ﴿صُمٌّ بُكْمٌ عُمْيٌ فَهُمْ لاَ يَعْقِلُونَ﴾ ﴿أُولَئِكَ الَّذِينَ طَبَعَ اللهُ عَلَى قُلُوبِهِمْ وَسَمْعِهِمْ وَأَبْصَارِهِمْ وَأُولَئِكَ هُمُ الْغَافِلُونَ﴾ تَحَصَّنتُ بِذِي الْمُلْكِ وَالْمَلَكُوتِ وَٱعتَصَمْتُ بِذِي الْعِزِ وَالْعَظَمِة وَالْجَبَرُوتِ وَتَوَكَّلتُ عَلَىٰ الْحَيِّ ٱلّذِي لاَ يَمُوتُ دَخَلتُ فِي حِرْزِ اللهِ وَفِي حِفْظِ اللهِ وَفِي أَمَانِ اللهِ مِنْ شَرِّ الْبَرِيَّة أَجْمَعِينَ، كَهَيَعِصَ، حَمِعَسِقَ وَلاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللهِ الْعِلِّي الْعَظِيمِ وَصَلَّىٰ اللهُ عَلَىٰ مُحَمَّدٍ وَآلِهِ ٱلطَّاهِرِينَ بِرَحْمَتِكَ يَا أَرَحَمَ ٱلرَّاحِمِينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext:
              Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an.screenRoute,
          pushBack: FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5ira.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء احتجاب امير المؤمنين.mp3',
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
