import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'a3mal_jami3_alkoufa.dart';
import 'ziyarat_hani_ben_3orwa.dart';

class FiFadlAlkoufaWamasjidouha extends StatefulWidget {
  static String screenRoute = 'fi_fadl_alkoufa_wamasjidouha_screen';
  const FiFadlAlkoufaWamasjidouha({super.key});

  @override
  State<FiFadlAlkoufaWamasjidouha> createState() =>
      _FiFadlAlkoufaWamasjidouhaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiFadlAlkoufaWamasjidouhaState extends State<FiFadlAlkoufaWamasjidouha> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_fadl_alkoufa_wamasjidouha_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_fadl_alkoufa_wamasjidouha_screen', value);
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
                      .addFavorite(
                          'في فضل الكوفة ومسجدها الأعظم وأعمالها وزيارة مسلم (عليه السلام)',
                          FiFadlAlkoufaWamasjidouha.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في فضل الكوفة ومسجدها الأعظم وأعمالها وزيارة مسلم (عليه السلام)',
                          FiFadlAlkoufaWamasjidouha.screenRoute,
                          FiFadlAlkoufaWamasjidouha.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في فضل الكوفة ومسجدها الأعظم وأعمالها وزيارة مسلم (عليه السلام)',
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
                      'اعلم انّ مدينة الكوفة هي احدى المُدن الاربعة الّتي اختارها الله تعالى وبها قد فسّرت كلمة طور سينين وفي الحديث انّها حرم الله وحرم رسوله (صلى الله عليه وآله وسلم) وحرم امير المؤمنين (عليه السلام) ودرهم واحد يتصدّق به فيها يعدل مائة درهم يتصدّق بها في مكان آخر، والصّلاة فيها ركعتان تعدل مائة ركعة في غيرها.\n\n'
                      'وأمّا فضْلُ جْامِع الكُوفة : فلا يفي به الذّكر وحسبه شرفاً انّه أحد المساجد الاربعة الجديرة بأن تشدّ اليها الرّحال لدرك فضلها، وهو أحد المواطن الاربعة التي يكون المسافر فيها بالمختار بين القصر والاتمام، والفريضة فيه تعدل حجّة مقبُولة وتعدل ألف صلاة تُصلّى في غيره، وفي الرّوايات انّه موضع قد صلّى فيه الانبياء وسيصلّي فيه القائم المهدي صلوات الله عليه.\n\n'
                      'وفي الحديث انّه قد صلّى فيه ألف نبيّ، وألف وصيّ نبيّ ويستفاد من بعض الرّوايات فضل مسجد الكوفة على المسجد الاقصى في بيت المقدس، وروى ابن قولويه عن الباقر (عليه السلام) قال : لو علِمَ النّاس ما لمسجد الكوفة من الفضل لشدّوا اليه الرّحال من بُعد البلاد، وقال (عليه السلام) : الصّلاة المكتوبة فيه تعدل حجّة مقبولة، والنّافلة تعدل عمرة مقبولة.\n\n'
                      'وعلى رواية اخرى الفريضة والنّافلة فيه تعدل حجّة وعمرة مع رسول الله (صلى الله عليه وآله وسلم)، وروى الكليني وغيره عن المشايخ العظام عن هارون بن خارجة قال : قال أبو عبد الله صلوات الله عليه : كم بينك وبين مسجد الكوفة يكون ميلاً ؟ قلت : لا ، قال : أفتصلّي فيه الصّلاة كلّها ، قلت : لا ، قال : أما لو كنت حاضراً بحضرته لرجوت أن لا تفوتني فيه صلاة أو تدري ما فضل ذلك الموضِع، ما من نبيّ ولا عبد صالح الاّ وقد صلّى في مسجد الكوفة حتّى انّ رسول الله لمّا اسرى به الى السّماء قال له جبرئيل : أتدري أين أنت يا محمّد أنت السّاعة مقابل مسجد كوفان ، قال : فاستأذن ربّي حتّى آتيه فأصلّي فيه ركعتين، فنزل فصلّى فيه، وانّ ميمنته لروضة من رياض الجنّة وانّ وسطه لروضة من رياض الجنّة وانّ مؤخره لروضة من رياض الجنّة، والصّلاة فيه فريضة تعدُل بألف صلاة والنّافلة فيه بخمسمائة صلاة، وانّ الجلوس فيه بغير تلاوة ولا ذكر لعبادة ولو عَلِمَ النّاس ما فيه لاتوه ولو حبواً.\n\n'
                      'وفي رواية اخرى انّ الصّلاة المكتوبة فيه تعدل حجّة والنّافلة تعدل عمرة، وقد ألمحنا في ذيل الزّيارة السّابعة للامير (عليه السلام) الى فضل هذا المسجد الشّريف، ويستفاد من بعض الرّوايات انّ ميمنة هذا المسجد أفضل من ميسرته.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: A3malJami3Alkoufa.screenRoute,
          pushBack: ZiyaratHaniBen3orwa.screenRoute,
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
