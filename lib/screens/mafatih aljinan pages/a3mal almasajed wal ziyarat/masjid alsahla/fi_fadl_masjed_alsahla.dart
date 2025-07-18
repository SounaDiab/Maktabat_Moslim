import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../a3mal_masjid_alsahla.dart';
import 'a3mal_masjed_alsahla.dart';
import 'alsalat_waldouaa_fi_masjed_zaid.dart';

class FiFadlMasjedAlsahla extends StatefulWidget {
  static String screenRoute = 'fi_fadl_masjed_alsahla_screen';
  const FiFadlMasjedAlsahla({super.key});

  @override
  State<FiFadlMasjedAlsahla> createState() => _FiFadlMasjedAlsahlaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiFadlMasjedAlsahlaState extends State<FiFadlMasjedAlsahla> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_fadl_masjed_alsahla_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_fadl_masjed_alsahla_screen', value);
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
          .pushReplacementNamed(A3malMasjidAlsahla.screenRoute);
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
                          'في فضل مسجد السهلة وأعماله, وأعمال مسجد زيد ومسجد صعصعة',
                          FiFadlMasjedAlsahla.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في فضل مسجد السهلة وأعماله, وأعمال مسجد زيد ومسجد صعصعة',
                          FiFadlMasjedAlsahla.screenRoute,
                          FiFadlMasjedAlsahla.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في فضل مسجد السهلة وأعماله, وأعمال مسجد زيد ومسجد صعصعة',
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
                      'اعلم انّه ليس في تلك البقاع مسجد يضاهي مسجد السّهلة فضلاً وشرفاً بعد مسجد الكوفة وهو بيت ادريس (عليه السلام) وابراهيم (عليه السلام) ومنزل خضر (عليه السلام) ومسكنه، وعن أبي بصير عن الصّادق صلوات الله وسلامه عليه قال : قال لي : يا أبا محمّد كأنّي أرى نزول القائم صلوات الله عليه في مسجد السّهلة بأهله وعياله ويكون منزله، وما بعث الله نبيّاً الاّ وقد صلّى فيه والمقيم فيه كالمقيم في فُسطاط رسول الله (صلى الله عليه وآله وسلم)، وما من مؤمن ولا مؤمنة الاّ وقلبه يحنّ اليه وفيه صخرة فيها صورة كلّ نبيّ، وما صلّى فيه أحد فدعا الله بنيّه صادقة الاّ صرفه الله بقضاء حاجته، '
                      'وما مِن أحد استجاره الاّ أجاره الله ممّا يخاف منه، قلت : هذا لهو الفضل ، قال : نزيدك ؟ قلت : نعم ، قال : هو من البقاع التّي أحبّ الله أن يدعى فيها وما من يوم ولا ليلة الاّ والملائكة تزُور هذا المسجد يعبدون الله فيه، أما انّي لو كنت بالقرب منكم ما صلّيت صلاة الاّ فيه، يا أبا محمّد ما لم أصف اكثر ، قلت : جعلت فداك لا يزال القائم (عليه السلام) فيه أبداً ؟ قال : نعم .. الخ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlsalatWaldouaaFiMasjedZaid.screenRoute,
          pushBack: A3malMasjedAlsahla.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في فضل مسجد السهلة.mp3',
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
