import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import '../herz_almoujahidin_home_screen.dart';
import 'douaa_lilihtijab_page.dart';
import 'douaa_nadi_aalyan_mozhira_alaajaib_page.dart';

class HerzAltajPage extends StatefulWidget {
  static String screenRoute = 'herzaltaj_screen';
  HerzAltajPage({super.key});

  @override
  State<HerzAltajPage> createState() => _HerzAltajPageState();
}

class _HerzAltajPageState extends State<HerzAltajPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_herzaltaj_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzaltaj_screen', value);
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
                      .addFavorite('حرز التاج', HerzAltajPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('حرز التاج', HerzAltajPage.screenRoute,
                          HerzAltajPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حرز التاج',
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
                    title: '',
                    subtitle:
                        'روي أن رسول الله (ص) كان يحمله في الحروب، وأن لقارئه وحامله ثواباً عظيماً وهو نافع بإذن الله عن العين والحمى والشقيقة والمحبة والدخول على السلاطين والقضاة ونافع للأسير ولعسر الولادة وللأوجاع والسفر ولإبطال السحر والمكر وعن الجن والشياطين:',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          ' بسم الله الرحمن الرحيم',
                          style: TextStyle(
                            fontSize: isTablet ? _fontSizeTablet : _fontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      ListOfNineVerses(
                        title: '',
                        subtitle:
                            'اللهم إني أسألك يا الله يا الله يا رحمن يا رحيم يا حليم يا كريم يا قديم يا مديم يا عظيم يا الله يا هير مسؤولٍ وأكرم مأمولٍ يا من له الحمد والثَّناء بيده الفقر والغنا وله الأسماء الحسنى لا مانع لمن أعطى ولا مُضِلَّ لمن هدى يفعل في ملكه ما يشاء رب الأرباب ومعتق الرِّقاب ذو القوَّة القاهرة والعظمة الباهرة مالك الدنيا والآخرة أسألك باحتياط قافٍ وبِهَوْلِ يوم المخاف بالزُّخرف بالطُّور بالرِّق المنشور بالبيت المعمور بالسَّقف المرفوع وبالبحر المسجور بنور القمر بشعاع الشمس بضوء النهار بظلام الليل بدويِّ الماء بخيرات الأرض بحفيف الشجر بعلوِّ السماء بهبوط الأرض بجريان البحر بعجائب الدنيا بنفخ الصُّور بلغات الطيور بنور الصباح بالخمسة الأشباح بمكنونة سِرِّك بوفاء عهدك بعلمك بالشمس وضحاها والقمر إذا تلاها والنهار إذا جلَّاها والليل إذا يغشاها والسماء وما بناها والأرض وما طحاها ونفسٍ وما سوّاها فألهمها فجورها وتقواها قد أفلح من زكَّاها وقد خاب من دسّاها بقرب الجنّة ببعد النار وعدل الميزان بهدير الرّعد بلمع البرق برقدة أهل الكهف بفطرة الإسلام بزمزم والمقام والحجِّ إلى بيت الله الحرام بِسِرِّ يوسف بطور سيناء بسورة يسٓ بالأنبياء والمرسلين بحُلَّة آدم بتاج حواء بحُلَّة إبراهيم بكبش إسماعيل بناقة صالح بعصا موسى بإنجيل عيسى بزبور داود بفرقان محمد (ص) برفعة إدريس بدعوة جرجيس بسفينة نوحٍ بسدرة المنتهى بجنَّة المأوى باللوح المحفوظ بما جرى به القلم بنور الظلام والشاب والمرام بشهر عاشوراء بساعات الدُّهور بالفلك النَّوار بالصُّدور وما حوت بالأنفس الزَّكيَّة وما عملت والأقلام وما سطرت والنجوم وما سارت بحروف القرآن بسورة الدخان بعزائم الجانِّ بملك سليمان بحكمة لقمان بعدل الميزان بسعير النيران بغرق الطوفان بتغليب الدُّول باختلاف الملل بقرب الأجل بصالح العمل بالدُّعاء إذا ارتفع والقضاء إذا نزل، اللهم صلِّ على محمد وآل محمد واحفظ حامل كتابي هذا يا الله يا ودود اللهم صلِّ على محمد وآل محمد يا من اسمه من الأسماء مفرود يا مجيب دعوة هود يا مؤنس المستوحشين باللحود يا من أخرجنا من الرحم إلى الوجود يا مظلم ذات الوقود يا من بقاؤه غير محدود يا مفدي الأطفال بالمهود يا صادق الوعد والوعود يا من تقدَّد باسمه الصخر الجلمود يا الله اللهم أبعد عن حامل كتابي هذا شرَّ الجنِّ والإنس وشدَّته والموت وقبضته والآخرة ودرجته والقبر وظلمته والتراب وديَّته والدّود وهويَّته ومنكر ونكيرٍ ومحاسبته والجانِّ ودوسته والسَّيف وخَرْقتِهِ والرُّمح وطَعْنَتِهِ والخنجر ودكَّته والقوس ورمْيتِهِ والسَّهم وضبْيته  والسِّكِّين وسنَّته والسَّبع وعضَّته والكلب ونُبْحتِهِ والذِّئب وهدْرتِهِ والحرام وسطْوَتِهِ والحيَّة ولسعتها والعقرب ولدغتها والتابعة وأذيتها والولد وفقدته وأعيذ حامل كتابي هذا من شرِّ الرَّيب والمنون ولحظات العيون في كلِّ حركة وسكون اللهم صلِّ على محمد وآل محمد واخفظ حامل كتابي هذا من شرِّ كلِّ جنِّيِّ وجنِّيَّة وغول وغوليَّة ومارد ومارديَّة وإبليس وإبليسيَّة ومسلم  ومسلمة ومن يفرِّق بين الزوج والزوجة والولد وأبيه والابنة وأمها والأخت وأختها اللهم اصرف عن حامل كتابي هذا شرَّ البلاء والبليَّة والسيوف الهندية والرماح الخطِّية والقِسِيِّ المحنية والسهام المرمية والحربات الجلمودية والساعات الرَّدِيَّة اللهم ادفع عن حامل كتابي هذا كلَّ رديَّة وأعذه من شرِّ رَصَدٍ طاغ نمرود وأعيذ حامل كتابي هذا من شرِّ الجنون والتَّحريك والدَّويِّ وأعيذه من شرِّ إبليس القوي وأشياعه وأتباعه وأولاده وأعوانه وخدّامه من الخواصة والقمرية والمسترقة والسمع للملل، وأعيذه بقل أعوذ برب الناس ملك الناس إله الناس من شرِّ الوسواس الخناس الذي يوسوس في صدور الناس من الجنة والناس اللهم إني أسألك بحرمة الآيات الكريمة العظيمة أن تحفظ حامل كتابي هذا من شرِّ كل ذي شرٍّ اللهم احفظه في كلِّ برٍّ وبحرٍ وأعيذه بالاسم الذي نزل به جبريل (ع) على سليمان بن داود ومحمد (ص) وأعيذه بالإسم الذي فلق به البحر لموسى بن عمران وبالاسم الذي تكلَّم به عيسى ابن مريم في المهد صبيّاً وأحيا به الموتى وأبرأ به الأكمه والأبرص وبالاسم الذي نجا به إبراهيم من نار النُّمرود وذلَّ به إبليس اللَّعين وأعيذه بالاسم الذي أيَّد الله به علِيَّ بن أبي طالب في قتله الكفَّار وأعيذه بما كُتِبَ على خاتم سليمان بن داود وأعيذه بكلِّ اسمٍ سمّاه الله به وأخصَّ به أنبياءه ورسله وملائكته اللهم إني أسألك أن تجعل لحامل هذه الأحرف كرامة جبريل ومهابة إسرافيل وقبول محمد اللهم اجعل لحامل هذا الحرز هيبةً وقبولاً وبيده سيف النصر مسلول وإذلال البشر من كلِّ أُنثى وكبير وصغير وغنيٍّ وفقير وسلطان وأمير ومشير وصاحب ووزير بإذن الملك القدير ذلَّل الخلق والبشر من أمَّة ربيعة ومُضر كما ذلَّلت الأرض للإنسان والطَّريق للحصان والميِّت للأكفانوثم استوى إلى السَّماء وهي دخانٌ فقال لها وللأرض ائتيا طوعاً أو كرهاً قالتا أتينا طائعين كذلك، اللهم أطِعْ لحامل كتابي هذا جميع الخلْق والبشر، اللهم إني أسألك يا رافع السَّماء أن تُعيذَ حامل كتابي هذا من كلِّ أُنثى وذكرٍ من أمة ربيعة ومُضَرَ، اللهم ألِّف بين حامل كتابي هذا وبين بني آدم وبنات حوّاء كما ألَّفت بين الشمس والنار، اللهم ألِّف بين حامل كتابي هذا وبين قلوب عبادك الصالحين على صحبة حامل هذا الحرز المبارك واصرف عنه كلَّ فاجرٍ وفاجرةٍ وساحرٍ وساحرةٍ وكلَّ خائن وخائنة وأعيذ حامل كتابي هذا من شرِّ كلِّ أنواع البلاء العظيم، اللهم إني أسألك يا رافع السماء بغير عمدٍ وباسط الأرضين على ماءٍ جمدٍ وأكملت الجبال الرّاسيات بالوتد وأنزلت ماء المعصرات يا من لا تشتبه عليه اللُّغات ويا من لا تخفى عليه الأصوات يا رب الملائكة الرّوحانيّة يا خالق الخلق والآيات يا متكلِّم بلا لسان يا سامع بلا أُذُنٍ يا من لا يخفى عليه خافية في الأرض ولا في السماء اللهم إني أسألك أن تحفظ حامل كتابي هذا من كلِّ شرِّ بحقِّ محمدٍ وعليٍّ وفاطمة وخديجة الكبرى والحسن الزكيِّ والحسين الشهيد وعليِّ بن الحسين ومحمد الباقر وجعفر الصادق وموسى الكاظم وعاي الرضا ومحمد بن عليِّ الجواد وعليِّ الهادي والحسن العسكري وأبي صالح المهديِّ صلوات الله عليهم أجمعين وأجمعين وأعيذ حامل كتابي هذا بألف لا حول ولا قوة إلا بالله العليِّ العظيم.',
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
          pushNext: DouaaNadiAalyanMozhiraAlaajaibPage.screenRoute,
          pushBack: DouaaLilihtijabPage.screenRoute,
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
