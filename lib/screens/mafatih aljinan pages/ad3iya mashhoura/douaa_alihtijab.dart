import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iya_mashhoura.dart';
import 'douaa_alkamous.dart';
import 'douaa_zaman_alghaiba.dart';

class DouaaAlihtijab extends StatefulWidget {
  static String screenRoute = 'douaa_alihtijab_screen';
  const DouaaAlihtijab({super.key});

  @override
  State<DouaaAlihtijab> createState() => _DouaaAlihtijabState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _DouaaAlihtijabState extends State<DouaaAlihtijab> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_alihtijab_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_alihtijab_screen', value);
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
          .pushReplacementNamed(Ad3iyaMashhoura.screenRoute);
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
                    Ad3iyaMashhoura.screenRoute);
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
                      .addFavorite('دعاء الإحتجاب لأمير المؤمنين',
                          DouaaAlihtijab.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء الإحتجاب لأمير المؤمنين',
                          DouaaAlihtijab.screenRoute,
                          DouaaAlihtijab.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء الإحتجاب لأمير المؤمنين',
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
                      'اِحتَجَبتُ بِنورِ وَجهِ اللهِ القَديمِ الكامِل وتَحَصَّنتُ بحِصِنِ اللهِ القَوِيّ الشّامِلِ وَرَمَيتُ مَن بَغى علىَّ بِسَهِمِ الله وَسَيفِهِ القاتِلِ اَللّهُمَ يا غالباً عَلى اَمِرِه ويا قائمِاً فَوقَ خَلقِهِ وَيا حائلاً بَينَ المَرءِ وَقَلَبِهِ حُل بَيني وَبَينَ الشيَطانِ وَنَزغِهِ وَبينَ ما لا طاقَةَ لي بِهِ مِن اَحدٍ مِن عِبادِكَ كُفَّ عَنّي اَلسِنَتَهم وَاغلل اَيَديَهم وَاَرجُلَهم وَاجعَل بَيني وَبَينَهم سَدّاً مِن نورِ عظمتِكَ وَحِجاباً مِن قُوَّتك وَجُنداً مِن سُلطانِكَ فَاِنَّكَ حَيَّ قادِرٌ اَللهمَّ اغشَ عَنّي اَبصارَ الناظِرينَ حَتى اَرِدَ الموَارِدَ وَاغشَ عَنّي اَبصارَ النورِ وَاَبصارَ الظّلمِةَ وَابَصارَ المريدينَ لَي السّوءَ حَتّى لا أُبالي مِن اَبصارِهِم يَكادُ سَنا بَرقه يَذهَب بِالأبصارِ يقَلّب اللهُ اَللَيلَ وَالَّنهارَ اِنَّ في ذلِكَ لَعِبرة لاِولى الأبصارِ بِسمِ الله الرَحمَن الرحَيمِ كهيعص كفايتُنا وهو حسبي بِسمِ الله الرَحَمن الرَحيمِ حمعسق حمايتُنا وهو حسبي كَماءٍ اَنزَلناهُ مِنَ السَّماءِ فاختَلَطَ بِهِ نَباتُ الأرضِ فَاَصبَحَ هَشيماً تَذروهُ الرّيِاح هوَ اللهُ اَلَذي لا اِلهَ اِلا هوَ عالم الغَيب وَالشهادةِ هوَ الرَّحمن الرحَيمُ يَومَ الأزِفةِ اِذَا القُلوبُ لَدَى الحَناجِرِ كاظِمينَ ما للِظالمِين مِن حَميمٍ وَلا شَفيٍع يُطاعُ عَلِمَت نَفسٌ ما اَحضَرَت فَلا اَقسِمُ بِالخُنَّس الجَوارِ الكُنسَّ وَاَللّيِل اذِا عَسعَسَ وَالصُّبحِ اِذا تَنَفَّسَ ص وَالقُرانِ ذي الذِكِر بَل الَذينَ كَفَروا في عِزةٍ وشِقاق (شاهَتِ الوُجوهُ) ثلاث مرات وَكَلَّتِ الألسُنُ وَعَمِيَتِ الأَبصارُ اَللهُمَّ اجعَل خَيرَهم بَينَ عَينَيهِم وَشَرَّهُم تَحتَ قَدَمَيهِم وخاتَمَ سُلَيمانَ بَينَ اَكتافِهِم فَسَيَكفيكَهُم الله وَهوَ السَّميعُ العَليم صِبغَةَ اللهِ وَمَن اَحسَن مِنَ اللهِ صِبغَة كهيعص اكِفِنا حمعسق احِمِنا سُبحانَ القادِرِ القاهِرِ الكافي وَجَعَلنا مِن بَينِ ايِديهِم سَداً ومَنِ خَلفِهم سَدّاً فَاَغشَيناهُم فَهم لا يبصِرونَ صمٌ بكمٌ عميٌ فَهم لا يعقِلونَ اولئكَ الّذَينَ طَبَعَ اللهُ عَلى قُلوِبهِم وسَمعِهِم وَاَبصارِهِم واوُلائِكَ هُم الغافِلوُنَ تَحَصَّنتُ بذِيِ الُملكِ والمَلكَوتِ وَاعتَصَمتُ بذِي العِزِ وَالعَظَمِة والجَبَروتِ وَتَوَكَّلتُ عَلى الحَيّ الّذي لا يَموت دَخَلتُ في حرِزِ اللهِ وَفي حِفِظِ اللهِ وَفي اَمانِ اللهِ مِن شَرّ البَريَّة اَجمَعين كهيعص حمعسق ولا حَولَ وَلا قُوَّة إلا باِلله العِلي العَظيِم وَصَلى اللهُ عَلى محُمدٍ وَآلِهِ الطاهِرينَ بِرَحمَتِكَ يا اَرَحَمَ الراحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: DouaaZamanAlghaiba.screenRoute,
          pushBack: DouaaAlkamous.screenRoute,
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
