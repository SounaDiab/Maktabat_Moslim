import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:maktabat_almoslim/widgets/she3er.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'alziyarat_al2o5ra.dart';
import 'ziyarat_3ashoraa.dart';

class FadlTorbatAlhussein extends StatefulWidget {
  static String screenRoute = 'fadl_torbat_alhussein_screen';
  const FadlTorbatAlhussein({super.key});

  @override
  State<FadlTorbatAlhussein> createState() => _FadlTorbatAlhusseinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FadlTorbatAlhusseinState extends State<FadlTorbatAlhussein> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_fadl_torbat_alhussein_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fadl_torbat_alhussein_screen', value);
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
          .pushReplacementNamed(ZiyaratAlhousseinWa2adabiha.screenRoute);
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
                          'تذييل في فضل تربة الحسين (عليه السلام) المقدسة وآدابها',
                          FadlTorbatAlhussein.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'تذييل في فضل تربة الحسين (عليه السلام) المقدسة وآدابها',
                          FadlTorbatAlhussein.screenRoute,
                          FadlTorbatAlhussein.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'تذييل في فضل تربة الحسين (عليه السلام) المقدسة وآدابها',
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
                      'اعلم انّ لنا روايات متظافرة تنطق بأنّ تربته (عليه السلام) شفاء من كلّ سقم وداء الاّ الموت وامان من كلّ بلاء، وهي تورث الامن من كلّ خوف، والاحاديث في هذا الباب متواترة وما برزت من تلك التّربة المقدّسة من المعجزات اكثر من أن تُذكر واني قد ذكرت في كتاب الفوائد الرّضويّة في تراجم العلماء الاماميّة عند ترجمة السّيد المحدّث المتبحّر نعمة الله الجزائري انّه كان ممّن جهد لتحصيل العلم جهداً وتحمّل في سبيله الشّدائد والصّعاب وكان في أبان طلبه العلم لا يسعه الاسراج فقراً فيستفيد للمطالعة ليلاً من ضوء القمر وقد أكثر من المطالعة في ضوء القمر ومن القراءة والكتابة حتّى ضعف بصره فكان يكتحل بتربة الحسين (عليه السلام)المقدّسة وبتراب المراقد الشّريفة للائمة في العراق (عليهم السلام) فيقوي بصره ببركتها، وانّي قد حذرت هُناك ايضاً أهالي عصرنا أن '
                      'يعجبوا لهذه الحكاية اثر معاشرتهم الكفّار والملاحدة ، فقد قال الدّميري في حياة الحيوان : انّ الافعى اذا عاش مائة سنة عميت عينه فيلهمه الله تعالى أن يمسحها بالرازيانج الرّطب لكي يعُود اليها بصرها فيقبل من الصّحراء نحو البساتين ومنابت الرّازيانج وان طالب المسافة حتّى يهتدي الى ذلك النّبات فيمسح بها عينه فيرجع اليها بصرها، ويروي ذلك عن الزّمخشري وغيره أيضاً، فاذا كان الله تعالى قد جعل مثل هذه الفائدة في نبات رطب وتهتدي اليه حيّة عمياء فتأخذ نصيبها منه فأيّ استبعاد واستعجاب في أن يجعل في تربة ابن نبيّه صلوات الله عليه الاذي ستشهد هو وعترته في سبيله شفاء من كلّ داء وغير ذلك من الفوائد والبركات لينتفع بها الشّيعة والاحباب، ونحن في المقام نقنع بذكر عدّة روايات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاُولى :',
                  subtitle:
                      'روي انّ الحور العين اذا بصرن بواحد من الاملاك يهبط الى الارض لامر ما يستهدين منه السّبح والتّربة من طين قبر الحسين (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّانية :',
                  subtitle:
                      'روي بسند معتبر عن رجل قال : بعث اليّ الرّضا (عليه السلام) من خراسان رزم ثياب وكان بين ذلك طين فقلت للرّسول : ما هذا؟ قال : هذا طين قبر الحسين (عليه السلام) ما كاد يوجه شيئاً من الثّياب ولا غيره الاّ ويجعل فيه الطّين، فكان يقول: هو أمان باذن الله.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالثة :',
                  subtitle:
                      'عن عبد الله بن أبي يعفور قال : قلت للصّادق (عليه السلام) : يأخذ الانسان من طين قبر الحسين (عليه السلام)فينتفع به ويأخذ غيره فلا ينتفع به ؟ فقال : لا والله ما يأخذه أحد وهو يرى انّ الله ينفعه به الاّ نفعه الله به.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابعة :',
                  subtitle:
                      'عن أبي حمزة الثّمالي قال : قلت للصّادق (عليه السلام): انّي رأيت أصحابنا يأخذون من طين الحسين (عليه السلام)يستشفُون به هل في ذلك شيء ممّا يقولون من الشّفاء ؟ قال : يستشفي بما بينه وبين القبر على رأس أربعة أميال وكذا طين قبر جدّي رسول الله (صلى الله عليه وآله وسلم) وكذا طين قبر الحسن وعليّ ومحمّد، فخُذ منها فانّها شفاء من كلّ سقم وجنّة ممّا تخاف ولا يعدلها شيء من الاشياء الّتي يستشفي بها الاّ الدّعاء وانّما يفسدها ما يخالطها من أوعيتها وقلّة اليقين ممّن يعالج بها، فامّا مَن أيقن انّها له شفاء اذا يعالج بها كفته باذن الله تعالى من غيرها ممّا يتعالج به، ويفسدها الشّياطين والجنّ من أهل الكفر منهم يتمسّحون بها وما تمرّ بشيء الاّ شمّها، وامّا الشّياطين وكفّار الجنّ فانّهم يحسدون ابن آدم عليها فيمسحون بها فيذهب عامّة طيبها ولا يخرج الطّين من الحائر الاّ وقد استعدّ له ما لا '
                      'يحصى منهم، والله انّها لفي يدي صاحبها وهم يتمسّحون بها ولا يقدرُون مع الملائكة أن يدخلوا الحائر ولو كان من التّربة شيء يسلم ما عولج به أحد الاّ اُبريء من ساعته، فاذا أخذتها فاكتمها واكثر عليها ذكر الله عزّوجل، وقد بلغني انّ بعض من يأخذ من التّربة شيئاً يستخفّ به حتّى انّ بعضهم ليطرحها في مخلاة الابل والبغل والحمار أو في وعاء الطّعام وما يمسح به الايدي من الطّعام والخرج والجوالق، فكيف يستشفي به من هذا حالها عنده، ولكن القلب الَّذي ليس فيه اليقين من المستخفّ بما فيه صلاحه يفسد عمله.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامسة :',
                  subtitle:
                      'روي انّه اذا تناول التّربة أحدكم فليأخذ باطراف أصابعه وقدره مثل الحمّصة فليقبلها وليضعها على عينيه وليمرها على سائر جسده وليقُل : اَللّـهُمَّ بِحَقِّ هـذِهِ التُّرْبَةِ وَبِحَقِّ مَنْ حَلَّ بِها وَثَوى فيها وَبِحِقِّ جَدِّهِ وَاَبيهِ وَاُمِّهِ وَاَخيهِ وَالاَْئِمَّةِ مِنْ وُلْدِهِ وَبِحَقِّ الْمَلائِكَةِ الْحافّينَ بِهِ اِلاّ جَعَلْتَها شِفاءً مِنْ كُلِّ داء، وَبُرْءاً مِنْ كُلِّ مَرَض، وَنَجاةً مِنْ كُلِّ آفَة، وَحِرْزاً مِمّا اَخافُ وَاَحْذَرُ، ثمّ ليستعملها.\n\n'
                      'وروي انّ الختم على طين قبر الحسين (عليه السلام) أن يقرأ على سورة (اِنّا اَنْزَلْناهُ فِي لَيْلَةِ الْقَدْرِ).\n\n'
                      'وروي ايضاً انّك تقول اذا طعمت شيئاً من التّربة أو أطعمته أحداً : بِسْمِ اللهِ وَبِاللهِ، اَللّـهُمَّ اجْعَلْهُ رِزْقاً واسِعاً وَعِلْماً نافِعاً وَشِفاءً مِنْ كُلِّ داء اِنَّكَ عَلى كُلِّ شَىْء قَديرٌ.\n\n'
                      'أقول : لتربته الشّريفة فوائد جمّة : منها استحباب جعلها مع الميّت في اللّحد واستحباب كتابة الاكفان بها واستحباب السّجود عليها ، فقد روي انّ السّجود عليها يخرق الحجب السّبعة أي يورث قبول الصّلاة عند ارتقائها السّماوات، واستحباب ان يصنع منها السّبحة فتستعمل للذّكر أو تترك في اليد من دون ذكر فلذلك فضل عظيم، ومن ذلك الفضل ان السّبحة تسبّح في يد صاحبها من غير أن يسبّح، ومن المعلوم انّ هذا التّسبيح بمعنى خاص غير التّسبيح الَّذي يسبّحه كلّ شيء كما قال الله تعالى :(وَاِنْ مِنْ شَىْء اِلاّ يُسَبِّحُ بِحَمْدِهِ وَلكِنْ لا تَفْقَهُونَ تَسْبيحَهُمْ)وقال العارف الرّومي في معنى الاية :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'گر ترا از غيب چشمى باز شد   با تو ذرّات جهان همراز شد\n\n'
                      'نطق خاك ونطق آب ونطق گِل   هست محسوس حواس اهل دل\n\n'
                      'جمله ذرّات در عالم نهان   با تو ميگويند روزان وشبان\n\n'
                      'ما سميعيم وبصير وباهُشيم   با شما نامحرمان ما خامشيم\n\n'
                      'از جمادى سوى جان جان شويد   غلغل اجزاى عالم بشنويد\n\n'
                      'فاش تسبيح جمادات آيدت   وسوسه تاوليها بزد آيدت',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وبالاجمال فالتّسبيح الوارد في هذه الرّواية هو تسبيح خاصّ بتربة سيّد الشّهداء أرواحنا له الفداء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادسة :',
                  subtitle:
                      'عن الرّضا (عليه السلام) من أدار السّبحة من تربة الحسين (عليه السلام) فقال: سُبْحانَ اللهِ وَالْحَمْدُ للهِ وَلا اِلـهَ اِلاَّ اللهُ وَاللهُ اَكْبَرُ، مع كلّ حبّة منها كتب الله لهُ بها ستّة آلاف حسنة، ومحا عنه ستّة آلاف سيّئة، ورفع له ستّة آلاف درجة، واثبت له من الشّفاعة مثلها، وعن الصّادق (عليه السلام): انّ من أدار الحصيات الّتي تعمل من تربة الحسين (عليه السلام) أي السّبحة من الخزف فاستغفر بها مرّة واحدة كتب له سبعون مرّة وان أمسك سبحة في يده ولم يسبّح كتب له بكلّ حبّة سبعاً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّابعة :',
                  subtitle:
                      'في الحديث المعتبر انّ الصّادق صلوات الله عليه لما قدم العراق أتاه قوم فسألوه: عرفنا انّ تربة الحسين (عليه السلام) شفاء من كلّ داء فهل هي أمان ايضاً من كلّ خوف ؟ قال : بلى من أراد أن تكون التّربة أماناً له من كلّ خوف فليأخذ السّبحة منها بيده ويقول ثلاثاً :\n\n'
                      'اَصْبَحْتُ اللّـهُمَّ مُعْتَصِماً بِذِمامِكَ وَجِوارِكَ الْمَنيعِ الَّذي لا يُطاوَلُ وَلا يُحاوَلُ، مِنْ شَرِّ كُلِّ غاشِم وَطارِق مِنْ سائِرِ مَنْ خَلَقْتَ وَما خَلَقْتَ مِنْ خَلْقِكَ الصّامِتِ وَالنّاطِقِ فِي جُنَّة مِنْ كُلِّ مَخُوف بِلِباس سابِغَة حَصينَة وَهِيَ وَلاءُ اَهْلِ بَيْتِ نَبِيِّكَ مُحَمَّد صَلَّى اللهُ عَلَيْهِ وَآلِهِ مُحْتَجِزاً مِنْ كُلِّ قاصِد لي اِلى اَذِيَّة بِجَدار حَصين الاِْخْلاصِ فِي الاِْعْتِرافِ بِحَقِّهِمْ وَالَّتمَسُّكِ بِحَبْلِهِمْ جَميعاً، مُوقِناً اَنَّ الْحَقَّ لَهُمْ وَمَعَهُمْ وَمِنْهُمْ وَفيهِمْ وَبِهِمْ اُوالي مَنْ والَوا وَاُعادي مَنْ عادَوا وَاُجانِبُ مَنْ جانَبُوا، فَصَلِّ عَلى مُحَمَّد وَآلِهِ وَاَعِذْنِي اللّـهُمَّ بِهِمْ مِنْ شَرِّ كُلِّ مَا اَتَّقيهِ، يا عَظيمُ حَجَزْتُ '
                      'الاَْعادِىَ عَنّي بِبَديعِ السَّماواتِ وَالاَْرْضِ، اِنّا جَعَلْنا مِنْ بَيْنِ اَيْديهِمْ سَدّاً وَمِنْ خَلْفِهِمْ سَدّاً فَاَغْشَيْناهُمْ فَهُمْ لا يُبْصِرُونَ . ثم يقبل السبحة ويمسح بها عينه ويقول: الَّلهُمَّ انِّي أسأَلُكَ بِحَقِّ هذِهِ التُربَةِ المُبارَكَةِ، وَبِحَقِّ صاحِبِها وبِحَقِّ جَدِّهِ وَبِحَقِّ أبيهِ وبِحَقِّ أُمِّهِ وبِحَقِّ أخيهِ وَبِحَقِّ وُلدِهِ الطاهِرينَ، اجْعَلْها شِفاءً مِنْ كُلِّ داء، وأماناً مِنْ كُلِّ خَوف، وَحِفظاً مِنْ كُلِّ سُوء.\n\n'
                      'ثمّ يجعلها على جبينه، فان عمل ذلك صباحاً كان في أمان الله تعالى حتّى يمسي وان عمله مساءً كان في أمان الله تعالى حتّى يصبح.\n\n'
                      'وروي في حديث آخر انّ من خاف من سلطان أو غيره فليصنع مثل ذلك حين يخرج من منزله ليكُون ذلك حرزاً له.\n\n'
                      'أقول : لا يجوز مطلقاً على المشهور بين العلماء أكل شيء من التّراب أو الطّين الاّ تربة الحسين (عليه السلام)المقدّسة استشفاء من دُون قصد الالتذاذ بها بقدر الحمّصة، والاحوط أن لا يزيد قدرها على العدسة، ويحسن أن يضع التّربة في فمه ثمّ يشرب جُرعة من الماء ويقول : اَللّـهُمَّ اجْعَلْهُ رِزْقاً واسِعاً وَعِلْماً نافِعاً وَشِفاءً مِنْ كُلِّ داء وَسُقْم.\n\n'
                      'قال العلامة المجلسي : الاحوط ترك التّبايع على السّبحة من التّربة أو ما يصنع منها للسّجدة بل تهدى اهداءً ولعلّه ممّا لا بأس به أن يتراضى عليها المتعاملان تراضياً من دون اشتراط سابق، ففي الحديث المعتبر عن الصّادق (عليه السلام) قال : من باع تراب قبر الحسين (عليه السلام) فكأنّما تبايع على لحمه (عليه السلام).\n\n'
                      'أقول : حكى شيخنا المحدّث المتبحّر ثقة الاسلام النّوري (رحمه الله) في كتاب دار السّلام قال : دخل بعض اخواني على والدتي رحمها الله فرأت في جيبه الَّذي في أسفل قبائه (بالفارسيّة) تربة مولانا أبي عبد الله (عليه السلام) فزجرته وقالت : هذا من سوء الادب ولعلّها تقع تحت فخذك فتنكسر ، فقال : نعم انكسرت منها الى الان اثنان وعهد أن لا يضعها بعد ذلك فيه ولما مضى بعض الايّام رأى والد العلاّمة رفع الله مقامه في المنام ولم '
                      'يكن له اطّلاع بذلك انّ مولانا أبا عبد الله (عليه السلام)دخل عليه زائراً وقعد في بيت كتبه الَّذي كان يقعد فيه غالباً فلاطفه كثيراً وقال : ادعُ بنيك يأتوا اليّ لاكرمهم فدعاهم وكانوا خمسة معي، فوقفوا قدامه (عليه السلام) عند الباب وكان بين يديه اشياء من الثّوب وغيره، فكان يدعو واحداً بعد واحد ويعطيه شيئاً منه فلمّا وصلت النّوبة الى الاخ المزبور سلّمه الله نظر الله شبه المغضب والتفت الى الوالد (قدس سره) وقال : ابنك هذا قد كسر تربتين من تراب قبري تحت فخذه ثمّ طرح اليه شيئاً ولم يدعه اليه، وببالي انّ ما أعطاه كان بيت المشط '
                      'الَّذي يعمل من الثّوب الَّذي يقال له بالفارسيّة (تِرْمه) فانتبه وقصّ ما رآه على الوالدة رحمها الله، فأخبرته بما وقع فتعجّب من صدقه ، انتهى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالثة :',
                  subtitle: '',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Ziyarat3ashoraa.screenRoute,
          pushBack: AlziyaratAl2o5ra.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/فضل تربة الحسين.mp3',
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
