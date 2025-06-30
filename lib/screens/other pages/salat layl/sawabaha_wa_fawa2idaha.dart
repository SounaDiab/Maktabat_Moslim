import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../salat_allayl.dart';
import 'dou3aa_7azin.dart';
import 'waktaha_wakaifyatiha.dart';

class SawabahaWaFawa2idaha extends StatefulWidget {
  static String screenRoute = 'sawabaha_wa_fawa2idaha_screen';
  const SawabahaWaFawa2idaha({super.key});

  @override
  State<SawabahaWaFawa2idaha> createState() => _SawabahaWaFawa2idahaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SawabahaWaFawa2idahaState extends State<SawabahaWaFawa2idaha> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_sawabaha_wa_fawa2idaha_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_sawabaha_wa_fawa2idaha_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(SalatAllayl.screenRoute);
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
                      .addFavorite('عنها وثوابها وفوائدها',
                          SawabahaWaFawa2idaha.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'عنها وثوابها وفوائدها',
                          SawabahaWaFawa2idaha.screenRoute,
                          SawabahaWaFawa2idaha.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'عنها وثوابها وفوائدها',
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
                  title: 'في الحديث: "ليس منّا من لم يصلّ صلاة الليل"\n\n'
                      'أ- في ظلال الحديث',
                  subtitle:
                      'جاء ذكر صلاة الليل في الكتاب الكريم في مواضع عديدة منها قوله تعالى: ﴿وَمِنَ اللَّيْلِ فَتَهَجَّدْ بِهِ نَافِلَةً لَّكَ عَسَى أَن يَبْعَثَكَ رَبُّكَ مَقَامًا مَّحْمُودًا﴾(الإسراء:79).\n\n'
                      'وقوله عزّ وجلّ: ﴿إِنَّ نَاشِئَةَ اللَّيْلِ هِيَ أَشَدُّ وَطْءًا وَأَقْوَمُ قِيلًاً﴾(المزمل:6)، وبها أوصى الأنبياء والملائكة يقول النبي صلى الله عليه وآاله: "ما زال جبرائيل يوصيني بقيام الليل حتى ظننت أن خيار أمتي لن يناموا من الليل إلا قليلاً"، وفي وصيته صلى الله عليه وآاله لأمير المؤمنين عليه السلام: "عليك بصلاة الليل يكّررها أربعاً".\n\n'
                      'ولها من الفضل ما يذهل العبد إذا قدر على الإحاطة، به فهي شرف المؤمن ودأب الصالحين، ومبعدة الداء من الأجساد ومصححة البدن، والمانعة من نزول العذاب، وهي من روح اللَّه تعالى وتجلب رضاه، وتحسّن الخلق وغير ذلك مما روي.\n\n'
                      'فمن الطبيعي أن تكون شعار الأولياء ومنهاج الأصفياء وسبيل الأتقياء فأهل الولاية المتربّون في مدرسة أهل البيت عليهم السلام هم أهل صلاة الليل والاستغفار بالأسحار، وبالإمكان بلوغ ما نروم إليه من الحديث المصدّر بقوله عليه السلام: "ليس منّا.." حينما نقرأ تعريف مولانا الصادق عليه السلام عن شيعته وهو يقول: "شيعتنا أهل الورع والاجتهاد وأهل الوفاء والأمانة وأهل الزهد والعبادة، أصحاب إحدى وخمسين ركعة في اليوم والليلة، القائمون بالليل، الصائمون بالنهار، يزكّون أموالهم ويحجّون البيت ويجتنبون كل محرم".',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'ب- ثواب صلاة الليل',
                  subtitle:
                      'يتساءل الواحد منا أنه إذا كان لهذه النافلة درجة عالية من الأهمية في تربية الإنسان وعملية تهذيب النفس حيث أنها تساعده في برنامجه الساعي إلى الكمال، والانتهاء من التخبط يميناً وشمالاً والفرار من شرك الشيطان اللعين، فلا بد أن يكون ثوابها عظيماً ومتناسباً مع دورها المحوري فما هو ذلك الثواب يا ترى؟\n\n'
                      'والجواب: أنه غير مبيّن بتحديد معيّن وما ذلك إلا لعظمته.\n\n'
                      'وفي هذا الشأن يقول مولانا الصادق‏ عليه السلام: "ما من عمل حسن يعمله العبد إلا وله ثواب في القرآن إلا صلاة الليل، فإن اللَّه لم يبيّن ثوابها لعظيم خطرها عنده فقال: تتجافى جنوبهم عن المضاجع.. فلا تعلم نفس ما أخفي لهم من قرة أعين جزاء بما كانوا يكسبون".',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'ج- أسباب الحرمان من صلاة الليل',
                  subtitle:
                      'إن كثيرين يحبون أن ينالوا شرف قيام الليل وأداء هذه الناشئة المباركة ويتشوقون إلى ذلك، لكن سرعان ما تراهم لا يبادرون إلى ما أحبّوه، وظلّ هذا الحب في عالم النفس وحديثها دون أن يترجم بالفعل والخارج فكأن شيئاً حال بينهم وبين تحقيق مطلوبهم ولقاء محبوبهم فما هو ذلك الشي‏ء الذي أوجد حاجزاً أو شكّل مانعاً؟\n\n'
                      'والجواب: أنه ليس أمراً واحداً وإنما جملة من الأمور لكنها تنتمي إلى أصل واحد يسمّى الذنب على اختلاف أنواعه وأشكاله.\n\n'
                      'يقول الصادق عليه السلام: "إن الرجل يذنب فيحرم صلاة الليل وإن العمل السيى‏ء أسرع في صاحبه من السكين في اللحم".\n\n'
                      'وفي حديث عن أمير المؤمنين عليه السلام لرجل شكى عن حرمانه صلاة الليل: "أنت رجل قد قيّدتك ذنوبك".\n\n'
                      'وفي حديث آخر: "إن الرجل ليكذب الكذبة فيحرم بها صلاة الليل".\n\n'
                      'ومن الذنوب الموانع العجب، فإن الإنسان إذا قدر على التخلص من سائر الذنوب وبقيت له آفة العجب والرضا عن النفس فهي كافية للحؤول بينه وبين التوفيق للتهجد والقيام بالليل.\n\n'
                      'يقول رسول اللَّه صلى الله عليه وآله: قال اللَّه تعالى: "إن من عبادي المؤمنين لمن يجتهد في عبادتي فيقوم من رقاده ولذيذ وساده فيتهجدّ لي الليالي، فيتعب نفسه في عبادتي فأضربه بالنعاس الليلة والليلتين نظراً مني له وابقاءً عليه فينام حتى يصبح وهو ماقت لنفسه، زار عليها، ولو أخلي بينه وبين ما يريد من عبادتي لدخله من ذلك العجب، فيصيّره العجب إلى الفتنة بأعماله، فيأتيه من ذلك ما فيه هلاكه لعجبه بأعماله ورضاه عن نفسه عند حد التقصير فيتباعد مني عند ذلك وهو يظن أنه يتقرب إليّ".',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'د- فوائد صلاة الليل',
                  subtitle:
                      'هي مطردة الداء من الأجساد، ومصححة البدن، وإنها تبيّض الوجه وتحسّنه، وتحسّن الخلق، وتطيّب الريح، وتجلب الرزق وتدرّه، وتقضي الدين، وتذهب بالهمّ، وتجلو البصر، وإنها تمنع من نزول العذاب، وإنها من روح اللَّه تعالى، وإنها تجلب رضا الرب، وإنها تمسّك بأخلاق النبيين، وتعرّض لرحمة رب العالمين، وتنفي السيئات، وتذهب بما عمل من ذنب بالنهار، وأن العبد ليقوم في الليل فيميل به النعاس يميناً وشمالاً وقد وقع ذقنه على صدره، فيأمر اللَّه تعالى أبواب السماء فتفتح، ثم يقول للملائكة: انظروا إلى عبدي ما يصيبه في التقرّب إليّ بما لم افترضه عليه راجياً مني لثلاث خصال: ذنباً اغفر له، أو توبة أجدّدها، أو رزقاً أزيده. اشهدوا ملائكتي أني قد جمعتهن له.\n\n'
                      'وسئل علي بن الحسين عليه السلام: ما بال المتهجدين بالليل من أحسن الناس وجهاً؟ قال: لأنهم خلوا باللَّه فكساهم اللَّه من نوره، وإن البيوت التي يصلّى فيها بالليل ويتلى فيها القرآن تضي‏ء لأهل السماء كما تضي‏ء نجوم السماء لأهل الأرض.\n\n'
                      'وورد أنه كذب من زعم أنه يصلّي بالليل ويجوع بالنهار، إن صلاة الليل تضمن رزق النهار.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: WaktahaWakaifyatiha.screenRoute,
          pushBack: Dou3aa7azin.screenRoute,
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
