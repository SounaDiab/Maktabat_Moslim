import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'a3mal_al2ostwana_alsabi3a.dart';
import 'aamal_al2ostwana_alsalisa.dart';

class A3malAl2ostwanaAl5amisa extends StatefulWidget {
  static String screenRoute = 'a3mal_al2ostwana_al5amisa_screen';
  const A3malAl2ostwanaAl5amisa({super.key});

  @override
  State<A3malAl2ostwanaAl5amisa> createState() =>
      _A3malAl2ostwanaAl5amisaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malAl2ostwanaAl5amisaState extends State<A3malAl2ostwanaAl5amisa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_a3mal_al2ostwana_al5amisa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_a3mal_al2ostwana_al5amisa_screen', value);
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
          .pushReplacementNamed(FadlLakoufaWmasjidoha.screenRoute);
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
                      .addFavorite('أعمال الأسطوانة الخامسة',
                          A3malAl2ostwanaAl5amisa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'أعمال الأسطوانة الخامسة',
                          A3malAl2ostwanaAl5amisa.screenRoute,
                          A3malAl2ostwanaAl5amisa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال الأسطوانة الخامسة',
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
                      'اعلم انّ من المقامات ذوات المزيّة في جامع الكوفة الاسطوانة الخامسة ينبغي أن يُصلّى عندها وتطلب المسألات، ففي رواية معتبرة انّها بقعة صلّى فيها ابراهيم خليل الرّحمن، ولا ينافى هذا ما في سائر الرّوايات فلعلّه (عليه السلام)كان قد صلّى في مختلف هذه المواضع الواردة في مختلف الرّوايات، وفي رواية مُعتبرة عن الصّادق (عليه السلام) قال : الاسطوانة الخامسة هي مقامُ جبرئيل (عليه السلام)، ويظهر من الرّواية السّالفة انّها مقام الحسن (عليه السلام)، وبالاجمال انّ ما يظهر منَ الرّوايات هُو انّ عند الاسطوانة السّابعة والاسطوانة الخامسة اشرف المقامات في الجامع، وقالَ السّيد ابن طاووس ثمّ تُصلّي عند الاسطوانة الخامِسة ركعتين تقرأ فيهما الحمد وما شئت من السّور فاذا سلّمت وسبّحت فقُل :\n\n'
                      'اَللّـهُمَّ اِنّي اَسْاَلُكَ بِجَميعِ اَسْمائِكَ كُلِّها ما عَلِمْنا مِنْها وَما لا نَعْلَمُ، وَاَسْاَلُكَ بِاِسْمِكَ الْعَظيمِ الاَْعْظَمِ الْكَبيرِ الاَْكْبَرِ الَّذي مَنْ دَعاكَ بِهِ اَجَبْتَهُ، وَمَنْ سَأَلَكَ بِهِ اَعْطَيْتَهُ، وَمَنِ اسْتَنْصَرَكَ بِهِ نَصَرْتَهُ، وَمَنِ اسْتَغْفَرَكَ بِهِ غَفَرْتَ لَهُ، وَمَنِ اسْتَعانَكَ بِهِ اَعَنْتَهُ، وَمَنِ اسْتَرْزَقَكَ بِهِ رَزَقْتَهُ، وَمَنِ اسْتَغاثَكَ بِهِ اَغَثْتَهُ، وَمَنِ اسْتَرْحَمَكَ  بِهِ رَحِمْتَهُ، وَمَنِ اسْتَجارَكَ بِهِ اَجَرْتَهُ، وَمَنْ تَوَكَّلَ عَلَيْكَ بِهِ كَفَيْتَهُ، وَمَنِ اسْتَعْصَمَكَ بِهِ عَصَمْتَهُ، وَمَنِ اسْتَنْقَذَكَ بِهِ مِنَ النّارِ اَنْقَذْتَهُ، وَمَنِ اسْتَعْطَفَكَ بِهِ تَعَطَّفْتَ، لَهُ وَمَنْ اَمَّلَكَ بِهِ اَعْطَيْتَهُ، الَّذِي اتَّخَذْتَ بِهِ آدَمَ صَفِيّاً، وَنُوحاً نَجِيّاً، وَاِبْراهيمَ خَليلاً، وَمُوسى كَليماً، وَعيسى رُوحاً، وَمُحَمَّداً حَبيباً، وَعَلِيّاً وَصِيّاً، صَلَّى اللهُ عَلَيْهِمْ اَجْمَعينَ اَنْ تَقْضِيَ لي حَوآئِجي، وَتَعْفُوَ عَمّا سَلَفَ مِنْ ذُنُوبي، وَتَتَفَضَّلَ عَلَيَّ بِما اَنْتَ اَهْلُهُ وَلِجَميعِ الْمُؤْمِنينَ وَالْمُؤْمِناتِ لِلدُّنْيا وَالاْخِرَةِ، يا مُفَرِّجَ هَمِّ الْمَهْمُومينَ وَيا غِياثَ الْمَلْهُوفينَ لا اِلـهَ اِلاّ اَنْتَ سُبْحانَكَ يا رَبَّ الْعالَمينَ.\n\n'
                      'أقول : روي عن الصّادق (عليه السلام) انّه قال لبعض أصحابه : صلّ عند الاسطوانة الخامسة ركعتين فانّه مُصلّى ابراهيم (عليه السلام)وقل : اَلسَّلامُ عَلى اَبينا آدَمَ وَاُمِّنا حَوّاءَ الخ، بما يقرب ممّا قد قلته عند الاسطوانة السّابعة وأنت مستقبل القبلة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AamalAl2ostwanaAlsalisa.screenRoute,
          pushBack: A3malAl2ostwanaAlsabi3a.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اعمال الاسطوانة الخامسة.mp3',
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
