import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:maktabat_almoslim/widgets/ta3kibat_style.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ziarat_al2osbou3.dart';
import 'ziarat_al2a7ad.dart';
import 'ziarat_aljom3a.dart';

class ZiaratAlsabt extends StatefulWidget {
  static String screenRoute = 'ziarat_alsabt_screen';
  const ZiaratAlsabt({super.key});

  @override
  State<ZiaratAlsabt> createState() => _ZiaratAlsabtState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiaratAlsabtState extends State<ZiaratAlsabt> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ziarat_alsabt_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziarat_alsabt_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiaratAl2osbou3.screenRoute);
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
                    .pushReplacementNamed(ZiaratAl2osbou3.screenRoute);
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
                      .addFavorite('زيارة يوم السبت', ZiaratAlsabt.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('زيارة يوم السبت',
                          ZiaratAlsabt.screenRoute, ZiaratAlsabt.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة يوم السبت',
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
                      'ذِكْرُ زيارةِ النّبيِّ (صلى الله عليه وآله وسلم) في يَومِه وَهُوَ يَومُ السّبتِ:',
                  subtitle:
                      'َشْهَدُ اَنْ لا اِلـهَ إلاّ اللهُ وَحْدَهُ لا شَريكَ لَهُ وَاَشْهَدُ اَنَّكَ رَسُولُهُ وَاَنَّكَ مُحَمَّدُ بْنُ عَبْدِ اللهِ وَاَشْهَدُ اَنَّكَ قَدْ بَلَّغْتَ رِسالاتِ رَبِّكَ وَنَصَحْتَ لاُِمَّتِكَ وَجاهَدْتَ فى سَبيلِ اللهِ بِالْحِكْمَةِ وَالمَوْعِظَةِ الْحَسَنَةِ وَاَدَّيْتَ الَّذى عَلَيْكَ مِنَ الْحَقِّ وَاَنَّكَ قَدْ رَؤُفْتَ بِالْمُؤْمِنينَ وَغَلَظْتَ عَلَى الْكافِرينَ وَعَبَدْتَ اللهَ مُخْلِصاً حَتّى أتاكَ اليَقينُ فَبَلَغَ اللهُ بِكَ اشَرَفَ مَحَلِّ الْمُكَرَّمينَ اَلْحَمْدُ للهِِ الَّذِي اسْتَنْقَذَنا بِكَ مِنَ الشِّرْكِ وَالضَّلالِ اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِهِ وَاجْعَلْ صَلَواتِكَ وَصَلَواتِ مَلائِكَتِكَ الْمُقَرَّبينَ وَاَنْبِيائِكَ الْمـُرْسَلينَ وَعِبادِكَ الصّالِحينَ وَاَهْلِ السَّماواتِ وَالاَْرَضينَ وَمَنْ سَبَّحَ لَكَ يا رَبَّ الْعالَمينَ مِنَ الاَْوَّلينَ وَالاخِرينَ عَلى مُحَمَّد عَبْدِكَ وَرَسُوِلِكَ وَنَبِيِّكَ وَاَمينِكَ وَنَجِيبِكَ وَحَبيبِكَ وَصَفِيِّكَ وَ صَفْوَتِكَ وَخاصَّتِكَ وَخالِصَتِكَ وَخِيَرَتِكَ مِنْ خَلْقِكَ وَاَعْطِهِ الْفَضْلَ وَالْفَضيلَةَ وَالْوَسيلَةَ وَالدَّرَجَةَ الرَّفيعَةَ وَابْعَثْهُ مَقاماً مَحَمْوُداً يَغْبِطُهُ بِهِ الاَْوَّلُونَ'
                      'وَالاخِرُونَ اَللّـهُمَّ اِنَّكَ قُلْتَ وَلَوْ اَنَّهُمْ اِذْ ظَلَمُوا اَنْفُسَهُمْ جاؤوكَ فَاسْتَغْفَرُوا اللهَ وَاسْتَغْفَرَ لَهُمُ الرَّسُولُ لَوَجَدُوا اللهَ تَوّاباً رَحيماً اِلـهى فَقَدْ اَتَيْتُ نَبِيَّكَ مُسْتَغْفِراً تائِباً مِنْ ذُنُوبى فَصَلِّ عَلى مُحَمَّد وَآلِهِ وَ اْغِفْرها لي، يا سَيِّدَنا اَتَوَجَّهُ بِكَ وَبِاَهْلِ بَيْتِكَ اِلَى اللهِ تَعالى رَبِّكَ وَرَبّى لِيَغْفِرَ لى ثمّ قل ثلاثاً : اِنّا للهِِ وَاِنّا اِلَيْهِ راجِعُونَ ثمّ قل : اُصِبْنا بِكَ يا حَبيبَ قُلُوبِنا فَما اَعْظَمَ الْمُصيبَةَ بِكَ حيَْثُ انْقَطَعَ عَنّا الْوَحْيُ وَحَيْثُ فَقَدْناكَ فَاِنّا للهِِ وَاِنّا اِلَيْهِ راجِعُونَ يا سَيِّدَنا يا رَسُولَ اللهِ صَلَواتُ اللهِ عَلَيْكَ وَعَلى آلِ بَيْتِكَ الطّاهِرينَ هذا يَوْمُ السَّبْتِ وَهُوَ يَوْمُكَ وَاَنَا فيهِ ضَيْفُكَ وَجارُكَ فَاَضِفْنى وَاجِرْنى فَاِنَّكَ كَريمٌ تُحِبُّ الضِّيافَةَ وَمَأْمُورٌ بِالاِْجارَةِ فَاَضِفْني وَأحْسِنْ ضِيافَتى وَاَجِرْنا وَاَحْسِنْ اِجارَتَنا بِمَنْزِلَةِ اللهِ عِنْدَكَ وَعِنْدَ آلِ بَيْتِكَ وَبِمَنْزِلَتِهِمْ عِنْدَهُ وَبِما اسْتَوْدَعَكُمْ مِنْ عِلْمِهِ فَاِنَّهُ اَكْرَمُ الاَْكْرَمينَ.',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'يقول مؤلّف الكتاب عبّاس القُمّي عُفى عَنْه: انّي كلّما زرته (صلى الله عليه وآله وسلم) بهذه الزّيارة بَدَأت بزيارته عَلى نحو ما علّمه الامام الرّضا (عليه السلام) البزنطي ثمّ قرأت هذِهِ الزّيارة، فَقَدْ رُوي بسند صحيح إنّ ابن أبي بصير سأل الرّضا (عليه السلام) كيف يُصلّى على النبيّ (صلى الله عليه وآله وسلم) ويسلّم عليه بَعد الصلاة فأجابَ (عليه السلام) بقوله:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: Ta3kibatStyle(
                  text:
                      'اَلسَّلامُ عَلَيْكَ يا رَسُولَ اللهِ وَرَحْمةُ اللهِ وَبَرَكاتُهُ اَلسَّلامُ عَلَيْكَ يا مُحَمَّدُ بْنَ عَبْدِ اللهِ اَلسَّلامُ عَلَيْكَ يا خِيَرَةَ اللهِ اَلسَّلامُ عَلَيْكَ يا حَبيبَ اللهِ اَلسَّلامُ عَلَيْكَ يا صِفْوَهَ اللهِ اَلسَّلامُ عَلَيْكَ يا اَمينَ اللهِ اَشْهَدُ اَنَّكَ رَسُولُ اللهِ وَاَشْهَدُ اَنَّكَ مُحمَّدُ بْنُ عَبْدِ اللهِ وَاَشْهَدُ اَنَّكَ قَدْ نَصَحْتَ لاُِمَّتِكَ وَجاهَدْتَ فى سَبيلِ رَبِّكِ وَعَبَدْتَهُ حَتّى أتاكَ الْيَقينُ فَجَزاكَ اللهُ يا رَسُولَ اللهِ اَفْضَلَ ما جَزى نَبِيّاً عَنْ اُمَّتِهِ اَللّـهُمَّ صَلِّ عَلى مَحَمِّد وآلِ مُحَمِّد اَفْضَلَ ما صَلَّيْتَ عَلى اِبْرهِيمَ وَآلِ إبراهيمَ اِنَّكَ حَميدٌ مَجيدٌ.',
                  weight: FontWeight.w900,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiaratAl2a7ad.screenRoute,
          pushBack: ZiaratAljom3a.screenRoute,
          soud: '',
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
