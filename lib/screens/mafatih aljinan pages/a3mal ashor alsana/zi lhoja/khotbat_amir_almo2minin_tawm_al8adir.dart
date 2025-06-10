import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../zi_lhoja.dart';
import 'alyawm_alrabi3_wal3ishroun_zilhoja.dart';
import 'alyawm_alsamin_3ashar_zilhoja.dart';

class KhotbatAmirAlmo2mininTawmAl8adir extends StatefulWidget {
  static String screenRoute = 'khotbat_amir_almo2minin_tawm_al8adir_screen';
  const KhotbatAmirAlmo2mininTawmAl8adir({super.key});

  @override
  State<KhotbatAmirAlmo2mininTawmAl8adir> createState() =>
      _KhotbatAmirAlmo2mininTawmAl8adirState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _KhotbatAmirAlmo2mininTawmAl8adirState
    extends State<KhotbatAmirAlmo2mininTawmAl8adir> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_khotbat_amir_almo2minin_tawm_al8adir_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_khotbat_amir_almo2minin_tawm_al8adir_screen', value);
  }

    Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiLhoja.screenRoute);
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
                      .addFavorite('خطبة أمير المؤمنين (ع) في يوم الغدير',
                          KhotbatAmirAlmo2mininTawmAl8adir.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'خطبة أمير المؤمنين (ع) في يوم الغدير',
                          KhotbatAmirAlmo2mininTawmAl8adir.screenRoute,
                          KhotbatAmirAlmo2mininTawmAl8adir.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'خطبة أمير المؤمنين (ع) في يوم الغدير',
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
                      'ومن فطّر مؤمناً في ليلته فكأنّما فطّر فئاماً وفئاماً يعدها بيده عشراً، فنهض ناهِض فقال : يا أمير المؤمنين وما الفئام ؟ قال : مائتا ألف نبيّ وصدّيق وشهيد، فكيف بمن يكفل عدداً من المؤمنين والمؤمنات فأنا ضمينه على الله تعالى الامان من الكفر والفقر الخ.\n\n'
                      'والخلاصة : انّ فضل هذا اليوم الشريف اكثر من أن يذكر، وهو يوم قبول أعمال الشّيعة، ويوم كشف غمُومهم، وهو اليوم الذي انتصر فيه موسى على السّحرة، وجعل الله تعالى النّار فيه على ابراهيم الخليل برداً وسلاماً، ونصب فيه موسى (عليه السلام) وصيّه يوشع بن نون، وجعل فيه عيسى (عليه السلام) شمعون الصّفا وَصيّاً له، واشهد فيهِ سليمان (عليه السلام) قومه على استخلاف آصف بن برخيا، وآخى فيه رسول الله (صلى الله عليه وآله وسلم) بين أصحابه، ولذلك ينبغي فيه أن يواخي المؤمن أخاه وهي على ما رواه شيخنا في مستدرك الوسائل عن كتاب زاد الفردوس بأن يضع يده اليمنى على اليد اليمنى لاخيه المؤمِن ويقول :\n\n'
                      'وَآخَيْتُكَ فِى اللهِ، وَصافَيْتُكَ فِى اللهِ، وَصافَحْتُكَ فِى اللهِ، وَعاهَدْتُ اللهَ وَمَلائِكَتَهُ وَكُتُبَهُ وَرُسُلَهُ وَاَنْبِيآءَهُ وَالاَْئِمَّةَ الْمَعْصُومينَ عَلَيْهِمُ السَّلامُ عَلى اَنّى اِنْ كُنْتُ مِنْ اَهْلِ الْجَنَّةِ وَالشَّفاعَةِ وَاُذِنَ لى بِاَنْ اَدْخُلَ الْجَنَّةَ لا اَدْخُلُها اِلاّ وَاَنْتَ مَعى.\n\n'
                      'ثمّ يقول أخوهُ المؤمن : قَبِلْتُ (ثمّ يقُول) : اَسْقَطْتُ عَنْكَ جَميعَ حُقُوقِ الاُخُوَّةِ ما خَلاَ الشَّفاعَةَ وَالدُّعآءَ وَالزِّيارَةَ، والمحدّث الفيض ايضاً قد أورد ايجاب عقد المواخاة في كتاب خلاصة الاذكار بما يقرب ممّا ذكرناه ثمّ قال : ثمّ يقبل الطرف الاخر لنفسه أو لموكّله باللّفظ الدّال على القبول ، ثمّ يسقط كلّ منهما عن صاحبه جميع حقوق الاخوّة ما سوى الدّعاء والزّيارة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAlrabi3Wal3ishrounZilhoja.screenRoute,
        pushBack: AlyawmAlsamin3asharZilhoja.screenRoute,
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
