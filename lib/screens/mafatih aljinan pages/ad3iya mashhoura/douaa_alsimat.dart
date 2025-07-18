import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iya_mashhoura.dart';
import 'douaa_al3asharat.dart';
import 'douaa_almashlol.dart';

class DouaaAlsimat extends StatefulWidget {
  static String screenRoute = 'douaa_alsimat_screen';
  const DouaaAlsimat({super.key});

  @override
  State<DouaaAlsimat> createState() => _DouaaAlsimatState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _DouaaAlsimatState extends State<DouaaAlsimat> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_alsimat_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_alsimat_screen', value);
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
                      .addFavorite('دعاء السمات', DouaaAlsimat.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء السمات', DouaaAlsimat.screenRoute,
                          DouaaAlsimat.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء السمات',
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
                      'المعروف بدعاء الشّبور، ويستحبّ الدّعاء به في آخر ساعة من نهار الجمعة ولا يخفى انّه من الادعية المشهورة وقد واظب عليه اكثر العلماء السّلف وهو مرويّ في مصباح الشّيخ الطّوسي، وفي جمال الاسبوع للسيّد ابن طاووس وكتب الكفعمي باسناد معتبرة عن محمّد بن عثمان العمري رضوان الله عليه وهو من نوّاب الحجّة الغائب (عليه السلام) وقد روي الدعاء أيضا عن الباقر والصّادق (عليهما السلام) ورواه المجلسي (رحمه الله)، في البحار فشرحه، وهذا هو الدّعاء على رواية المصباح للّشيخ :',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'اللّـهمَّ انّى اسأَلك باسمك العظيم الاْعظم الاْعزِّ الاْجلِّ الاْكرم الَّذى اذا دعيت به على مغالق ابواب السَّمآء للفتح بالرَّحمة انفتحت، واذا دعيت به على مضآئِق ابواب الاْرض للفرج انفرجت، واذا دعيت به على العسر لليسر تيسَّرت، واذا دعيت به على الاْموات للنُّشور انتشرت، واذا دعيت به على كشف البأسآء والضَّرّاء انكشفت، وبجلال وجهك الكريم اكرم الوجوه واعزِّ الوجوه الَّذى عنت له الوجوه وخضعت له الرِّقاب وخشعت له الاْصوات ووجلت له القلوب من مخافتك، وبقوَّتك الَّتى بها تمسك السَّمآء ان تقع على الاْرض إلاّ باذنك، وتمسك السَّماوات والاْرض ان تزولا، وبمشيَّتك الَّتى دان (كان) لها العالمون، وبكلمتك الَّتى خلقت بها السَّماوات والاْرض، وبحكمتك الَّتى صنعت بها العجآئِب وخلقت بها الظُّلمة وجعلتها ليلا وجعلت اللَّيل سكنا (مسكنا) وخلقت بها النُّور وجعلته نهارا وجعلت النَّهار نشورا مبصرا، وخلقت بها الشَّمس وجعلت الشَّمس ضيآء، وخلقت بها القمر وجعلت القمر نورا، وخلقت بها الكواكب وجعلتها نجوما وبروجا ومصابيح وزينة ورجوما، وجعلت لها مشارق ومغارب وجعلت لها مطالع ومجارى، وجعلت لها فلكا ومسابـح وقدَّرتها فى السَّمآء منازل فاحسنت تقديرها، وصوَّرتها فاحسنت تصويرها واحصيتها باسمآئِك احصآء ودبَّرتها بحكمتك تدبيرا فأحسنت تدبيرها وسخَّرتها بسلطان اللَّيل وسلطان النَّهار والسّاعات وعدد السِّنين والحساب، وجعلت رؤْيتها لجميع النّاس مرئً واحدا واسأَلك اللّهمَّ بمجدك الَّذى كلَّمت به عبدك ورسولك موسى بن عمران عليه السَّلام فى المقدَّسين فوق احساس الكرُّوبين (الكرُّوبيّين) فوق غمآئِم النُّور فوق تابوت الشَّهادة فى عمود النّار وفى (والى) طور سينآء وفى جبل حوريث فى الواد المقدَّس فى البقعة المباركة من جانب الطُّور الاْيمن من الشَّجرة وفى ارض مصر بتسع ايات بيِّنات، ويوم فرقت لبنى اسرآئيل البحر وفى المنبجسات الَّتى صنعت بها العجآئِب فى بحر سوف، وعقدت مآء البحر فى قلب الغمر كالحجارة، وجاوزت ببنى اسرائيل البحر وتمَّت كلمتك الحسنى عليهم بما صبروا واورثتهم مشارق الاْرض ومغاربها الَّتى باركت فيها للعالمين، واغرقت فرعون وجنوده ومراكبه فى اليمِّ، و باسمك العظيم الاْعظم الاْعزِّ الاْجلِّ الاْكرم وبمجدك الَّذى تجلَّيت به لموسى كليمك عليه السَّلام فى طور سيناء، ولاِبراهيم عليه السَّلام خليلك من قبل فى مسجد الخيف، ولاِسحق صفيِّك عليه السَّلام فى بئْر شيع (سبع) وليعقوب نبيِّك عليه السَّلام فى بيت ايل، واوفيت لاِبراهيم عليه السَّلام بميثاقك ولاِسحق بحلفك وليعقوب بشهادتك وللمؤْمنين بوعدك وللدّاعين باسمائِك فاجبت، وبمجدك الَّذى ظهر لموسى بن عمران عليه السَّلام على قبَّة الرُّمّان (الزَّمان) وباياتك الَّتى وقعت على ارض مصر بمجد العزَّة والغلبة بايات عزيزة و بسلطان القوَّة وبعزَّة القدرة وبشأْن الكلمة التّآمَّة، وبكلماتك الَّتى تفضَّلت بها على اهل السَّماوات والاْرض واهل الدُّنيا واهل الاخرة، وبرحمتك الَّتى مننت بها على جميع خلقك، وباستطاعتك الَّتى اقمت بها على العالمين، وبنورك الَّذى قد خرَّمن فزعه طور سينآء، وبعلمك وجلالك وكبريآئِك و عزَّتك وجبروتك الَّتى لم تستقلَّها الاْرض وانخفضت لها السَّماوات وانزجر لها العمق الاْكبر، وركدت لها البحار والاْنهار، و خضعت لها الجبال وسكنت لها الاْرض بمناكبها، واستسلمت لها الخلائِق كلُّها، و خفقت لها الرِّياح فى جريانها، وخمدت لها النّيران فى اوطانها، وبسلطانك الَّذى عرفت لك به الغلبة دهر الدُّهور وحمدت به فى السَّماوات والاْرضين، وبكلمتك كلمة الصِّدق الَّتى سبقت لاِبينا ادم عليه السَّلام وذرِّيَّته بالرَّحمة واسأَلك بكلمتك الَّتى غلبت كلَّ شىء، وبنور وجهك الَّذى تجلَّيت به للجبل فجعلته دكّا وخرَّ موسى صعقا، وبمجدك الَّذى ظهر على طور سينآء فكلَّمت به عبدك ورسولك موسى بن عمران، وبطلعتك فى ساعير وظهورك فى جبل فاران بربوات المقدَّسين وجنود الملائِكة الصّافّين وخشوع الملائِكة المسبِّحين، وببركاتك الَّتى باركت فيها على ابراهيم خليلك عليه السَّلام فى امَّة محمَّد صلَّى الله عليه وآله، وباركت لاِسحق صفيِّك فى امَّة عيسى عليهما السَّلام، وباركت ليعقوب اسرآئيلك فى امَّة موسى عليهما السَّلام، وباركت لحبيبك محمَّد صلَّى الله عليه وآله فى عترته وذرِّيَّته وامَّته، اللّـهمَّ وكما غبنا عن ذلك ولم نشهده وآمنّا به ولم نره صدقا وعدلا ان تصلِّى على محمَّد وآل محمَّد وان تبارك على محمَّد وآل محمَّد وترحَّم على محمَّد وآل محمَّد كافضل ما صلَّيت وباركت وترحَّمت على ابراهيم وآل ابراهيم انَّك حميد مجيد فعّال لما تريد وانت على كلِّ شىء قدير (شهيد) .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'ثمَّ تذكر حاجتك وتقول :',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'اللّـهمَّ بحقِّ هذا الدُّعآء، وبحقِّ هذه الاْسمآء الَّتى لا يعلم تفسيرها ولا يعلم باطنها غيرك صلِّ على محمَّد وآل محمَّد وافعل بى ما انت اهله، ولا تفعل بى ما انا اهله واغفر لى من ذنوبى ما تقدَّم منها وما تأَخَّر، ووسِّع علىَّ من حلال رزقك واكفنى مؤُنة انسان سوء، وجار سوء وقرين، سوء وسلطان سوء، انَّك على ما تشآء قدير وبكلِّ شيء عليم آمين ربَّ العالمين .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'أقول في بعض النسخ بعد وانت على كلِّ شىء قدير ثمّ اذكر حاجتك وقل :',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'يا الله يا حنّان يا منّان يا بديع السَّماوات والارض، يا ذا الجلال والاكرام، يا ارحم الرّاحمين اللّهمَّ بحقِّ هذا الدُّعآء .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'إلى آخر الدّعاء، وروى المجلسي عن مصباح السيّد ابن باقي انه قال: قل بعد دعاء السمات :',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'اللّـهمَّ بحقِّ هذا الدُّعآء وبحقِّ هذه الاْسمآء الَّتى لا يعلم تفسيرها ولا تأْويلها ولا باطنها ولا ظاهرها غيرك ان تصلِّى على محمَّد وآل محمَّد وان ترزقنى خير الدُّنيا والاخرة .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'ثمّ اطلب حاجتك وقل :',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وافعل بى ما انت اهله ولا تفعل بى ما انـا اهله، وانتقم لى من فلان بن فلان وسمّ عدوّك واغفر لى من ذنوبى ما تقدَّم منها وما تأَخَّر، ولوالدىَّ ولجميع المؤْمنين والمؤْمنات، ووسِّع علىَّ من حلال رزقك واكفنى مؤُنة، انسان سوء، وجار سوء، وسلطان سوء، وقرين سوء، ويوم سوء، وساعة سوء، وانتقم لى ممَّن يكيدنى وممَّن يبغى علىَّ ويريد بى وباهلى واولادى واخوانى وجيرانى وقراباتى من المؤْمنين والمؤْمنات ظلما انَّك على ما تشآء قدير وبكلِّ شىء عليم آمين ربَّ العالمين .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'ثمّ قل :',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'اللّـهمَّ بحقِّ هذا الدُّعآء تفضَّل على فقرآء المؤْمنين والمؤْمنات بالغنى والثَّروة، وعلى مرضى المؤْمنين والمؤْمنات بالشِّفآء والصِّحة، وعلى احيآء المؤْمنين والمؤْمنات باللُّطف والكرامة، وعلى اموات المؤْمنين والمؤْمنات بالمغفرة والرَّحمة، وعلى مسافرى المؤْمنين والمؤْمنات بالرَّدِّ الى اوطانهم سالمين غانمين برحمتك يا ارحم الرّاحمين وصلَّى الله على سيِّدنا محمَّد خاتم النَّبيّين وعترته الطّاهرين وسلَّم تسليما كثيرا .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وقال الشّيخ ابن فهد: يستحبّ أن تقول بعد دعاء السّمات :',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'اللّـهمَّ انّى اسأَلك بحرمة هذا الدُّعآء وبمافات منه من الاْسمآء وبما يشتمل عليه من التَّفسير والتَّدبير الَّذى لايحيط به الاّ انت ان تفعل بى كذا وكذا . وتذكر حاجتك عوض كذا وكذا .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: DouaaAlmashlol.screenRoute,
        pushBack: DouaaAl3asharat.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء السمات.mp3',
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
