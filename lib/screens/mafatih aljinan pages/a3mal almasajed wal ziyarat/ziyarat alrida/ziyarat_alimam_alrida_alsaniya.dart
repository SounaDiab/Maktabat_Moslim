import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:maktabat_almoslim/widgets/she3er.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alrida.dart';
import 'ziyarat_alimam_alrida_al2oula.dart';

class ZiyaratAlimamAlridaAlsaniya extends StatefulWidget {
  static String screenRoute = 'ziyarat_alimam_alrida_alsaniya_screen';
  const ZiyaratAlimamAlridaAlsaniya({super.key});

  @override
  State<ZiyaratAlimamAlridaAlsaniya> createState() =>
      _ZiyaratAlimamAlridaAlsaniyaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratAlimamAlridaAlsaniyaState
    extends State<ZiyaratAlimamAlridaAlsaniya> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_alimam_alrida_alsaniya_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_ziyarat_alimam_alrida_alsaniya_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiyaratAlrida.screenRoute);
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
                      .addFavorite('زيارة الإمام الرضا (عليه السلام) الثانية',
                          ZiyaratAlimamAlridaAlsaniya.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة الإمام الرضا (عليه السلام) الثانية',
                          ZiyaratAlimamAlridaAlsaniya.screenRoute,
                          ZiyaratAlimamAlridaAlsaniya.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة الإمام الرضا (عليه السلام) الثانية',
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
                      'وهي ما أوردها المفيد في المقنعة ، قال : تقف عند قبره (عليه السلام) بعد ما اغتسلت غُسل الزّيارة ولبست أنظف ثِيابك وتقول :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا وَلِيَّ اللهِ وَابْنَ وَلِيِّهِ، اَلسَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ وَابْنَ حُجَّتِهِ، اَلسَّلامُ عَلَيْكَ يا اِمامَ الْهُدى وَاَلْعُرْوَةُ الْوُثْقى وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَشْهَدُ اَنَّكَ مَضَيْتَ عَلى ما مَضى عَلَيْهِ آباؤُكَ الطّاهِرُونَ صَلَواتُ اللهِ عَلَيْهِمْ، لَمْ تُؤْثِرْ عَمىً عَلى هُدىً وَلَمْ تَمِلْ مِنْ حَقٍّ اِلى باطِل، وَاَنَّكَ نَصَحْتَ للهِ وَلِرَسُولِهِ وَاَدَّيْتَ الاَْمانَةَ، فَجَزاكَ اللهُ عَنِ الاِْسْلامِ وَاَهْلِهِ خَيْرَ الْجَزاءِ، اَتَيْتُكَ بِاَبي وَاُمّي زائراً عارِفاً، بِحَقِّكَ مُوالِياً لاَِوْلِيائِكَ مُعادِياً لاَِعْدائِكَ فَاشْفَعْ لي عِنْدَ رَبِّكَ.\n\n'
                      'ثمّ انكبّ على القبر وقبّله وضَع جانبي وجهك عليه ثمّ تحوّل الى جانب الرّأس وقُل :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا مَوْلايَ يَا بْنَ رَسُولِ اللهِ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَشْهَدُ اَنَّكَ الاِْمامُ الْهادي وَالْوَلِيُّ الْمُرْشِدُ، اَبْرَأُ اِلَى اللهِ مِنْ اَعْدائِكَ، وَاَتَقَرَّبُ اِلَى اللهِ بِوِلايَتِكَ صَلَّى اللهُ عَلَيْكَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.\n\n'
                      'ثمّ صلّ للزّيارة وصلّ بعدها ما شئت، ثمّ تحوّل الى جانب الرّجل فادعُ بما شئت ان شاء الله.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أقول :',
                  subtitle:
                      'لزيارته (عليه السلام) في السّاعات والايّام الشّريفة المنتمية اليه بنوع من المناسبات فضل كثير ولا سيّما في شهر رجب، وفي الثّالث والعشرين من ذي القعدة، والخامس والعشرين منه، وفي السّادس من شهر رمضان كما ذكر في مواقعها من أعمال الشّهور والايّام، وكذلك غير هذه الايّام ممّا ينتمي اليه، واذا أردتَ أن تودّعه (عليه السلام) فودّعه بما كنت تودّع به النّبي (صلى الله عليه وآله وسلم) :\n\n'
                      'لا جَعَلَهُ اللهُ آخِرَ تَسْليمي عَلَيْكَ (واذا أردت قُل): اَلسَّلامُ عَلَيْكَ يا وَلِيَّ اللهِ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَللّـهُمَّ لا تَجْعَلْهُ آخِرَ الْعَهْدِ مِنْ زِيارَتي اِبْنَ نَبِيِّكَ وَحُجَّتِكَ عَلى خَلْقِكَ، وَاجْمَعْني وَاِيّاهُ في جَنَّتِكَ وَاحْشُرْني مَعَهُ وَفي حِزْبِهِ مَعَ الشُّهَداءِ وَالصّالِحينَ وَحَسُنَ اُولئِكَ رَفيقاً، وَاَسْتَوْدِعُكَ اللهَ وَاَسْتَرْعيكَ وَاَقْرَأُ عَلَيْكَ اَلسَّلامَ، آمَنّا بِاللهِ وَبِالرَّسُولِ وَبِما جِئْتَ بِهِ وَدَلَلْتَ عَلَيْهِ فَاكْتُبْنا مَعَ الشّاهِدينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أقول :',
                  subtitle: 'ينبغي هُنا ذكر أمور :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle:
                      'بسند معتبر عن الامام عليّ النّقي صلوات الله وسلامه عليه انّه قال : من كانت له الى الله حاجة فليزُر قبر جدّي الرّضا(عليه السلام) بطوس مغتسلاً فيصلّي عند رأسه ركعتين فيذكر حاجته في قنوت صلاته فتستجاب له حاجته الاّ اذا كانت في معصية أو قطيعة رحم، انّ موضِع قبره بقعة من بُقَعِ الجنّة ولا يزُوره مؤمن الاّ اعتقه الله من النّار وأدخله الجنّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle:
                      'حكى العلاّمة المجلسي (رحمه الله) عن خطّ الشّيخ الجليل الشّيخ حسين بن عبد الصّمد والد الشّيخ البهائي انّ الشّيخ أبي الطّيب حسين بن احمد الفقيه الرّازي (رحمه الله) ذكر انّه : مَن زارَ الرّضا صلوات الله وسلامه عليه أو غيره من الائمة (عليه السلام) فصلّى عنده صلاة جعفر كتب له بكلّ ركعة أجر من حجّ ألف حجّة واعتمر ألف عمرة، وأعتق في سبيل الله ألف رقبة، ووقف للجهاد مَعَ نبيّ مُرسل ألف مرّة، وكان له بكلّ خطوة يخطوها أجر مائة حجّة، ومائة عمرة، وعتق مائة رقبة في سبيل الله تعالى، وكتب له مائة حسنة، ومحى عنه مائة سيّئة، وصفة صلاة جعفر قد مضت في خلال أعمال يوم الجُمعة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle:
                      'روي عن محوّل السّجستاني قال : لما ورد البريد بإشخاص الرّضا (عليه السلام) الى خراسان دخل المسجد ليودّع رسُول الله (صلى الله عليه وآله وسلم) فودّعه مراراً كلّ ذلك يرجع الى القبر ويعلو صوته بالبُكاء والنّحيب ، فتقدّمت اليه وسلّمت عليه ، فردّ السّلام وهنّأته فقال : زُرني فانّي أخرج من جوار جدّي(صلى الله عليه وآله وسلم) فأموت في غُربة وأدفن في جنب هارون.\n\n'
                      'وروى الشّيخ يوسف بن حاتم الشّامي في كتاب الدّرّ النّظيم عن جمع من الاصحاب عن الرّضا(عليه السلام) قال : لما أردتُ الخرُوج من المدينة الى خراسان جمعت عيالي فأمرتهم أن يبكوا عليّ حتّى اسمع بكاءهم، ثمّ فرقت فيهم اثني عشر ألف دينار ثمّ قلت لهم : انّي لا أرجع الى عيالي أبداً ، ثمّ أخذت أبا جعفر الجواد فأدخلته المسجد ووضعت يده على حافة القبر وألصقته واستخفظته برسُول الله (صلى الله عليه وآله وسلم)وأمرت جميع وكلائي وحشمي له بالسّمع والطّاعة وترك مخالفته وعرفتهم انّه القيّم مقامي.\n\n'
                      'وروى السّيد عبد الكريم ابن طاوُس (رحمه الله): انّه لما طلب المأمون الرّضا (عليه السلام)من المدينة الى خراسان سار (عليه السلام) من المدينة الى البصرة ولم يذهب الى الكوفة ثمّ توجّه من البصرة الى بغداد على طريق الكوفة ومن هُناك الى مدينة قم ودخل قُم فاستقبله أهلها، '
                      'فتخاصموا في ضيافته كلّ يبغي أن يحلّ (عليه السلام) داره ، فقال (عليه السلام) : انّ جملي هُو المأمُور أي انّه (عليه السلام)يحلّ حيثما برك الجمل، فأتي الجمل داراً واستناخ على بابه وكان صاحب الدّار قد رأى في المنام في ليلته انّ الرّضا (عليه السلام) سيكُون ضيفه غداً، فلم تمض مدّة طويلة حتّى صار ذلك الدّار مقاماً من المقامات الرّفيعة وهو في عصرنا مدرسة معمورة.\n\n'
                      'وروى الصدّوق بسنده عن اسحاق بن راهويه قال : لما وافى أبو الحسن الرّضا (عليه السلام) نيسابور وأراد أن يرحل منها اجتمع اليه أصحاب الحديث ، فقالوا له : يا ابن رسول الله (صلى الله عليه وآله وسلم) ترحل عنّا ولا تحدّثنا بحديث فنستفيده منك، وقد كان قعد في العمارية فاطلع رأسه وقال : سمعتُ أبي مُوسى بن جعفر يقول : سمعتُ أبي جعفر بن محمّد يقُول : سمعتُ أبي محمّد بن علي يقول : سمعتُ أبي عليّ بن الحسين يقول : سمعتُ أبي الحسين بن علي يقول : سمعتُ أبي أمير المؤمنين علي بن أبي طالب عليه الصّلاة والسّلام يقول : سمعتُ رسُول الله (صلى الله عليه وآله وسلم) يقول : سمعتُ جبرئيل يقول : سمعتُ الله عزّوجلّ يقُول : لا اِلـهَ اِلاَّ اللهُ حِصْني فَمَنْ دَخَلَ حِصْني اَمِنَ مِنْ عَذابي، فلمّا مرّت الرّاحلة نادانابِشُرُوطِها وَاَنَا مِنْ شُرُوطِها.\n\n'
                      'وروى أبو الصّلت انّ الرّضا (عليه السلام) في طريقه الى المأمون لما بلغ القرية الحمراء ] ده سُرخ [ قيل له : يا ابن رسُول الله (صلى الله عليه وآله وسلم) قد زالت الشّمس أفلا نصلّي، فنزل (عليه السلام) فقال : إئتوني بماء، فقيل : ما معنا ماء ، فبحث بيده الارض فنبع من الماء ما توضّأ به هُو ومن معه وأثره باق الى اليوم . فلمّا دخل سناباد أسند الى الجبل الّذي ينحت منهُ القدُور ، فقال : اَللّهُمَّ انفَعْ به وبارِك فيما يجعل فيما ينحت منه ، ثمّ أمر (عليه السلام) فنحت له قُدور من الجبل وقال : لا يأكل الاّ ما طبخ فيها فاهتدى النّاس اليه من ذلك اليوم وظهرت بركة دعائه فيه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle:
                      'ارّخ صاحب مطلع الشّمس انّ الملك (الشاه) عبّاس الاوّل نزل مشهد الرّضا (عليه السلام) في الخامس والعشرين من ذي الحجّة سنة ألف وستّ وذلك بعد ما نهب عبد الرّحمن الاوزبكي الحرم الطّاهر، فلم يترك فيها شيئاً سوى السّاج الذهبي، وفي الثّامن والعشرين من الشّهر شهر ذي الحجّة توجّه الملك الى مدينة هرات فاستردّها ونظم شؤونها فقفل الى مدينة خراسان ولبث فيها شهراً رمّم خلاله الصحن المقدّس وأنعم على خدّام البقعة المباركة ورعاهم بعطفه ثمّ عاد الى العراق، وفي أواخر السّنة الثّامنة بعد الالف قدم الملك ثانياً خراسان فقضى فيه فصل الشّتاء وتقلّد خدمة الاستانة المقدّسة وباشرها بنفسه فكان في بعض اللّيالي وهو يقرض فضُول فتائل الشّموع بالمقراضين فانشأ الشّيخ البهائي على البديهة قائلاً بالفارسيّة:',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'پروانه شمع روضه خُلد آيين   مقراض باحتياط زن اى خادم\n\n'
                      'ترسم ببرى شهپر جبريل امين   پيوسته بُوَد ملايك علّيين',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وكان الشّاه قد نذر أن يرحل الى زيارة الرّضا (عليه السلام) راجلاً فوفى بنذره في السّنة التّاسعة بعد الالف وقطع تلك المسافة الشّاسعة على قدميه خلال ثمانية وعشرين يوماً، وبهذه المناسبة أورد صاحب كتاب تاريخ عالم آرا هذه الابيات :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'غلام شاه مردان شاه عبّاس   شه والا گُهر خاقان امجد\n\n'
                      'بطوف مرقد شاه خراسان   پياده رفت با اخلاص بيحدّ',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: 'الى أن قال :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'پياده رفت شد تاريخ رفتن   ز اصفاهان پياده تا بمشهد',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'فلمّا بلغ مدينة خراسان أمر بأن يرحّب الصّحن المبارك وكان المدخل الى الرّوضة حينذاك في ايوان علي شير في جانب من جوانب الصّحن الشّريف بشكل غير أنيق، فأمر بتشييد الصّحن بحيث يتوسّطه الايوان وبنى ايواناً آخر في الجانب المقابل ومدّ شارعاً مركزيّاً يجتاز بابي الصّحن والايوان ويطوي المدينة من بابها الغربي الى بابها الشّرقي واحدث للمدينة عيوناً وقنوات ومدّ في منتصف الشّارع المركزي ساقية تجري الى حوض كبير قد أحدثه في وسط الصّحن الشّريف فتخترقه الى الجانب الشّرقي من الشّارع والكتابات الموجودة في هذه الابنية هي من آثار الميرزا محمّد رضا صدر الكتّاب وعليرضا العبّاسي ومحمّد رضا الامامي، وممّا أجراه الشّاه عباس أيضاً انّه كسى القبّة الطّاهرة بالذهب كما تنطق به الكتابة الموجودة على القبّة الطّاهرة وهي :\n\n'
                      'بِسْمِ اللهِ الرَّحْمنِ الرَّحيمِ مِنْ عَظائِمِ تَوفيقاتِ اللهِ سُبحانه أن وفّق السّلطان الاعظم مولى العجم صاحب النّسب الطّاهر النّبوي والحسب الباهر العلوي تراب أقدام خدّام هذه القبّة المطهّرة اللاّهية زوّار هذه الرّوضة المنوّرة الملكوتيّة مروّج آثار أجداده المعصومين السّلطان بن السّلطان أبو المظفّر شاه عبّاس الحسيني الموسوي الصّفوي بهادر خان، فاستسعد بالمجيء ماشياً '
                      'على قدميه من دار السّلطنة اصفهان الى زيارة هذا الحرم الاشرف وقد تشرّف بزينة هذه القبّة من خلصّ ما له في سنة ألف وعشر وتمّ سنة ألف وستّ وعشر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'قال الطّبرسي في كتاب أعلام الورى بعدما أورد جملة من معجزات الرّضا (عليه السلام) : وأمّا ما ظهر للنّاس بعد وفاته من بركة مشهده المقدّس والعلامات والعجائب الّتي شاهدها الخلق فيه وأذعن العام والخاص له وأقرّ المخالف والمؤالف به الى يومنا هذا فكثير خارج عن حدّ الاحصاء والعدّ، ولقد أبرئ فيه الاكم والابرص واستجيبت الدّعوات وقضيت ببركته الحاجات وكشفت المسلّمات، وشاهدنا كثيراً من ذلك وتيقناه وعلمناه لا يتخالج الشّك والرّيب في معناه، والشّيخ الاجلّ الشّيخ الحُرّ العاملي في كتابه اثبات الهداة بعدما حكى هذا الكلام للطّبرسي ، قال : يقول مؤلف هذا الكتاب محمّد بن الحسن الحرّاني : قد شاهدت كثيراً من هذه المعجزات كما شاهدها الشّيخ الطّبرسي وتيقّنت بها كما تيقّن هو بها وذلك في مدّة مجاورتي للمشهد المقدس وهي ستّ وعشرون سنة، وقد سمعت في ذلك ما يفوق التّواتر ولم أتخطر حاجة دعوت الله بها في هذا المشهد الاّ وقضيت والحمد لله، والمقام لا يسع التّفصيل فاكتفينا بالاجمال.\n\n'
                      'ويقول عباس القمّي مؤلّف هذا الكتاب : انّنا في غنىً عن ذكر الكرامات الّتي برزت من تلك الرّوضة المقدّسة في سوالف الازمان بما يتجدّد منها في كلّ عصر وزمان وقد ألمحنا الى ما يناسب المقام في الباب الثّاني في خلال أعمال اللّيلة السّابعة والعشرين من شهر رجب، فلنختم هذا الفصل بعدّة أبيات ممّا انشأه الجامي في مدحه (عليه السلام) :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'سَلامٌ عَلى آلِ طه وَيس   سَلامٌ عَلى آلِ خَيْرِ النَّبِيّين\n\n'
                      'سَلامٌ عَلى رَوْضَة حَلَّ فيها   اِمامٌ يُباهي بِهِ المُلْكُ وَالدّين\n\n'
                      'امام بحق شاه مطلق كه آمد   حريم درش قبله گاه سلاطين\n\n'
                      'شه كاخ عرفان گل شاخ احسان   دُرِ درج امكان مه برج تمكين\n\n'
                      'علىّ بن موسى الرّضا كز خدايش   رضا شد لقب چون رضا بودش امين\n\n'
                      'ز فضل و شرف بينى او را جهانى   اگر نبودت تيره چشم جهان بين\n\n'
                      'پى عطر روبند حُوران جنّت   غبار درش را بگيسوى مشكين\n\n'
                      'اگر خواهى آرى بكف دامن او   برو دامن از هر چه جز اوست برچين',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle: '',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiyaratAlimamAlridaAl2oula.screenRoute,
          pushBack: ZiyaratAlimamAlridaAl2oula.screenRoute,
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
