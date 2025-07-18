import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'herz_mostakhraj_men_kitab_allah_page.dart';
import 'rokaat_aljayb_lilimam_alrida_aalaih_alsalam_page.dart';

class AlhayakelSabeaPage extends StatefulWidget {
  static String screenRoute = 'alhayakelsabea_screen';
  AlhayakelSabeaPage({super.key});

  @override
  State<AlhayakelSabeaPage> createState() => _AlhayakelSabeaPageState();
}

class _AlhayakelSabeaPageState extends State<AlhayakelSabeaPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_alhayakelsabea_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alhayakelsabea_screen', value);
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
                          'الهياكل السبع', AlhayakelSabeaPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الهياكل السبع',
                          AlhayakelSabeaPage.screenRoute,
                          AlhayakelSabeaPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الهياكل السبع',
            style: TextStyle(
              fontSize: isTablet ? 40 : 24,
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
                      'ذكرها الشيخ الكفعمي في المصباح، وقال الحاشية: هي عظيمة الشأن جليلة القدر.',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                )),
                Container(
                  child: ListOfNineVerses(
                    title: 'آثاره:',
                    subtitle: 'قال في الحشية أيضاً:\n'
                        'إن من حملها أو كانت في منزله كان في أمان الله وحفظه، ومن حملها وكان مريضاً شفي أو محبوساً خلص أو مهموماً فرّج الله همّه، أو مديوناً قضى الله تعالى دينه، ومن وضعها في مصروع أفاق وعلى مطلقة وضعت سريعاً ومن حملها وسافر غنم وسلم، وإن كان يريد التزويج وفّق الله أمره ورزقه الولد والبركة، ومن حملها ودخل على سلطان أمن شرَّه وقضى حوائجه بإذن الله تعالى.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      ListOfNineVerses(
                        title: 'الهيكل الأول:',
                        subtitle:
                            'الحَمْدُ لله الذي لا ينسى من ذكره ولا يخيِّب من دعاه والحَمْدُ لله الذي من توكَّل عليه كفاه والحَمْدُ لله الذي لا يحصى نعْماؤه والحَمْدُ لله الذي يجزي بالإحسان إحساناً وبالسيئات غفراناً وبالصبر نجاةً والحَمْدُ لله هو رجاؤنا حين ينقطع الأمل منّا والحَمْدُ لله الذي لم يتّخذ ولداً ولم يكن له شريكٌ في الملك ولم يكن له وليٌّ من الذل وكبِّره تكبيراً الله أكبر كبيراً والحَمْدُ لله كثيراً وسبحان الله بُكرةً وأصيلاً ولا حولولا قوّة إلا بالله العليّ العظيم آمنت بالله وحده وكفرْت بالجبت والطاغوت وتوكَّلت على الحيّ الذي لا يموت ومن يتوكل على الله فهو حسبه إنَّ الله بالغ أمره قد جعل الله لكلِّ شيءٍ قدْراً سيجعل الله بعد عسرٍ يسراً وتحصّنْتُ بشهادة أن لا إله إلا الله محمد رسول الله صلّى الله عليه وآلهوسلم.',
                        weight: FontWeight.w600,
                        size: isTablet ? _fontSizeTablet : _fontSize,
                      ),
                      ListOfNineVerses(
                        title: 'الهيكل الثاني:',
                        subtitle:
                            'أُعيذُ نفسي بالذي خلق الأرض والسماوات العلى الرحمن على العرش استوى لهمافي السماوات ومافي الأرض وا بينهما وما تحت الثرى وإن تجهر بالقول فإنّه يعلم السِّر وأجفى الله لاإله إلا هو له الأسماء الحسنى منسحر كل ساحر ومكركل ماكر ومن شرِّ كل متكبر فاجر وأُعيذُ حاملها من شر الأشرار وكيد الفجّار وما اختلف عليه اللبل والنهار بقل هو الله أحد الواحد القهّار وأًعيذُهُ بالاسم المخزون المكنون الذي تجبه وتختاره وترضى عمّنّ دعاك به وبالإسم الذي تؤتي به الملك من تشاء وتنزع الملك ممن تشاء وتعزُّ من تشاء وتُذِلُ منتشاء بيدك الخير إنك على كل شيءٍ قديرٌ تولج الليل والنهار وتولجالنهارفي الليل وتُخرِجُ الحي من الميت وتخرج الميت من الحي وترزق من تشاء بغير حساب وصلّى الله على سيدنا محمد وآله وسلم.',
                        weight: FontWeight.w600,
                        size: isTablet ? _fontSizeTablet : _fontSize,
                      ),
                      ListOfNineVerses(
                        title: 'الهيكل الثالث:',
                        subtitle:
                            'أعيذ نفسي بالله الذي لا إله إلا هوالحي القيُّوم لا تأخذه سِنةٌ ولا نوم له ما في السماوات وما في الأرض من ذا الذي يشفع عنده إلا بإذنه يعلم ما بين أيديهم وما خلفهم ولا يحيطون بشيء من علمه إلا بما شاء وسع كرسيه السماوات والأرض ولا يؤوده حفظهما وهو العليّ العظيم آمن الرسول بما أُنزل إليه من ربه والمؤمنون كلٌّ آمن بالله وملائكته وكتبه ورسله لا نفرِّق بين أحدٍ من رسله وقالوا سمعنا وأطعنا غفرانك ربنا وإليك المصير لا بكلِّف الله نفساً إلا وسعها لها ما كسبت وعليها ما اكتسبت ربنا لا تؤاخذنا إن نسينا أو أخطأنا ربنا ولا تحمل علينا إصراً كما حملته على الذين من قبلنا ربنا لا تحمِّلنا ما لا طاقة لنا به واعف عنا واغفر لنا وارحمنا أنتمولانا فانصرنا على القوم الكافرين.',
                        weight: FontWeight.w600,
                        size: isTablet ? _fontSizeTablet : _fontSize,
                      ),
                      ListOfNineVerses(
                        title: 'الهيكل الرابع:',
                        subtitle:
                            'أعيذ نفسي بالذي قال للسماوات والأرض ائتيا طوعا" أو كرها"قالتاأتينا طائعين وأعوذ بالله من  شر كل جبار عنيد وشيطان مريد وجنِّي  شديد قائم أو قاعد في أكل أو شرب  أو نوم  أو اغتسال كلما سمعوابذكر ايات الله تولوا على اعقابهم هربا" أفحسبتم أنما خلقناكم عبثا" وأنكم الينا لا ترجعون وأعيذ حامل كتابي هذا بالاسماء الثمانية المكتوبات في قلب الشمس وبالاسم  الذي أضاءبهالقمر وبالاسم الذي كتب على ورق الشجر الزيتون وألقي في النار فلم  يحترق قل كونوا حجارة أو حديدا" أو خلقا" مما يكبر في صدوركم فسيقولون من يعيدنا  قل الذي فطركم أول مرة وصلى الله على سيدنا محمد واله وسلم.',
                        weight: FontWeight.w600,
                        size: isTablet ? _fontSizeTablet : _fontSize,
                      ),
                      ListOfNineVerses(
                        title: 'الهيكل الخامس:',
                        subtitle:
                            'أعيذ نفسي بالله الذي تجلى للجبل فجعله دكا" وخر موسى صعقا"فلما أفاق قال سبحانك تبت اليك وأناأول المؤمنين وأعوذ بالله من سحر الساحرين  ومكر الماكرين وغدر الغادرين ومن شر كل شيطان لعين ان الذين قالوا ربنا الله ثم استقاموا تتنزل عليهم الملائكة ألا تخافوا ولا تحزنوا وأبشروا بالجنة التي كنتم توعدون وأعوذ بالاسم الذي نزل به الروح الأمين جبرائيل (ع) على النبي محمد(ص) في يوم الاثنين وبما وارت الحجب من جلال جمالك وبما طاف به العرش من  بهاء كمالك وبمنتهى الرحمة من كتابك اكف حامل كتابي هذا من افات الدنيا وعذاب الاخرة انك اهل التقوى واهل المغفرة وصلى الله لى سيدنا محمد واله وسلم.',
                        weight: FontWeight.w600,
                        size: isTablet ? _fontSizeTablet : _fontSize,
                      ),
                      ListOfNineVerses(
                        title: 'الهيكل السادس:',
                        subtitle:
                            'أُعيذ نفسي بالله الذي لا إله سواه منء شر ما يلج في الأرض وما يخرج منها وما ينزل من السماء وما يعرج فيها وهو معكم أين ما كنتم والله بما تعملون بصير له ملك السماوات والأرض وإلى الله ترجع الأمور يولج الليل في النهار ويولج النهار بالليل وهو عليم بذات الصدور وأَعوذ بما استعاذ به آدم أبو البشر وشَيْثٌ وهابيل وإدريس ونوح وهود وصالح وشعيب ولوط وإبراهيم وإسماعيل وإسحاق ويعقوب والأسباط وموسى وهارون وداود وسليمان وأيوب وإلياس واليسع وذو الكفل ويونس وعيسى وذكريا ويحيى والخضر ومحمد خير البشر صلوات الله عليهم أجمعين وبما استعاذ به كل ملك مقرَّب ونبيٍ مرسل إلا ما تباعدتم وتفرَّقتم عن حامل كتابي هذا وصلَّى الله على سيدنا محمد وآله وصحبه وسلم.',
                        weight: FontWeight.w600,
                        size: isTablet ? _fontSizeTablet : _fontSize,
                      ),
                      ListOfNineVerses(
                        title: 'الهيكل السابع:',
                        subtitle:
                            'ُعيذ نفسي وأهلي ومالي وولدي وجيراني وما خوَّلني ربّي وأهل حُزانتي ومن أسدى إليَّ يداًأو عمل معي معروفاً بيده أو لسانه بالله الذي لا إله إلا هو عالم الغيب والشهادة هو الرحمن الرحيم هو الله الذي لا إله إلا هو الملك القدوس السلام المؤمن المهيمن العزيز الجبار المتكبِّر سبحان الله عمّا يشركون هو الله الخالق البارئ المصوِّر له الأسماء الحسنى يسبِّح له ما في السماوات والأرض وهو العزيز الحكيم يا نوز النور يا مدبِّر الأمور الله نور السماوات والأرض مثل نوره كمشكاةٍ فيها مصباح المصباح في زجاجة الزجاجة كأنها كوكب دريّ يوقد من شجرةٍ مباركةٍ زيتونةٍ لا شرْقيّةٍ ولا غرْبيّةٍ يكاد زيتها يضيءُ ولو لم تمسسه نارٌ نورٌ على نورٍ يهدي الله لنوره من يشاء ويضرب الله الأمثال للناس والله بكل شيءٍ عليم إنَّ ربَّك الله الذي خلق السماوات والأرض في ستَّة أيام ثم استوى على العرش يغشي الليل النهار يطلبه حثيثاً والشمس والقمر والنجوم مسخرات بأمره ألا له الخلق والأمر تبارك الله رب العالمين ادعوا ربَّكم تضرُّعاً وخفيةً إنه لا يحبُّ المعتدين ولا تفسدوا في الأرض بعد إصلاحها ادعوه خوفاً وطمعاً إنَّ رحمة الله قريبٌ من المحسنين وصلّى الله على سيدنا محمد وآله الطَّيِّبين الطَّاهرين.',
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
          pushNext: RokaatAljaybLilimamAlridaAalaihAlsalamPage.screenRoute,
          pushBack: HerzMostakhrajMenKitabAllahPage.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الهياكل السبع.mp3',
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
