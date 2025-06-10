import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'a3mal_mi7rab_amir_almo2minin.dart';
import 'sifat_salat.dart';

class SifatSalatLil7aja extends StatefulWidget {
  static String screenRoute = 'sifat_salat_lil7aja_screen';
  const SifatSalatLil7aja({super.key});

  @override
  State<SifatSalatLil7aja> createState() => _SifatSalatLil7ajaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SifatSalatLil7ajaState extends State<SifatSalatLil7aja> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_sifat_salat_lil7aja_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_sifat_salat_lil7aja_screen', value);
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
          .pushReplacementNamed(FadlLakoufaWmasjidoha.screenRoute);
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
                      .addFavorite('صفة صلاة للحاجة في المحل المذكور',
                          SifatSalatLil7aja.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صفة صلاة للحاجة في المحل المذكور',
                          SifatSalatLil7aja.screenRoute,
                          SifatSalatLil7aja.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صفة صلاة للحاجة في المحل المذكور',
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
                  title: 'تصلّي أربع ركعات فاذا فرغت وسبّحت فقُل :',
                  subtitle:
                      'اَللّـهُمَّ اِنّي اَسْاَلُكَ يا مَنْ لا تَراهُ الْعُيُونُ، وَلا تُحيطُ  بِهِ الظُّنوُنُ وَلا يَصِفُهُ الواصِفُونَ، وَلا تُغَيِّرُهُ الْحَوادِثُ، وَلا تُفْنيهِ الدُّهُورُ، تَعْلَمُ مَثاقيلَ الْجِبالِ، وَمَكائيلَ الْبِحارِ، وَوَرَقَ الاَْشْجارِ، وَرَمْلَ الْقِفارِ، وَما اَضأَتْ بِهِ الشَّمْسُ وَالْقَمَرُ، وَاَظْلَمَ عَلَيْهِ اللَّيْلُ، وَوَضَحَ عَلَيْهِ النَّهارُ، وَلا تُواري مِنْكَ سَماءٌ سَماءً، وَلا اَرْضٌ اَرْضاً، وَلا جَبَلٌ ما في اَصْلِهِ، وَلا بَحْرٌ ما في قَعْرِهِ، اَسْاَلُكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تَجْعَلَ خَيْرَ اَمْري آخِرَهُ، وَخَيْرَ اَعْمالي خَواتيمَها، وَخَيْرَ اَيّامي يَوْمَ اَلْقاكَ، اِنَّكَ عَلى كُلِّ شَيْء قَديرُ، اَللّـهُمَّ مَنْ اَرادَني بِسُوء فَاَرِدْهُ، وَمَنْ كادَني فَكِدْهُ، وَمَنْ بَغاني بِهَلَكَة '
                      'فَاَهْلِكْهُ، وَاكْفِني ما اَهَمَّني مِمَّنْ دَخَلَ هَمُّهُ عَلَيَّ، اَللّـهُمَّ اَدْخِلْني في دِرْعِكَ الْحَصينَةِ، وَاسْتُرْني بِسِتْرِكَ الْواقي، يا مَنْ يَكْفي مِنْ كُلِّ شَيْء وَلا يَكْفي مِنْهُ شَيْءٌ، اِكْفِني ما اَهَمَّني مِنْ اَمْرِ الدُّنْيا وَالاْخِرَةِ، وَصَدِّقْ قَوْلي وَفِعْلي يا شَفيقُ يا رَفيقُ فَرِّجْ عَنِّي الْمَضيقَ وَلا تُحَمِّلْني ما لا اُطيقُ، اَللّـهُمَّ احْرُسْني بِعَيْنِكَ الَّتي لا تَنامُ، وَارْحَمْني بِقُدْرَتِكَ عَلَيَّ يا اَرْحَمَ الرّاحِمينَ، يا عَلِيُّ يا عَظيمُ اَنْتَ عالِمٌ بِحاجَتي وَعَلى قَضائِها قَديرٌ، وَهِيَ لَدَيْكَ يَسيرٌ، وَاَنَا اِلَيْكِ فَقيرٌ فَمُنَّ بِها عَليَّ يا كَريمُ اِنَّكَ عَلى كُلِّ شَيْء قَديرُ.\n\n'
                      'ثمّ تسجد وتقول : اِلْهي قَدْ عَلِمْتَ حَوائِجي فَصَلِّ عَلى مُحَمَّد وَآلِ محمد واقضيها وقَدْ أحصيَتَ ذُنُوبي فصلِّ على محمد وآلهِ  وَاغْفِرها يا كَريمُ ثم تقلب خدك الايمن وتقول : إن كنت بِئسَ العبدُ فأنتَ نِعْمَ الربُّ افعل بي ما أنتَ أهْلُهُ ولا تفعلْ بي ما أنا أهلُهُ يا أرْحَمَ الرَّحِمينَ، ثم تقلّب خدِك الايسر وتقول : اللّهمَّ إن عَظُيمَ الذّنبُ منَ عَبدِك فَلْيَحْسُن العَفْوُ مِنْ عِنْدِك ياكريم، ثمّ تعود الى السّجود وتقول : اِرْحَمْ مَنْ اَساءَ وَاقْتَرَفَ، وَاسْتَكانَ وَاعْتَرَفَ.\n\n'
                      'أقول : هذا الدعاء الى كلمة وَاغْفِرها يا كَريمُ هو الدّعاء الوارد في كتاب المزار القديم في عمل مقام الامام زين العابدين (عليه السلام) في أعمال صحن مسجد السّهلة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: A3malMi7rabAmirAlmo2minin.screenRoute,
          pushBack: SifatSalat.screenRoute,
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
