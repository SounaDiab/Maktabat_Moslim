import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:maktabat_almoslim/widgets/she3er.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'monajat_alzahidin.dart';
import 'salas_kalimat_3an_amir_almo2minin.dart';

class MonajatL2amirAlmo2minin extends StatefulWidget {
  static String screenRoute = 'monajat_l2amir_almo2minin_screen';
  const MonajatL2amirAlmo2minin({super.key});

  @override
  State<MonajatL2amirAlmo2minin> createState() =>
      _MonajatL2amirAlmo2mininState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatL2amirAlmo2mininState extends State<MonajatL2amirAlmo2minin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_monajat_l2amir_almo2minin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_l2amir_almo2minin_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Almonajat.screenRoute);
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
                Navigator.of(context)
                    .pushReplacementNamed(Almonajat.screenRoute);
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
                      .addFavorite('المناجات المنظومة لأمير المؤمنين (ع)',
                          MonajatL2amirAlmo2minin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'المناجات المنظومة لأمير المؤمنين (ع)',
                          MonajatL2amirAlmo2minin.screenRoute,
                          MonajatL2amirAlmo2minin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'المناجات المنظومة لأمير المؤمنين (ع)',
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
                child: She3er(
                  subtitle: 'لك الحمـدُ يا ذا الجُودِ والمجدِ والعُلى\n'
                      'تباركتَ تُعطي من تشاءُ وتَمنعُ\n\n'
                      'إلهي وخلّاقي وحِرزي ومَوئِلي\n'
                      'إليكَ لدى الإعسار واليُسر أفزَعُ\n\n'
                      'إلهي لئن جَلّت وجَمّت خَطيئتي\n'
                      'فعفوكَ عن ذَنبي أجَلُّ وأوسَعُ\n\n'
                      'إلهي لئن أعطيتَ نفسي سُؤلهَا\n'
                      'فها أنا في رَوضِ النَّدامةِ أرتَعُ\n\n'
                      'إلهي تَرى حالي وفَقري وفَاقَتي\n'
                      'وأنتَ مُناجاتي الخفيَّةَ تسمَعُ\n\n'
                      'إلهي فَلا تقطَع رَجائي ولا تُزِغ\n'
                      'فُؤادي فَلي في سَيبِ جُودِكَ مَطمعُ\n\n'
                      'إلهي لَئِن خيَّبتَني أو طردتَني\n'
                      'فمن ذا الَّذي أرجو وَمَن ذا اشفَعُ\n\n'
                      'إلهي أجِرني من عذابك إنَّني\n'
                      'أسيرٌ ذَليلٌ خائفٌ إليكَ أخضَعُ\n\n'
                      'إلهي فآنِسني بتلقينِ حُجَّتي\n'
                      'إذا كانَ لي في القبرِ مَثوىً وَمضجَعُ\n\n'
                      'إلهي لَئِن عذَّبتنَي ألفَ حِجّةٍ\n'
                      'فَحبلُ رَجائيَ مِنكَ لا يتقطّعُ\n\n'
                      'إلهي أذِقني طَعمَ عَفوِكَ يَومَ لا\n'
                      'بَنُونَ ولا مَالٌ هُنَالِكَ يَنفَعُ\n\n'
                      'إلهي لَئِن لَم تَرعَني كُنتُ ضائعاً\n'
                      'وإن كُنتَ تَرعَاني فلستُ أضَيّعُ\n\n'
                      'إلهي إذا لم تَعفُ عن غيرِ مُحسنٍ\n'
                      'فَمَن لمِسِيءٍ بالهوى يَتمتّعُ\n\n'
                      'إلهي لَئِن فَرّطتُ في طَلَبِ التُقى\n'
                      'فَهَا أنَا إثرَ العَفوِ أقفُو وأتبَعُ\n\n'
                      'إلهي لَئِن أخطأتُ جَهلاً فطالمَا\n'
                      'رَجُوتُكَ حتى قِيلَ مَا هُوَ يجزَعُ\n\n'
                      'إلهي ذُنُوبي بَذّت الطَودَ واعتَلَت\n'
                      'وصَفحُكَ عن ذنبي أجَلُّ وأرفَعُ\n\n'
                      'إلهي يُنّحِي ذِكرُ طُولِكَ لَوعَتي\n'
                      'وذِكرُ الخطايا العَينَ مِنّي يُدمعُ\n\n'
                      'إلهي أقِلني عَثرَتي وامحُ حَوبَتي\n'
                      'فإني مُقِرٌّ خَائِفٌ مُتَضَرّعُ\n\n'
                      'إلهي أنِلني مِنكَ رَوحاً ورَاحَةً\n'
                      'فَلَستً سِوَى أبوابَ فَضلِكَ أقرَعُ\n\n'
                      'إلهي لَئِن أقصَيتَنِي أو أهَنتَني\n'
                      'فَما حَيلَتي يا ربِّ أم كيفَ أصنَعُ\n\n'
                      'إلهي حَلِيفُ الحُبّ في الليلِ سَاهرٌ\n'
                      'يُنَاجِي وَيدعُو والمُغَفَّلُ يَهجَعُ\n\n'
                      'إلهي وهَذا الخَلقُ مَا بَينَ نَائِمٍ\n'
                      'ومُنتَبِهٍ في لَيلِـه يَتَضَرّعُ\n\n'
                      'وَكُلّهُم يَرجُو نَوالَكَ رَاجيا\n'
                      'لِرَحَمَتِكَ العُظمى وفَي الخُلد يَطمَعُ\n\n'
                      'إلهي يُمَنَيني رَجَائِي سَلاَمةً\n'
                      'وَقَبحُ خَطَيئَاتي عَليَّّ يُشَنّعُ\n\n'
                      'إلهي فَإن تَعفُو فَعفوُكَ مُنقِذِي\n'
                      'وإلّا فّبِالذَنبِ المُدَمِّرُ أُصرَعُ\n\n'
                      'إلهي بِحَقِّ الهاشميّ مُحَمّدٍ\n'
                      'وَحُرمَةٍ أطهَارِهِم لَكَ خُضَّعُ\n\n'
                      'إلهي بِحَقِّ المُصطَفَى وابنِ عَمّهِ\n'
                      'وَحُرمَةٍ أبرارِهِم لَكَ خُشّعُ\n\n'
                      'إلهي فانشرُني على دِينِ أحمدٍ\n'
                      'مُنيباً تَقيا قَانِتاً لَكَ أخضَعُ\n\n'
                      'وَلَا تحرِمني يا إلهي وَسَيّدي\n'
                      'شَفَاعَتَهُ الكُبرى فَذَاك المُشَفِّعُ\n\n'
                      'وَصلِّ عَليه مَا دَعَاكَ مُوَحِّدٌ\n'
                      'وَنَاجَاك أخيارٌ بِبَابِكَ رُكّعُ\n\n',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: SalasKalimat3anAmirAlmo2minin.screenRoute,
        pushBack: MonajatAlzahidin.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/مناجاة لامير المؤمنين.mp3',
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
