import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alkazimin.dart';
import 'almasjed_alsharif.dart';
import 'ziyarat_salman.dart';

class ZiyaratAlnowabAl2arba3a extends StatefulWidget {
  static String screenRoute = 'ziyarat_alnowab_al2arba3a_screen';
  const ZiyaratAlnowabAl2arba3a({super.key});

  @override
  State<ZiyaratAlnowabAl2arba3a> createState() =>
      _ZiyaratAlnowabAl2arba3aState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratAlnowabAl2arba3aState extends State<ZiyaratAlnowabAl2arba3a> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_alnowab_al2arba3a_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_alnowab_al2arba3a_screen', value);
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
                      .addFavorite('زيارة النواب الأربعة',
                          ZiyaratAlnowabAl2arba3a.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة النواب الأربعة',
                          ZiyaratAlnowabAl2arba3a.screenRoute,
                          ZiyaratAlnowabAl2arba3a.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة النواب الأربعة',
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
                      'وهم أبو عمرو عثمان بن سعيد الاسدي ، وأبو جعفر محمّد بن عثمان ، والشّيخ أبو القاسم حسين بن روح النّوبختي ، والشّيخ الجليل أبو الحسن علي بن محمّد السّمري رضي الله عنهم.\n\n'
                      'اعلم انّ من وظائف الوافدين لزيارة الاعتاب المقدّسة في العراق أثناء اقامتهم في مدينة الكاظمين (عليهما السلام) الطّيّبة هو التّوجه الى بغداد لزيارة هؤلاء النّواب الاربعة الّذين نابُوا عن الحجّة المنتظر امام العصر صلوات الله عليه، وزيارة قبورهم لا يتطلّب من الزّائر بذل كثير من الجُهد فهي مجتمعة في بغداد غير بعيدة عن الوافدين من الزّوار، وهي لو كانت منتشرة في أقاصي البلاد لكان يحقّ أن يشّد اليها الرّحال ويطوى في سبيلها المسافات الشّاسعة ويتحمّل متاعب السّفر وشدائده لنيل ما في زيارة كلّ منها من الاجر العظيم والثّواب الجزيل، وهم قد فاقوا جميع اصحاب الائمّة (عليهم '
                      'السلام)وخواصهم مرتبة وفضلاً وفازوا بالنّيابة عن الامام (عليه السلام) وسفارته والوساطة بينه وبين الرّعية خلال سبعين سنة، وقد جرى على أيديهم كرامات كثيرة وخوارق لا تحصى، ويعزى الى بعض العلماء القول بعصمتهم وغير خفيّ انّهم في مماتهم ايضاً وسائط، فمن اللاّزم أن يبلغ الامام (عليه السلام) ما تكتب في الحاجات والشّدائد من الرّقاع عن طريقهم وبوسيلتهم كما عُرف في محلّه، والخلاصة انّ عظيم فضلهم ومنزلتهم ممّا لا يحدّه البيان وحسبنا ما ذكرناه ترغيباً الى زيارتهم.\n\n'
                      'وامّا صفة زيارتهم فهي كما ذكرها الطّوسي (رحمه الله) في التّهذيب والسّيد ابن طاوُس (رحمه الله) في مصباح الزّائر مسنداً الى أبي القاسم حُسين بن روح (رحمه الله) حيث قال في صفة زيارتهم: يسلّم على رسول الله وعلى امير المؤمنين بعده وعلى خديجة الكبرى وعلى فاطمة الزّهراء وعلى الحسن والحسين وعلى الائمة (عليهم السلام)الى صاحب الزّمان صلوات الله عليه ثمّ تقول : اَلسَّلامُ عَلَيْكَ يا فُلانَ بْنَ فُلان وتذكر اسم صاحب القبر واسم أبيه وتقول :\n\n'
                      'اَشْهَدُ اَنَّكَ بابُ الْمَوْلى اَدَّيْتَ عَنْهُ وَاَدَّيْتَ اِلَيْهِ ما خالَفْتَهُ وَلا خالَفْتَ عَلَيْهِ، قُمْتَ خاصّاً وَانْصَرَفْتَ سابِقاً جِئْتُكَ عارِفاً بِالْحَقِّ الَّذي اَنْتَ عَلَيْهِ، واَنَّكَ ما خُنْتَ في التَّأدِيَةِ وَالسَّفارَةِ، اَلسَّلامُ عَلَيْكَ مِنْ باب ما اَوْسَعَكَ وَمِنْ سَفير ما آمَنَكَ وَمِنْ ثِقَة ما اَمْكَنَكَ، اَشْهَدُ اَنَّ اللهَ اخْتَصَّكَ بِنُورِهِ حَتّى عايَنْتَ الشَّخْصَ فَاَدَّيْتَ عَنْهُ وَاَدَّيْتَ اِلَيْهِ.\n\n'
                      'ثمّ ترجع فتبتدئ بالسّلام على رسول الله الى صاحِب الزّمان (عليهم السلام) ثمّ تقول :\n\n'
                      'جِئْتُكَ مُخْلِصاً بِتَوْحيدِ اللهِ وَمُوالاةِ اَوْلِيائِهِ وَالْبَراءَةِ مِنْ اَعْدآئِهِمْ وَمِنَ الّذينَ خالَفُوكَ يا حُجَّةَ الْمَوْلى وَبِكَ اِلَيْهِمْ تَوَجُّهي وَبِهِمْ اِلىَ اللهِ تَوَسُّلي . ثمّ تدعُو وتسأل الله ما تُحِبّ تجب ان شاء الله تعالى.\n\n'
                      'أقول : وينبغي ايضاً أن يُزار في بغداد الشّيخ الاجلّ الافخم ثقة الاسلام محمّد بن يعقوب الكليني عطّر الله مرقده، وقد كان زعيم الشّيعة وأوثقهم وأثبتهم في الحديث، وقد صنّف كتاب الكافي في خلال عشرين سنة وهو الكتاب القيّم الّذي تقرّ به عُيون الشّيعة، وهو منّة منّ بها على الشّيعة ولا سيّما رجال الّدين منهم، وقد عدّه ابن الاثير مجدّد مذهب الاماميّة في بدء القرن الثّالث بعدما عدّ مولانا ثامن الائمة صلوات الله عليه مجدّداً للمذهب في القرن الثّاني، ونحن قد عددنا في كتاب هديّة الزّائر أغلب العلماء المدفُونين في المشاهد الشّريفة فليرجع اليه من شاء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: ZiyaratSalman.screenRoute,
        pushBack: AlmasjedAlsharif.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة النواب الاربعة.mp3',
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
