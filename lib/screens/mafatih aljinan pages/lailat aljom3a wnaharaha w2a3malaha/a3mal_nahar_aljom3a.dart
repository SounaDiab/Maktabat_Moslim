import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../lailat_aljom3a_wnaharaha_w2a3malaha.dart';
import 'a3mal_lailat_aljom3a.dart';
import 'salat_alnabi.dart';

class A3malNaharAljom3a extends StatefulWidget {
  static String screenRoute = 'a3mal_nahar_aljom3a_screen';
  const A3malNaharAljom3a({super.key});

  @override
  State<A3malNaharAljom3a> createState() => _A3malNaharAljom3aState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malNaharAljom3aState extends State<A3malNaharAljom3a> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_a3mal_nahar_aljom3a_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_a3mal_nahar_aljom3a_screen', value);
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
          .pushReplacementNamed(LailatAljom3aWnaharahaW2a3malaha.screenRoute);
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
                    LailatAljom3aWnaharahaW2a3malaha.screenRoute);
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
                      .addFavorite(
                          'أعمال نهار الجمعة', A3malNaharAljom3a.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'أعمال نهار الجمعة',
                          A3malNaharAljom3a.screenRoute,
                          A3malNaharAljom3a.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال نهار الجمعة',
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
                  'فكثيرة وهُنا نقتصر على عدّة منها:',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الأول :',
                  subtitle:
                      'أن يقرأ في الرّكعة الاُولى من صلاة الفجر سورة الجمعة وفي الثّانية سورة التّوحيد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      ' أن يدعو بهذا الدُعاء بعد صلاة الغداة قبل أن يتكلّم ليكون ذلك كفّارة ذنوبه من جمعة إلى جُمعة:\n\n'
                      'اَللّـهُمَّ ما قُلْتُ فى جُمُعَتى هذِهِ مِنْ قَوْل اَوْ حَلَفْتُ فيها مِنْ حَلْف اَوْ نَذَرْتُ فيها مِنْ نَذْر فَمَشِيَّتُكَ بَيْنَ يَدَيْ ذلِكَ كُلِّهِ فَما شِئْتَ مِنْهُ اَنْ يَكُونَ كانَ وَما لَمْ تَشَأْ مِنْهُ لَمْ يَكُن اَللّـهُمَّ اغْفرْ لى وَتَجاوَزْ عَنّى اَللّـهُمَّ مَنْ صَلَّيْتَ عَلَيْهِ فَصَلاتى عَلَيْهِ وَمَنْ لَعَنْتَ فَلَعْنَتي عَلَيْهِ .\n\n'
                      'وليؤدّ هذا العمل لا أقلّ من مرّة في كلّ شهر، وروي انّ من جلس يوم الجمعة يعقّب الى طلوع الشّمس رفع له سَبعون درجة في الفِردوس الاعلى، وروى الشّيخ الطوسي انّ من المسنُون هذا الدّعاء في تعقيب فريضة الفجر يوم الجُمعة :\n\n'
                      'اَللّـهُمَّ اِنّى تَعَمَّدْتُ اِلَيْكَ بِحاجَتى وَاَنْزَلْتُ اِلَيْكَ الْيَوْمَ فَقْرى وَفاقَتى وَمَسْكَنَتى فَاَنَا لِمَغْفِرَتِكَ اَرْجى مِنّى لِعَمَلى وَلَمَغْفِرَتُكَ وَرَحْمَتُكَ اَوْسَعُ مِنْ ذُنُوبي فَتَولَّ قَضاءَ كُلِّ حاجَة لي بِقُدْرَتِكَ عَلَيْها وَتَيسيرِ (وَتَيَسَر) ذلِكَ عَلَيْكَ وَلِفَقْري اِلَيْكَ فَاِنّي لَمْ اُصِبْ خَيْراً قَطُّ إلاّ مِنَك وَلَمْ يَصْرِفْ عَنّي سُوءاً قَطُّ اَحَدٌ سِواكَ وَلَسْتُ (وَلَيْسَ) اَرْجُو لاخِرَتي وَدُنْيايَ وَلا لِيَوْمِ فَقْرى يَوْمَ يُفْرِدُني النّاسُ في حُفْرَتي وَاُفْضي اِلَيْكَ بِذَنْبي سِواكَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'روي انّ مَن قال بعد فريضة الظّهر وفريضة الفجر في يوم الجُمعة وغيره من الايّام: اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَعَجِّلْ فَرَجَهُمْ لم يمت حتّى يدرك القائم (عليه السلام) وان قاله مائة مرّة قضى الله له ستّين حاجة ثلاثين من حاجات الدّنيا وثلاثين من حاجات الاخرة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle:
                      'أن يقرأ سُورة الرَّحمن بعد فريضة الصّبح فيقول بعد فَبِأيِّ آلاءِ رَبِّكُما تُكَذِّبانِ: لا بشيء مِنْ آلائكَ رَبِّ اُكَذِّبُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'قال الشّيخ الطوسي (رحمه الله): من المسنون بعد فريضة الصّبح يوم الجُمعة أن يقرأ التّوحيد مائة مرّة، وَيُصلّي على محمّد وآل مُحمّد مائة مرّة، ويستغفر مائة مرّة، ويقرأ سورة النّساء وهُود والكهف والصّافات والرّحمن.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس :',
                  subtitle:
                      'أن يقرأ سورة الاحقاف والمؤمنُون، فعن الصّادق (عليه السلام)قال: مَنْ قرأ كلّ ليلة من ليالي الجمعة أو كلّ يوم من أيّامها سورة الاحقاف لم يصبه الله بروعة في الحياة الدّنيا وأمّنه من فزع يوم القيامة ان شاء الله، وقال ايضاً: من قرأ سورة المؤمنون ختم الله له بالسّعادة اذا كان يدمن قراءتها في كلّ جمعة وكان منزله في الفردوس الاعلى مع النّبيّين والمرسلين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'أن يقرأ سُورة (قُل يا أيُّها الْكافِرُونَ) قبل طلوع الشّمس عشر مرّات ثمّ يدعو ليستجاب دعاؤه وروي انّ الامام زين العابدين (عليه السلام) كان اذا أصبح الصّباح يوم الجمعة أخذ في قراءة آية الكرسي الى الظّهر ثمّ اذا فرغ من الصلاة أخذ في قراءة سُورَة (اِنّا اَنْزَلْناهُ) واعلم انّ لقراءة آية الكرسى على التّنزيل في يوم الجُمعة فضلاً كثيراً.\n\n'
                      '(قال العلامة المجلسي: آية الكرسي على التنزيل على رواية عليّ بن إبراهيم والكليني هي كما يلي: الله لا اله إلاّ هو الحيّ القيوم لا تأخذه سنة ولا نوم له ما في السماوات والأرض وما بينهما وما تحت الثرى عالم الغيب والشهادة الرحمن الرحيم من ذا الذي … الى هم فيها خالدون).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن :',
                  subtitle:
                      'أن يغتسل وذلك من وكيد السّنن وروى عن النّبي (صلى الله عليه وآله وسلم)انّه قال لعليّ (عليه السلام) : يا علي اغتسل في كلّ جمعة ولو انّك تشتري المآء بقوت يومك وتطويه فانّه ليس شيء من التطوّع اعظم منه، وعن الصّادق صلواتُ الله وسلامه عليه قال : من اغتسل يوم الجُمعة فقال : اَشْهَدُ اَنْ لا اِلـهَ إلاّ اللهُ وَحْدَهُ لا شَريكَ لَهُ وَاَشْهَدُ اَنَّ مُحَمَّداً عَبْدُهُ وَرَسُولُهُ اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاجْعَلْني مِنَ التَّوّابينَ واجْعَلْني مِنَ المُتَطَهِّرينَ كان طهراً من الجمعة الى الجُمعة أي طهراً من ذنوبه أو انّ أعماله وقعت على طهر معنوي وقبلت والاحوط أن لا يدع غُسل الجُمعة ما تمكّن منه، ووقته من بعد طلُوع الفجر الى زوال الشّمس وكلّما قرب الوقت الى الزّوال كان أفضل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التاسع :',
                  subtitle:
                      'أن يغسل الرأس بالخطمي فانّه أمان من البرص والجُنون.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العاشِر :',
                  subtitle:
                      'أن يقص شاربه ويقلّم أظفاره فلذلك فضل كثير يزيد في الرّزق ويمحو الذّنوب الى الجمعة القادمة، ويوجب الامن من الجنون والجُذام والبرص، وليقل حينئذ: بِسْمِ اللهِ وَبِاللهِ وِعلى سُنَّةِ مُحَمَّد وَآلِ مُحَمَّد وليبدء في تقليم الاظفار بالخنصر من اليد اليسرى ويختم بالخنصر من اليد اليمنى وكذا في تقليم أظفار الرّجل ثمّ ليدفن فضُول الاظافير.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الحادي عشر :',
                  subtitle: 'أن يتطيّب ويلبس صالح ثيابه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني عشر :',
                  subtitle:
                      'أن يتصدّق فالصّدقة تضاعف على بعض الرّوايات في ليلة الجُمعة ونهارها ألف ضعفها في سائر الأوقات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث عشر :',
                  subtitle:
                      'أن يطرف أهله في كلّ جمعة بشيء من الفاكهة واللّحم حتّى يفرحُوا بالجمعة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع عشر :',
                  subtitle:
                      'أكل الرُّمّان على الرّيق وأكل سبعة أوراق من الهندباء قبل الزّوال، وعن مُوسى بن جعفر (عليهما السلام) قال : مَنْ أكل رُمّانة يوم الجُمعة على الرّيق نوّرت قلبه أربعين صباحاً فإن أكل رُمّانتين فثمانين يوماً فإنّ أكل ثلاثاً فمائة وعشرين يوماً وطردت عنه وسوسة الشّيطان، ومن طردت عنه وسوسة الشّيطان لم يعص الله ومن لم يعص الله أدخله الله الجنّة.\n\n'
                      'وقال الشيخ في المصباح: وروي في أكل الرُّمان في يوم الجُمعة وليلتها فضل كثير.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس عشر :',
                  subtitle:
                      'أن يتفرّغ فيه لتعلّم أحكام دينه، لا أن ينفق يومه هذا في التجوال في بساتين النّاس ومزارعهم، ومصاحبة الاراذل والاوباش، والتهكم والتحدّث عن عيوب النّاس، والاستغراق في الضحك والقهقهة، وإنشاء القريض والخوض في الباطِل وأمثال ذلك فانّ ما يترتّب على ذلك من المفاسد أكثر من أن يذكر، وعن الصّادق (عليه السلام) قال : أفّ على مسلم لم ينفق من اسبُوعه يوم الجُمعة في تعلّم دينه ولم يتفرّغ فيه لذلك، وعن النّبي (صلى الله عليه وآله وسلم) انّه قال : اذا رأيتم يوم الجُمعة شيخاً يقصّ على النّاس تاريخ الكفر والجاهليّة فأرموا رأسه بالحصى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس عشر :',
                  subtitle:
                      'أن يصلّي على النّبي وآله ألف مرّة، وعن الباقر (عليه السلام) قال : ما من شيء من العبادة يوم الجُمعة أحبّ اليّ من الصلاة على محمّد وآله الاطهار صلّى الله عليهم أجمعين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أقول :',
                  subtitle:
                      'فإن لم تسنح له الفرصة بالصلاة ألف مرّة فلا أقلّ من المائة مرّة ليكون وجهه يوم الحساب مشرقاً، وروي انّ من صلّى على محمّد وآله يوم الجُمعة مائة مرّة وقال مائة مرّة:اَسْتَغْفِرُ اللهَ رَبّى واَتُوبُ اِلَيْهِ وقرأ التّوحيد مائة مرّة غفر له البتّة، وروى ايضاً انّ الصلاة على محمّد وآله بين الظّهر والعصر تعدل سبعين حجّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع عشر :',
                  subtitle:
                      'أن يزُور النّبي والائمة الطاهرين سلام الله عليهم أجمعين وستأتي كيفيّة الزّيارة في باب الزّيارات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن عشر :',
                  subtitle:
                      'أن يزور الاموات ويزور قبر أبويه أو أحدهما وعن الباقر (عليه السلام) قال : زوروا الموتى يوم الجُمعة فانّهم يعلمون بمن أتاهم ويفرحون.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التاسع عشر :',
                  subtitle:
                      'أن يقرأ دعاء النّدبة وَهُو من أعمال الاعياد الاربعة وسيأتي في محلّه ان شاء الله.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العشرون :',
                  subtitle:
                      'اعلم انّه قد ذكر ليومِ الجُمعة صلوات كثيرة سوى نافلة الجُمعة التي هي عشرون ركعة وصفتها على المشهور أن يصلّي ستّ ركعات منها عند انبساط الشّمس، وستّاً عند ارتفاعها، وستّاً قبل الزّوال، وركعتين بعد الزّوال قبل الفريضة، أو أن يصلّي الستّ ركعات الاولى بعد صلاة الجُمعة أو الظّهر على ما هُو مذكور في كتب الفقهاء وفي المصابيح، وينبغي هُنا ايراد عدّة من تلك الصّلوات المذكورة ليوم الجُمعة وإن كان أكثرها لا يخص يوم الجُمعة ولكنّها في يوم الجُمعة أفضل . من تلك الصّلوات الصلاة الكاملة التي رواها الشّيخ والسّيد والشّهيد والعلاّمة وغيرهم باسناد عديدة معتبرة عن الامام جعفر بن محمّد الصّادق صلوات الله وسلامه عليهما عن آبائه الكرام عن رسول الله (صلى الله عليه وآله وسلم) قال : مَن صلّى يو م الجُمعة قبل الزّوال أربع ركعات يقرأ في كلّ ركعة الحمد عشر مرّات وكلاًّ مِن (قُلْ اَعُوذُ بِرَبِّ النّاسِ وقُلْ اَعُوذُ بِرَبِّ الْفَلَقِ وقُلْ هُوَ اللهُ اَحَدٌ وقُلْ يا أيُّها الْكافِرُونَ) ومثلها آية الكرسى، وفي رواية اُخرى يقرأ أيضاً عشر مرّات (اِنّا اَنْزَلْناهُ فى لَيلةِ الْقَدر) وعشر مرّات آية (شَهِدَ الله) وبعد فراغه من الصلاة يستغفر الله مائة مرّة ويقول : سُبْحانَ اللهِ وَالْحَمْدُ للهِ وَلا اِلـهَ إلاّ اللهُ وَاَللهُ اَكْبَرُ وَلا حَوْلَ وَلا قُوةَ إلاّ بِالله الْعَليِّ الْعَظيمِ مائة مرّة ويصلّي على محمّد وآل محمّد مائة مرّة . من صلّى هذه الصلاة دفع الله عنه شَرِّ أهل السّماء وأهل الارض وشرّ الشّيطان وشرّ كلّ سُلطان جابر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة أخرى :',
                  subtitle:
                      'روى الحارث الهمداني عن أمير المؤمنين (عليه السلام) انّه قال : اِنِ استطعت أن تصلّي يوم الجُمعة عشر ركعات تتمّ سجودهنّ وركوعهنّ وتقُول فيما بين كلّ ركعتين (سُبْحانَ اللهِ وَبِحَمْدِهِ) مائة مرّة فافعل فانّ لها فضلاً عظيماً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة أخرى :',
                  subtitle:
                      'بسند معتبر عن الصّادق (عليه السلام) قال : مَن قرأ سُورة ابراهيم وسورة الحجر في ركعتين جميعاً في يوم الجُمعة لم يصبه فقر أبداً ولا جنون ولا بلوى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: SalatAlnabi.screenRoute,
        pushBack: A3malLailatAljom3a.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اعمال نهار الجمعة.mp3',
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
