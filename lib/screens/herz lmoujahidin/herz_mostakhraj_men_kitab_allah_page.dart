import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'alhayakel_sabea_page.dart';
import 'douaa_lidafea_kaid_aladow_wsharoh_page.dart';

class HerzMostakhrajMenKitabAllahPage extends StatefulWidget {
  static String screenRoute = 'herzmostakhrajmenkitaballah_screen';
  HerzMostakhrajMenKitabAllahPage({super.key});

  @override
  State<HerzMostakhrajMenKitabAllahPage> createState() =>
      _HerzMostakhrajMenKitabAllahPageState();
}

class _HerzMostakhrajMenKitabAllahPageState
    extends State<HerzMostakhrajMenKitabAllahPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_herzmostakhrajmenkitaballah_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzmostakhrajmenkitaballah_screen', value);
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
                      .addFavorite('حرز مستخرج من كتاب الله',
                          HerzMostakhrajMenKitabAllahPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'حرز مستخرج من كتاب الله',
                          HerzMostakhrajMenKitabAllahPage.screenRoute,
                          HerzMostakhrajMenKitabAllahPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حرز مستخرج من كتاب الله',
            style: TextStyle(
              fontSize: isTablet
                  ? 40
                  : size > 1
                      ? 20
                      : 23,
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
                    child: Column(
                  children: [
                    Text(
                      'للحفظ من جميع البلايا وردّ كيد السلطان الجائر.',
                    ),
                    ListOfNineVerses(
                      title: 'تعريف:',
                      subtitle:
                          'وهو الدعاء الذي قرأه الإمام الصادق ع لمّا استدعاه المنصور لقتله للمرة السابعة فأمنه الله منه، وكان عليه السلام يقرؤه يعوِّذ به نفسه وكتبه وجعله حرزاً لابنه الكاظم عليه السلام.\n'
                          'رواه السيد ابن طوس في المهج في أحراز الإمام الصادق عليه السلام وذكره أيضاً في الأدعية المروية عنه عليه السلام بزيادة عمّا ذكره في الأحراز، وقال لعلّ هذه الزيادة كانت قبل استدعائه لسعاية القرشي، وهو محمد بن عبدالله الإسكندرية.\n'
                          'وذكره أيضاً الشيخ الكفعمي في المصباح في أدعية الأمن من عتاة السلاطين برواية علي إبراهيم بن هاشم. الدعاء أيضاً السيد علي خان في الكلم الطيب عن الصادق ع لكفاية العدو.',
                      weight: FontWeight.w400,
                      size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                    ),
                  ],
                )),
                Container(
                  child: ListOfNineVerses(
                    title: 'آثاره:',
                    subtitle:
                        'في المهج عن محمد بن عبدالله الاسكندري قال ما ملخصه :\n'
                        'كنت من جملة ندماء المنصور وصاحب سرِّه،'
                        'فدخلت عليه يوماً فرأيته مغتماً فقلت :\n'
                        'ماذا يا أمير المؤمنين  ؟ \n'
                        'قال: \n'
                        'لقد هلك من أولاد فاطمة (ع) مقدار مائه او يزيدون وقد بقي سيِّدهم وإمامهم .\n'
                        'قلت : من ذلك ؟ \n'
                        'قال : جعفر بن محمَّد .\n'
                        'فقلت : إنَّه رجل أنحلته العبادة واشتغل بالله عن طلب الملك والخلافة .\n'
                        'قال: قد علمت أنك تقول به وبإمامته ، ولكن الملك عقيم ، وقد آليت على نفسي أن لا امسي عشيتي هذه او أفرغ منه ، ثم دعا سيَّافاً فقال له: \n'
                        'إذا أنا أحضرت ابا عبدالله وشغلته بالحديث ووضعت قلنسوتي عن رأسي فهو العلامة بيني وبينك فاضرب عنقه ، ثم أحضر أبا عبدالله (ع) في تلك الساعة .\n'
                        'قال الراوي: فلحقه في الدار وكان يحرّك شفتيه ولم أدر ما كان يقرأ (ع). ورأيت القصر يموج كأنه سفينة في لجج البحار، ورأيت المنصور يمشي بين يدي الإمام (ع) حافي القدمين مكشوف الرأس قد اصطكت أسنانه وارتعدت فرائصه يحمرُّ ساعة ويصفرُّ أخرى، وقد أخذ بعضد أبي عبدالله الصادق (ع) وأجلسه على سريره وجثا بين يديه كما يجثو العبد بين يدي مولاه، ثم قال:\n'
                        'يا بن رسول الله ما الذي جاءك في هذه الساعة؟\n'
                        'قال الإمام: إجابة لدعوتك.\n'
                        'قال: ما دعوتك والغلط من الرسول، ثم قال:\n سل حاجتك.\n'
                        'فقال الإمام (ع): أسألك أن لا تدعوني لغير شغل.\n'
                        'قال: لك ذلك وغير ذلك.\n'
                        'ثم انصرف أبو عبدالله، وحدّثني المنصور بعد ذلك فقال:\n'
                        'لمّا أحضرت أبا عبدالله الصّادق (ع) وهممت به ما هممت من السوء رأيت تنيناً قد حوى بذنبه جميع داري وقصري وقد وضع شفتيه العليا في أعلاه والسفلى في أسفلها وهو يكلِّمني بلسان طلق زلق عربي مبين:\n'
                        'يا منصور إن الله تعالى قد بعثني إليك وأمرني إن أنت أحدثت في أبي عبدالله حدثاً فأنا أبتلعك ومن في دارك جميعاً.\n'
                        'فطاش عقلي وارتعدت فرائصي واصطكّت أسناني.\n'
                        'قال الراوي: وبعد ذلك اسأذنت المنصور بزيارة أبي عبدالله الصّادق (ع). فدخلت عليه وسلّمت وقلت: أسألك بحقِّ حبّك أن تعلمني الدعاء الذي كنت تقرؤه عند دخولك على المنصور.\n'
                        'قال: لك ذلك، ثم قال (ع):\n'
                        'يا محمد هذا الدعاء حرز جليل ودعاء عظيم حفظته عن آبائي الكرام (ع) هو حرز مستخرج من كتاب الله عزّ وجلّ العزيز الذي لا يأتيه الباطل من بين يديه ولا من خلفه تنزيل من حكيم حميد.\n'
                        'وقال في المهج:\n'
                        'هو دعاء جليل مضمون الإجابة ومبارك مستجاب، ثم قال:\n'
                        'لمّا ورد أبو مخلّد بن يحيى من بغداد لرسالة خراسان إلى عند الأمير ابن الحسن بن نصر بن أحمد ببخارى، كان هذا الدعاء مكتوباً في دفتر أوراقه من فضّة وكتابتها بماء الذهب وهبها من الشيخ أبي الفضل محمد بن عبدالله البلعمي، وقال له:\n'
                        'إن هذا من أسنى التحف وأجلّ الهبات فمن وفَّقه الله عزّ وجلّ لقراءته صبيحة كل يوم حفظه الله من جميع البلايا وأعاذه من شرِّ مردة الجن والإنس والشياطين والسلطان الجائر والسِّباع ومن شر الأمراض والآفات والعاهات كلّها وهو مجرَّب إلَّا أن يخلص لِلَّهِ عزّ وجلّ.\n',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Text('برواية علي بن إبراهيم بن هاشم كما في المصباح:'),
                      ListOfNineVerses(
                        title: 'الدعاء:',
                        subtitle:
                            'بسم الله الرحمن الرحيم، لا إله إلا الله أبداً حقاً حقاً، لا إله إلا الله إيماناً وصدقاً،  لا إله إلا الله تعبداً ورقّاً، لا إله إلا الله تلطُّفاً ورفقاً، لا إله إلاَّ الله بسم الله والحمدالله واعتصمتُ بالله وألجأت ظهري الى الله ما شاء الله لا قوة إلا بالله وما توفيقي إلا بالله وما النصرُ إلا بالله ونِعم القادرُ الله ونِعمَ المولى الله ونعم النصير الله ولا يأتي بالحسنات إلا الله ولا يصرفُ السيئاتِ إلا الله وما بنا من نعمةٍ  فمن الله وإن الأمر كلَّه لله وأستغفر الله وأستغيث الله وصلى الله على محمد وآله وعلى أنبياء الله وعلى ملائكةِ الله وعلى الصالحين من عباد الله.\n'
                            'إنه من سليمان وإنه بسم الله الرحمان الرحيم ألاَّ تَعلُوا  عليَّ وأتوني مسلمين ، كتب الله لأغلبنَّ أنا ورسلي إن الله قويٌّ عزيز، لا يضرُّكم كيدهم شيئاً إن الله بما يعملون مُحيط واجعل لي من لدنك سلطاناً نصيراً، إذ هَمَّ قومٌ أن يبسطوا إليكم أيديهم فكفَّ أيديَهُم عنكم واتَّقوا الله وعلى الله فليتوكَّل المؤمنون ، والله يعصمك من الناس ان الله لا يهدي القوم الكافرين كلَّما أوقدوا ناراً للحرب أطفأها الله ويسعون في الارض فساداً والله لا يحب المفسدين ، قلنا يا نارُ كوني برداً وسلاماً على ابراهيم وأرادوا به كيداً فجعلناهم الأخسرين، وزادكم في الخلق بسطةً فاذكروا آلاء الله لعلكم تفلحون ، له معقِّباتٌ من بين يديه ومن خلفه يحفظونه من أمرِ الله رب أدخلني مُدخل صدقٍ وأخرجني مُخرج صدقٍ واجعل لي من لدنك سلطاناً نصيراً، وقرَّبناه نجيّاً ورفعناه مكاناً عليّاً سيجعل لهم الرحمن وُدّاً، وألقيت عليك محبَّةً مني ولِتُصنع على عيني إذ تمشي أُختك فتقول هل أدُلُّكم على من يكفله فرجعناك إلى أمك كي تقرَّ عينها ولا تحزن وقتلت نفساً فنجيناك من الغم وفتناك فتوناً لا تخف إنك من الآمنين لا تخف إنك أنت الأعلى لا تخاف دركاً ولا تخشى لا تخف نجوت من القوم الظالمين لا تخف إنا منجّوك وأهلك لا تخافا إنني معكما أسمع وأرى وينصرك الله نصراً عزيزاً ومن يتوكل على الله فهو حسبه إن الله بالغ أمره قد جعل الله لكلِّ شيءٍ قدراً فوقاهم الله شر ذلك اليوم ولقّاهم نضْرةً وسروراً وينقلب إلى أهله مسروراً ورفعنا لك ذكرك ويحبونهم كحب الله والذين آمنوا أشد حباً لله ربنا أفرغ علينا صبراً وثبت أقدامنا وانصرنا على القوم الكافرين الذين قال لهم الناس إن الناس قد جمعوا لكم فاخشوهم فزادهم إيماناً وقالوا حسبنا الله ونعم الوكيل فانقلبوا بنعمةٍ من الله وفضلٍ لم يمسسهم سوءٌ واتَّبعوا رِضوان الله والله ذو فضل عظيم، أو من كان ميتاً فأحييناه وجعلنا له نوراً يمشي به في الناس هو الذي أيَّدك بنصره وبالمؤمنين وألف بين قلوبهم . . . ولكنَّ الله ألَّف بينهم إنه عزيزٌ حكيم سنشدُّ عضدك بأخيك ونجعل لكما سلطاناً فلا يصلون إليكما بآياتنا أنتما ومن اتبعكما الغتلبون، على الله توكلنا ربنا افتح بيننا وبين قومنا بالحق وأنت خير الفاتحين، إني توكلت على الله ربي وربِّكم ما من دابةٍ إلا هو آخذٌ بناصيتها إن ربي على صراطٍ مستقيم، فستذكرون ما أقول لكم وأفوض أمري إلى الله إنَّ الله بصيرٌ بالعباد، فإنّ تولّوا فقل حسبي الله لا إله إلا هو عليه توكلت وهو ربُّ العرش العظيم، ربِّ أني مسني الضرُّ وأنت أرحم الراحمين لا إله إلا أنت سبحانك إني كنت من الظالمين، آلم ذلك الكتاب لا ريب فيه هدىً للمتقين الذين يؤمنون بالغيب ويقيمون الصلاة ومما رزقناهم ينفقون، الله لا إله إلا هو الحيُّ القيوم الله لا إله إلا هو عليك توكَّلت وهو ربُّ العرش العظيم زعنت الوجوه للحي القيوم وقد خاب من حمل ظلماً فتعالى الله الملك الحق لا إله إلا هو ربُّ العرش الكريم فلله الحمد ربِّ السموات وربِّ الأرض ربِّ العالمين وله الكبرياء في السماوات والأرض وهو العزيز الحكيم وإذا قرأت القرآن جعلنا بينك وبين الذين لا يؤمنون بالآخرة حجاباً مستوراً وجعلنا على قلوبهم أكنَّةً أن يفقهوه وفي آذانهم وقراً وإذا ذكرت ربك في القرآن وحده ولًوا على أدبارهم نفوراً، أفرأيت من اتخذ إلهه هواه وأضلَّه الله على عِلمٍ وختم على سمعه وقلبه وجعل على بصره غشاوةً فمن يهديه من بعد الله أفلا تَذَكَّرون، وجعلنا من بين أيديهم سداً ومن خلفهم سداً فأغشيناهم فهم لا يبصرون، وما توفيقي إلا بالله عليه توكلت وإليه أنيب، إن الله مع الذين اتَّقوا والذين هم محسنون، وقال الملك ائتوني به أستخلصه لنفسي فلمَّا كلَّمه قال إنك اليوم لدينا مكينٌ أمينٌ، وخشعتِ الأصوات للرحمن فلا تسمع إلا همساً فسيكفيكهم الله وهو السميع العليم، لو أنزلنا هذا القرآن على جبلٍ لرأيته خاشعاً متصدعاً من خشية الله وتلك الأمثال نضربها للناس لعلهم يتفكَّرون هو الله الذي لا إله هو عالم الغيب والشهادة هو الرحمن الرحيم هو الله الذي لا إله إلا هو الملك القدّوس السلام المؤمن المهيمن العزيز الجبار المتكبِّر سبحان الله عمّا يشركون هو الله الخالق البارئ المصوِّر له الأسماء الحسنى يسبِّح له ما في السماوات والأرض وهو العزيز الحكيم، ربنا ظلمنا أنفسنا وإن لم تغفر لنا وترحمنا لنكوننَّ من الخاسرين، ربنا اصرف عنا عذاب جهنم إن عذابها كان غراماً إنها ساءت مستقراً ومقاماً، ربنا ما خلقت هذا باطلاً سبحانك فقنا عذاب النار، وقل الحمدالله الذي لم يتَّخذ ولداً ولم يكن له شريكٌ في الملك ولم يكن له وليٌّ من الذلِّ وكبِّره تكبيراً وما لنا ألّا نتوكّل على الله وقد هدانا سُبُلنا ولنصبرنَّ على ما آذيتمونا وعلى الله فليتوكل المتوكلون، إنما أمره إذا أراد شيئاً أن يقول له كن فيكون فسبحان الذي بيده ملكوت كلِّ شيءٍ وإليه ترجعون.\n'
                            'اللهم من أراد بي وبأهلي وولدي وأهل عنايتي بشّر وضُرّ فاقمع رأسه واعقل لسانه والجم فاه وحل بيني وبينه كيف شئت وأنّى شئت واجعلنا منه ومن كلِّ دابةٍ أنت آخذٌ بناصيتها إنك على صراط مستقيم في حجابك الذي لا يستضام فإن حجابك منيع وجارك عزيز وأمرك غالب وسلطانك قاهرٌ وأنت على كل شيءٍ قديرٌ.\n'
                            'اللهم صلِّ على محمد وآل محمدٍ أفضل ما صليت على أحدٍ من خلقك وصلِّ على محمدٍ وآل محمدٍ كما هديتنا به من الضلالة واغفر لنا ولآبائنا ولأمهاتنا ولجميع المؤمنين والمؤمنات الأحياء منهم والأموات وتابع بيننا وبينهم بالخيرات إنك مجيب الدعوات وأنت على كل شيءٍ قديرٌ.\n'
                            'اللهم إني أستودعك نفسي وديني وأمانتي وأهلي ومالي وعيالي وأهل حُزانتي وخواتيم عملي وجميع ما أنعمت به عليَّ من أمر دنياي وآخرتي فإنه لا يضيع محفوظك ولا ترزأ ودائعك، قل إني لن يجيرني من الله أحدٌ ولن أجد من دونه ملتَحَداً، اللهم ربنا آتنا في الدنيا حسنة وفي الآخرة حسنةً وقنا عذاب النار وصلَّى الله على محمدٍ وآله أجمعين.',
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
          pushNext: AlhayakelSabeaPage.screenRoute,
          pushBack: DouaaLidafeaKaidAladowWsharohPage.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/حرز مستخرج من كتاب الله.mp3',
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
