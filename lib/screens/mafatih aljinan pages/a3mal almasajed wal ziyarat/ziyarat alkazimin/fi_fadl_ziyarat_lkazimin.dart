import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alkazimin.dart';
import 'ziyarat_2o5ra_lmousa.dart';
import 'ziyarat_salman.dart';

class FiFadlZiyaratLkazimin extends StatefulWidget {
  static String screenRoute = 'fi_fadl_ziyarat_lkazimin_screen';
  const FiFadlZiyaratLkazimin({super.key});

  @override
  State<FiFadlZiyaratLkazimin> createState() => _FiFadlZiyaratLkaziminState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiFadlZiyaratLkaziminState extends State<FiFadlZiyaratLkazimin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_fadl_ziyarat_lkazimin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_fadl_ziyarat_lkazimin_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiyaratAlkazimin.screenRoute);
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
                          'في فضل زيارة الكاظمين (عليه السلام) وكيفيتها',
                          FiFadlZiyaratLkazimin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في فضل زيارة الكاظمين (عليه السلام) وكيفيتها',
                          FiFadlZiyaratLkazimin.screenRoute,
                          FiFadlZiyaratLkazimin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في فضل زيارة الكاظمين (عليه السلام) وكيفيتها',
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
                      'اعلم انّه قد ورد لزيارة هـذين الامامين المعصومين فضل كثير وفي اخبار كثيرة انّ زيارة الامام مُوسى بن جعفر (عليهما السلام) هي كزيارة النّبي (صلى الله عليه وآله وسلم).\n\n'
                      'وفي رواية : من زاره كان كما لو زار رسول الله (صلى الله عليه وآله وسلم) وامير المؤمنين.\n\n'
                      'وفي حديث آخر : انّ زيارته مثل زيارة الحسين (عليه السلام).\n\n'
                      'وفي حديث آخر : من زاره كان له الجنّة.\n\n'
                      'وروى الشّيخ الجليل محمّد بن شهر آشوب في المناقب عن تاريخ بغداد للخطيب، باسناده عن عليّ بن خلال ، قال : ما اهمّني أمر فقصدت موسى بن جعفر (عليهما السلام) وتوسّلت به الاّ سهّل الله لي، وقال ايضاً : ورؤي في بغداد امرأة تهرول ، فقيل لها: الى أين ؟ قالت : الى موسى بن جعفر (عليه السلام) فانّه حُبس ابني ، فقال لها حنبلي مُستهزئاً: انّه قد مات في الحبس ، فقالت : بحقّ المقتول في الحبس أن تريني قدرتك، فاذا بابنها قد اطلق واخذ ابن المستهزيء بجنايته.\n\n'
                      'وروى الصّدوق عن ابراهيم بن عقبة قال : كتبت الى الامام عليّ النّقي (عليه السلام) عن زيارة الحسين (عليه السلام) وزيارة الامام مُوسى بن جعفر والامام محمّد التّقي (عليهما السلام) أي اسأله عن أيّهما أفضل . فكتب اليّ: أبو عبد الله (عليه السلام) المقدّم وزيارتهما اجمع واعظم أجراً.\n\n'
                      'وامّا في كيفيّة زيارتهما (عليهما السلام) فاعلم انّ الزّيارات الواردة في ذلك الحرم الشّريف بعضها مشترك بين هذين الامامين (عليهما السلام) وبعضها يخصّ احدهما ، امّا ما يخصّ الامام مُوسى (عليه السلام) فهي على ما رواه السّيد ابن طاوُس في المزار كما يلي : اذا أردت زيارته (عليه السلام) فينبغي أن تغتسل ثمّ تأتي المشهد المقدّس وعليك السّكينة والوقار ، فاذا أتيته فقِف على بابه وقُل :\n\n'
                      'اَللهُ اَكْبَرُ اَللهُ اَكْبَرُ  لا اِلـهَ اِلاَّ اللهُ وَاللهُ اَكْبَرُ اَلْحَمْدُ للهِ عَلى هِدايَتِهِ لِدِينِهِ وَالتَّوْفيقِ لِما دَعا اِلَيْهِ مِنْ سَبيلِهِ، اَللّـهُمَّ اِنَّكَ اَكْرَمُ مَقْصُود، وَاَكْرَمُ مَأتِيٍّ وَقَدْ اَتَيْتُكَ مُتَقَرِّباً اِلَيْكَ بِابْنِ بِنْتِ نَبِيِّكَ صَلَواتُكَ عَلَيْهِ وَعَلى آبائِهِ الطّاهِرينَ وَاَبْنائِهِ الطَّيِّبينَ، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَلا تُخَيِّبْ سَعْيي وَلا تَقْطَعْ رَجائي وَاجْعَلْني عِنْدَكَ وَجيهاً في الدُّنْيا وَالاْخِرَةِ وَمِنَ الْمُقَرَّبينَ.\n\n'
                      'ثمّ ادخل وقدّم رجلك اليُمنى وقُل :\n\n'
                      'بِسْمِ اللهِ وَبِاللهِ وَفي سَبيلِ اللهِ وَعَلى مِلَّةِ رَسُولِ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ، اَللّـهُمَّ اغْفِرْ لي وَلِوالِدَيَّ وَلِجَميعِ الْمُؤْمِنينَ وَالْمُؤْمِناتِ.\n\n'
                      'فاذا وصلت باب القُبّة فقِف عليه واستأذن ، تقول :\n\n'
                      'أاَدْخُلُ يا رَسُولَ اللهِ، أَاَدْخُلُ يا نَبِيَّ اللهِ، أَاَدْخُلُ يا مُحَمَّدَ بْنَ عَبْدِاللهِ، أَاَدْخُلُ يا اَميرَ الْمُؤْمِنينَ، أَاَدْخُلُ يا اَبا مُحَمَّد الْحَسَنَ، أَاَدْخُلُ يا اَبا عَبْدِ اللهِ الْحُسَيْنَ، أَاَدْخُلُ يا اَبا مُحَمَّد عَلِيَّ بْنَ الْحُسَيْنِ، أَاَدْخُلُ يا اَبا جَعْفَر مُحَمَّدَ بْنَ عَلِيٍّ، أَاَدْخُلُ يا اَبا عَبْدِ اللهِ جَعْفَرَ بْنَ مُحَمَّد، أَاَدْخُلُ يا مَوْلايَ يا اَبَا الْحَسَنِ مُوسَى بْنَ جَعْفَر، أَاَدْخُلُ يا مَوْلايَ يا اَبا جَعْفَر أَاَدْخُلُ يا مَوْلايَ مُحَمَّدَ بْنَ عَلِيٍّ.\n\n'
                      'وادخل وقُل أربعاً : اَللهُ اَكْبَرُ، ثمّ قِف مستقبل القبر واجعل القِبلة بين كتفيك وقُل :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا ولِيَّ اللهِ وَابْنَ وَلِيِّهِ، اَلسَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ وَابْنَ حُجَّتِهِ، اَلسَّلامُ عَلَيْكَ يا صَفِيَّ اللهِ وَابْنَ صَفِيِّهِ، اَلسَّلامُ عَلَيْكَ يا اَمينَ اللهِ وَابْنَ اَمينِهِ، اَلسَّلامُ عَلَيْكَ يا نُورَ اللهِ في ظُلُماتِ الاَْرْضِ، اَلسَّلامُ عَلَيْكَ يا اِمامَ الْهُدى، اَلسَّلامُ عَلَيْكَ يا عَلَمَ الدّينِ وَالتُّقى، اَلسَّلامُ عَلَيْكَ يا خازِنَ عِلْمِ النَّبِيّينَ، اَلسَّلامُ عَلَيْكَ يا خازِنَ عِلْمِ الْمُرْسَلينَ، اَلسَّلامُ عَلَيْكَ يا نائِبَ الاَْوْصِياءِ السّابِقينَ، اَلسَّلامُ عَلَيْكَ يا مَعْدِنَ الْوَحْيِ الْمُبينِ، اَلسَّلامُ عَلَيْكَ يا صاحِبَ الْعِلْمِ الْيَقينِ، اَلسَّلامُ عَلَيْكَ يا عَيْبَةَ عِلْمِ الْمُرْسَلينَ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الاِْمامُ الصّالِحُ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الاِْمامُ الزّاهِدُ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الاِْمامُ الْعابِدُ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الاِْمامُ السَّيِّدُ الرَّشيدُ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الْمَقْتُولُ الشَّهيدُ، اَلسَّلامُ عَلَيْكَ يَا بْنَ رَسُولِ اللهِ وَابْنَ وَصِيِّهِ، اَلسَّلامُ عَلَيْكَ يا مَوْلايَ مُوسَى بْنَ جَعْفَر وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَشْهَدُ اَنَّكَ قَدْ بَلَّغْتَ عَنِ اللهِ ما حَمَّلَكَ وَحَفِظْتَ مَا اسْتَوْدَعَكَ، '
                      'وَحَلَّلْتَ حَلالَ اللهِ وَحَرَّمْتَ حَرامَ اللهِ، وَاَقَمْتَ اَحْكامَ اللهِ، وَتَلَوْتَ كِتابَ اللهِ وَصَبَرْتَ عَلَى الاَْذى في جَنْبِ اللهِ، وَجاهَدْتَ في اللهِ حَقَّ جِهادِهِ حَتّى أتاكَ الْيَقينُ، وَاَشْهَدُ اَنَّكَ مَضَيْتَ عَلى ما مَضى عَلَيْهِ آباؤُكَ الطّاهِرُونَ وَاَجْدادُكَ الطَّيِّبُونَ الاَْوْصِياءُ الْهادُونَ الاَْئِمَّةُ الْمَهْدِيُّونَ، لَمْ تُؤْثِرْ عَمىً عَلى هُدىً، وَلَمْ تَمِلْ مِنْ حَقٍّ اِلى باطِل، وَاَشْهَدُ اَنَّكَ نَصَحْتَ للهِ وَلِرَسُولِهِ وَلاَِميرِ الْمُؤمِنينَ، وَاَنَّكَ اَدَّيْتَ الاَْمانَةَ، وَاجْتَنَبْتَ الْخِيانَةَ، وَاَقَمْتَ الصَّلاةَ، وَآتَيْتَ الزَّكاةَ، وَاَمَرْتَ بِالْمَعْرُوفِ، وَنَهَيْتَ عَنِ الْمُنْكَرِ، وَعَبَدْتَ اللهَ مُخْلِصاً مُجْتَهِداً مُحْتَسِباً حَتّى أتاكَ الْيَقينُ فَجَزاكَ اللهُ عَنِ الاِْسْلامِ وَاَهْلِهِ اَفْضَلَ الْجَزاءِ وَاَشْرَفَ الْجَزاءِ، اَتَيْتُكَ يَا بْنَ رَسُولِ اللهِ زائِراً، عارِفاً بِحَقِّكَ، مُقِرّاً بِفَضْلِكَ، مُحْتَمِلاً لِعِلْمِكَ، مُحْتَجِباً بِذِمَّتِكَ، عائِذاً بِقَبْرِكَ، لائِذاً بِضَريحِكَ، مُسْتَشْفِعاً بِكَ اِلَى اللهِ، مُوالِياً لاَِوْلِيائِكَ، مُعادِياً '
                      'لاَِعْدائِكَ، مُسْتَبْصِراً بِشَأْنِكَ وَبِالْهُدَى الَّذي اَنْتَ عَلَيْهِ، عالِماً بِضَلالَةِ مَنْ خالَفَكَ وَبِالْعَمَى الَّذي هُمْ عَلَيْهِ، بِاَبي اَنْتَ وَاُمّي وَنَفْسي وَاَهْلي وَمالي وَوَلَدي يَا بْنَ رَسُولِ اللهِ، اَتَيْتُكَ مُتَقَرِّباً بِزِيارَتِكَ اِلَى اللهِ تَعالى، وَمُسْتَشْفِعاً بِكَ اِلَيْهِ فَاشْفَعْ لي عِنْدَ رِبِّكَ لِيَغْفِرَ لي ذُنُوبي، وَيَعْفُوَ عَنْ جُرْمي، وَيَتَجاوَزَ عَنْ سَيِّئاتي، وَيَمْحُوَ عَنّي خَطيئاتي وَيُدْخِلَنِي الْجَنَّةَ، وَيَتَفَضَّلَ عَلَيَّ بِما هُوَ اَهْلُهُ، وَيَغْفِرَ لي وَلاِبائي وَلاِِخْواني وَاَخَواتي وَلِجَميعِ الْمُؤْمِنينَ وَالْمُؤْمِناتِ في مَشارِقِ الاَْرْضِ وَمَغارِبِها بِفَضْلِهِ وَجُودِهِ وَمَنِّهِ.\n\n'
                      'ثمّ تنكب على القبر وتقبّله وتعفّر خدّيك عليه وتدعو بما تريد ثمّ تتحوّل الى الرّأس وتقُول :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا مَوْلايَ يا مُوسَى بْنَ جَعْفَر وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَشْهَدُ اَنَّكَ الاِْمامُ الْهادِي وَالْوَلِيُّ الْمُرْشِدُ وَاَنَّكَ مَعْدِنُ التَّنْزيلِ وَصاحِبُ التَّأويلِ وَحامِلُ التَّوْراةِ وَالاِْنْجيلِ، وَالْعالِمُ الْعادِلُ وَالصّادِقُ الْعامِلُ، يا مَوْلايَ اَنَا اَبْرَأُ اِلَى اللهِ مِنْ اَعْدائِكَ وَاَتَقَرَّبُ اِلَى اللهِ بِمُوالاتِكَ، فَصَلَّى اللهُ عَلَيْكَ وَعَلى آبائِكَ وَاَجْدادِكَ وَاَبْنائِكَ وَشيعَتِكَ وَمُحِبّيكَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.\n\n'
                      'ثمّ تصلّي ركعتين للزّيارة تقرأ فيهما سورة يس والرّحمن أو ما تيسّر من القرآن ثمّ ادعُ بما تريد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Ziyarat2o5raLmousa.screenRoute,
          pushBack: ZiyaratSalman.screenRoute,
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
