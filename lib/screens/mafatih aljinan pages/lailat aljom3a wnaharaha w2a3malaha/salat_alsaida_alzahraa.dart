import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../lailat_aljom3a_wnaharaha_w2a3malaha.dart';
import 'salat_al2imam_alhassan.dart';
import 'salat_amir_amo2minin.dart';

class SalatAlsaidaAlzahraa extends StatefulWidget {
  static String screenRoute = 'salat_alsaida_alzahraa_screen';
  const SalatAlsaidaAlzahraa({super.key});

  @override
  State<SalatAlsaidaAlzahraa> createState() => _SalatAlsaidaAlzahraaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAlsaidaAlzahraaState extends State<SalatAlsaidaAlzahraa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_salat_alsaida_alzahraa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_alsaida_alzahraa_screen', value);
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
          .pushReplacementNamed(LailatAljom3aWnaharahaW2a3malaha.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (previousPage == 'favorite_screen') {
                Navigator.of(context)
                    .pushReplacementNamed(FavoritesScreen.screenRoute);
              } else {
                Navigator.of(context).pushReplacementNamed(
                    LailatAljom3aWnaharahaW2a3malaha.screenRoute);
              }
            },
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
                      .addFavorite('صلاة فاطمة الزهراء عليها السلام',
                          SalatAlsaidaAlzahraa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة فاطمة الزهراء عليها السلام',
                          SalatAlsaidaAlzahraa.screenRoute,
                          SalatAlsaidaAlzahraa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة فاطمة الزهراء عليها السلام',
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
                      'رُوي انّه كانت لفاطمة (عليها السلام) ركعتان تصلّيهما علّمها جبرئيل (عليه السلام).\n\n'
                      'تقرأ في الرّكعة الاُولى بَعد الفاتِحة سُورة القدر مائة مرّة وفي الثّانية بعد الحمد تقرأ سُورة التّوحيد واذا سلمت قالت :\n\n'
                      'سُبحانَ ذِي الْعِزِّ الشّامِخِ المُنيفِ سُبحانَ ذِي الْجَلالِ الْباذِخِ الْعَظيمِ سُبحانَ ذِي الْمُلْكِ الْفاخِرِ الْقَديمِ سُبحانَ مَنْ لَبِسَ الْبَهْجَةَ وَالْجَمالَ سُبحانَ مَنْ تَرَدّى بِالنُّورِ وَالْوَقارِ سُبحانَ مَنْ يَرى اَثَرَ الَّنمْلِ فى الصَّفا سُبحانَ مَنْ يَرى وَقْعَ الطَّيْرِ فِى الْهَواءِ سُبحانَ مَنْ هُوَ هكَذا لا هكَذا غَيْرُهُ.\n\n'
                      'قال السّيد: وروي انّه يُسبح بعد الصلاة تسبيحها المنقول عقيب كلّ فريضة، ثمّ يصلّي على محمّد وآل محمّد مائة مرّة، وقال الشّيخ في كتاب مِصباح المتهجدين: انّ صلاة فاطمة (عليها السلام) ركعتان تقرأ في الاُولى الحمد وسورة القدر مائة مرّة، وفي الثانية بعد الحمد سورة التّوحيد مائة مرّة، فاذا سلّمت سبّحت تسبيحُ الزّهراء (عليها السلام) ثمّ تقول (سُبْحَانَ ذِي الْعِزِّ الشّامِخِ) الى آخر ما مرّ من التّسبيح ثمّ قالَ : وينبغي لمَن صلّى هذه الصلاة وفرغ من التّسبيح أن يكشف رُكبتيه وذراعَيْه ويُباشر بجميع مَساجده الارض بغير حاجز يحْجز بَيْنه وبيْنها ويَدعو ويسأل حاجته وما شاءَ مِنَ الدّعاء ويقول وَهو ساجِدٌ:\n\n'
                      'يا مَنْ لَيْسَ غَيْرَهُ رُبٌّ يُدْعى، يا مَنْ لَيْسَ فَوْقَهُ اِلهٌ يُخْشى، يا مَنْ لَيْسَ دُونَهُ مَلِكٌ يُتَّقى، يا مَنْ لَيْسَ لَهُ وَزيْرٌ يُؤْتى، يا مَنْ لَيْسَ لَهُ حاجِبٌ يُرْشى، يا مَنْ لَيْسَ لَهُ بَوّابٌ يُغْشى، يا مَنْ لا يَزْدادُ عَلى كَثْرَةِ السُّؤالِ إلاّ كَرَماً وَجُوداً وَعَلى كَثْرَةِ الذُّنُوبِ إلاّ عَفْواً وَصُفْحاً صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَافْعَلْ بى كَذا وَكَذا. ويسأل حاجته.\n\n'
                      'صلاة اُخرى لها (عليها السلام) روى الّشيخ والسّيد عن صفوان قال : دخل محمّد بن عليّ الحلبي على الصّادق (عليه السلام) في يوم الجُمعة فقال له : تعلّمني أفضل ما أصنع في هذا اليوم ، فقال : يا محمّد ما أعلم انّ أحداً كان أكبر عند رسول الله (صلى الله عليه وآله وسلم) من فاطِمة ولا أفضل ممّا علّمها أبوها محمّد بن عبد الله (صلى الله عليه وآله وسلم) قال : من أصبح يوم الجمعة فاغتسل وصفّ قدَميْه وصلّى أربع ركعات مثنى مثنى يقرأ في أوّل ركعة فاتحة الكتاب وقل هو الله أحد خمسين مرّة، وفي الثانية فاتحة الكتاب والعاديات خمسين مرّة، وفي الثّالثة فاتحة الكتاب واذا زلزلت خمسين مرّة، وفي الرّابعة فاتحة الكتاب واذَا جاءَ نصرُ اللهِ خمسين مرّة وهذه سورة النّصر وهي آخر سورة نزلت فاذا فرغ منها دعا فقال:\n\n'
                      'يا اِلـهي وَسَيِّدي مَنْ تَهَيَّأَ أو تَعَّبَأ اَوْ اَعَدَّ اَوِ اسْتَعَدَّ لِوِفادَةِ مَخْلُوق رَجاءَ رِفْدِهِ وَفَوائِدِهِ وَنائِلِهِ وَفَواضِلِهِ وَجَوائِزِهِ فَاِلَيْكَ يا اِلـهي كانَتْ َتهيئتي وتعبئتي وَاِعْدادي وَاسْتِعْدادي رَجاءَ فَوائِدِكَ وَمَعْرُوفِكَ وَنائِلِكَ وَجَوائِزِكَ فَلا تُخَيِّبْني مِنْ ذلِكَ يا مَنْ لا تَخيبُ عَلَيْهِ مَسْأَلةُ السّائِل وَلا تَنْقُصُهُ عَطِيَّةُ نائِل، فَانّى لَمْ آتِكَ بعَمَل صالِح قَدَّمْتُهُ وَلا شَفاعَةِ مَخْلُوق رَجَوْتُهُ اَتَقَرَّبُ اِلَيْكَ بِشَفاعَتِهِ إلاّ مُحَمَّداً وَاَهْلَ بَيْتِهِ صََواتُكَ عَلَيْهِ وَعَلَيْهِمْ اَتَيْتُكَ اَرْجُو عَظيمَ عَفْوِكَ الَّذي عُدْتَ بِهِ عَلَى الْخَطّائينَ عِنْدَ عُكُوفِهِمْ عَلَى الَْمحارِمِ، فَلَمْ يَمْنَعْكَ طُولُ عُكُوفِهِمْ عَلَى الَْمحارِمِ اَنْ جُدْتَ عَلَيْهِمْ بِالْمَغْفِرَةِ وَاَنْتَ سَيِّدي الْعَوّادُ بِالنَّعْماء وَاَنَا الْعَوّادُ بِالْخَطاءِ أَسْأَلُكَ بِحَقِّ مُحَمَّد وآلِهِ الطّاهِرِينَ اَنْ تَغْفِرَ لي ذَنْبي الْعَظيمَ فَاِنَّهُ لا يَغْفِرُ الْعَظيمَ إلاّ الْعَظيمُ يا عَظيمُ  يا عَظيمُ يا عَظيمُ يا عَظيمُ يا عَظيمُ يا عَظيمُ يا عَظيمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: SalatAl2imamAlhassan.screenRoute,
        pushBack: SalatAmirAmo2minin.screenRoute,
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
