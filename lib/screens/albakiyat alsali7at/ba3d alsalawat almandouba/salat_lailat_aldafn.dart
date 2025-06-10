import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_alhadiya.dart';
import 'salat_alwalad_liwalidayh.dart';

class SalatLailatAldafn extends StatefulWidget {
  static String screenRoute = 'salat_lailat_aldafn_screen';
  const SalatLailatAldafn({super.key});

  @override
  State<SalatLailatAldafn> createState() => _SalatLailatAldafnState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatLailatAldafnState extends State<SalatLailatAldafn> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_lailat_aldafn_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_lailat_aldafn_screen', value);
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
          .pushReplacementNamed(Ba3dAlsalawatAlmandouba.screenRoute);
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
                          'صلاة ليلة الدفن', SalatLailatAldafn.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة ليلة الدفن',
                          SalatLailatAldafn.screenRoute,
                          SalatLailatAldafn.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة ليلة الدفن',
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
                      'ركعتان : في الأولى الحمد وآية الكرسي، وفي الثانية الحمد وعشر مرات إنا أنزلناه في ليلة القدر فإذا سلّم قال : اللَّهُمَّ صَلِّ عَلى مُحَمَّدٍ وَآل مُحَمَّدٍ وَابْعَثْ ثَوابَها إِلى قَبْرِ (فُلان) وليسم الميت عوضا عن كلمة فلان.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة أخرى',
                  subtitle:
                      'روى أيضاً السيد ابن طاووس رض عن النبي (صلّى الله عليه وآله وسلم) قال: لا يأتي على الميت ساعة أشدّ من أوّل ليلة، فارحموا موتاكم بالصّدقة فإن لم تجدوا فليصلِّ أحدكم ركعتين يقرأ في الأولى فاتحة الكتاب مرة وقل هو الله أحد مرتين، وفي الثانية فاتحة الكتاب مرة وألهاكم التكاثر عشر مرات، ويسلم ويقول : اللَّهُمَّ صَلِّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَابْعَثْ ثَوابَها إِلى قَبْرِ ذلِكَ المَيِّتِ فُلانِ بِنْ فُلانٍ.\n\n'
                      'فيبعث الله من ساعته ألف ملك إلى قبره مع كل ملك ثوب وحلّة، ويوسّع في قبره من الضيق إلى يوم ينفخ في الصّور، ويعطى‌المصلّي بعدد ماطلعت عليه الشمس حسنات، وترفع له أربعون درجة.\n\n'
                      'أقول : روى الكفعمي أيضاً هذه الصلاة بهذه الكيفية ثم قال: ورأيت في بعض كتب أصحابنا أنّه يقرأ في الأولى بعد الفاتحة آية الكرسي مرّة والتوحيد مرّتين وقال العلامة المجلسي رض في كتاب (زاد المعاد) ينبغي للمر أن لاينشغل عن ذكر الاموات فإنهم قد انقطعت أياديهم عن الاعمال الصالحة والخيرات وهم يأملون في أبنائهم وأقاربهم وإخوانهم من المؤمنين يترقّبون إحسانهم ولاسيما دعاءهم في صلاة الليل وعلى المر أن يخص والديه في دعائه في أعقاب الفرائض وفي المشاهد الشريفة وأن يعمل لهم الصالحات من الاعمال ففي الحديث ربّ رجل يكون عاقّاً لوالديه في حياتهما ويكتب باراً لهما بعد وفاتهما لما عمله عنهما من الصالحات. ورب رجل يكون باراً في حياتهما فيكتب بعد وفاتهما عاقّا لهما لتوانيه فيما ينبغي أن يعمل عنهما من الاعمال وأهم مايسدى به إلى الابوين وإلى سائر ذوي القربي أن يؤدي ديونهم وأن يبرئهم ممّا في ذمتهم من حقوق الله أو حقوق خلقه فيجتهد في أن يؤدي عنهم الحجّ وغيره ممّا قد فاتهم من العبادات استئجاراً أو تبرعاً.\n\n'
                      'وفي الصحيح أن الصادق (عليه السلام) كان يصلّي عن ولده في كل ليلة ركعتين وعن والديه في كل يوم ركعتين يقرأ في الأولى إنّا أنزلناه وفي الثانية إنّا أعطيناك الكوثر وفي الصحيح عن الصادق (عليه السلام) قال: ربما يكون الميّت في ضيق فيوسع عليه ثم يؤتى فيقال إنّه خفّف عنك هذا الضّيق بصلاة فلان أخيك ، فسأله الراوي: هل يجوز أن يُشرك اثنان من الاموات في ركعتي الصلاة ؟ فأجاب (عليه السلام): بلى. وقال (عليه السلام): إن الميت ليفرح بالدعاء له والاستغفار كما يفرح الحي بالهدية تهدى إليه. وقال (عليه السلام): يدخل الميت في قبره الصلاة والصوم والحج والصدقة والبرّ والدعاء. قال: ويكتب أجره للذي يفعله وللميت. وقال (عليه السلام) في حديث اَّخر: من عمل من المسلمين عن ميت عملاً أضعف له أجره ونفع الله عزَّ وجلَّ به الميت.\n\n'
                      'وفي بعض الاحاديث أنّه إذا تصدّق الرجل بنية الميت أمر الله جبرائيل أن يحمل إلى قبره سبعين ألف ملك في يد كل ملك طبق، فيحملون إلى قبره ويقولون: السلام عليك يأولي الله ، هذه هدية فلان بن فلان المؤمن إليك، فيتلالا قبره واعطاه الله ألف مدينة في الجنّة وزوّجه ألف حوراء وألبسه ألف حلّة وقضى له ألف حاجة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAlwaladLiwalidayh.screenRoute,
          pushBack: SalatAlhadiya.screenRoute,
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
