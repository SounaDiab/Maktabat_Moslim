import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz%20lmoujahidin/herz_alrasoul_wal_aimma_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'herz_alimam_alhadi_page.dart';
import 'herz_alimam_alrida_page.dart';

class HerzAlimamMohamadAljawadPage extends StatefulWidget {
  static String screenRoute = 'herzalimammohamadaljawad_screen';
  HerzAlimamMohamadAljawadPage({super.key});

  @override
  State<HerzAlimamMohamadAljawadPage> createState() =>
      _HerzAlimamMohamadAljawadPageState();
}

class _HerzAlimamMohamadAljawadPageState
    extends State<HerzAlimamMohamadAljawadPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_herzalimammohamadaljawad_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzalimammohamadaljawad_screen', value);
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
          .pushReplacementNamed(HerzAlrasoulWalAimmaPage.screenRoute);
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
                      .addFavorite('حرز الإمام محمد الجواد (ع)',
                          HerzAlimamMohamadAljawadPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'حرز الإمام محمد الجواد (ع)',
                          HerzAlimamMohamadAljawadPage.screenRoute,
                          HerzAlimamMohamadAljawadPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حرز الإمام محمد الجواد (ع)',
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
                Container(
                  child: ListOfNineVerses(
                    title: '',
                    subtitle:
                        '"بسم الله الرحمن الرحيم الحمدالله رب العالمين الرحمن الرحيم مٰلك يوم الدين إياك نعبد وإياك نستعين اهدنا الصراط المستقيم صراط الذين أنعمت عليهم غير المغضوب عليهم ولا الضآلين"، "ألم تر أنَّ الله سخَّر لكم ما في الأرض والفُلك تجري في البحر بأمره ويمسك السمآء أن تقع على الأرض إلّا بإذنه إنَّ الله بالناس لرءوفٌ رحيمٌ".\n\n'
                        'أنت الواحد الملك، الدَّيَّان يوم الدِّين، تفعل ما تشاء بلا مغالبة، وتعطي من تشاء بلا منٍّ، وتفعل ما تشاء، وتحكم ما تريد، وتداول الأيام بين الناس، وتركِّبهم طبقاً عن طبقٍ أسألك باسمك المكتوب على  سُرادق السَّرائر السّابق الفائق الحسن الجميل النَّصير ربِّ الملائكة الثَّمانية، والعرْش الذي لا يتحرّك، وأسألك بالعين التي لا تنام، وبالحياة التي لا تموت، وبنور وجهك الذي لا يُطْفأ، وبالاسم الأكبر الأكبر الأكبر، وبالاسم الأعظم الأعظم الأعظم الذي هو محيط بملكوت السماوات والأرض، وبالاسم الذي أشرقت به الشمس وأضاء به القمر، وسجِّرتْ به البخور، ونصِبَت به الجبال، وبالاسم الذي قام به العرش والكرسيُّ، وباسمك الكتوب على سُرادق العرش، وباسمك المكتوب على سُرادق العزّة. وباسمك المكتوب على سُرادق البهاء، وباسمك المكتوب على سُرادق القدرة، وباسمك العزيز، وبأسمائك المقدَّسات المكرَّمات المخزونات في علم الغيب عندك وأسألك من خيرك خيراً ممَّا أرجو، وأعوذ بعزَّتك وقدرتك من شرِّ ما أخاف وأحذر، وما لا أحذر، يا صاحب محمدٍ يوم حنينٍ، ويا صاحب عليٍّ يوم صفِّين، أنت يا ربِّ مبير الجبّارين، وقاصم المتكبِّرين، أسألك بحقِّ طه وياسين والقرآن العظيم والفرقان الحكيم، أن تصلّي على محمدٍ وآل محمدٍ، وأن تشدَّ به عَضُد صاحب هذا العقد، وأدرأ بك في نحر كلِّ جبّارٍ عنيدٍ، وكلِّ شيطانٍ مريدٍ، وعدوٍ شديدٍ، وعدوٍّ منكرِ الأخلاق، واجعله ممَّن أسلم إليم نفسه، وفوَّضَ إليك أمره، وألجأ إليك ظهره. اللهم بحقِّ هذه الأسماء التي ذكرتها وقرأتها، وأنت أعرف بحقِّها منّي وأسألك يا ذا المنِّ العظيم، الجود الكريم، وليِّ الدَّعوات المستجابات، والكلمات التّامّات، والأسماء النافذات، وأسألك يا نور النّهار، ويا نور الليل، ويا نور السماء والأرض، ونور النور، ونوراً يضيءُ به كلُّ نورٍ، يا عالم الخفيّات كلِّها، في البرِّ والبحر، والأرض والسماء، والجبال، وأسألك يا من لا يفنى، ولا يبيد ولا يزول، ولا له شيءٌ موصوفٌ، ولا إليه حدٌّ منسوبٌ، ولا معه إلٓهٌ ولا إلٓهٌ سواه، ولا له في ملكه شريكٌ، ولا تضاف العِزّة إلّا إليه لم يزل بالعلوم عالماً، وعلى العلوم واقفاً، وللأمور ناظماً، وبالكينونيّة عالماً وللتّدبير محكماً، وبالخلق بصيراً، وبالأمور خبيراً أنت الذي خشعت لك الأصوات، وضلّت فيك الأحلام، وضاقت دونك الأسباب، وملأ كل شيءٍ نورك، ووجِل كلُّ شيءٍ منك، وهرب كلُّ شيءٍ إليك وتوكّل شيءٍ كلُّ شيءٍ عليك وأنت الرفيع في جلالك، وأنت البيُّ في جمالك، وأنت العظيم في قدرتك، وأنت الذي لا يدركك شيءٌ، وأنت العليُّ الكبير العظيم، مجيب الدّعوات، قاضي الحاجات، مفرّج الكربات، وليّ النعمات. يا من هو في علوِّه دانٍ، وفي دنوِّه عالٍ، وفي إشراقه منيرٌ، وفي سلطانه قويٌ، وفي ملكه عزيزٌ، صلِّ على محمدٍ وآل محمدٍ، واحرس صاحب هذا العقظ وهذا الحرز وهذا الكتاب، بعينك التي لا تنام، واكنُفهُ برُكنك الذي لا يرام، وارحمه بقدرتك عليه، فإنّه مرزوقك. بسم الله الرَّحمن الرحيم بسم الله وبالله لا صاحبة له ولا ولد، بسم الله قويِّ الشأن، عظيم البرهان، شديد السُلطان، ما شاء الله كان، وما لم يشأ لم يكن. أشهد أنَّ نوحاً رسول الله وأنَّ إبراهيم خليل الله، وأنَّ موسى كلبم الله، ونجيُه، وأنَّ عيسى ابن مريم (صلوات الله عليه وعليهم أجمعين) روحه وكلمته وأنَّ محمّداً (صلّى الله عليه وآله) خاتم النبيين لا نبيَّ بعده. وأسألك بحقِّ الساعة التي يؤتى فيها بإبليس اللعين يوم القيامة ويقول اللعين في تلك الساعة: والله ما أنا إلّا مهيِّج مردة، الله نور السمٰوات والأرض وهو القاهر وهو الغالب له القدرة السابقة وهو الحكيم الخبير اللهم وأسألك بحقِّ هذه الأسماء كلِّها وصفاتها وصورها.\n\n'
                        'سبحان الذي خلق العرش والكرسيَّ، واستوى عليه، أسألك أن تصرف عن صاحب كتابي هذا كلَّ سوءٍ ومحذورٍ، فهو عبدك وابن عبدك، وابن أمتك، وأنت مولاه فقه. اللهم يا ربَّ ادفع عنه الأسواء كلَّها واقمع عنه أبصار الظالمين، وألسنة المعادين، والمريدين له السُّوء والضُّر، وادفع عنه كلَّ محذورٍ ومخوفٍ، وأيُّ عبدٍ من عبيدك أو أمةٍ من إمائك، أو سلطانٍ ماردٍ، أو شيطانٍ أو شيطانةٍ، أو جنِّيٍ أو جنيَّةٍ، أو غولٍ أو غولةٍ أراد صاحب كتابي هذا بظلم أو ضُرٍّ أو مكرٍ أو مكروهٍ أو كيدٍ أو خديعةٍ أو نكايةٍ أو سِعايةٍ أو فسادٍ أو غرقٍ أو اصطلامٍ أو عطبٍ أو مغالبةٍ أوغدرٍ أو قهرٍ أو هتكِ سترٍ أو اقتدارٍ أو آفةٍ أو عاهةٍ أو قتلٍ أو حرقٍ أو انتقام أو قطع أو سحرٍ أو مسخٍ أو مرضٍ أو سقمٍ أو برصٍ أو جذام أو بؤسٍ أو آفةٍ أو فاقةٍ أو سغبٍ أو عطشٍ أو وسوسةٍ أو نقصٍ في دينٍ أو معيشةٍ فاكفنيه بما شئت، وكيف شئت، وأنّى شئت إنك على كلِّ شيءٍ قديرٌ وصلّى الله على سيِّدنا محمدٍ وآله أجمعين وسلَّم تسليماً كثيراً ولا حول ولا قوة إلا بالله العليِّ العظيم والحمدلله ربِّ العالمين.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HerzAlimamAlhadiPage.screenRoute,
          pushBack: HerzAlimamAlridaPage.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/حرز الإمام محمد الجواد.mp3',
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
