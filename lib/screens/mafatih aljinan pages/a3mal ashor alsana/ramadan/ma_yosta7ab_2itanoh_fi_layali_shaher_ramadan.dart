import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ramadan.dart';
import 'douaa_al2iftita7.dart';
import 'ma_ya3om_allayali_wal2ayam.dart';

class MaYosta7ab2itanohFiLayaliShaherRamadan extends StatefulWidget {
  static String screenRoute =
      'ma_yosta7ab_2itanoh_fi_layali_shaher_ramadan_screen';
  const MaYosta7ab2itanohFiLayaliShaherRamadan({super.key});

  @override
  State<MaYosta7ab2itanohFiLayaliShaherRamadan> createState() =>
      _MaYosta7ab2itanohFiLayaliShaherRamadanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MaYosta7ab2itanohFiLayaliShaherRamadanState
    extends State<MaYosta7ab2itanohFiLayaliShaherRamadan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_ma_yosta7ab_2itanoh_fi_layali_shaher_ramadan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_ma_yosta7ab_2itanoh_fi_layali_shaher_ramadan_screen',
        value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ramadan.screenRoute);
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
                      .addFavorite('ما يستحب إيتانه في ليالي شهر رمضان',
                          MaYosta7ab2itanohFiLayaliShaherRamadan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'ما يستحب إيتانه في ليالي شهر رمضان',
                          MaYosta7ab2itanohFiLayaliShaherRamadan.screenRoute,
                          MaYosta7ab2itanohFiLayaliShaherRamadan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'ما يستحب إيتانه في ليالي شهر رمضان',
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
                  title: 'وهي اُمور : الاوّل :',
                  subtitle:
                      'الافطار ويستحبّ تأخيره عن صلاة العشاء الّا اذا غلب عليه الضّعف أو كان له قوم ينتظرونه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle:
                      'أن يفطر بالحلال الخالي من الشّبهات سيّما التّمر ليضاعف أجر صلاته أربعمائة ضعف ويحسن الافطار أيضاً بأيّ من التّمر والرّطب والحلواء والنّبات ـ النّبات كلمة فارسيّة تعنى بلّورات خاصة من السّكر ـ والماء الحار.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle:
                      'أن يدعو عند الافطار بدعوات الافطار المأثورة، منها أن يقول: اَللّـهُمَّ لَكَ صُمْتُ، وَعَلى رِزْقِكَ اَفْطَرْتُ، وَعَلَيْكَ تَوَكَّلْتُ، ليهب الله له مثل أجر كلّ من صام ذلك اليوم ولدعاء اَللّـهُمَّ رَبَّ النّورِ الْعَظيم الذي رواه السّيد والكفعمي فضل كبير، وروي انّ امير المؤمنين (عليه السلام) كان اذا أراد أن يفطر يقول : بِسْمِ اللهِ اَللّـهُمَّ لَكَ صُمْنا وَعَلى رِزْقِكَ اَفْطَرْنا فَتَقَبَّلْ مِنّا اِنَّكَ اَنْتَ السَّميعُ الْعَليمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle:
                      'أن يقول عند أوّل لقمة يأخذها: بِسْمِ اللهِ الرَّحْمـنِ الرّحَيـمِ، يا واسِعَ الْمَغْفِرَةُ اِغْفِرْ لي، لِيَغفِرَ اللهُ لهُ وفي الحديث انّ الله تعالى يعتق في آخر ساعة من نهار كلّ يوم من شهر رمضان ألف ألف رقبة فسل الله تعالى أن يجعلك منهم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle: 'أن يتلو سورة القدر عند الافطار.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس :',
                  subtitle:
                      'أن يتصدّق عند الافطار ويفطّر الصّائمين ولو بعدد من التّمر أو بشربة من الماء ، وعن النّبي (صلى الله عليه وآله وسلم) : انّ من فطّر صائماً فله أجر مثله من دون أن ينقص من أجره شيء وكان له مثل أجر ما عمله من الخير بقوّة ذلك الطّعام.\n\n'
                      'وروى آية الله العلاّمة الحلّي في الرّسالة السّعديّة عن الصّادق (عليه السلام) : انّ أيّما مؤمن أطعم مؤمناً لقمة في شهر رمضان كتب الله له أجر من أعتق ثلاثين رقبة مؤمنة وكان له عند الله تعالى دعوة مستجابة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّابع :',
                  subtitle: 'من المأثور تلاوة سورة القدر في كلّ ليلة ألف مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّامن :',
                  subtitle:
                      'أن يتلو سورة حم الدخّان في كلّ ليلة مائة مرّة إن تيسّرت.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التّاسع :',
                  subtitle:
                      'روى السّيد انّ من قال هذا الدّعاء في كلّ ليلة من شهر رمضان غفرت له ذنوب أربعين سنة :\n\n'
                      'اَللّـهُمَّ رَبَّ شَهْرِ رَمَضانَ الَّذي اَنْزَلْتَ فيهِ الْقُرْآنَ، وَافْتَرَضْتَ على عِبادِكَ فيهِ الصِّيامَ، صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَارْزُقْني حَجَّ بَيْتِكَ الْحَرامِ في عامي هذا وَفي كُلِّ عام، وَاغْفِرْ لي تِلْكَ الذُّنُوبَ الْعِظامَ، فَاِنَّهُ لا يَغْفِرُها غَيْرُكَ يا رَحْمنُ يا عَلاّمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العاشر :',
                  subtitle:
                      'أن يدعو بعد المغرب بدعاء الحجّ الّذي مرّ في القسم الاوّل من أعمال الشّهر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: DouaaAl2iftita7.screenRoute,
        pushBack: MaYa3omAllayaliWal2ayam.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/ما يستحب ايتانه في ليالي شهر رمضان.mp3',
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
