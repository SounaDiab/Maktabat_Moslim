import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alnabi_walzahraa_wal2a2ima.dart';
import 'ziyarat_2a2imat_belbaki3.dart';
import 'ziyarat_fatima_bent_2asad.dart';

class ZikrSa2irAlziyarat extends StatefulWidget {
  static String screenRoute = 'zikr_sa2ir_alziyarat_screen';
  const ZikrSa2irAlziyarat({super.key});

  @override
  State<ZikrSa2irAlziyarat> createState() => _ZikrSa2irAlziyaratState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZikrSa2irAlziyaratState extends State<ZikrSa2irAlziyarat> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_zikr_sa2ir_alziyarat_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_zikr_sa2ir_alziyarat_screen', value);
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
          .pushReplacementNamed(ZiyaratAlnabiWalzahraaWal2a2ima.screenRoute);
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
                          'ذكر سائر الزيارات بالمدينة الطيبة نقلاً عن مصباح الزائر وغيره',
                          ZikrSa2irAlziyarat.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'ذكر سائر الزيارات بالمدينة الطيبة نقلاً عن مصباح الزائر وغيره',
                          ZikrSa2irAlziyarat.screenRoute,
                          ZikrSa2irAlziyarat.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'ذكر سائر الزيارات بالمدينة الطيبة نقلاً عن مصباح الزائر وغيره',
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
                      'زيارة ابراهيم ابن رسول الله (صلى الله عليه وآله وسلم) : تقف عند القبر وتقول :\n\n'
                      'اَلسَّلامُ عَلى رَسُولِ اللهِ، اَلسَّلامُ عَلى نَبِيِّ اللهِ، اَلسَّلامُ عَلى حَبيبِ اللهِ، اَلسَّلامُ عَلى صَفِىِّ اللهِ، اَلسَّلامُ عَلى نَجِيِّ اللهِ، اَلسَّلامُ عَلى مُحَمَّدِ بْنِ عَبْدِ اللهِ سَيِّدِ الاَْنْبِياءِ، وَخاتَمِ الْمُرْسَلينَ، وَخِيَرَةِ اللهِ مِنْ خَلْقِهِ في اَرْضِهِ وَسَمائِهِ، اَلسَّلامُ عَلى جَميعِ اَنْبِيائِهِ وَرُسُلِهِ، اَلسَّلامُ عَلَى الشُّهَداءِ وَالسُّعَداءِ وَالصّالِحينَ، اَلسَّلامُ عَلَيْنا وَعَلى عِبادِ اللهِ الصّالِحينَ، اَلسَّلامُ عَلَيْكَ اَيَّتُهَا الرُّوحُ الزّاكِيَةُ، اَلسَّلامُ عَلَيْكَ اَيَّتُهَا النَّفْسُ الشَّريفَةُ، اَلسَّلامُ عَلَيْكَ اَيَّتُهَا السُّلالَةُ الطّاهِرَةُ، اَلسَّلامُ عَلَيْكَ اَيَّتُهَا النَّسَمَةُ الزّاكِيَةُ، اَلسَّلامُ عَلَيْكَ يَابْنَ خَيْرِ الْوَرى، اَلسَّلامُ عَلَيْكَ يَابْنَ النَبِيِّ الُْمجْتَبى، اَلسَّلامُ عَلَيْكَ يَابْنَ الْمَبْعُوثِ اِلى كافَّةِ الْوَرى، اَلسَّلامُ عَلَيْكَ يَابْنَ الْبَشيرِ النَّذيرِ، اَلسَّلامُ عَلَيْكَ يَابْنَ السِّراجِ الْمُنير، اَلسَّلامُ عَلَيْكَ يَابْنَ الْمُؤَيَّدِ بِالْقُرآنِ، اَلسَّلامُ عَلَيْكَ يَابْنَ الْمُرْسَلِ اِلَى الاِنْسِ وَالْجانِّ، اَلسَّلامُ عَلَيْكَ يَابْنَ صاحِبِ الرّايَةِ وَالْعَلامَةِ، اَلسَّلامُ عَلَيْكَ يَابْنَ الشَّفيعِ يَوْمَ الْقِيامَةِ، اَلسَّلامُ عَلَيْكَ يَابْنَ مَنْ حَباهُ اللهُ بِالْكَرامَةِ، اَلسَّلامُ عَلَيْكَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَشْهَدُ اَنَّكَ قَدِ اخْتارَ اللهُ لَكَ دارَ اِنْعامِهِ قَبْلَ اَنْ يَكْتُبَ عَلَيْكَ اَحْكامَهُ اَوْ يُكَلِّفَكَ حَلالَهُ وَحَرامَهُ، فَنَقَلَكَ اِلَيْهِ طَيِّباً زاكِياً مَرْضِيِّاً طاهِراً مِنْ كُلِّ نَجَس، مُقَدَّساً مِنْ كُلِّ دَنَس، وَبَوَّأَكَ جَنَّةَ الْمَأوى، وَرَفَعَكَ اِلَى الدَّرَجاتِ الْعُلى، وَصَلَّى اللهُ عَلَيْكَ صَلاةً تَقَرُّ بِها عَيْنُ رَسُولِهِ، وَتُبَلِّغُهُ اَكْبَرَ مَأمُولِهِ، اَللّـهُمَّ اجْعَلْ اَفْضَلَ صَلَواتِكَ وَاَزْكاها، وَاَنْمى بَرَكاتِكَ وَاَوْفاها، عَلى رَسُولِكَ وَنَبِيِّكَ وَخِيَرَتِكَ مِنْ خَلْقِكَ مُحَمَّد خاتَمِ النَّبِيّينَ، وَعَلى مَنْ نَسَلَ مِنْ اَوْلادِهِ الطَّيِّبينَ، وَعَلى مَنْ خَلَّفَ مِنْ عِتْرَتِهِ الطّاهِرينَ، بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِحَقِّ مُحَمَّد صَفِيِّكَ، وَاِبْراهِيمَ نَجْلِ نَبِيِّكَ، اَنْ تَجْعَلَ سَعْيي بِهِمْ مَشْكوراً وَذَنْبي بَهم مَغفوراً وحياتي بهم سعيدة وعاقبتي بهم حميدة وحوائجي بهم مَقْضِيَّةً، وَاَفْعالِي بِهِمْ مَرْضِيَّةً، وَاُمُوري بِهِمْ مَسْعُودَةً، وَشُؤُوني بِهِمْ مَحْمُودَةً، اَللّـهُمَّ وَاَحسِنْ لِيَ التَّوْفيقَ، وَنَفِّسْ عَنِّي كُلَّ هَمّ وَضيق، اَللّـهُمَّ جَنِّبْني عِقابَكَ، وَامْنَحْني ثَوابَكَ، وَاَسْكِنِّي جِنانَكَ، وَارْزُقْني رِضْوانَكَ وَاَمانَكَ، وَاَشْرِكْ لي في صالِح دُعائي والِدَىَّ وَوَلَدي وَجَميعَ الْمُؤمِنينَ وَالمُؤْمِناتِ، الاَْحْياءَ مِنْهُمْ وَالاَْمْواتَ اِنَّكَ وَلِيُّ الْباقِياتِ الصّالِحاتِ، آمينَ رَبَّ الْعالَمينَ.\n\n'
                      'ثمّ تسأل حوائجك وتُصلّي ركعتين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiyaratFatimaBent2asad.screenRoute,
          pushBack: Ziyarat2a2imatBelbaki3.screenRoute,
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
