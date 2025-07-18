import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'ayat_lkorsi_page.dart';
import 'herz_altaj_page.dart';

class DouaaNadiAalyanMozhiraAlaajaibPage extends StatefulWidget {
  static String screenRoute = 'douaanadiaalyanmozhiraalaajaib_screen';
  DouaaNadiAalyanMozhiraAlaajaibPage({super.key});

  @override
  State<DouaaNadiAalyanMozhiraAlaajaibPage> createState() =>
      _DouaaNadiAalyanMozhiraAlaajaibPageState();
}

class _DouaaNadiAalyanMozhiraAlaajaibPageState
    extends State<DouaaNadiAalyanMozhiraAlaajaibPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_douaanadiaalyanmozhiraalaajaib_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_douaanadiaalyanmozhiraalaajaib_screen', value);
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
                      .addFavorite('دعاء ناد علياً مظهر العجائب',
                          DouaaNadiAalyanMozhiraAlaajaibPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء ناد علياً مظهر العجائب',
                          DouaaNadiAalyanMozhiraAlaajaibPage.screenRoute,
                          DouaaNadiAalyanMozhiraAlaajaibPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء ناد علياً مظهر العجائب',
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
                        '_ عندما يتعرَّض المؤمن إلى معضلات كبيرة يقرأ هذا الدعاء (7 مرات) بنيّة خالصة ليخلصه الله منها.\n'
                        '_ عندما يدخل على ظالم يقرأ هذا الدعاء (3 مرات) ثم ينفخ ويمسح على بدنه فيأمن من شرّه بإذن الله.\n'
                        '_ لطلب الذريّة: يداوم على قراءته فيدخل في عناية الله.\n'
                        '_ لكسب محبة شخص ما: يقرأ ليلة الجمعة (14 مرة) على اسم الشخص ويصلي على محمد وآله (100 مرة).\n'
                        '_ لجلب الرزق والمال: يقرأ الدعاء (9 مرات) بعد صلاة الصبح.\n'
                        '_ لسداد الديون: يقرأ كل يوم (22 مرة) لمدة 15 يوم.\n'
                        '_ لتسهيل الولادة: يقرأ الدعاء (5 مرات) على كأس من الماء ثم يشرب بعد ذلك.\n'
                        '_ حفظ هذا الدعاء في الجَيْب يحمي منشر الحيوانات والجن والإنس.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        child: Center(
                          child: Text(
                            'بسم الله الرحمن الرحيم',
                            style: TextStyle(
                              fontSize: isTablet ? _fontSizeTablet : _fontSize,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      ListOfNineVerses(
                        title: '',
                        subtitle:
                            'اللهم انت الذي استجبت لآدم وحواء اذ قالا ربنا ظلمنا انفسنا فان لم تغفر لنا وترحمنا لنكونن من الخاسرين. وناداك نوح فاستجبت له ونجيته واهله من الكرب العظيم. واطفات نار نمرود عن خليلك ابراهيم، فجعلتها برداً وسلاماً.\n'
                            'وانت الذي استجبت لأيوب اذ نادى: ربي مسني الضر وانت ارحم الراحمين، فكشفت ما به من ضر وآتيته اهله ومن معه رحمةً من عندك وذكرى لأولي الألباب. وانت الذي استجبت لذي النون اذ ناداك في الظلمات ان لا اله الا انت سبحانك اني كنت من الظالمين، فنجيته من الغم. وانت الذي استجبت لموسى وهرون حين قلت: قد اجيبت دعوتكما فاستقيما، واغرقت فرعون وقومه. وغفرت لداود ذنبه وتبت عليه رحمةً منك وذكرى. وفديت اسماعيل بذبح بعدما اسلم وتله للجبين فناديته بالفرج والروح. وانت الذي ناداك زكريا نداء خفياً فقال: ربي اني وهن العظم مني واشتعل الرأس شيباً ولم اكن بدعائك ربي شقياً. وقلت: يدعوننا رغباً ورهباً وكانوا لنا خاشعين. وانت الذي استجبت للذين آمنوا وعملوا الصالحات، لتزيدهم من فضلك فلا تجعلني من اهون الداعين لك والراغبين اليك واستجب لي كما استجبت لهم بحقهم عليك، وطهرني بتطهيرك، وتقبل صلاتي ودعائي بقبول حسن، وطيب بقية حياتي، وطيب وفاتي، واخلفني فيمن اخلف، واحفظني يا ربي بدعائي واجعل ذريتي ذرية طيبةً تحوطها بحياطتك بكل ما حطت به ذرية احد من اوليائك واهل طاعتك، برحمتك يا ارحم الراحمين، يا من هو على كلِّ شيءٍ رقيبٌ، ولكلِّ داعٍ من خلقك مجيب، ومن كل سائل قريب، أسألك يا لا إله إلا أنت الحيُّ القيُّوم الأحد الصَّمد، الذي لم يلد ولم يولد ولم يكن له كفواً أحد، وبكل اسم رفعْت به أسمائك وفرشت به أرضك وأرسيت به الجبال، وأجريت به الماء، وسخَّرت به السحاب والشمس والقمر والنجوم والليل والنهار، وخلقتوالخلائق كلَّها، أسألك بعظمة وجهك العظيم الذي أشرقت له السماوات والأرض فأضاءت به الظلمات، إلا صلَّيت على محمد وآل محمد وكفيتني أمر معاشي ومعادي، وأصلحت لي شأني كلُّه، ولم تكلني إلى نفسي طرفة عين، وأصلحت أمري وأمر عيالي، وكفيتني همهم وأغنيتني  وإياهم من كنزك زخزائنك، وسعة فضلك الذي لا ينفذ أبداً، وأثبت في قلبي ينابيع الحكمة التي تنفعني بها وتنفع بها من ارتضيت من عبادك، واجعل لي من المتَّقين في آخر الزمان إماماً، كما جعلت إبراهيم الخليل إماماً، فإنَّ بتوفيقك يفوز الفائزون ويتوب التائبون ويعبدك العابدون، وبتسديدك يصلح الصَّالحون، المحسنون المخبتون، العابد لك، الهائفون منك، وبإرشادك نجا الناجون من نارك، وأشفق منها المشفقون من خلقك، وبخذلانك خسر المبطلون وهلك الظالمون وغفل الغافلون، اللهم وآت نفسي تقواها فأنت وليُّها ومولاها، وأنت خير من زكَّاها. اللهم بيِّن لها هداها، وألهمها تقواها، وبشرّها برحمتك حين تتوفاها، ونزِّلها من الجنان عُلياها، وطيِّب وفاتها ومحياها، وأكرم منقلبها ومثواها، ومستقرها ومأواها، فأنت وليُّها ومولاها.\n\n'
                            'ثم يقول: لا إله إلا الله (١٠٠ مرة) _ الصلاة على محمد وآله (١٠٠ مرة) _ يا مفرِّج الهم (١٠٠ مرة) _ يا شافي كل مريض (١٠٠ مرة) _ يا قاضي الحاجات (١٠٠ مرة).',
                        weight: FontWeight.w600,
                        size: isTablet ? _fontSizeTablet : _fontSize,
                      ),
                      ListOfNineVerses(
                        title: '',
                        subtitle: 'ثم يقرأ الدعاء الآتي:',
                        weight: FontWeight.w400,
                        size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            'بسم الله الرحمن الرحيم',
                            style: TextStyle(
                              fontSize: isTablet ? _fontSizeTablet : _fontSize,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      ListOfNineVerses(
                        title: '',
                        subtitle:
                            'ناد علياً مظهر العجائب تجده عوناً لك في النوائب لي إلى الله حاجتي وعليه معوَّلي كلَّما أمرته ورميت منقضي في ظلِّ الله ويظلل الله لي أدعوك كلَّ همِّ وغمِّ سينجلي بعظمتك يا الله بنبوَّتك يا محمد بولايتك يا عليُّ يا عليُّ يا عليُّ أدركني بحق لطفك الخفيِّ الله أكبر أنا من شر أعدائك بريء الله صمدي من عندك مددي وعليك معتمدي بحقِّ إياك نعبد وإياك نستعين يا أبا الغيث أغثني يا أبا الحسنين أدركني يا سيف الله أدركني يا باب الله أدركني بحقِّ لطفك الخفيِّ يا قهَّار يا قاهر العدوِّ يا والي الولي يا مظهر العجائب يا مرتضى عليٌّ رميت من بغى عليَّ بسهم الله وسيف الله القاتل أفوِّض أمري إلى الله إن الله بصير بالعباد وإلهكم إله واحد لا إله إلا هو الرحمن الرحيم أدركني يا غياث المستغيثين يا دليل المتحيرين يا أمان الخائفين يا معين المتوكلين يا راحم المساكين يا إله العالمين برحمتك وصلَّى الله على سيدنا محمد وآله أجمعين والحمد لله ربِّ العالمين.',
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
          pushNext: AyatLkorsiPage.screenRoute,
          pushBack: HerzAltajPage.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء ناد علياً مظهر العجائب.mp3',
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
