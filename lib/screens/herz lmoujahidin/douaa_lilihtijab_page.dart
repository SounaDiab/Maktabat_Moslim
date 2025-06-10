import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'douaa_lilihtijab_aan_basar_alaadaa_page.dart';
import 'herz_altaj_page.dart';

class DouaaLilihtijabPage extends StatefulWidget {
  static String screenRoute = 'douaalilihtijab_screen';
  DouaaLilihtijabPage({super.key});

  @override
  State<DouaaLilihtijabPage> createState() => _DouaaLilihtijabPageState();
}

class _DouaaLilihtijabPageState extends State<DouaaLilihtijabPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaalilihtijab_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaalilihtijab_screen', value);
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
          .pushReplacementNamed(HerzAlmoujahidinHomeScreen.screenRoute);
      return false;
    }
  }

  double _fontSize = 18;
  double _fontSizeTablet = 30;
  @override
  Widget build(BuildContext context) {
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
                          'دعاء للإحتجاب', DouaaLilihtijabPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء للإحتجاب',
                          DouaaLilihtijabPage.screenRoute,
                          DouaaLilihtijabPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء للإحتجاب',
            style: TextStyle(
              fontSize: isTablet ? 40 : 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 10,
              right: 30,
              left: 30,
              bottom: 10,
            ),
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListOfNineVerses(
                    title: 'تعريف:',
                    subtitle: 'ذكره السيِّد علي خان في الكلم الطيب.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      ListOfNineVerses(
                        title: 'الدعاء:',
                        subtitle:
                            'بسم الله الرحمن الرحيم، احتجبت بنور وجه الله القديم الكامل، وتحصَّنت بحصن الله القويِّ الشامل ورميت من بغى عليَّ بسهم الله وسيفه القاتل، اللهم يا غالباً على أمره ويا قائماً فوق خلقه ويا حائلاً بين المرء وقلبه حل بيني وبين الشيطان ونزغه وبين ما لا طاقة لي به من أحد من عبادك، كفَّ عنِّي ألسنتهم واغلل أيديهم وأرجلهم واجعل بيني وبينهم سداً من نور عظمتك وحجاباً من قُدْرتك وجنداً من سلطانك إنك حيٌّ قادرٌ.\n'
                            'اللهم اغش عنّي أبصار النّاظرين حتّى أرُدَّ الموارد واغش عنّي أبصار النور وأبصار الظُّلمة حتَّى لا أبالي عن أبصارهم يكاد سنا برقه يذهب بالأبصار، يُقَلِّب الله الليل والنهار إن في ذلك لعبرةً لأولي الأبصار.\n'
                            'بسم الله الرحمن الرحيم كهيعص، بسم الله الرحمن الرحيم حمعسق، كماءٍ أنزلناه من السماء فاختلط به نبات الأرض فأصبح هشيماً تذروه الرياح، ح ه‍ هو الله الذي لا إله إلا هو عالم الغيب والشهادة هو الرحمن الرحيم، م ي يوم الآزفة إذِ القلوب لدى الحناجر كاظمين ما للظالمين من حميم ولا شفيعٍ يُطاع ع ع علمتْ نفسٌ ما أحضرت فلا أقسم بالخنَّس الجوار الكنَّس والليل إذا عسعس والصبح إذا تنفَّس، س ص ص والقرآن ذي الذكر بل الذين كفروا في عِزَّةٍ وشقاقٍ.',
                        weight: FontWeight.w600,
                        size: isTablet ? _fontSizeTablet : _fontSize,
                      ),
                      ListOfNineVerses(
                        title: '',
                        subtitle: 'وتقول ثلاث مرّات:',
                        weight: FontWeight.w400,
                        size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                      ),
                      ListOfNineVerses(
                        title: '',
                        subtitle:
                            'شاه‍ت الوجوه شاهت الوجوه شاهت الوجوه وعميت الأبصار وكلَّت الألسن اللهم اجعلْ خيرهم بين عينيهم وشرَّهم وتحت قدميهم وخاتم سليمان بين أكتافهم. سُيْحان القادر القاهر الكافي، فسيكفيكهم الله وهو السميع العليم، صبغة الله ومن أحسن من الله صبغةً، كهيعص اكفنا، حمعسق احمنا وارحمنا، هو الله القادر القاهر الكافي، وجعلنا من بين أيديهم سداً فأغشيناهم فهم لا يبصرون، أولئك الذين طبع الله على قلوبهم وسمعهم وأبصارهم وأولئك هم الغافلون، وصلَّى الله على محمد وآله أجمعين الطَّيِّبين الطّاهرين، إنه من سليمان وإنه بسم الله الرحمن الرحيم ألا تعلوا عليَّ وأتوني مسلمين، اللهم إني أسألك أن تقضي حاجتي وتغفر ذنوبي فإنه لا يغفر الذنوب إلا أنت برحمتك يا أرحم الراحمين، وعنت الوجوه للحيّ القيّوم يا ذا الجلال والإكرام.',
                        weight: FontWeight.w600,
                        size: isTablet ? _fontSizeTablet : _fontSize,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HerzAltajPage.screenRoute,
          pushBack: DouaaLilihtijabAanBasarAlaadaaPage.screenRoute,
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
