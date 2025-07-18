import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ala7raz_walad3iya_almoujaza.dart';
import 'almonajat_belsafaar.dart';
import 'almonajat_bilisti3aza.dart';

class AlmonajatBitalabAlrizk extends StatefulWidget {
  static String screenRoute = 'almonajat_bitalab_alrizk_screen';
  const AlmonajatBitalabAlrizk({super.key});

  @override
  State<AlmonajatBitalabAlrizk> createState() =>
      _AlmonajatBitalabAlrizkState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlmonajatBitalabAlrizkState
    extends State<AlmonajatBitalabAlrizk> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_almonajat_bitalab_alrizk_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_almonajat_bitalab_alrizk_screen', value);
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
          .pushReplacementNamed(Ala7razWalad3iyaAlmoujaza.screenRoute);
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
                          'المناجاة بطلب الرزق',
                          AlmonajatBitalabAlrizk.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'المناجاة بطلب الرزق',
                          AlmonajatBitalabAlrizk.screenRoute,
                          AlmonajatBitalabAlrizk.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'المناجاة بطلب الرزق',
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
                      'اللّهُمَّ أرْسَلْ عَلَيَّ سِجالَ رِزْقِكَ مِدْراراً وَأمْطِرْ عَلَيَّ سَحائِبَ فِضالِكَ غِزاراً وأَدِمْ غَيْثَ نَيْلِكَ إِليَّ سِجالاً وَأسْبِلْ مَزيدَ نِعْمَتِكَ عَلى خِلَّتي إسْبالاً وَأَفْقِرْني بِجُودِكَ إلَيْكَ وَأَغْنِني عَمَّنْ يَطِلُب ما لَدَيْكَ وَداوِ داءَ فَقْري بِدَواءِ فَضْلِكَ وَانْعَشُ صَرْعَةَ عِلَّتي بِطَوْلِكَ وَتَصَّدَقْ عَلى إقْلالي بِكَثْرَةِ عَطائِكَ وَعلى اخْتِلالي بِكَريمِ حِبائِكَ، وَسَهِّلْ رَبِّ سَبيلَ الرِّزْقِ إِليَّ وَثَبِّتْ قَواعِدَهُ لَدَيَّ وَبَجِّسْ لي عُيونَ سَعَتِهِ بِرَحْمَتِكَ وَفَجِّرْ أنْهارَ رَغَدِ العَيْشِ قِبَلي بِرأفَتِكَ، وَأَجْدِبْ أَرْضَ فَقْري وَأَخْصِبْ جَدْبَ ضُرِّي وَاصْرِفْ عَنِّي في الرِّزْقِ العَوائِقَ وَاقْطَعْ عَنِّي مِنَ الضيقِ العَلائِقِ وَارْمِني مِنْ سَعَهِ الرِّزْقِ اللّهُمَّ بِأَخْصَبِ سِهامِهِ وَاحْبُني مِنْ رَغَدِ العَيْشِ بِأَكْثَرِ دَوامِهِ وَإكْسُني اللّهُمَّ سَرابيلَ السَّعَةِ وَجَلابيبَ الدَّعَةِ فَإنّي يارَبِّ مُنْتَظِرٌ لانْعامِكَ بِحَذْفِ المَضيقِ وَلِتَطَوُلِكَ بِقَطْعِ التَعْويقِ وَلِتَفَضُلِكَ بِإزالَةِ التَّفْسيرِ وَلِوُصُولِ حَبْلي بِكَرَمِكَ بِالتَّيْسيرِ، وَأَمْطِرِ اللّهُمَّ عَلَيَّ سَّماء رِزْقِكَ بِسِجالِ الدَّيْمِ وَأَغْنني عَنْ خَلْقِكَ بِعَوائِدِ النِّعَمِ وَارْمِ مَقاتِلَ الاقْتارِ مِنّي وَاحْمِلْ كَشْفَ الضُّرِّ عَنّي عَلى مَطايا الاعْجالِ وَاضْرِبْ عَنّي الضيقِ بِسَيْفِ الايصالِ وَأتْحِفْني رَبِّ مِنْكَ بِسَعَةِ الافْضالِ وَامْدُدْني بِنُمُوِّ الامْوالِ وَاحْرُسْني مِنْ ضيقِ الاقْلالِ وَاقْبِضْ عَنّي سُوءَ الجَدْبِ وَاسْقِني مِنْ مأِ رِزْقِكَ غَدَقا وَانْهَجْ لي مِنْ عَميمِ بَذْلِكَ طُرُقا وَفاجِئْني بِالثَّرْوَةِ وَالمالِ وَانْعِشْني بِهِ مِنَ الاقْلالِ، وَصَبِّحْني بِالاسْتِظْهارِ وَمَسِّني بِالتَّمَكُنِ مِنَ اليَسارِ ؛ إنَّكَ ذو الطَوْلِ العَظيمِ وَالفَضْلِ العَميمِ وَالمَنِّ الجَسيمِ وَأَنْتَ الجَوادُ الكَريمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlmonajatBilisti3aza.screenRoute,
          pushBack: AlmonajatBelsafaar.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/المناجاة بطلب الرزق.mp3',
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
