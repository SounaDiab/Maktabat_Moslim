import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'alsadbi3a_almo5asasa_alsania.dart';
import 'alziyarat_al2o5ra.dart';

class AlsaminaAlmo5asasa extends StatefulWidget {
  static String screenRoute = 'alsamina_almo5asasa_screen';
  const AlsaminaAlmo5asasa({super.key});

  @override
  State<AlsaminaAlmo5asasa> createState() => _AlsaminaAlmo5asasaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlsaminaAlmo5asasaState extends State<AlsaminaAlmo5asasa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_alsamina_almo5asasa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alsamina_almo5asasa_screen', value);
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
                          'الثامنة المخصوصة: زيارة الأربعين أي اليوم العشرين من صفر',
                          AlsaminaAlmo5asasa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الثامنة المخصوصة: زيارة الأربعين أي اليوم العشرين من صفر',
                          AlsaminaAlmo5asasa.screenRoute,
                          AlsaminaAlmo5asasa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الثامنة المخصوصة: زيارة الأربعين أي اليوم العشرين من صفر',
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
                      'روى الشّيخ في التّهذيب والمصباح عن الامام الحسن العسكري (عليه السلام)قال: علامات المؤمن خمس: صلاة احدى وخمسين أي الفرائض اليوميّة وهي سبع عشرة ركعة والنّوافل اليوميّة وهي أربع وثلاثون ركعة، وزيارة الاربعين، والتختّم باليمين وتعفير الجبين بالسّجود، والجهر بِبِسْمِ اللهِ الرَّحْمنِ الرَّحيمِ، وقد رويت زيارته في هذا اليوم على نحوين، أحدهما ما رواه الشّيخ في التّهذيب والمصباح عن صفوان الجمّال قال : قال لي مولاي الصّادق صلوات الله عليه في زيارة الاربعين: تزُور عند ارتفاع النّهار وتقول :\n\n'
                      'اَلسَّلامُ عَلى وَلِيِّ اللهِ وَحَبيبِهِ، اَلسَّلامُ عَلى خَليلِ اللهِ وَنَجيبِهِ، اَلسَّلامُ عَلى صَفِيِّ اللهِ وَابْنِ صَفِيِّهِ، اَلسَّلامُ عَلى الْحُسَيْنِ الْمَظْلُومِ الشَّهيدِ، اَلسَّلامُ على اَسيرِ الْكُرُباتِ وَقَتيلِ الْعَبَراتِ، اَللّـهُمَّ اِنّي اَشْهَدُ اَنَّهُ وَلِيُّكَ وَابْنُ وَلِيِّكَ وَصَفِيُّكَ وَابْنُ صَفِيِّكَ الْفائِزُ بِكَرامَتِكَ، اَكْرَمْتَهُ بِالشَّهادَةِ وَحَبَوْتَهُ بِالسَّعادَةِ، وَاَجْتَبَيْتَهُ بِطيبِ الْوِلادَةِ، وَجَعَلْتَهُ سَيِّداً مِنَ السادَةِ، وَقائِداً مِنَ الْقادَةِ، وَذائِداً مِنْ الْذادَةِ، وَاَعْطَيْتَهُ مَواريثَ الاَْنْبِياءِ، وَجَعَلْتَهُ حُجَّةً عَلى خَلْقِكَ مِنَ الاَْوْصِياءِ، فَاَعْذَرَ فىِ الدُّعاءِ وَمَنَحَ النُّصْحَ، وَبَذَلَ مُهْجَتَهُ فيكَ لِيَسْتَنْقِذَ عِبادَكَ مِنَ الْجَهالَةِ وَحَيْرَةِ الضَّلالَةِ، وَقَدْ تَوازَرَ عَلَيْهِ مَنْ غَرَّتْهُ الدُّنْيا، وَباعَ حَظَّهُ بِالاَْرْذَلِ الاَْدْنى، وَشَرى آخِرَتَهُ بِالَّثمَنِ الاَْوْكَسِ، وَتَغَطْرَسَ وَتَرَدّى فِي هَواهُ، وَاَسْخَطَكَ وَاَسْخَطَ نَبِيَّكَ، وَاَطاعَ مِنْ عِبادِكَ اَهْلَ الشِّقاقِ وَالنِّفاقِ وَحَمَلَةَ الاَْوْزارِ '
                      'الْمُسْتَوْجِبينَ النّارَ، فَجاهَدَهُمْ فيكَ صابِراً مُحْتَسِباً حَتّى سُفِكَ فِي طاعَتِكَ دَمُهُ وَاسْتُبيحَ حَريمُهُ، اَللّـهُمَّ فَالْعَنْهُمْ لَعْناً وَبيلاً وَعَذِّبْهُمْ عَذاباً اَليماً، اَلسَّلامُ عَلَيْكَ يَا بْنَ رَسُولِ اللهِ، اَلسَّلامُ عَلَيْكَ يَا بْنَ سَيِّدِ الاَْوْصِياءِ، اَشْهَدُ اَنَّكَ اَمينُ اللهِ وَابْنُ اَمينِهِ، عِشْتَ سَعيداً وَمَضَيْتَ حَميداً وَمُتَّ فَقيداً مَظْلُوماً شَهيداً، وَاَشْهَدُ اَنَّ اللهَ مُنْجِزٌ ما وَعَدَكَ، وَمُهْلِكٌ مَنْ خَذَلَكَ، وَمُعَذِّبٌ مَنْ قَتَلَكَ، وَاَشْهَدُ اَنَّكَ وَفَيْتَ بِعَهْدِ اللهِ وَجاهَدْتَ فِي سَبيلِهِ حَتّى اَتياكَ الْيَقينُ، فَلَعَنَ اللهُ مَنْ قَتَلَكَ، وَلَعَنَ اللهُ مَنْ ظَلَمَكَ، وَلَعَنَ اللهُ اُمَّةً سَمِعَتْ بِذلِكَ فَرَضِيَتْ بِهِ، اَللّـهُمَّ اِنّي اُشْهِدُكَ اَنّي وَلِيٌّ لِمَنْ والاهُ وَعَدُوٌّ لِمَنْ عاداهُ بِاَبي اَنْتَ وَاُمّي يَا بْنَ رَسُولِ اللهِ، اَشْهَدُ اَنَّكَ كُنْتَ نُوراً فىِ الاَْصْلابِ الشّامِخَةِ وَالاَْرْحامِ الْمُطَهَّرَةِ، لَمْ تُنَجِّسْكَ الْجاهِلِيَّةُ بِاَنْجاسِها وَلَمْ تُلْبِسْكَ الْمُدْلَهِمّاتُ مِنْ '
                      'ثِيابِها، وَاَشْهَدُ اَنَّكَ مِنْ دَعائِمِ الدّينِ وَاَرْكانِ الْمُسْلِمينَ وَمَعْقِلِ الْمُؤْمِنينَ، وَاَشْهَدُ اَنَّكَ الاِْمامُ الْبَرُّ التَّقِيُّ الرَّضِيُّ الزَّكِيُّ الْهادِي الْمَهْدِيُّ، وَاَشْهَدُ اَنَّ الاَْئِمَّةَ مِنْ وُلْدِكَ كَلِمَةُ التَّقْوى وَاَعْلامُ الْهُدى وَالْعُرْوَةُ الْوُثْقى، وَالْحُجَّةُ على اَهْلِ الدُّنْيا، وَاَشْهَدُ اَنّي بِكُمْ مُؤْمِنٌ وَبِاِيابِكُمْ، مُوقِنٌ بِشَرايِعِ ديني وَخَواتيمِ عَمَلي، وَقَلْبي لِقَلْبِكُمْ سِلْمٌ وَاَمْري لاَِمْرِكُمْ مُتَّبِعٌ وَنُصْرَتي لَكُمْ مُعَدَّةٌ حَتّى يَأذَنَ اللهُ لَكُمْ، فَمَعَكُمْ مَعَكُمْ لا مَعَ عَدُوِّكُمْ صَلَواتُ اللهِ عَلَيْكُمْ وَعلى اَرْواحِكُمْ وَاَجْسادِكُمْ وَشاهِدِكُمْ وَغائِبِكُمْ وَظاهِرِكُمْ وَباطِنِكُمْ آمينَ رَبَّ الْعالِمينَ.\n\n'
                      'ثمّ تصلّي ركعتين وتدعو بما أحببت وترجع.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlziyaratAl2o5ra.screenRoute,
          pushBack: Alsadbi3aAlmo5asasaAlsania.screenRoute,
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
