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
import 'douaa_alfaraj.dart';

class DouaaAlaahd extends StatefulWidget {
  static String screenRoute = 'douaa_alaahd_screen';
  const DouaaAlaahd({super.key});

  @override
  State<DouaaAlaahd> createState() => _DouaaAlaahdState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _DouaaAlaahdState extends State<DouaaAlaahd> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_alaahd_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_alaahd_screen', value);
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
                      .addFavorite('دعاء العهد', DouaaAlaahd.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء العهد', DouaaAlaahd.screenRoute,
                          DouaaAlaahd.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء العهد',
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
                      'اللهُمَّ رَبَّ النُّورِ الْعَظيمِ، وَرَبَّ الْكُرْسِيِّ الرَّفيعِ، وَرَبَّ الْبَحْرِ الْمَسْجُورِ، وَمُنْزِلَ التَّوْراةِ وَالإِنْجيلِ وَالزَّبُورِ، وَرَبَّ الظِّلِّ وَالْحَرُورِ، وَمُنْزِلَ الْقُرْآنِ الْعَظيمِ، وَرَبَّ الْمَلائِكَةِ الْمُقَرَّبينَ وَالأَنْبِياءِ وَالْمُرْسَلينَ، اللهُمَّ إِنّي أَسْأَلُكَ بِإِسْمِكَ الْكَريمِ، وَبِنُورِ وَجْهِكَ الْمُنيرِ وَمُلْكِكَ الْقَديمِ، يا حَيُّ يا قَيُّومُ أَسْأَلُكَ بِاسْمِكَ الَّذي أَشْرَقَتْ بِهِ السَّماواتُ وَالأَرَضُونَ، وَبِاسْمِكَ الَّذي يَصْلَحُ بِهِ الأَوَّلُونَ وَالآخِرُونَ، يا حَيّاً قَبْلَ كُلِّ حَيٍّ وَيا حَيّاً بَعْدَ كُلِّ حَيٍّ وَيا حَيّاً حينَ لا حَيَّ يا مُحْيِيَ الْمَوْتى وَمُميتَ الأَحْياءِ، يا حَيُّ لا إِلهَ إِلّا أَنْتَ.\n\n اللهُمَّ بَلِّغْ مَوْلانَا الإِمامَ الْهادِيَ الْمَهْدِيَّ الْقائِمَ بِأَمْرِكَ صَلَواتُ اللهِ عَلَيْهِ وعَلى آبائِهِ الطّاهِرينَ عَنْ جَميعِ الْمُؤْمِنينَ وَالْمُؤْمِناتِ في مَشارِقِ الأَرْضِ وَمَغارِبِها سَهْلِها وَجَبَلِها وَبَرِّها وَبَحْرِها، وَعَنّي وَعَنْ والِدَيَّ مِنَ الصَّلَواتِ زِنَةَ عَرْشِ اللهِ وَمِدادَ كَلِماتِهِ، وَما أَحْصاهُ عِلْمُهُ وَأَحاطَ بِهِ كِتابُهُ، اللهُمَّ إِنّي أُجَدِّدُ لَهُ في صَبيحَةِ يَوْمي هذا وَما عِشْتُ مِنْ أَيّامي عَهْداً وَعَقْداً وَبَيْعَةً لَهُ في عُنُقي، لا أَحُولُ عَنْها وَلا أَزُولُ أَبَداً، اللهُمَّ اجْعَلْني مِنْ أَنْصارِهِ وَأَعْوانِهِ وَالذّابّينَ عَنْهُ وَالْمُسارِعينَ إِلَيْهِ في قَضاءِ حَوائِجِهِ، وَالْمُمْتَثِلينَ لأَوامِرِهِ وَالْمُحامينَ عَنْهُ، وَالسّابِقينَ إِلى إِرادَتِهِ وَالْمُسْتَشْهَدينَ بَيْنَ يَدَيْهِ.\n\n اللهُمَّ إِنْ حالَ بَيْني وَبَيْنَهُ الْمَوْتُ الَّذي جَعَلْتَهُ عَلى عِبادِكَ حَتْماً مَقْضِيّاً فَأَخْرِجْني مِنْ قَبْري مُؤْتَزِراً كَفَني شاهِراً سَيْفي مُجَرِّداً قَناتي مُلَبِّياً دَعْوَةَ الدّاعي فِي الْحاضِرِ وَالْبادي، اللهُمَّ أَرِنيِ الطَّلْعَةَ الرَّشيدَةَ، وَالْغُرَّةَ الْحَميدَةَ، وَاكْحُلْ ناظِري بِنَظْرَة منِّي إِلَيْهِ، وَعَجِّلْ فَرَجَهُ وَسَهِّلْ مَخْرَجَهُ، وَأَوْسِعْ مَنْهَجَهُ وَاسْلُكْ بي مَحَجَّتَهُ، وَأَنْفِذْ أَمْرَهُ وَاشْدُدْ أَزْرَهُ، وَاعْمُرِ اللّهُمَّ بِهِ بِلادَكَ، وَأَحْيِ بِهِ عِبادَكَ، فَإِنَّكَ قُلْتَ وَقَوْلُكَ الْحَقُّ: (ظَهَرَ الْفَسادُ فِي الْبَرِّ وَالْبَحْرِ بِما كَسَبَتْ أَيْدِي النّاسِ)، فَأَظْهِرِ الّلهُمَّ لَنا وَلِيَّكَ وَابْنَ بِنْتِ نَبِيِّكَ الْمُسَمّى بِاسْمِ رَسُولِكَ حَتّى لا يَظْفَرَ بِشَيْء مِنَ الْباطِلِ إِلّا مَزَّقَهُ، وَيُحِقَّ الْحَقَّ وَيُحَقِّقَهُ، وَاجْعَلْهُ اللهُمَّ مَفْزَعاً لِمَظْلُومِ عِبادِكَ، وَناصِراً لِمَنْ لا يَجِدُ لَهُ ناصِراً غَيْرَكَ، وَمُجَدِّداً لِما عُطِّلَ مِنْ أَحْكامِ كِتابِكَ، وَمُشَيِّداً لِما وَرَدَ مِنْ أَعْلامِ دينِكَ وَسُنَنِ نَبِيِّكَ صَلَّى اللهُ عَلَيْهِ وَآلِهِ، وَاجْعَلْهُ اللهُمَّ مِمَّنْ حَصَّنْتَهُ مِن بَأسِ الْمُعْتَدينَ، اللهُمَّ وَسُرَّ نَبِيَّكَ مُحَمَّداً صَلَّى اللهُ عَلَيْهِ وَآلِهِ بِرُؤْيَتِهِ وَمَنْ تَبِعَهُ عَلى دَعْوَتِهِ، وَارْحَمِ اسْتِكانَتَنا بَعْدَهُ، اللهُمَّ اكْشِفْ هذِهِ الْغُمَّةَ عَنْ هذِهِ الأُمَّةِ بِحُضُورِهِ، وَعَجِّلْ لَنا ظُهُورَهُ، إِنَّهُمْ يَرَوْنَهُ بَعيداً وَنَراهُ قَريباً، بِرَحْمَتِكَ يا أَرْحَمَ الرّاحِمينَ.\n\nثم تضرب على فخذك الأيمن بيدك ثلاث مرّات وتقول كل مرّة:العَجَلَ العَجَلَ يا مَوْلايَ يا صاحِبَ الزَّمانِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: Douaa3alkama.screenRoute,
        pushBack: DouaaAlfaraj.screenRoute,
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
