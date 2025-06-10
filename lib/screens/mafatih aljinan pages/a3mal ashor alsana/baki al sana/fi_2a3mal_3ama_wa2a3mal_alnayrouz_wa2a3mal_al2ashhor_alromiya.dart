import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../baki_alsana.dart';
import 'fi_shaher_rabi3_alsani_waljamada_al2oula_wal2a5ira.dart';
import 'fi_shaher_zilko3da.dart';

class Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya
    extends StatefulWidget {
  static String screenRoute =
      'fi_2a3mal_3ama_wa2a3mal_alnayrouz_wa2a3mal_al2ashhor_alromiya_screen';
  const Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya({super.key});

  @override
  State<Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya> createState() =>
      _Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiyaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiyaState
    extends State<Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_2a3mal_3ama_wa2a3mal_alnayrouz_wa2a3mal_al2ashhor_alromiya_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_2a3mal_3ama_wa2a3mal_alnayrouz_wa2a3mal_al2ashhor_alromiya_screen',
        value);
  }

    Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(BakiAlsana.screenRoute);
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
                          'في أعمال عامة وأعمال النيروز وأعمال الأشهر الرومية',
                          Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في أعمال عامة وأعمال النيروز وأعمال الأشهر الرومية',
                          Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya
                              .screenRoute,
                          Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya
                              .screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في أعمال عامة وأعمال النيروز وأعمال الأشهر الرومية',
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
                padding: EdgeInsets.all(20),
                child: Text(
                  'أمّا أعمال عامّة الشّهور فعديدة :',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أوّلها :',
                  subtitle:
                      'الدّعاء عند رؤية الهلال بالادعية المأثورة وأفضلها الدّعاء الثّالث والاربعون من الصّحيفة الكاملة المذكور في خلال أعمال غرّة شهر رمضان (ص216).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle: 'قراءة الحمد سبع مرّات لدفع وجع العين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle:
                      'أكل شيء من الجبن وروي انّ من يعتمد أكله رأس الشّهر أوشك أن لا تردّ له حاجة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle:
                      'أن يصلّي في اللّيلة الاولى من الشّهر ركعتين يقرأ بعد الحمد في كلّ منهما سورة الانعام ويسأل الله أن يكفيه كلّ خوف ووجع وأن لا يرى في ذلك الشّهر ما يكرهه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'أن يصلّي في اوّل يوم من الشّهر ركعتين يقرأ في الاولى بعد الحمد التّوحيد ثلاثين مرّة وفي الثّانية بعد الحمد القدر وثلاثين مرّة ثمّ يصتدّق بما تيسّر فاذا فعل ذلك فقد اشترى السّلامة في ذلك الشّهر وزاد في بعض الرّوايات وتقول اذا فرغت من الرّكعتين :\n\n'
                      'بِسْمِ اللهِ الرَّحْمنِ الرَّحيمِ وَما مِنْ دابَّة فِى الاَْرْضِ الاّ عَلَى اللهِ رِزْقُها وَيَعْلَمُ مُسْتَقَرَّها وَمُسْتَوْدَعَها كُلٌّ فى كِتاب مُبين.\n\n'
                      'بِسْمِ اللهِ الرَّحْمنِ الرَّحيمِ وَاِنْ يُمْسَسْكَ اللهُ بِضُرٍّ فَلا كاشِفَ لَهُ اِلاّ هُوَ وَاِنْ يُرِدْكَ بِخَيْر فَلا رادَّ لِفَضْلِهِ يُصيبُ بِهِ مَنْ يَشآءُ مِنْ عِبادِهِ وَهُوَ الْغَفُورُ الرَّحيمُ.\n\n'
                      'بِسْمِ اللهِ الرَّحْمنِ الرَّحيمِ سَيَجْعَلُ اللهُ بَعْدَ عُسْر يُسْراً ما شآءَ اللهُ لا قُوَّةَ اِلاّ بِاللهِ حَسْبُنَا اللهُ وَنِعْمَ الْوَكيلُ وَاُفَوِّضُ اَمْرى اِلَى اللهِ اِنَّ اللهَ بَصيرٌ بِالْعِبادِ لا اِلـهَ اِلاّ اَنْتَ سُبْحانَكَ اِنّى كُنْتَ مِنْ الظّالِمينَ رَبِّ اِنّى لِما اَنْزَلْتَ اِلَىَّ مِنْ خَيْر فَقيرٌ رَبِّ لا تـَذَرْنى فَرْداً وَاَنْتَ خَيْرُ الْوارِثينَ.\n\n',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أعمال يوم النّيروز :',
                  subtitle:
                      'وأمّا أعمال يوم النّيروز فهي ما علّمها الصّادق (عليه السلام) مُعلّى بن خنيس قال : اذا كان يوم النّيروز فاغتسل والبس ثيابك وتطيّب بأطيب طيبك وتكون ذلك اليوم صائماً فاذا صلّيت النّوافل والظّهر والعصر فصلّ بعد ذلك أربع ركعات أي بسلامين يقرأ في أوّل ركعة فاتحة الكتاب وعشر مرّات اِنّا اَنْزَلْناهُ وفي الثّانية فاتحة الكتاب وعشر مرّات قُلْ يا اَيُّها الْكافِرُونَ وفي الثّالثة فاتحة الكتاب وعشر مرّات قُلْ هُوَ اللهُ اَحَدٌ وفي الرّابعة فاتحة الكتاب وعشر مرّات قُلْ اَعُوذُ بِرَبِّ الْفَلَقِ وَقُلْ اَعُوذُ بِرَبِّ النّاسِ وتسجد بعد فراغك من الرّكعات فتقول :\n\n'
                      'اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد الاَْوْصِيآءِ الْمَرْضِيِّينَ وَعَلى جَمِيعِ اَنْبِيآئِكَ وَرُسُلِكَ بِاَفْضَلِ صَلَواتِكَ وَبارِكَ عَلَيْهِمْ بِاَفْضَلِ بَرَكاتِكَ وَصَلِّ عَلى اَرْواحِهِمْ وَاَجْسادِهِمْ اَللّـهُمَّ بارِكْ عَلى مُحَمَّد وَآلِ مُحَمَّد وَبارِكْ لَنا فى يَوْمِنا هذَا الَّذى فَضَّلْتَهُ وَكَرَّمْتَهُ وَشَرَّفْتَهُ وَعَظَّمْتَ خَطَرَهُ اَللّـهُمَّ بارِكْ لى فيـما اَنْعَمْتَ بِهِ عَلَىَّ حَتّى لا اَشْكُرَ اَحَداً غَيْرَكَ وَوَسِّعْ عَلَىَّ فى رِزْقِى يا ذَا الْجَلالِ وَالاِْكْرامِ اَللّـهُمَّ ما غابَ عَنّى فَلا يَغيبَنَّ عَنّى عَوْنُكَ وَحِفْظُكَ وَما فَقَدْتُ مِنْ شَىْء فَلا تُفْقِدْنِى عَوْنَكَ عَلَيْهِ حَتّى لا اَتَكَلَّفَ ما لا اَحْتاجُ اِلَيْهِ يا ذَا الْجَلالِ وَالاِْكْرامِ.\n\n'
                      'يغفر لك ذنوب خمسين سنة وتكثر من قولك يا ذَا الْجَلالِ وَالاِْكْرامِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أعمال الشّهور الرّومية :',
                  subtitle:
                      'وأمّا أعمال الشّهور الرّومية فنقتصر منها هُنا على ما في كتاب زاد المعاد :\n\n'
                      'روى السّيد الجليل عليّ ابن طاوس (رحمه الله) انّ قوماً من الاصحاب كانوا جلوساً اذ دخل عليهم رسول الله (صلى الله عليه وآله وسلم) فسلّم عليهم فردّوا عليه السّلام فقال : ألا أعلّمكم دواءاً علّمني جبرئيل (عليه السلام) حيث لا أحتاج الى دواء الاطبّاء وقال علي (عليه السلام)وسلمان وغيرهم : وما ذاك الدّواء ؟ فقال النّبي (صلى الله عليه وآله وسلم) لعليّ (عليه السلام) : تأخذ من ماء المطر بنيسان وتقرأ عليه كلاًّ من فاتحة الكتاب وآية الكرسي وقُلْ هُوَ اللهُ اَحَدٌ وقُلْ اَعُوذُ بِرَبِّ الْفَلَقِ وَقُلْ اَعُوذُ بِرَبِّ النّاسِ وقُلْ يا اَيُّها الْكافِرُونَ سَبيعن مرّة وزادت رواية أخرى سورة اِنّا أنزَلْناهُ ايضاً سبعين مرّة وتشرب من ذلك الماء غدوة وعشيّة سبعة أيّام متواليات والّذي بعثني بالحقّ نبيّاً انّ جبرئيل (عليه السلام) قال : انّ الله يرفع عن الّذي يشرب هذا المآء كلّ دآء في جسده وبعافية ويخرج من جسده وعظمه وجميع أعضائه ويمحو ذلك من اللّوح المحفوظ والذي بعثني بالحقّ نبيّاً إن لم يكن له ولد بعد فشرب من ذلك الماء كان له ولد وإن كانت المرأة عقيماً وشربت من ذلك الماء رزقها الله ولداً وإن أحببت أن تحمل بذكر أو اُنثى حملت وتصديق ذلك في كتاب الله تعالى '
                      'يَهَبُ لِمَنْ يَشاءُ اِناثاً وَيَهَبُ لِمَنْ يَشاءُ الذُّكُورَ اَوْ يُزَوِّجُهُمْ ذُكْراناً وَاِناثاً وَيَجْعَلْ مَنْ يَشاءُ عَقيماً ثمّ قال (عليه السلام) : وان كان به صداع فشرب من ذلك يسكن عنه الصّداع باذن الله وان كان به وجع العين يقطر من ذلك الماء في عينيه ويشرب منه ويغسل به عينه ويشتدّ اصول الاسنان ويطيب الفم ولا يسيل من اصول الاسنان اللّعاب ويقطع البلغم ولا يتخم اذا أكل وشرب ولا يتأذّى بالرّيح (من القولنج وغيره) ولا يشتكي ظهره ولا ينجع بطنه ولا يخاف من الزّكام ووجع الضّرس ولا يشتكي المعدة ولا الدّود ولا يحتاج الى الحجامة ولا يصيبُه البواسير ولا يصيبُه الحِكّة ولا الجدري ولا الجنُون ولا الجذام ولا البرص ولا الرّعاف ولا القييء ولا يصبه عمي ولا بكم ولا خرس ولا صمم ولا مقعد ولا يصيبه الماء الاسود في عينيه ولا يصيبه داء يفسد عليه صومه وصلاته ولا يتأذّى بوسوسة الجنّ ولا الشّياطين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وقال النّبي (صلى الله عليه وآله وسلم) : قال جبرئيل (عليه السلام) انّه من شرب من ذلك ثمّ كان به جميع الاوجاع الّتي تصيب النّاس فانّه شفاء له من جميع الاوجاع ، فقال جبرئيل (عليه السلام) : والذي بعثني بالحقّ من يقرأ هذه الايات على هذا المآء فيشرب منه ملا الله تعالى قلبه نوراً وضياءً ويلقى الالهام في قلبه ويجري الحكمة على لسانه ويحشو لبه من الفهم والبصيرة وأعطاه من الكرامات ما لم يعط أحداً من العالمين ويرسل عليه ألف مغفرة وألف رحمة ويخرج الغشّ والخيانة والغيبة والحسد والبغي والكبر والبخل والحرص والغضب من قلبه والعداوة والبغضآء والنّميمة والوقيعة في النّاس وهو الشّفآء من كلّ داء.\n\n'
                      'أقول : هذه الرّواية المشهورة ينتهي سندها الى عبد الله بن عمرو لاجل ذلك يكون السّند ضعيفاً وانّي قد وجدت هذه الرّواية بخطّ الشّيخ الشّهيد مرويّة عن الصّادق (عليه السلام) بنفس هذه الاثار والسّور ، ولكن ترتيب الايات فيها كما يلي : تقرأ على ماء المطر في نيسان فاتحة الكتاب وآية الكرسي وقُلْ يا اَيُّها الْكافِرُونَ وسَبِّحِ اسْمَ رَبِّكَ الاَْعْلى وقُلْ اَعوذُ بِربّ الفَلق وقُلْ اَعوذُ بربِّ النّاس وقُلْ هُوَ اللهُ اَحَدٌ كلاً منها سبعين مرّة وتقول سبعين مرّة لا اِلـهَ اِلاَّ اللهُ وسبعين مرّة اللهُ اَكْبَرُ وسبعين مرّة اَللّـهُمَّ صَلّ عَلى مُحَمَّد وَآلِ مُحَمَّد وسبعين مرّة سُبْحانَ اللهِ وَالْحَمْدُ للهِ وَلا اِلـهَ اِلاَّ اللهُ وَاللهُ اَكْبَرُ وقد ذكر فيها في آثاره انّه اذا كان مسجوناً فشرب من ذلك الماء نجا من السّجن وانّه لم يغلب على طبعه البرودة وقد وردت في هذه الرّواية ايضاً اكثر تلك الاثار المذكورة في الرّواية السّالفة وماء المطر ماء مبارك ذو منافع سواء مطر في نيسان أو في غيره من الشّهور كما في الحديث المعتبر عن امير المؤمنين (عليه السلام) قال : اشربوا من ماء السّماء فانّه مطهّر لابدانكم ومزيل للداء كما قال تعالى وَيُنَزِّلُ عَلَيْكُمْ مِنَ السَّمآءِ ماءً لِيُطَهِّرَكُمْ بِهِ وَيُذْهِبَ عَنْكُمْ رِجْزَ الشَّيْطانِ وَلِيَرْبِطَ عَلى قُلُوبِكُمْ وَيُثَبِّتَ بِهِ الاقْدامَ واذا اجتمع قوم لهذا الدّعاء فالاحسن أن يستوفي كلّ واحد منهم قراءة كلّ من تلك السّور والاذكار سبعين مرّة والنّفع لمن قرأها بنفسه أعظم والاجر أوفر وشهر نيسان تبدأ في هذه السّنين عند مُضيّ ثلاثة وعشرين يوماً تقريباً من النّيروز وهو ثلاثون يوماً وعن الصّادق (عليه السلام) قال : لا تدع الحجامة في سبع حزيران فانّ فاتك فالاربع عشرة ويبدأ شهر حزيران عند مضيّ أربعة وثمانين يوماً تقريباً من النّيروز وهو أيضاً ثلاثون يوماً وهو شهر نحس كما روي انّ الصّادق (عليه السلام) ذكر عنده حزيران ، فقال : هو الشّهر الّذي دعا فيه موسى (عليه السلام) على بني اسرائيل فمات في يوم وليلة من بني اسرائيل ثلاثمائة ألف من النّاس وأيضاً بسند معتبر عنه (عليه السلام) قال : انّ الله تعالى يقرب الاجال في شهر حزيران أي يكثر فيه الموت واعلم انّ الشّهور الرّوميّة شهور شمسيّة يؤخذ حسابها من مسير الشّمس وهي اثنا عشر شهراً كما يلي :\n\n'
                      'تشرين الاوّل ، تشرين الاخر ، كانون الاوّل ، كانُون الاخر ، شباط ، آذر ، نيسان ، أيار ، حزيران ، تموز ، آب ، ايلُول.\n\n'
                      'وهم يعتبرون كلاًّ من الشّهور الاربعة تشرين الاخر ونيسان وحزيران وايلول ثلاثين يوماً والشّهور الباقية كلاًّ منها واحداً وثلاثين يوماً سوى شهر شباط الذي يختلف عدد ايّامه فيعتبر ذا ثمانية وعشرين يوماً في ثلاث سنين متوالية وفي السّنة الرّابعة وهي سنة كبيستهم يحسب له تسعة وعشرين يوماً وسنتهم ثلاثمائة وخمسة وستّون يوماً وربع يوم وغرّة تشرين الاوّل وهي مبدأ سنتهم توافق في هذه السّنين يوم اجتياز الشّمس الدّرجة التّاسعة عشرة من بُرج الميزان وتفصيل ذلك في كتاب بحار الانوار ونحن قد أوردنا هذا الموجز لكون هذه الشّهور مذكورة في الاخبار.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: FiShaherZilko3da.screenRoute,
        pushBack: FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira.screenRoute,
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
