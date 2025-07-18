import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'fima_3ala_alza2ir_mora3atoh.dart';
import 'ziyarat_3ashoraa.dart';

class FiFadlZiyaratAlhussein extends StatefulWidget {
  static String screenRoute = 'fi_fadl_ziyarat_alhussein_screen';
  const FiFadlZiyaratAlhussein({super.key});

  @override
  State<FiFadlZiyaratAlhussein> createState() => _FiFadlZiyaratAlhusseinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiFadlZiyaratAlhusseinState extends State<FiFadlZiyaratAlhussein> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_fadl_ziyarat_alhussein_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_fadl_ziyarat_alhussein_screen', value);
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
                      .addFavorite('في فضل زيارة الحسين (عليه السلام)',
                          FiFadlZiyaratAlhussein.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في فضل زيارة الحسين (عليه السلام)',
                          FiFadlZiyaratAlhussein.screenRoute,
                          FiFadlZiyaratAlhussein.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في فضل زيارة الحسين (عليه السلام)',
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
                      'اعلم انّ فضل زيارة الحسين (عليه السلام) ممّا لا يبلغه البيان وفي روايات كثيرة انّها تعدل الحجّ والعمرة والجهاد بل هي أفضل بدرجات، تـُورث المغفرة وتخفيف الحساب وارتفاع الدّرجات واجابة الدعوات وتورث طول العمر والانحفاظ في النفس والمال وزيادة الرزق وقضاء الحوائج ورفع الهموم والكربات، وتركها يوجب نقصاً في الدّين وهو ترك حقّ عظيم من حقوق النّبي (صلى الله عليه وآله وسلم)، وأقلّ ما يوجر به زائره هو أن يغفر ذنوبه وأن يصون الله تعالى نفسه وماله حتّى يرجع الى أهله، فاذا كان يوم القيامة كان الله له أحفظ من الدّنيا، وفي روايات كثيرة انّ زيارته تزيل الغمّ وتهون سكرات الموت وتذهب بهول القبر، وانّ ما يصرف في زيارته (عليه السلام)يكتب بكلّ درهم منه الف درهم، بل عشرة آلاف دِرهم وانّ الزّائر اذا توجّه الى قبره (عليه السلام)استقبله اربعة آلاف ملك فاذا رجع منه شايعته، وانّ الانبياء والاوصياء والائمة المعصومين والملائكة سلام الله عليهم اجمعين يزورون الحسين (عليه السلام)ويدعون لزوّاره ويبشّرونهُم بالبشائر، '
                      'وانّ الله تعالى ينظر الى زوّار الحسين صلوات الله وسلامه عليه قبل نظره الى من حضر عرفات، وانّه اذا كان يوم القيامة تمنّى الخلق كلّهم أن كانوا من زوّاره (عليه السلام) لما يصدر منه (عليه السلام) من الكرامة والفضل في ذلك اليوم، والاحاديث في ذلك لا تحصى وسنشير الى جملة منها عند ذكر زياراته الخاصّة وحسبنا هنا رواية واحدة.\n\n'
                      'روى ابن قولويه والكليني والسّيد ابن طاوُس وغيرهم باسناد معتبرة عن الثّقة الجليل معاوية بن وهب البجليّ الكوفي قال : دخلت على الصادق صلوات الله وسلامه عليه وهو في مُصلاّه فجلست حتّى قضى صلاته فسمعته وهو يُناجي ربّه ويقول : يا من خصّنا بالكرامة ووعدنا الشفاعة وحملنا الرّسالة وجعلنا ورثة الانبياء وختم بنا الامم السّالفة وخصّنا بالوصيّة وأعطانا علم ما مضى وعلم ما بقى وجعل افئدة الناس تهوي الينا اغْفِرْ لي وَلاِِخْواني وَزُوّارِ قَبْرِ اَبي الْحُسَيْنِ بْنِ عَليّ صَلَواتُ اللهِ عَلَيْهِما الذين انفقوا اموالهم واشخصوا أبدانهم رغبة في برّنا ورجاء لما عندك في وصلتنا، وسروراً أدخلوه على نبيّك محمّد صلّى الله عليه وآله واجابة منهم لامرنا وغيظاً أدخلوه على عدوّنا وأرادُوا بذلك رضوانك فكافهم عنّا بالرّضوان واكلاهم بالليل والنّهار واخلف على اهاليهم واولادهم الذين خلّفوا بأحسن الخلف وأصحبهم واكفهم شرّ كلّ جبّار عنيد واعطهم افضل ما '
                      'املوا منك في غربتهم عن أوطانهم وما آثرونا على ابنائهم وأهاليهم وقراباتهم اللّهُمَّ انّ اعداءنا عابوا عليهم خروجهم فلم ينههم ذلك عن النّهوض والشّخوص الينا خلافاً عليهم فَارْحَمْ تِلْكَ الْوُجُوهَ الَّتي غَيَّرَتْهَا الشَّمْسُ وَارْحَمْ تِلْكَ الْخُدُودَ الَّتي تُقَلَّبُ عَلى قَبْرِ أبي عَبْدِاللهِ عَلَيْهِ السَّلامُ وارحم تلك الاعين التي جرت دموعها رحمة لنا وارحم تلك القلوب التي جزعت واحترقت لنا، وارحم تلك الصّرخة التي كانت لنا اللهم انّي استودعك تلك الانفس وتلك الابدان حتى ترويهم من الحوض يوم العطش، فما زال صلوات الله عليه يدعو بهذا الدّعاء وهو ساجد فلمّا انصرف قلت له : جعلت فداك لو انّ هذا الَّذي سمعته منك كان لمن لا يعرف الله لظننت انّ النّار لا تطعم منه شيئاً ابداً والله لقد تمنّيت انّي كنت زرته ولم أحج، فقال لي : ما أقربك منه فما الَّذي يمنعك من زيارته يا معاوية لا تدع ذلك ، '
                      'قلت : جعلت فداك فلم أدر انّ الامر يبلغ هذا كلّه ، فقال : يا معاوية ومن يدعو لزوّاره في السّماء اكثر ممّن يدعو لهم في الارض، لا تدعه لخوف من أحد فمن تركه لخوف رأى من الحسرة ما يتمنّى انّ قبره كان بيده (أي تمنّى أن يكون قد ظلّ عنده حتّى دفن هُناك) أما تُحبّ أن يرى الله شخصك وسوادك فيمن يدعو له رسول الله وعليّ وفاطمة والائمة المعصومون (عليهم السلام) امّا تحبّ أن تكون غداً ممّن تصافحه الملائكة ، امّا تحبّ أن تكون غداً فيمن يأتي وليس عليه ذنب فيتبع به ، أما تحب أن تكون ممّن يصافح رسول الله (صلى الله عليه وآله وسلم).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Fima3alaAlza2irMora3atoh.screenRoute,
          pushBack: Ziyarat3ashoraa.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في فضل زيارة الحسين.mp3',
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
