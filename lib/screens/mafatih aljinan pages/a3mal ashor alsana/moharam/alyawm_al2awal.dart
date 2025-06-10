import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../moharam.dart';
import 'allayla_al2oula.dart';
import 'alyawm_alsalis.dart';

class AlyawmAl2awal extends StatefulWidget {
  static String screenRoute = 'alyawm_al2awal_screen';
  const AlyawmAl2awal({super.key});

  @override
  State<AlyawmAl2awal> createState() => _AlyawmAl2awalState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlyawmAl2awalState extends State<AlyawmAl2awal> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_alyawm_al2awal_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alyawm_al2awal_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Moharam.screenRoute);
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
                      .addFavorite('اليوم الأول', AlyawmAl2awal.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('اليوم الأول', AlyawmAl2awal.screenRoute,
                          AlyawmAl2awal.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اليوم الأول',
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
                padding: EdgeInsets.all(20),
                child: Text(
                  'اعلم انّ غرّة محرّم هو اوّل السّنة وفيه عملان :',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle:
                      'الصّيام ، وفي رواية ريّان بن شبيب عن الرّضا صلوات الله وسلامه عليه انّه قال : من صام هذا اليوم ودعا الله استجاب الله دعاءه كما استجاب لزكريّا.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle:
                      'عن الرّضا (عليه السلام) انّه كان النّبي (صلى الله عليه وآله وسلم) يصلّي اوّل يوم من محرّم ركعتين فاذا فرغ رفع يديه ودعا بهذا الدّعاء ثلاث مرّات:\n\n'
                      'اَللّـهُمَّ اَنْتَ الاِْلهُ الْقَديمُ وَهذِهِ سَنَةُ جَديدَةُ فَاَسْئَلُكَ فيهَا الْعِصْمَةَ مِنَ الشَّيْطانِ وَالْقُوَّةَ عَلى هذِهِ النَّفْسِ الاَْمّارَةِ بِالسّوءِ وَالاِْشْتِغالَ بِما يُقَرِّبُنى اِلَيْكَ يا كَريمُ يا ذَا الْجَلالِ وَالاِْكْرامِ يا عِمادَ مَنْ لا عِمادَ لَهُ يا ذَخيرَةَ مَنْ لا ذَخيرَةَ لَهُ يا حِرْزَ مَنْ لا حِرْزَ لَهُ يا غِياثَ مَنْ لا غِياثَ لَهُ يا سَنَدَ مَنْ لا سَنَدَ لَهُ يا كَنْزَ مَنْ لا كَنْزَ لَهُ يا حَسَنَ الْبَلاءِ يا عَظيمِ الرَّجاءِ يا عِزَّ الضُّعَفآءِ يا مُنْقِذَ الْغَرْقى يا مُنْجِىَ الْهَلْكى يا مُنْعِمُ يا مُجْمِلُ يا مُفْضِلُ يا مُحْسِنُ اَنْتَ الَّذى سَجَدَ لَكَ سَوادُ اللَّيْلِ وَنُورُ النَّهارِ وَضَوْءُ الْقَمَرِ وَشُعاعُ الشَّمْسِ وَدَوِىُّ الْمآءِ وَحَفيفُ الشَّجَرِ يا اَللهُ لا شَريكَ لَكَ اَللّـهُمَّ اجْعَلْنا خَيْراً مِمّا يَظُنُّونَ وَاغْفِرْ لَنا ما لا يَعْمَلُونَ وَلا تُؤاخِذْنا بِما يَقُولُونَ حِسْبِىَ اللهُ لا اِلـهَ اِلاّ هُوَ عَلَيْهِ تَوَكَّلْتُ وَهُوَ رَبُّ الْعَرْشِ الْعَظيمِ آمَنّا بِهِ كلٌّ مِنْ عِنْدِ رَبِّنا وَما يَذَّكَّرُ اِلاّ اُولُوا الاَْلْبابِ رَبَّنا لا تُزِغْ قُلُوبَنا بَعْدَ اِذْ هَدَيْتَنا وَهَبْ لَنا مِنْ لَدُنْكَ رَحْمَةً اِنَّكَ اَنْتَ الْوَهّابُ.\n\n'
                      'قال الشّيخ الطّوسي : يستحبّ صيام الايّام المتسعة من اوّل محرّم وفي اليوم العاشر يمسك عن الطّعام والشّراب الى بعد العصر ثمّ يفطر من تربة الحسين (عليه السلام) وروى السّيد فضلاً لصوم شهر المحرّم كلّه وانّه يعصم سائمه من كلّ سيّئة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAlsalis.screenRoute,
        pushBack: AllaylaAl2oula.screenRoute,
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
