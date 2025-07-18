import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../../widgets/she3er.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../kaifyat_wziyarat_amir_almo2minin.dart';
import 'alsalisa_men_alziyarat.dart';
import 'fi_kaifiyat_ziyaratihi.dart';

class FiFadlZiyaratihi extends StatefulWidget {
  static String screenRoute = 'fi_fadl_ziyaratihi_screen';
  const FiFadlZiyaratihi({super.key});

  @override
  State<FiFadlZiyaratihi> createState() => _FiFadlZiyaratihiState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiFadlZiyaratihiState extends State<FiFadlZiyaratihi> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_fi_fadl_ziyaratihi_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_fadl_ziyaratihi_screen', value);
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
          .pushReplacementNamed(KaifyatWziyaratAmirAlmo2minin.screenRoute);
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
                      .addFavorite('في فضل زيارته (عليه السلام)',
                          FiFadlZiyaratihi.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في فضل زيارته (عليه السلام)',
                          FiFadlZiyaratihi.screenRoute,
                          FiFadlZiyaratihi.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في فضل زيارته (عليه السلام)',
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
                      'روى الشّيخ الطّوسي (رحمه الله) بسند صحيح عن محمّد بن مُسلم عن الصّادق صلوات الله وسلامه عليه قال : ما خلق الله خلقاً اكثر من الملائكة، وانّه لينزل كلّ يوم سبعون ألف ملك فيأتون البيت المعمُور، فيطوفون به فاذا هم طافوا به طافوا بالكعبة، فاذا طافوا بها أتوا قبر النّبي (صلى الله عليه وآله وسلم) فسلّموا عليه، ثمّ أتوا قبر أمير المؤمنين (عليه السلام) فسلّموا عليه، ثمّ أتوا قبر الحسين (عليه السلام) فسلّموا عليه، ثمّ عرجُوا وينزل مثلهم أبداً الى يوم القيامة، ثمّ قال : مَن زار امير المؤمنين (عليه السلام) عارفاً بحقّه أي وهو يعترف بامامته وَوجوب طاعته وانّه الخليفة للنّبي (صلى الله عليه وآله وسلم) حقّاً غير متجبّر ولا متكبّر، كتب الله له أجر مائة ألف شهيد، وغفر الله له ما تقدّم من ذنبه وما تأخّر، وبعث من الامنين، وهوّن عليه الحساب، واستقبله الملائكة، فاذا انصرف الى منزله فان مرض عادُوه، وإن مات تبعوه بالاستغفار الى قبره.\n\n'
                      'وروى السّيد عبد الكريم بن طاووس (رحمه الله) في فرحة الغرّي عنه (عليه السلام) قال : مَن زار امير المؤمنين صلوات الله وسلامه عليه ماشياً كتب الله له بكلّ خطوة حجّة وعمرة، فإن رجع ماشياً كتب الله له بكلّ خطوة حجّتين وعمرتين.\n\n'
                      'وروي عنه (عليه السلام) ايضاً انّه قال لابن مارد : يا ابن مارد مَن زار جدّي عارفاً بحقّه كتب الله له بكلّ خطوة حجّة مقبُولة وعمرة مبرورة ، يا ابن مارد والله ما يطعم الله النّار قدماً غبرت في زيارة امير المؤمنين (عليه السلام)ماشياً كان أو راكباً، يا ابن مارد اكتب هذا الحديث بماء الذّهب.\n\n'
                      'وروي ايضاً عنه (عليه السلام) قال : نحن نقول بظهر الكوفة قبر لا يلُوذ به ذو عاهة الا شفاه الله.\n\n'
                      'أقول : يظهر من أحاديث معتبرة انّ الله تعالى قد جعل قبور امير المؤمنين (عليه السلام) وأولاده الطّاهرين صلوات الله عليهم اجمعين معاقل الخائفين، وملاجيء المضطرّين، واماناً لاهل الارض، ما زارها مغموم الّا وفرّج الله عنه، وما تمسح بها سقيم الّا وشفى، وما التجأ اليها أحد الّا أمن.\n\n'
                      'روى السّيد عبد الكريم بن طاووس عن محمّد بن عليّ الشيباني قال : خرجت أنا وأبي وعمّي حسين ليلاً متخفين الى الغريّ لزيارة امير المؤمنين صلوات الله وسلامه عليه، وكان ذلك سنة مائتين وبضع وستّين وكنت طفلاً صغيراً، فلمّا وصلنا الى القبر الشّريف وكان يومئذ قبراً حوله حجارة سود ولا بناء عنده، فبينا نحن عنده بعضنا يقرأ وبعضنا يصلّي وبعضنا يزور، واذا نحن بأسد مقبل نحونا، فلمّا قرب منّا قدر رمح تباعدنا عن القبر الشّريف، فجاء الاسد فجَعل يمرّغ ذراعَيه على القبر، فمضى رجل منّا فشاهده فعاد فاعلمنا فزال الرّعب عنّا، فجئناه جميعاً فشاهدناه يمرّغ ذراعه على القبر وفيهِ جراح فلم يزل يمرّغه ساعة ثمّ انزاح عن القبر ومضى، فعدنا الى ما كنّا عليه لاتمام الزّيارة والصّلاة وقراءة القرآن.\n\n'
                      'وحكى الشّيخ المفيد قال : خرج الرّشيد يوماً من الكوفة للصّيد فصار الى ناحية الغريّين والثويّة، فرأى هُناك ظباءً فأمر بارسال الصّقور والكلاب المُعلّمة عليها، فحاولتها ساعة ثمّ لجأت الظِّباء الى أكمة، فتراجعت الصّقور والكلاب عنها، فتعجّب الرّشيد من ذلك، ثمّ انّ الظِّباء هبطت من الاكمة فسقطت الطّيُور والكلاب عليها، فرجعت الظِّباء الى الاكمة فراجعت الصّقور والكلاب عنها مرّة ثانية، ثمّ فعلت ذلك مرّة اخرى، فقال الرّشيد: اركضوا الى الكوفة فأتوا بأكبرها سنّاً، فأتّي بشيخ من بني أسد، فقال الرّشيد: أخبرني ما هذه الاكمة؟ فقال : وهل أنا آمن اذا أجبت السّؤال ؟ فقال الرّشيد : عاهدت الله على أن لا اُوذيك، فقال : حدّثني أبي عن آبائه انّهم كانوا يقولون انّ هذه الاكمة قبر عليّ بن أبي طالب صلوات الله وسلامه عليهما، جعله الله حرماً آمناً يأمن مَن لجأ اليه.\n\n'
                      'أقول : من أمثال العرب السّائرة (اَحْمى مِن مُجيرِ الجَرادِ) وقصّة المثال انّ رجلاً من اهلِ البادية من قبيلة طي يسمّى مُدلج بن سُويد كان ذات يوم في خيمته فاذا هُو بقوم من طي ومعهم أوعيتهم ، فقال : ما خطبكم ؟ قالوا : جراد وقع في فنائك فجئنا لنأخذه، فلمّا سمع مدلج ذلك ركب فرسه وأخذ رمحهُ وقال : اَيَكُونُ الْجَرادُ في جَواري ثُمَّ تُريدُونَ اَخْذَهُ لا يَكونُ ذلك، فما زال يحرسه حتّى حميت الشّمس عليهِ وطار ، فقال : شأنكم الان فقد تحوّل عن جواري.\n\n'
                      'وقال صاحب القاموس : انّ ذا الاعواد لقب رجل شريف جدّاً من العرب قيل هو جدّ أكثم بن الصّيفي كانت قبيلة مضر تجبي اليه الخراج، فلمّا هرم وبلغ الكِبر كان يحمل على سرير فيطاف به بين قبائل العرب ومياهها فيجبى له، وكان شريفاً مكرّماً ما لجأالى سريره خائف الّا أمن، وما دنا من سريره ذليل الّا عزّ، وما أتاه جائع الّا أشبع ، انتهى.\n\n'
                      'فاذا كان سرير رجل من العرب يبلع من العزّة والرّفعة هذا المبلَغ فلا غرو اذا جعل الله تعالى قبر وليّه الّذي كان حملة سريره هم جبرئيل وميكائيل (عليهما السلام) والامام الحسن (عليه السلام) والامام الحسين (عليه السلام) معقلاً للخائفين وملجأ للهاربين وغوثاً للمضطرّين، وشفاء للمرضى، فاجتهد أينما كنت لبلوغ قبره الشّريف والتصق به ما امكنك ذلك والحّ في الدّعاء كي يغيثك (عليه السلام) وينجّيك من الهلاك في الدّنيا والاخرة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle: 'لُذْ اِلى جُودِهِ تَجِدْهُ زَعيماً\n'
                      'بِنَجاةِ الْعُصاةِ يَوْمَ لِقاها\n\n'
                      'عائِذٌ لِلْمُؤَمِّلينَ مُجيبٌ\n'
                      'سامِعٌ ما تُسِرُّ مِنْ نَجْواها',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وحُكي في كتاب دار السّلام عن الشّيخ الديلمي انّه روى جمع من صُلحاء النّجف الاشرف انّ رجلاً شاهد في المنام القبّة الشريفة لحبل الله المتين امير المؤمنين صلوات الله عليه وقد امتدّت اليها واتّصلت بها خيوط خارجة من القبور التي في داخل ذلك المشهد الشّريف وفي خارجه، فأنشد الرّجل :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle: 'اِذا مُتُّ فَادْفِنِّي اِلى جَنْبِ حَيْدَر\n'
                      'اَبي شَبَّر اَكْرِمْ بِهِ وَشُبَيْرِ\n\n'
                      'فَلَسْتُ اَخافُ النّارَ عِنْدَ جِوارِهِ\n'
                      'وَلا اَتَّقي مِنْ مُنْكَر وَنَكيرِ\n\n'
                      'فَعارٌ عَلى حامي الْحِمى وَهُوَ فِى الْحِمى\n'
                      'اِذا ضَلَّ فِى الْبَيْداء عِقالُ بَعيرِ',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiKaifiyatZiyaratihi.screenRoute,
          pushBack: AlsalisaMenAlziyarat.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في فضل زيارته.mp3',
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
