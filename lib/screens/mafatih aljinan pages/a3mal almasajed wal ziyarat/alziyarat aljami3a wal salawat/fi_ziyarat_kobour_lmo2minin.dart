import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:maktabat_almoslim/widgets/she3er.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../alziyarat_aljami3a_walsalawat.dart';
import 'fi_ziyarat_alabna2_al3ozama2.dart';
import 'fi_ziyarat_l2abiya2_l3izam.dart';

class FiZiyaratKobourLmo2minin extends StatefulWidget {
  static String screenRoute = 'fi_ziyarat_kobour_lmo2minin_screen';
  const FiZiyaratKobourLmo2minin({super.key});

  @override
  State<FiZiyaratKobourLmo2minin> createState() =>
      _FiZiyaratKobourLmo2mininState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiZiyaratKobourLmo2mininState extends State<FiZiyaratKobourLmo2minin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_ziyarat_kobour_lmo2minin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_ziyarat_kobour_lmo2minin_screen', value);
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
                          'في زيارة قبور المؤمنين رضي الله عنهم أجمعين',
                          FiZiyaratKobourLmo2minin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في زيارة قبور المؤمنين رضي الله عنهم أجمعين',
                          FiZiyaratKobourLmo2minin.screenRoute,
                          FiZiyaratKobourLmo2minin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في زيارة قبور المؤمنين رضي الله عنهم أجمعين',
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
                      'روى الثّقة الجليل الشّيخ جعفر بن قولويه القمي عن عمرو بن عثمان الرّازي ، قال : سمعت أبا الحسن الامام موسى بن جعفر (عليهما السلام) يقول : من لم يقدر أن يزورنا فليزر صالحي موالينا يكتب له ثواب زيارتنا ، ومن لم يقدر على صلتنا فليصل صالحي موالينا يكتب له ثواب صلتنا.\n\n'
                      'وروى أيضاً بسند صحيح عن محمّد بن أحمد بن يحيى الاشعري قال : كنت بفيد (وهو اسم منزل في طريق مكة) فمشيت مع عليّ بن بلال الى قبر محمّد بن اسماعيل بن بزيع ، قال : فقال لي عليّ بن بلال : قال لي صاحب هذا القبر عن الرّضا (عليه السلام) ، قال : من أتى قبر أخيه المؤمن ثمّ وضع يده على القبر وقرأ (اِنّا اَنْزَلناهُ فى لَيْلَةِ الْقَدْرِ) سبع مرّات ، أمن يوم الفزع الاكبر . ومثله حديث آخر ولكن زاد فيه واستقبل القبلة.\n\n'
                      'أقول : ظاهر الحديث انّ الضّمير في قوله (عليه السلام) أمن يوم الفزع الاكبر راجع الى القاري نفسه ومن المحتمل رجوعه الى صاحب القبر ويؤيد هذا المعنى ما سيأتي من الرّواية عن السّيد ابن طاووس وروي أيضاً في كامل الزّيارة بسند معتبر عن عبد الرحمن بن أبي عبد الله قال : سألت الصّادق (عليه السلام) كيف أضع يدي على قبور المسلمين ؟ فأشار بيده الى الارض فوضعها عليها وهو مستقبل القبلة.\n\n'
                      'وروى أيضاً بسند صحيح عن عبد الله بن سنان قال : قلت للصّادق (عليه السلام) كيف أسلم على أهل القبور ؟ قال : نعم تقول: السَّلامُ على أهْلِ الدِّيار مِنَ المُؤمنين والمسلمين أنتم لنا فرط ونحن إن شاء الله بكم لا حقون ، وعن الحسين  (عليه السلام) قال : من دخل المقابر فقال : اَللّـهُمَّ رَبَّ هذِهِ الاَْرْواحِ الْفانِيَةِ وَالاَْجْسادِ الْبالِيَةِ وَالْعِظامِ النَّخِرَةِ الَّتى خَرَجَتْ مِنَ الدُّنْيا وَهِىَ بِكَ مُؤْمِنَةٌ، اَدْخِلْ عَلَيْهِمْ رَوْحاً مِنْكَ وَسَلاماً مِنّى، كتب الله له بعدد الخلق من لدن آدم الى أن تقوم السّاعة حسنات . وعن عليّ (عليه السلام) قال : من دخل المقابر فقال : بِسْمِ اللهِ الرَّحْمنِ الرَّحيمِ،اَلسَّلامُ عَلى '
                      'اَهْلِ لا اِلـهَ اِلاَّ اللهُ، مِنْ اَهْلِ لا اِلـهَ اِلاَّ اللهُ، يا اَهْلَ لا اِلـهَ اِلاَّ اللهُ، بِحَقِّ لا اِلـهَ اِلاَّ اللهُ، كَيْفَ وَجَدْتُمْ قَوْلَ لا اِلـهَ اِلاَّ اللهُ، مِنْ لا اِلـهَ اِلاَّ اللهُ، يا لا اِلـهَ اِلاَّ اللهُ، بِحَقِّ لا اِلـهَ اِلاَّ اللهُ، اغْفِرْ لِمَنْ قالَ لا اِلـهَ اِلاَّ اللهُ، وَاحْشُرْنا فى زُمْرَةِ مَنْ قالَ لا اِلـهَ اِلاَّ اللهُ، مُحَمَّدٌ رَسُولُ اللهِ عَلِىٌّ وَلِىُّ اللهِ، أعطاه الله سبحانه وتعالى ثواب خمسين سنة وكفّر عنه وعن أبويه سيّئات خمسين سنة.\n\n'
                      'وفي رواية اخرى انّ أحسن ما يقال في المقابر اذا مررت عليه أن تقف وتقول : اَللّـهُمَّ وَلِّهِمْ ما تَوَلَّوْا وَاحْشُرْهُمْ مَعَ مَنْ اَحَبُّوا.\n\n'
                      'وقال السّيد ابن طاووس في مصباح الزّائر : اذا أردت زيارة المؤمنين فينبغي أن يكون يوم الخميس والاّ ففي أيّ وقت شئت وصفتها أن تستقبل القبلة وتضع يدك على القبر وتقول : اَللّـهُمَّ ارْحَمْ غُرْبَتَهُ وَصِلْ وَحْدَتَهُ وَآنِسْ وَحْشَتَهُ وَآمِنْ رَوْعَتَهُ، وَاَسْكِنْ اِلَيْهِ مِنْ رَحْمَتِكَ رَحْمَةً يَسْتَغْنى بِها عَنْ رَحْمَةِ مَنْ سِواكَ، وَاَلْحِقْهُ بِمَنْ كانَ يَتَوَلاّهُ ثمّ اقرأ (اِنّا اَنْزَلْناهُ فى لَيْلَةِ الْقَدْرِ) سبع مرّات.\n\n'
                      'وروي في صفة زيارتهم وثوابها حديث آخر عن فضيل قال : من قرأ اِنّا اَنْزَلْناهُ عند قبر مؤمن سبع مرّات بعث الله اليه ملكاً يبعد الله عند قبره ويكتب للميّت ثواب ما يعمل ذلك الملك فاذا بعثه الله من قبره لم يمر على هول الاّ صرفه الله عنه بذلك الملك حتّى يدخله الجنّة ويقرأ مع (اِنّا اَنْزَلْناهُ) سورة الحمد والمعوّذتين و (قُلْ هُوَ اللهُ اَحَدٌ) وآية الكرسي ثلاث مرّات كلّ سورة.\n\n'
                      'وروي أيضاً في صفة زيارتهم رواية أخرى عن محمّد بن مسلم قال : قلت للصّادق صلوات الله وسلامه عليه نزور الموتى قال : نعم ، قلت : فيعلمون بنا اذا أتيناهم ، قال : اي والله ليعلمون بكم ويفرحون بكم وليستأنسون اليكم ، قال : قلت : فأيّ شيء نقول اذا أتيناهم ؟ قال : قُل :\n\n'
                      'اَللّـهُمَّ جافِ الاَْرْضَ عَنْ جُنُوبِهِمْ، وَصاعِدْ اِلَيْكَ اَرْواحَهُمْ، وَلَقِّهِمْ مِنْكَ رِضْواناً، وَاَسْكِنْ اِلَيْهِمْ مِنْ رَحْمَتِكَ ما تَصِلُ بِهِ وَحْدَتَهُمْ وَتُونِسُ بِهِ وَحْشَتَهُمْ، اِنَّكَ عَلى كُلِّ شَىْء قَديرٌ.\n\n'
                      'ثم قال السّيد : فاذا كنت بين القبور فاقرأ (قُلْ هُوَ اللهُ اَحَدٌ) احدى عشر مرّة واهد ذلك لهم ، فقد روي انّ الله يثيبه على عدد الاموات.\n\n'
                      'وروي في كامل الزّيارة عن الصّادق (عليه السلام) قال : اذا زُرتم موتاكم قبل طلوع الشمس سمعوا وأجابوكم واذا زُرتموهم بعد طلوع الشمس سمعوا ولم يجيبوكم.\n\n'
                      'وقد روي في كتاب الدّعوات للرّاوندي حديث عن رسول الله (صلى الله عليه وآله وسلم) في كراهة زيارة الاموات ليلاً ، كما قال لابي ذر : ولا تزُرهم احياناً بالليل.\n\n'
                      'وروي في مجموعة الشّيخ الشّهيد عن رسول الله (صلى الله عليه وآله وسلم) قال : لا يقول أحد عند قبر ميّت ثلاث مرّات اَللّـهُمَّ اِنّى اَسْاَلُكَ بِحَقِّ مُحَمَّد وَآلِ مُحَمَّد اَنْ لا تُعَذِّبَ هـذَا الْمَيِّتَالاّ واقصى الله عنه عذاب يوم القيامة.\n\n'
                      'وعن جامع الاخبار عن بعض أصحاب النّبي (صلى الله عليه وآله وسلم) قال : قال رسول الله (صلى الله عليه وآله وسلم) : اهدوا لموتاكم ، فقلنا : يا رسول الله وما نهدي الاموات ؟ قال : الصّدقة والدّعاء ، وقال : انّ أرواح المؤمنين تأتي كلّ جمعة الى السّماء الدّنيا بحذاء دورهم وبيوتهم ينادى كلّ واحد منهم بصوت حزين باكين : يا أهلي ويا ولدي ويا أبي ويا أمّي واقربائي اعطفوا علينا يرحمكم الله بالّذي كان في أيدينا والويل والحساب علينا والمنفعة لغيرنا، وينادي كلّ واحد منهم الى أقربائه : اعطفوا علينا بدرهم أو رغيف أو بكسوة يكسوكم الله من لباس الجنّة، ثمّ بكى النّبي (صلى الله عليه وآله وسلم) '
                      'وبكينا معه ، فلم يستطع النّبي (صلى الله عليه وآله وسلم)أن يتكلّم من كثرة بكائه ، ثمّ قال (صلى الله عليه وآله وسلم) : اولئك اخوانكم في الدين فصاروا تراباً رميماً بعد السّرور والنعيم فينادون بالويل والثّبور على أنفسهم ، يقولون : يا ويلنا لو أنفقنا ما كان في أيدينا في طاعة الله ورضائه ما كنّا نحتاج اليكم ، فيرجعون بحسرة وندامة وينادون : أسرعوا صدقة الاموات.\n\n'
                      'وروي عنه أيضاً قال : ما تصدّقت لميّت فيأخذها ملك في طبق من نور ساطع ضوؤها يبلغ سبع سماوات ثمّ يقوم على شفير الخندق فينادي : اَلسَّلامُ عَلَيْكُمْ يا اَهْلَ الْقُبُورِ اهلكم اهدوا اليكم بهذه الهديّة ، فيأخذها ويدخل بها في قبره توسع عليه مضاجعه ، فقال (صلى الله عليه وآله وسلم) : ألا مَن أعطف لميّت بصدقة فله عند الله من الاجر مثل اُحُد ويكون يوم القيامة في ظلّ عرش الله يوم لا ظلّ الاّ ظلّ العرش وحيّ وميّت نجا بهذه الصّدقة.\n\n'
                      'وحكى انّ والي خراسان شوهد في المنام وهو يقول : ابعثوا اليّ ما تطرحونه الى الكلاب فانّي مفتقر اليه.\n\n'
                      'واعلم انّ لزيارة قبور المؤمنين أجراً جزيلاً وهي على ما له من جزيل الاجر ذات فوائد وآثار عظيمة فهي تورث العبرة والانتباه والزّهد والاعراض عن الدّنيا والرّغبة في الاخرة وينبغي زيارة المقابر اذا اشتدّ السّرور أو الغم . فالعاقل من اتّخذ المقابر عبرة ينزع بها حلاوة الدّنيا من قلبه ويحوّل شهدها مرّاً في ذائقته وتفكّر في فناء الدّنيا وتقلّب أحواله واستحضر بالبال انّه هو نفسه سيكون عمّا قريب مثلهم ويقصر يده عن الصّالحات ويكون عبرة لغيره.\n\n'
                      'ولقد أجاد الشّيخ النّظامي في قوله :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle: 'زنده دلى در صف افسردگان   رفت بهمسايگى مردگان\n\n'
                      'حرف فنا خواند ز هر لوح پاك   روح بقا جُست ز هر روح پاك\n\n'
                      'كارشناسى پى تفتيش حال   كرد از او بر سر راهى سؤال\n\n'
                      'كين همه از زنده رميدن چراست   رخت سوى مرده كشيدن چراست\n\n'
                      'گفت پليدان بمغاك اندرند   پاك نهادان تَهِ خاك اندرند\n\n'
                      'مرده دلانند بروى زمين   بهر چه با مرده شوم همنشين\n\n'
                      'همدمى مرده دهد مردگى   صحبت افسرده دل افسردگى\n\n'
                      'زير گِل آنانكه پراكنده اند   گر چه بتن مرده بدِل زنده اند\n\n'
                      'مرده دلى بود مرا پيش از اين   بسته هر چون وچرا پيش از اين\n\n'
                      'زنده شدم از نظر پاكشان   آب حياتست مرا خاكشان\n\n'
                      'وَقُلْ اِنّى لاحِقٌ بِهِمْ فِى اللاّحِقينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiZiyaratL2abiya2L3izam.screenRoute,
          pushBack: FiZiyaratAlabna2Al3ozama2.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الصلاة على في زيارة قبور المؤمنين.mp3',
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
