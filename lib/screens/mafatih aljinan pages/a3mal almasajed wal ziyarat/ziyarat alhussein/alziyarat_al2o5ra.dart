import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'alsamina_almo5asasa.dart';
import 'fadl_torbat_alhussein.dart';

class AlziyaratAl2o5ra extends StatefulWidget {
  static String screenRoute = 'alziyarat_al2o5ra_screen';
  const AlziyaratAl2o5ra({super.key});

  @override
  State<AlziyaratAl2o5ra> createState() => _AlziyaratAl2o5raState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlziyaratAl2o5raState extends State<AlziyaratAl2o5ra> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_alziyarat_al2o5ra_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alziyarat_al2o5ra_screen', value);
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
                      .addFavorite('الزيارةالأخرى هي ما يروى عن جابر',
                          AlziyaratAl2o5ra.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الزيارةالأخرى هي ما يروى عن جابر',
                          AlziyaratAl2o5ra.screenRoute,
                          AlziyaratAl2o5ra.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الزيارةالأخرى هي ما يروى عن جابر',
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
                      'وهي انّه روي عن عطا قال : كُنت مع جابر بن عبد الله الانصاري يوم العشرين من صفر، فلمّا وصلنا الغاضريّة اغتسل في شريعتها ولبس قميصاً كان معه طاهراً ثمّ قال لي : أمعك شيء من الطّيب يا عطا ؟ قلت : سعد، فجعل منه على رأسه وساير جسده ثمّ مشى حافياً حتّى وقف عند رأس الحسين (عليه السلام) وكبّر ثلاثاً ثمّ خرّ مغشيّاً عليه، فلمّا أفاق سمعته يقول : اَلسَّلامُ عَلَيْكُمْ يا آلَ اللهِ .. الخبر، وهي بعينها ما ذكرناه من زيارة النّصف من رجب لم يفترق عنها في شيء سوى بضع كلمات ولعلّها من اختلاف النسخ كما احتمله الشّيخ (رحمه الله) ، فمن أرادها فليقرأ زيارة النّصف من رجب السّالفة.\n\n'
                      'أقول : زيارة الحسين (عليه السلام) تزداد فضلاً في الاوقات الشّريفة واللّيالي والايّام المباركة ممّا لم يخصّ بالذّكر لا سيّما فيما انتسب اليه من تلك الاوقات كيوم المباهلة ويوم نزول سورة هَلْ أَتى ويوم ميلاده الشّريف وليالي الجمعة وغير ذلك من شريف الازمان، ويستفاد من بعض الرّوايات انّ الله تعالى ينظر الى الحسين (عليه السلام)في كلّ ليلة من ليالي الجُمعة بعين الكرامة فيبعث الى زيارته كلّ نبيّ أو وصيّ نبيّ . وروى ابن قولويه عن الصّادق (عليه السلام) : انّ من زار قبر الحسين في كلّ جمعة غفر الله له ولم يخرج من الدّنيا حسراً وكان في الجنة مع الحُسين (عليه السلام) . وفي حديث الاعمش انّه قال له بعض جيرانه : رأيت في المنام رقعاً تتساقط من السّماء فيها أمان لمن زار الحسين (عليه السلام) ليلة الجمعة، وسيأتي اشارة الى هذا في أعمال الكاظميّة عند ذكر قصّة الحاج عليّ البغدادي.\n\n'
                      'وروى انّ الصّادق (عليه السلام) سئل عن زيارة الحسين (عليه السلام) هل لها وقت أفضل من غيره ؟ قال : زوروه في كلّ زمان فانّ زيارته خير مقرّر، من أكثر منها كثر نصيبه من الخير ومن أقلّ منها قلّ نصيبه منه، واجتهدوا في زيارته في الاوقات الشّريفة ففيها يضاعف أجر الصّالحات وتنزل فيها الملائكة من السّماء لزيارته (عليه السلام) .. الخبر . ولم نعثر على زيارة خاصّة له (عليه السلام) تخصّ هذه الاوقات المذكورة ، نعم قد خرج من النّاحية المقدّسة في اليوم الثّالث من شعبان وهو يوم ميلاده (عليه السلام) دعاء ينبغي قراءته، وقد مضى في خلال أعمال شهر شعبان، واعلم ايضاً انّ لزيارته (عليه السلام) في غير كربلاء من البلاد البعيدة فضلاً كثيراً ايضاً ونحن نقتصر في ذلك على ذكر حديثين مرويين في الكافي والفقيه والتّهذيب.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الحديث الاوّل :',
                  subtitle:
                      'روى ابن أبي عمير عن هشام عن الصّادق (عليه السلام) قال : اذا بعدت بأحدكم الشّقة ونأت به الدّار فليعل أعلى منزله فيصلّي ركعتين وليؤم بالسّلام الى قبورنا فانّ ذلك يصير الينا.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الحديث الثّاني :',
                  subtitle:
                      'عن حنان بن سدير عن أبيه قال : قال لي الصّادق (عليه السلام) : يا سدير تزُور قبر الحسين (عليه السلام)في كلّ يوم؟ قلت : جعلت فداك لا ، قال : ما أجفاكم ، فتزوره في كلّ جمعة ؟ قلت : لا ، قال : فتزوره في كلّ شهر ؟ قلت : لا ، قال : فتزوره في كلّ سنة ؟ قلت : قد يكون ذلك ، قال : يا سدير ما اجفاكم بالحسين (عليه السلام)، أما علمتم انّ لله ألفين من الملائكة – وفي رواية التّهذيب والفقيه ألف ألف ملك – شعثاً غبراً يبكون ويزُورون لا يفترون، وما عليك يا سدير أن تزُور قبر الحسين (عليه السلام) في كلّ جمعة خمس مرّات وفي كلّ يوم مرّة؟ قلت : جعلت فداك انّ بيننا وبينه فراسخ كثيرة ، فقال : تصعد فوق سطحك ثمّ تلتفت يمنة ويسرة ثمّ ترفع رأسك الى السّماء ثمّ تتحوّل نحو قبر الحسين (عليه السلام) ثمّ تقول: اَلسَّلامُ عَلَيْكَ يا اَبا عَبْدِاللهِ السَّلامُ عَلَيكَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ تُكتب لك زورة، والزّورة حجّة وعمرة ، قال سدير: فربّما فعلته في الشّهر اكثر من عشرين مرّة وقد مضى في أوّل الزّيارة المطلقة الاولى ما يناسب المقام.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FadlTorbatAlhussein.screenRoute,
          pushBack: AlsaminaAlmo5asasa.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الزيارة الاخرى.mp3',
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
