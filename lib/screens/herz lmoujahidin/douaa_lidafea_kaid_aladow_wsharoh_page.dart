import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'douaa_ikhdaa_rikab_aljababira_page.dart';
import 'herz_mostakhraj_men_kitab_allah_page.dart';

class DouaaLidafeaKaidAladowWsharohPage extends StatefulWidget {
  static String screenRoute = 'douaalidafeakaidaladowwsharoh_screen';
  DouaaLidafeaKaidAladowWsharohPage({super.key});

  @override
  State<DouaaLidafeaKaidAladowWsharohPage> createState() =>
      _DouaaLidafeaKaidAladowWsharohPageState();
}

class _DouaaLidafeaKaidAladowWsharohPageState
    extends State<DouaaLidafeaKaidAladowWsharohPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_douaalidafeakaidaladowwsharoh_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_douaalidafeakaidaladowwsharoh_screen', value);
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
                      .addFavorite('دعاء لدفع كيد العدو وشره',
                          DouaaLidafeaKaidAladowWsharohPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء لدفع كيد العدو وشره',
                          DouaaLidafeaKaidAladowWsharohPage.screenRoute,
                          DouaaLidafeaKaidAladowWsharohPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء لدفع كيد العدو وشره',
            style: TextStyle(
              fontSize: isTablet
                  ? 40
                  : size > 1
                      ? 21
                      : 24,
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
            ),
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListOfNineVerses(
                    title: 'تعريف:',
                    subtitle:
                        'وهو الدعاء الذي دعا به الإمام الصادق ع لما استدعاه المنصور العباسي للمرة الثانية لقتله فأمنه الله عز وجل, رواه السيد ابن طاوس في مهجه والشيخ الكفعمي في المصباح عنه.\nوقد روى الشطر الأول من الدعاء العلّامة المجلسي في البحار عن عيون أخبار الرضا ع مسنداً عن الإمام الرضا ع عن أبيه صلوات الله عليه, وذكر ما يقارب قصة الدعاء التي ذكرها السيد ابن طاوس.\nوذكر الدعاء أيضاً السيد علي خان في الكلم الطيب عن الصادق ع لكفاية العدو.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'آثاره:',
                    subtitle:
                        'ذكر في حاشية المصباح ملخص قصة الدعاء التي ذكرها صاحب المهج, قال: هذا الدعاء عظيم الشأن وملخص قصته من مهج الدعوات لابن طاوس ما حدث به الربيع, قال:\nحججت مع المنصور, فلما رجعنا إلى المدينة قال لي:\nيا ربيع ائتني بجعفر بن محمد ع ولا تأت به إلا سحباً. فأتيت إلى الصادق ع وأعلمته بما أمرني به المنصور من سحبه, فقال:\nامتثل ما أمرك به.\nقال: فأخذت بكمه وأدخلته على المنصور, وفي يد المنصور عمود من حديد يريد أن يقتل به الصادق ع, ونظرت إلى الصادق ع وهو يحرك شفتيه فلما قرب منه أدناه المنصور وقرّبه حتى أجلسه على السرير ثم دعى بغالية فغليه منها بيده, ثم حمله على بغلة وأمر له ببدرة وخلعة, ثم أمره بالانصراف, فخرج عليه السلام.\nقال الربيع:\nخرجت معه حتى وصلت إلى منزله, فقلت له: يابن رسول الله لم اشك في المنصور انه قاتلك ورايتك تحرك شفتيك عند دخولك عليهو فبحق جدك محمد ص غلا ما علمتني ما قلت.\nفقال ع:\nيا ربيع إني قلت: حسبي الرب من المربوبين... إلى آخره.\nقال ربيع:\nفكتبت ذلك في رق وجعلته في حمايل سيفي فوالله ما رهبت المنصور بعدها.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'الدعاء:',
                    subtitle: 'حسبي الرب من المربوبين, حسبي الخالق من المخلوقين, حسبي من لم يزل حسبي, حسبي الله الذي لا إله إلا هو عليه توكلت وهو رب العرش العظيم, حسبي الذي لم يزل حسبي, حسبي الله ونعم الوكيل, اللهم احرسني بعينك التي لا تنام, واكنفني بركنك الذي لا يرام, واحفظني بعزك واكفني شر فلان بقدرتك, ومُنَّ عليَّ بنصرك وإلا هلكت وأنت ربي.\n' +
                        'اللهم إنك أجلُّ وأكبر ممن أخاف وأحذر، اللهم إني أدرأ بك في نحره وأعوذ بك من شره وأستعينك عليه وأستكفيك إياه، يا كافي موسى فرعون ومحمد صلّى الله عليه وآله الأحزاب الذين قال لهم الناس إن الناس قد جمعوا لكم فاخشوهم فزادهم إيماناً وقالوا حسبنا الله ونعم الوكيل، أولئك الذين طبع الله على قلوبهم وسمعهم وأبصارهم وأولئك هم الغافلون لا جرم أنهم في الآخرة هم الأخسرون، وجعلنا من بين أيديهم سداً ومن خلفهم سداً فأغشيناهم فهم لا يبصرون.\n' +
                        'بالله أستفتح وبالله أستنجح وبرسول الله صلّى الله عليه وآله أتوسل وبأمير المؤمنين عليه الصلاة والسلام أتشفع وبالحسن والحسين عليهما السلام أتقرب، اللهم ليّن لي صعوبته وسهل لي حزونته ووجّه سمعه وبصره، وجميع جوارحه، إليَّ بالرأفة والرحمة وأذْهِب عني غيظه وبأسه ومكره وجنوده وأحزابه وانصرني عليه بحق كل ملك سائح في رياض قدسك وفضاء نورك وشرب من حيوان مائك وأنقذني بنصرك العام المحيط جبرئيل عن يميني، وميكائيل عن يساري، ومحمد صلّى الله عليه وآله أمامي والله وليّي وحافظي وناصري وأماني، فإن حزب الله هم الغالبون، استترت واحتجبت وامتنعت وتعززت بكلمة الله الوحدانية الأزلية الإلهية التي امتنع بها كان محفوظاً، إن وليّي الله الذي نزّل الكتاب وهو يتولّى الصالحين.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HerzMostakhrajMenKitabAllahPage.screenRoute,
          pushBack: DouaaIkhdaaRikabAljababiraPage.screenRoute,
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
