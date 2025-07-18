import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../alziyarat_aljami3a_walsalawat.dart';
import 'alsalat_3ala_ali_bin_lhussein.dart';
import 'alsalat_3ala_alsayida_fatima.dart';

class Alsalat3alaLhassanWalhussein extends StatefulWidget {
  static String screenRoute = 'alsalat_3ala_lhassan_walhussein_screen';
  const Alsalat3alaLhassanWalhussein({super.key});

  @override
  State<Alsalat3alaLhassanWalhussein> createState() =>
      _Alsalat3alaLhassanWalhusseinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Alsalat3alaLhassanWalhusseinState
    extends State<Alsalat3alaLhassanWalhussein> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alsalat_3ala_lhassan_walhussein_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_alsalat_3ala_lhassan_walhussein_screen', value);
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
          .pushReplacementNamed(AlziyaratAljami3aWalsalawat.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isTablet ? 100 : 50,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
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
                    .addFavorite('الصلاة على الحسن والحسين (عليهما السلام)',
                        Alsalat3alaLhassanWalhussein.screenRoute);
              } else {
                Provider.of<FavoritesProvider>(context, listen: false)
                    .removeFavorite(
                        'الصلاة على الحسن والحسين (عليهما السلام)',
                        Alsalat3alaLhassanWalhussein.screenRoute,
                        Alsalat3alaLhassanWalhussein.screenRoute);
              }
            },
          ),
        ],
        title: Text(
          'الصلاة على الحسن والحسين (عليهما السلام)',
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
                    'اَللّـهُمَّ صَلِّ عَلَى الْحَسَنِ وَالْحُسَيْنِ عَبْدَيْكَ وَوَلِيَّيْكَ، وَابْنَىْ رَسُولِكَ، وَسِبْطَى الرَّحْمَةِ، وَسَيِّدَىْ شَبابِ اَهْلِ الْجَنَّةِ، اَفْضَلَ ما صَلَّيْتَ عَلى اَحَد مِنْ اَوْلادِ النَّبِيّينَ وَالْمُرْسَلينَ، اَللّـهُمَّ صَلِّ عَلَى الْحَسَنِ ابْنِ سَيِّدِ النَّبِيّينَ وَوَصِىِّ اَميرِ الْمُؤْمِنينَ، اَلسَّلامُ عَلَيْكَ يَا بْنَ رَسُولِ اللهِ، اَلسَّلامُ عَلَيْكَ يَا ابْنَ سَيِّدِ الْوَصِيّينَ، اَشْهَدُ اَنَّكَ يَا ابْنَ اَميرِ الْمُؤْمِنينَ اَمينُ اللهِ وَابْنُ اَمينِهِ، عِشْتَ مَظْلُوماً وَمَضَيْتَ شَهيداً، وَاَشْهَدُ اَنَّكَ الاِْمامُ الزَّكِىُّ الْهادِى الْمَهْدِىُّ، اَللّـهُمَّ صَلِّ عَلَيْهِ وَبَلِّغْ رُوحَهُ وَجَسَدَهُ عَنّى فى هذِهِ السّاعَةِ اَفْضَلَ التَّحِيَّةِ وَالسَّلامِ، اَللّـهُمَّ صَلِّ عَلَى الْحُسَيْنِ بْنِ عَلِىٍّ الْمَظْلُومِ الشَّهيدِ، قَتيلِ الْكَفَرَةِ وَطَريحِ الْفَجَرَةِ، اَلسَّلامُ عَلَيْكَ يا اَبا عَبْدِاللهِ، اَلسَّلامُ عَلَيْكَ يَا بْنَ رَسُولِ اللهِ، اَلسَّلامُ عَلَيْكَ يَا ابْنَ اَميرِ الْمُؤْمِنينَ اَشْهَدُ موُقِناً اَنَّكَ اَمينُ اللهِ وَابْنُ اَمينِهِ، قُتِلْتَ مَظْلُوماً وَمَضَيْتَ شَهيداً، وَاَشْهَدُ اَنَّ اللهَ تَعالى الطّالِبُ بِثارِكَ، وَمُنْجَزٌ ما وَعَدَكَ مِنَ النَّصْرِ وَالتَّاْييدِ فى هَلاكِ عَدُوِّكَ وَاِظْهارِ دَعْوَتِكَ، وَاَشْهَدُ اَنَّكَ وَفَيْتَ بِعَهْدِ اللهِ، وَجاهَدْتَ '
                    'فى سَبيلِ، اللهِ وَعَبْدتَ اللهَ مُخْلِصاً حَتّى أتاكَ الْيَقينُ لَعَنَ اللهُ اُمَّةً قَتَلَتْكَ، وَلَعَنَ اللهُ اُمَّةً خَذَلَتْكَ، وَلَعَنَ اللهُ اُمَّةً اَلَبَّتْ عَلَيْكَ، وَاَبْرَأُ اِلَى اللهِ تَعالى مِمَّنْ اَكْذَبَكَ وَاسْتَخَفَّ بِحَقِّكَ وَاسْتَحَلَّ دَمَكَ، بِاَبى اَنْتَ وَاُمّى يا اَبا عَبْدِاللهِ لَعَنَ اللهُ قاتِلَكَ، وَلَعَنَ اللهُ خاذِلَكَ، وَلَعَنَ اللهُ مَنْ سَمِعَ وَاعِيَتَكَ فَلَمْ يُجِبْكَ وَلَمْ يَنْصُرْكَ، وَلَعَنَ اللهُ مَنْ سَبا نِساءَكَ اَنَا اِلَى اللهِ مِنْهُمْ بَرئٌ وَمِمَّنْ والاهُمْ وَمالاََهُمْ وَاَعانَهُمْ عَلَيْهِ، وَاَشْهَدُ اَنَّكَ وَالاَْئِمَّةَ مِنْ وُلْدِكَ كَلِمَةُ التَّقْوى وَبابُ الْهُدى وَالْعُرْوَةُ الْوُثْقى وَالْحُجَّةُ عَلى اَهْلِ الدُّنْيا، وَاَشْهَدُ اَنّى بِكُمْ مُؤْمِنٌ وَبِمَنْزِلَتِكُمْ موُقِنٌ، وَلَكُمْ تابِعٌ بِذاتِ نَفْسى وَشَرايِعِ دينى وَخَواتيمِ عَمَلى وَمُنْقَلَبى فى دُنْياىَ وَآخِرَتى.',
                weight: FontWeight.w600,
                size: isTablet ? _fontSizeTablet : _fontSize,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: Alsalat3alaAliBinLhussein.screenRoute,
        pushBack: Alsalat3alaAlsayidaFatima.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الصلاة على الحسن والحسين.mp3',
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
    );
  }
}
