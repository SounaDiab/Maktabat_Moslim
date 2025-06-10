import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../alziyarat_aljami3a_walsalawat.dart';
import 'alsalat_3ala_waley_l2amer.dart';
import 'ziyarat_alna7iya_almokadasa.dart';

class Ziyarat2alYasin extends StatefulWidget {
  static String screenRoute = 'ziyarat_2al_yasin_screen';
  const Ziyarat2alYasin({super.key});

  @override
  State<Ziyarat2alYasin> createState() => _Ziyarat2alYasinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Ziyarat2alYasinState extends State<Ziyarat2alYasin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ziyarat_2al_yasin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_2al_yasin_screen', value);
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
                          'زيارة آل ياسين', Ziyarat2alYasin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة آل ياسين',
                          Ziyarat2alYasin.screenRoute,
                          Ziyarat2alYasin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة آل ياسين',
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
                      'سلام على آل يس السلام عليك يا داعي الله ورباني آياته السلام عليك يا باب الله وديان دينه السلام عليك يا خليفة الله وناصر حقه السلام عليك يا حجة الله ودليل إرادته السلام عليك يا تالي كتاب الله وترجمانه السلام عليك في آناء ليلك وأطراف نهارك السلام عليك يا بقية الله في أرضه السلام عليك يا ميثاق الله الذي أخذه ووكده السلام عليك يا وعد الله الذي ضمنه السلام عليك أيها العلم المنصوب والعلم المصبوب والغوث والرحمة الواسعة وَعْدٌ غَيْرُ مَكْذُوبٍ السلام عليك حين تقوم السلام عليك حين تقعد السلام عليك حين تقرأ وتبين السلام عليك حين تصلي وتقنت السلام عليك حين تركع وتسجد السلام عليك حين تهلل وتكبر السلام عليك حين تحمد وتستغفر السلام عليك حين تصبح وتمسي السلام عليك في اللَّيْلِ إِذا يَغْشى وَالنَّهارِ إِذا تَجَلَّى السلام عليك أيها الإمام المأمون السلام عليك أيها المقدم المأمول السلام عليك بجوامع السلام أشهدك يا مولاي أني أشهد أن لا إله إلا الله وحده لا شريك له وأن محمدا عبده ورسوله لا حبيب إلا هو '
                      'وأهله وأشهدك يا مولاي ان عليا أمير المؤمنين حجته والحسن حجته والحسين حجته وعلي بن الحسين حجته ومحمد بن علي حجته وجعفر بن محمد حجته وموسى بن جعفر حجته وعلي بن موسى حجته ومحمد بن علي حجته وعلي بن محمد حجته والحسن بن علي حجته وأشهد أنك حجة الله أنتم الأول والآخر وأن رجعتكم حق لا ريب فيها يوم لا يَنْفَعُ نَفْساً إِيمانُها لَمْ تَكُنْ آمَنَتْ مِنْ قَبْلُ أَوْ كَسَبَتْ فِي إِيمانِها خَيْراً وأن الموت حق وأن ناكرا ونكيرا حق وأشهد أن النشر والبعث حق وأن الصراط والمرصاد حق والميزان والحساب حق والجنة '
                      'والنار حق والوعد والوعيد بهما حق يا مولاي شقي من خالفكم وسعد من أطاعكم فاشهد على ما أشهدتك عليه وأنا ولي لك بريء من عدوك فالحق ما رضيتموه والباطل ما سخطتموه والمعروف ما أمرتم به والمنكر ما نهيتم عنه فنفسي مؤمنة بالله وحده لا شريك له وبرسوله وبأمير المؤمنين وبكم يا مولاي أولكم وآخركم ونصرتي معدة لكم ومودتي خالصة لكم آمين آمين.\n\n'
                      'اللهم إني أسألك أن تصلي على محمد نبي رحمتك وكلمة نورك وأن تملأ قلبي نور اليقين وصدري نور الإيمان وفكري نور الثبات وعزمي نور العلم وقوتي نور العمل ولساني نور الصدق وديني نور البصائر من عندك وبصري نور الضياء وسمعي نور الحكمة ومودتي نور الموالاة لمحمد وآله عليهم السلام حتى ألقاك وقد وفيت بعهدك وميثاقك فتغشيني رحمتك يا ولي يا حميد اللهم صل على محمد بن الحسن حجتك في أرضك وخليفتك في بلادك والداعي إلى سبيلك والقائم بقسطك والثائر بأمرك ولي المؤمنين وبوار الكافرين ومجلي الظلمة ومنير الحق والناطق بالحكمة والصدق وكلمتك التامة في أرضك المرتقب الخائف والولي الناصح سفينة النجاة وعلم '
                      'الهدى ونور أبصار الورى وخير من تقمص وارتدى ومجلي العمى الذي يملأ الأرض عدلا وقسطا كما ملئت ظلما وجورا إِنَّكَ عَلى كُلِّ شَيْءٍ قَدِيرٌ اللهم صل على وليك وابن أوليائك الذين فرضت طاعتهم وأوجبت حقهم وأذهبت عنهم الرجس وطهرتهم تطهيرا اللهم انصره وانتصر به لدينك وانصر به أولياءك وأولياءه وشيعته وأنصاره واجعلنا منهم اللهم أعذه من شر كل باغ وطاغ ومن شر جميع خلقك واحفظه من بين يديه ومن خلفه وعن يمينه وعن شماله واحرسه وامنعه من أن يوصل إليه بسوء واحفظ فيه رسولك وآل رسولك وأظهر به العدل وأيده بالنصر وانصر ناصريه واخذل خاذليه واقصم به جبابرة الكفر واقتل به الكفار والمنافقين وجميع الملحدين حيث كانوا من مشارق الأرض ومغاربها برها وبحرها واملأ به الأرض عدلا وأظهر به دين نبيك صلى الله عليه وآله واجعلني اللهم من أنصاره وأعوانه وأتباعه وشيعته وأرني في آل محمد (ع) ما يأملون وفي عدوهم ما يحذرون إله الحق آمين يا ذا الجلال والإكرام يا أرحم الراحمين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiyaratAlna7iyaAlmokadasa.screenRoute,
          pushBack: Alsalat3alaWaleyL2amer.screenRoute,
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
