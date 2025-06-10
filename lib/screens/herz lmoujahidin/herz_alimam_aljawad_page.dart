import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'aawzat_alnabi_yawm_wadi_alkora_page.dart';
import 'ayat_alhefz_men_saif_alaadow_page.dart';

class HerzAlimamAljawadPage extends StatefulWidget {
  static String screenRoute = 'herzalimamaljawad_screen';
  HerzAlimamAljawadPage({super.key});

  @override
  State<HerzAlimamAljawadPage> createState() => _HerzAlimamAljawadPageState();
}

class _HerzAlimamAljawadPageState extends State<HerzAlimamAljawadPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_herzalimamaljawad_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzalimamaljawad_screen', value);
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
                      .addFavorite('حرز الإمام الجواد (ع)',
                          HerzAlimamAljawadPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'حرز الإمام الجواد (ع)',
                          HerzAlimamAljawadPage.screenRoute,
                          HerzAlimamAljawadPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حرز الإمام الجواد (ع)',
            style: TextStyle(
              fontSize: isTablet ? 40 : 22,
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
                    subtitle:
                        'ذكر السيد ابن طاوس في المهج عن الشيخ علي بن عبد الصمد مسنداً عن حكيمة بنت محمد بن علي بن موسى بن جعفر عمّة أبي محمد الحسن بنعلي (ع), قالت:\n'
                        'لمّا مات محمد بن علي الرضا (ع) أتيت زوجته أم عيسى بنت المأمون فعزَّيتها فوجدّتها شديدة الحزن والجزع عليه, فبينمانحن في حديثه وكرمه ووصق خلقه ومل أعطاه الله تعالى من الشرف ةالإخلاص وما منحه منالعز والكرامة إذ قالت أم عيسى: ألا أخبرك عنه بشيءٍ عجيبوأمرٍ جليل فوق الوصف والمقدار.\n'
                        'قلت: وما ذاك؟\n'
                        'قلت: وذكرت قصة الحرز الآتية:',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'آثاره:',
                    subtitle:
                        'كنت أغار عليه كثيراً وأراقبه أبدأ وربما يسمعني الكلام فأشكو ذلك إلى أبي فيقول: يا بنيّة احتمليه فإنه بضعة من رسول الله (ص), فبينما أنا جالسة ذات يوم إذ دخلت عليَّ جارية فسلّمت فقلت: منأنت؟ فقالت: أنا جارية من ولد عمّار بن ياسر وأنا زوجة أبي جعفر محمد بن عليّ الرضا (ع) زوجك.\n'
                        'قالت: فدخلني من الغيرة ما لا أقدر على احتماله, وهممت أن أخرج واسيح في البلاد وكاد الشيطان أن يحملني على الإساءة إليها, فكظمت غيظي وأحسنت رفدها وكسوتها.\n'
                        'فلما خرجت من عندي المرأة نهضت ودخلت على أبي وأخبرته بالخبر وكان سكراناً لا يعقل, فقال: ياغلام عليّ بالسيف فأتي به فركب وقال: والله لأقتلنه.\n'
                        'فدخل عليه والدي وما زال يضربه بالسيف حتى قطعه ثم خرج من عنده وخرجت هاربة من خلفه فلم أرقد ليلتي.\n'
                        'فلما ارتفع النهار أتيت أبي فقلت: أتدري ما صنعت البارحة؟ قال: وما صنعت؟\n'
                        'قلت: قتلت ابن الرّضا (ع), فبرق عينه وغشي عليه ثم أفاق بعد حين.\n'
                        'وقال: عليَّ ياسر الخادم, فجاء ياسر فقال له المأمون: ويلك يا هذا مال الذي تقول ابنتي؟ قال: صدقت يا أمير المؤمنين, فضرب بيده على صدره وخذِّه وقال: إنا لله وإنا إليه راجعون هلكنا بالله وعطبنا وافتضحنا إلى آخرالأبد, ويلك يا ياسر انظر ما الخبر عنه وعجِّل عليَّ.\n'
                        'فلما كان بأسرع من أن رجع ياسر فقال: البشرى يا أمير المؤمنين, دخلت عليه فإذا هو جالس وعليه قميص ودواج وهو يستاك فسلّمت عليه وقلت: يابن رسول الله أحب أن تهب لي قميصك هذا أصلي فيه وأقبرك به وإنما أردت أن أنظر إليه وإلى جسده هل به أثر السيف فوالله كان العاج الذي مسَّته صفرة ما به أثر, فبكى المأمون طويلاً وقال: مابقي مع هذا شيء إنَّ هذا لعبرة للأوّلين والآخرين.\n'
                        'قال ياسر:\n'
                        'دخلت مع الهاشميين للسلام على الإمام (ع), فنظر إليّ ثم تبسم فقال: يا ياسر هكذا كان العهد بيننا وبينه حتى يهجم عليّ بالسيف أما علم أنَّ لي ناصراً أو حاجزاً يحجز بيني وبينه, وقال الراوي عن الإمام الجواد (ع) مخاطباً المأمون في وصف الحرز, قال:\n'
                        'عقد تحصن به نفسك وتحرز به من الشرور والبلايا والمكاره والآفات والعاهات كما أنقذني الله منك البارحة, ولولقيت به جيوش الروم والترك واجتمع عليك وعلى غلبتك أهل الأرض جميعاً ما تهيأ لهم منك شيء بإذن الله الجّبار.\n'
                        'وروي أنه لما سمع المأمون من أبي جعفر في أمر هذا الحرز هذه الصفات كلها غزا أهل الروم فنصره الله تعالى عليهم ومنح منهم من الغنم ما شاءالله, ولم يفارق هذا الحرز عند كل غزاة ومحاربة.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      ListOfNineVerses(
                        title: 'الحرز:',
                        subtitle:
                            'يكتب الحرز على رقّ ظبي ويصاغ له قصبة من فضة منقوش عليها:',
                        weight: FontWeight.w400,
                        size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                      ),
                      ListOfNineVerses(
                        title: 'الحرز:',
                        subtitle:
                            'يا مشهوراً في السماوات يا مشهوراً في الأرضين يا مشهوراً في الدنيا والآخرة جَهَدَتِ الجبابرة والملوك على إطفاء نورك ةإخماد ذكرك  فأبى الله إلا يُتِمَّ نورك ويبوح بذكرك ولو كره المُشركون.',
                        weight: FontWeight.w600,
                        size: isTablet ? _fontSizeTablet : _fontSize,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'وإذا أردت شدّه على عضدك  فلتشدّه على عضدك الأيمن, ولتتوضأ وضوءاً حسناً سابغاً, وصلِّ أربع ركعات وتقرأ في كلّ ركعة:\n'
                          'فاتحة الكتاب, - مرّة -, وآية الكرسي - سبع مرّات -, وآية شهد الله - سبع مرّات -, والشمس وضحاها - سبع مرات -, والليل إذا يغشى - سبع مرّات -, وقل هوالله أحد - سبع مرّات -.\n'
                          'فإذا فرغت فشدّه على عضدك الأيمن وينبغي أن لا يكون طلوع القمر في برج العقرب.\n'
                          'ولَّا كان الحرز مجهزاً يباع في الأسواق فنكتفي بهذا دون تدين نصّ الحرز ومن أراد الاطلاع فليراجع المهج.',
                          style: TextStyle(
                            fontSize: isTablet ? _fontSizeTablet : _fontSize,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AawzatAlnabiYawmWadiAlkoraPage.screenRoute,
          pushBack: AyatAlhefzMenSaifAlaadowPage.screenRoute,
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
