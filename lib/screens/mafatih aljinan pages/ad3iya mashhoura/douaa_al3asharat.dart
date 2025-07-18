import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iya_mashhoura.dart';
import 'douaa_alsimat.dart';
import 'douaa_komail.dart';

class DouaaAl3asharat extends StatefulWidget {
  static String screenRoute = 'douaa_al3asharat_screen';
  const DouaaAl3asharat({super.key});

  @override
  State<DouaaAl3asharat> createState() => _DouaaAl3asharatState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _DouaaAl3asharatState extends State<DouaaAl3asharat> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_al3asharat_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_al3asharat_screen', value);
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
                      .addFavorite('دعاء العشرات', DouaaAl3asharat.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء العشرات',
                          DouaaAl3asharat.screenRoute,
                          DouaaAl3asharat.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء العشرات',
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
                      'سبحان الله والحمد لله ولا الـه إلاّ الله والله اكبر ولا حول ولا قوَّة إلاّ بالله العليِّ العظيم، سبحان الله آناء اللَّيل واطراف النَّهار، سبحان الله بالغدوِّ والاصال، سبحان الله بالعشيِّ والاْبكار، سبحان الله حين تمسون وحين تصبحون وله الحمد في السَّماوات والاْرض وعشيَّا وحين تظهرون، يخرج الحيَّ من الميِّت ويخرج الميِّت من الحيِّ ويحيي الاْرض بعد موتها وكذلك تخرجون، سبحان ربِّك ربِّ العزَّة عمّا يصفون وسلام على المرسلين والحمد لله ربِّ العالمين، سبحان ذي الملك والملكوت، سبحان ذي العزَّة والجبروت، سبحان ذي الكبرياء والعظمة الملك الحقِّ المهيمن (المبين) القدُّوس، سبحان الله الملك الحيِّ الَّذي لا يموت، سبحان الله الملك الحيِّ القدُّوس، سبحان القائِم الدّائِم، سبحان الدّائِم القائِم، سبحان ربِّي العظيم، سبحان ربِّي الاْعلى، سبحان الحيِّ القيُّوم، سبحان العليِّ الاْعلى، سبحانه وتعالى، سبُّوح قدُّوس ربُّنا وربُّ الملائِكة والرُّوح، سبحان الدّائِم غير الغافل، سبحان العالم بغير تعليم، سبحان خالق ما يرى، وما لا يرى سبحان الَّذي يدرك الاْبصار ولا تدركه الابصار وهو اللَّطيف الخبير، اللّـهمَّ إنّي اصبحت منك في نعمة وخير وبركة وعافية فصلِّ على محمَّد وآله واتمم عليَّ نعمتك وخيرك وبركاتك وعافيتك بنجاة من النَّار، وارزقني شكرك وعافيتك وفضلك وكرامتك ابدا ما ابقيتني، اللّـهمَّ بنورك اهتديت وبفضلك استغنيت وبنعمتك اصبحت وامسيت، اللّـهمَّ انّي اشهدك وكفى بك شهيدا واشهد ملائِكتك وانبياءك ورسلك وحملة عرشك وسكَّان سماواتك وارضك (وارضيك) وجميع خلقك بانَّك انت الله لا الـه إلاّ انت وحدك لا شريك لك وانَّ محمَّدا صلَّى الله عليه وآله عبدك ورسولك وانَّك على كلِّ شيء قدير، تحيي وتميت وتميت وتحيي واشهد انَّ الجنَّة حقٌّ وانَّ النَّار حقٌّ، و (انَّ) النُّشور حقٌّ، والسَّاعه اتية لا ريب فيها، وانَّ الله يبعث من في القبور، واشهد انَّ عليَّ بن ابي طالب امير المؤْمنين حقّا حقّا، وانَّ الائِمَّة من ولده هم الائمَّة الهداة المهديُّون غير الضّالّين ولا المضلِّين وانَّهم أَولياؤٌك المصطفون وحزبك الغالبون وصفوتك وخيرتك من خلقك ونجباؤُك الَّذين انتجبتهم لدينك واختصصتهم من خلقك، واصطفيتهم على عبادك، وجعلتهم حجَّة على العالمين صلواتك عليهم والسَّلام ورحمة الله وبركاته، اللّـهمَّ اكتب لي هذه الشَّهاده عندك حتّى تلقِّنّيها يوم القيامة وانت عنّى راض انَّك على ما تشاء قدير، اللّـهمَّ لك الحمد حمدا يصعد اوَّله ولا ينفد اخره، اللّـهمَّ لك الحمد حمدا تضع لك السَّماء كنفيها (كتفيها) وتسبِّح لك الارض ومن عليها، اللّـهمَّ لك الحمد حمدا سرمدا ابدا لا انقطاع له ولا نفاد ولك ينبغي واليك ينتهي فيَّ وعليَّ ولديَّ ومعي وقبلي وبعدي وامامي وفوقي وتحتي واذا متُّ وبقيت فردا وحيدا ثمَّ فنيت، ولك الحمد اذا نشرت وبعثت يا مولاي. اللّـهمَّ ولك الحمد ولك الشُّكر بجميع محامدك كلِّها على جميع نعمائِك كلِّها حتّى ينتهي الحمد الى ما تحبُّ ربَّنا وترضى، اللّـهمَّ لك الحمد على كلِّ اكلة وشربة وبطشة وقبضة وبسطة وفي كلِّ موضع شعرة، اللّـهمَّ لك الحمد حمدا خالدا مع خلودك ولك الحمد حمدا لا منتهى له دون علمك ولك الحمد حمدا أمد له دون مشيَّتك، ولك الحمد حمدا لا أخر لقائِله إلاّ رضاك ولك الحمد على حلمك بعد علمك ولك الحمد على عفْوك بعد قدرتك ولك الحمد باعث الحمد ولك الحمد وارث الحمد ولك الحمد بديع الحمد ولك الحمد منتهى الحمد ولك الحمد مبتدع الحمد ولك الحمد مشتري الحمد ولك الحمد وليَّ الحمد ولك الحمد قديم الحمد ولك الحمد صادق الوعد وفيَّ العهد عزيز الجند قائِم الْمجد ولك الحمد رفيع الدَّرجات مجيب الدَّعوات منزل (منزَّل) الايات من فوق سبع سماوات عظيم البركات مخرج النُّور من الظُّلمات من في الظُّلمات ومخرج الى النُّور، مبدِّل السَّيِّئات حسنات، وجاعل الحسنات درجات، اللّـهمَّ لك الحمد غافر الذَّنب وقابل التَّوب شديد العقاب ذا الطَّول، لا الـه إلاّ انت اليك المصير، اللّـهمَّ لك الحمد في الَّليل اذا يغشى، ولك الحمد في النَّهار اذا تجلّى، ولك الحمد في الاخرة والاْولى، ولك الحمد عدد كلِّ نجم وملك في السَّماء، ولك الحمد عدد الثَّرى والحصى والنَّوى، ولك الحمد عدد ما في جوِّ الَّسماء، ولك الحمد عدد ما فى جوف الارض، ولك الحمد عدد اوزان مياه البحار، ولك الحمد عدد اوراق الاْشجار، ولك الحمد عدد ما على وجه الاْرض، ولك الحمد عدد ما احصى كتابك، ولك الحمد عدد ما احاط به علمك، ولك الحمد عدد الاْنس والجنِّ والهوامِّ والطَّير والبهائِم والسِّباع، حمدا كثيرا طيِّبا مباركا فيه كما تحبُّ ربَّنا وترضى، وكما ينبغي لكرم وجهك وعزِّ جلالك. ثمّ تقول عشرا : لا الـه إلاّ الله وحده لا شريك له، له الملك وله الحمد وهو اللَّطيف الخبير. وعشرا : لا الـه إلاّ الله وحده لا شريك له، له الملك وله الحمد يحيي ويميت ويميت ويحيي وهو حيٌّ لا يموت بيده الخير وهو على كلِّ شيء قدير. وعشرا : استغفر الله الَّذي لا الـه إلاّ هو الحيُّ القيُّوم واتوب اليه. وعشرا : يا الله يا الله، وعشرا : يا رحمن يا رحمن وعشرا : يا رحيم يا رحيم وعشرا : يا بديع السَّماوات والاْرض وعشرا : يا ذا الجلال والاْكرام وعشرا : يا حنّان يا منّان وعشرا : يا حيُّ يا قيُّوم وعشرا : يا حيُّ لا الـه إلاّ انت وعشرا : يا الله يا لا الـه إلاّ انت وعشرا : بسم الله الرَّحمن الرَّحيم وعشرا : اللّـهمَّ صلِّ على محمَّد وآل محمَّد وعشرا : اللّـهمَّ افعل بي ما انت اهله وعشرا : آمين آمين وعشرا : قل هو الله احد ثمّ تقول : اللّـهمَّ اصنع بي ما انت اهله ولا تصنع بي ما انا اهله فانَّك اهل التَّقوى واهل المغفرة، وانا اهل الذُّنوب والخطايا فارحمني يا مولاي وانت ارحم الرّاحمين. وايضا تقول عشرا : لا حَول ولا قوَّه إلاّ بالله توكَّلت على الحيِّ الَّذي لا يموت والحمد لله الَّذي لم يتَّخذ ولدا ولم يكن له شريك في الملك ولم يكن له وليٌّ من الذُّلِّ وكبِّره تكبيرا .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: DouaaAlsimat.screenRoute,
        pushBack: DouaaKomail.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء العشرات.mp3',
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
