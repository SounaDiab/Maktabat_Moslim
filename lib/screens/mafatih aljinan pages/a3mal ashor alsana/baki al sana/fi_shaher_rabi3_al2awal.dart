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
import 'fi_shaher_safar.dart';

class FiShaherRabi3Al2awal extends StatefulWidget {
  static String screenRoute = 'fi_shaher_rabi3_al2awal_screen';
  const FiShaherRabi3Al2awal({super.key});

  @override
  State<FiShaherRabi3Al2awal> createState() => _FiShaherRabi3Al2awalState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiShaherRabi3Al2awalState extends State<FiShaherRabi3Al2awal> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_shaher_rabi3_al2awal_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_shaher_rabi3_al2awal_screen', value);
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
                          'في شهر ربيع الأول', FiShaherRabi3Al2awal.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في شهر ربيع الأول',
                          FiShaherRabi3Al2awal.screenRoute,
                          FiShaherRabi3Al2awal.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في شهر ربيع الأول',
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
                  title: 'اللّيلة الاولى :',
                  subtitle:
                      'فيها في السّنة الثّالثة عشرة من البعثة هاجر النّبي (صلى الله عليه وآله وسلم) من مكّة الى المدينة المنوّرة فاختبأ هذه اللّيلة في غار ثور وفاداه أمير المؤمنين صلوات الله وسلامه عليه بنفسه فنام في فراشه غير مجانب سيوف قبائل المشركين ولله ظهر بذلك على العالمين فضله ومواساته وأخاءه النّبي (صلى الله عليه وآله وسلم) فنزلت فيه الاية وَمِنَ النّاسِ مِنْ يَشْرى نَفْسَهُ ابْتِغاءَ مَرْضاتِ اللهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الاوّل :',
                  subtitle:
                      'قال العلماء يستحبّ فيه الصّيام شكر الله على ما أنعم من سلامة النّبي وأمير المؤمنين صلوات الله عليهما ومن المناسب زيارتهما (عليهما السلام) في هذا اليوم.\n\n'
                      'وقد روى السّيد في الاقبال دعاءً لهذا اليوم وفيه كانت وفاة الامام الحسن العسكري (عليه السلام) على قول الشّيخ والكفعمي والمشهور على انّها في اليوم الثّامن ولعلّ في هذا اليوم كان بدء مرضه (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّامن :',
                  subtitle:
                      'سنة مائتين وستّين توفّى الامام الحسن العسكري (عليه السلام) فنصب صاحب الامر (عليه السلام) اماماً على الخلق ومن المناسب زيارتهما (عليهما السلام) في هذا اليوم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم التّاسع :',
                  subtitle:
                      'عيد عظيم وهو عيد البقر وشرحه طويل مذكور في محلّه وروي انّ من أنفق شيئاً في هذا اليوم غفرت ذُنوبه وقيل يستحبّ في هذا اليوم اطعام الاخوان المؤمنين وافراحهم والتّوسّع في نفقة العيال ولبس الثّياب الطّيّبة وشكر الله تعالى وعبادته وهو يوم زوال الغُموم والاحزان وهو يوم شريف جدّاً واليوم الثّامن من الشّهر كان يوم وفاة الامام الحسن العسكري (عليه السلام) فهذا اليوم يكون اوّل يوم من عصر امامة صاحب العصر أرواح العالمين له الفداء وهذا ممّا يزيد اليوم شرفاً وفضلاً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّاني عشر :',
                  subtitle:
                      'ميلاد النّبي (صلى الله عليه وآله وسلم) على رأي الكليني والمسعودي وهو المشهور لدى العامّة ويستحبّ فيه الصّلاة ركعتان في الاولى بعد الحمد قل يا اَيُّهَا الْكافِرُونَ ثلاثاً وفي الثّانية التّوحيد ثلاثاً وفي هذا اليوم دخل (صلى الله عليه وآله وسلم)المدينة مهاجراً من مكّة وقال الشّيخ انّ في مثل هذا اليوم في سنة اثنتين وثلاثين ومائة انقضى دولة بني مروان.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الرّابع عشر :',
                  subtitle:
                      'سنة أربع وستّين مات يزيد بن معاوية فأسرع الى دركات الجحيم وفي كتاب أخبار الدّول انّه مات مصاباً بذات الجنب في حوران فاُتي بجنازته الى دمشق ودفن في الباب الصّغير وقبره الان مزبلة وقد بلغ عمره السّابعة والثّلاثين ودامت خلافته ثلاث سنين وتسعة أشهر انتهى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اللّيلة السّابعة عشرة :',
                  subtitle:
                      'ليلة ميلاد خاتم الانبياء صلوات الله عليه وهي ليلة شريفة جدّاً وحكى السّيد قولاً بأنّ في مثل هذه اللّيلة أيضاً كان معراجه قبل الهجرة بسنة واحدة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم السّابع عشر :',
                  subtitle:
                      'ميلاد خاتم الانبياء محمّد بن عبد الله (صلى الله عليه وآله وسلم) على المشهور بين الاماميّة والمعروف انّ ولادته كانت في مكّة المعظّمة في بيته عند طلوع الفجر من يوم الجمعة في عام الفيل في عهد انوشيروان العادل وفي هذا اليوم الشّريف أيضاً في سنة ثلاث وثمانين ولد الامام جعفر الصّادق (عليه السلام) فزاده فضلاً وشرفاً والخلاصة انّ هذا اليوم شريف جدّاً وفيه عدّة أعمال :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '- الاوّل :',
                  subtitle: 'الغُسل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '- الثّاني :',
                  subtitle:
                      'الصّوم وله فضل كثير وروي انّ من صامه كتب له صيام سنة وهذا اليوم هو أحد الايّام الاربعة التي خصّت بالصّيام بين أيّام السّنة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '- الثّالث :',
                  subtitle:
                      'زيارة النّبي (صلى الله عليه وآله وسلم) عن قُرب أو بُعد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '- الرّابع :',
                  subtitle:
                      'زيارة أمير المؤمنين (عليه السلام) بما زار به الصّادق (عليه السلام) وعلّمه محمّد بن مُسلم من ألفاظ الزّيارة وستأتي في باب الزّيارات ان شاء الله.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '- الخامس :',
                  subtitle:
                      'أن يصلّي عند ارتفاع النّهار ركعتين يقرأ في كلّ ركعة بعد الحمد سورة اِنّا اَنْزَلناهُ عشر مرّات والتّوحيد عشر مرّات ثمّ يجلس في مُصلاّه ويدعو بالدّعاء اَللّـهُمَّ اَنْتَ حَىٌّ لا تَمُوتُالخ وهو دعاء مبسوط لم أجده مسنداً الى المعصوم لذلك رأيت أن أتركه رعاية للاختصار فمن شاء فليطلبه من زاد المعاد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '- السّادس :',
                  subtitle:
                      'أن يعظّم المسلمون هذا اليوم ويتصدّقوا فيه ويعملوا الخير ويسرّوا المؤمنين ويزوروا المشاهد الشّريفة والسّيد في الاقبال قد بسط القول في لزوم تعظيم هذا اليوم وقال : قد وجدت النّصارى وجماعة من المسلمين يعظّمون مولد عيسى (عليه السلام) تعظيماً لا يعظّمون فيه أحداً من العالمين وتعجّبت كيف قنع من يعظم ذلك المُولد من أهل الاسلام كيف يقنعون أن يكون مُولد نبيّهم الذي هو أعظم من كلّ نبيّ دون مُولد واحد من الانبياء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira.screenRoute,
        pushBack: FiShaherSafar.screenRoute,
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
