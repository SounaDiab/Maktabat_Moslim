import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'herz_alimam_aljawad_page.dart';
import 'herz_lietikaa_silah_alaadow_page.dart';

class AyatAlhefzMenSaifAlaadowPage extends StatefulWidget {
  static String screenRoute = 'ayatalhefzmensaifalaadow_screen';
  AyatAlhefzMenSaifAlaadowPage({super.key});

  @override
  State<AyatAlhefzMenSaifAlaadowPage> createState() =>
      _AyatAlhefzMenSaifAlaadowPageState();
}

class _AyatAlhefzMenSaifAlaadowPageState
    extends State<AyatAlhefzMenSaifAlaadowPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ayatalhefzmensaifalaadow_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ayatalhefzmensaifalaadow_screen', value);
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
          .pushReplacementNamed(HerzAlmoujahidinHomeScreen.screenRoute);
      return false;
    }
  }

  double _fontSize = 18;
  double _fontSizeTablet = 30;
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
                      .addFavorite('آيات الحفظ من سيف العدو',
                          AyatAlhefzMenSaifAlaadowPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'آيات الحفظ من سيف العدو',
                          AyatAlhefzMenSaifAlaadowPage.screenRoute,
                          AyatAlhefzMenSaifAlaadowPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'آيات الحفظ من سيف العدو',
            style: TextStyle(
              fontSize: isTablet
                  ? 40
                  : size > 1
                      ? 20
                      : 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 10,
              right: 30,
              left: 30,
              bottom: 10,
            ),
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListOfNineVerses(
                    title: 'تعريف:',
                    subtitle: 'ذكرها الشيخ الكفعمي في المصباخ.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'آثارها:',
                    subtitle:
                        'قال في المصباح: من تلاها أو حملها كان في حفظ الله وملئه وقال في الحاشية نقلاً عن حياو الحيوان للدميري:\n'
                        'روي أن أناساً ضربوا أبا الهيثم بالسيوف فلم يقطع منه شيئاً فسئل عن ذلك فقال: كنت أقرؤها، ثم قال:\n'
                        'خرجت يوماً مع جماعة فرأينا ذئباً يلاعب شاة عجفاء ولا يضرّها شيئاً فلما دنونا منه نفر الذئب فوجدنا في عنقها كتاباً فيه الآيات المذكورة.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'الآيات:',
                    subtitle:
                        'لا يؤوده حفظهما وهو العلي العظيم، فالله خيرٌ حافظاً وهو أرحم الراحمين، له معقِّبات من بين يديه ومن خلفه يحفظونه من أمر الله، إن -الله -ربي على كل شيءٍ حفيظ إنّا نحن نزّلنا الذكر وإنا له لحافظون وحفظناها من كل شيطان رجيم وحِفظاً من كل شيطان ماردٍ إنّ كل نفسٍ لما عليها حافظٌ إنّ بطش ربك لشديد إنّه هو يبدئ ويعيد وهو الغفور الودود ذو العرش المجيد فعّالٌ لما يريد هل أتاك حديث الحنود فرعون وثمود بل الذين كفروا في تكذيبٍ واله من ورائهم محيطٌ بل هو قرآن مجيد في لوحٍ محفوظ.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HerzAlimamAljawadPage.screenRoute,
          pushBack: HerzLietikaaSilahAlaadowPage.screenRoute,
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
