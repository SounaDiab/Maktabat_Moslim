import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz%20lmoujahidin/herz_alrasoul_wal_aimma_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'herz_alimam_alkazem_page.dart';
import 'herz_alimam_mohamad_aljawad_page.dart';

class HerzAlimamAlridaPage extends StatefulWidget {
  static String screenRoute = 'herzalimamalrida_screen';
  HerzAlimamAlridaPage({super.key});

  @override
  State<HerzAlimamAlridaPage> createState() => _HerzAlimamAlridaPageState();
}

class _HerzAlimamAlridaPageState extends State<HerzAlimamAlridaPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_herzalimamalrida_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzalimamalrida_screen', value);
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
          .pushReplacementNamed(HerzAlrasoulWalAimmaPage.screenRoute);
      return false;
    }
  }

  double _fontSize = 18;
  double _fontSizeTablet = 30;
  @override
  Widget build(BuildContext context) {
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
                      .addFavorite('حرز الإمام الرضا (ع)',
                          HerzAlimamAlridaPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'حرز الإمام الرضا (ع)',
                          HerzAlimamAlridaPage.screenRoute,
                          HerzAlimamAlridaPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حرز الإمام الرضا (ع)',
            style: TextStyle(
              fontSize: isTablet ? 40 : 19,
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
                  child: Center(
                    child: Text(
                      'بسم الله الرحمن الرحيم',
                      style: TextStyle(
                        fontSize: isTablet ? _fontSizeTablet : _fontSize,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: '',
                    subtitle:
                        'اللهم  أعطني الهدى وثبتني عليه، واحشرني عليه آمناً، أمن من لا خوف عليه، ولا حزن ولا جزع، إنك أهل التَّقوى وأهل المغغرة، برحمتك يا أرحم الراحمين وصاَّى الله على محمد وآله الطّاهرين.\n\n'
                        'باسم الله "اخسئوا فيها ولا تكلّمون" "إنّيٓ أعوذ بالرحمٰن منك إن كنت تقيّاً" أخذت بسمع الله وبصره على أسماعكم وأبصاركم وبقوَّة الله على قوَّتكم لا سلطان لكم على (فلان ابن فلانة) ولا على ذرِّيَّته ولا على أهله ولا على أهل بيته سترت بيني وبينكم بستر النُّبوَّة الذي استتروا به من سطوات الجبابرة والفراعنة، جبرائيل عن أيمانكم، وميكائيل عن يساركم، ومحمد صلى الله عليه وآله أمامكم والله يطَّلع عليكم بمنعه نبيَّ الله وبمنع ذرّيّته وأهل بيته منكم ومن الشياطين، ما شاء الله لا حول ولا قوة إلا بالله العليّ العظيم، اللهم إنه لا يبلغ جهله أناتك ولا يبتليه ولا يبلغ مجهود نفسه، عليك توكلت وأنت نعم المولى ونعم النصير، حرسك الله يا فلان ابن فلانة وذرِّيتك ممّا تخاف على أحدٍ من خلقه وصلّى الله على محمدٍ وآله.\n\n'
                        '"الله لآ إلٰه إلا هو الحيُّ القيّوم لا تأخذه سِنةٌ ولا نوم له ما في السماوات والأرض من ذا الذي يشفع عنده إلا بإذنه يعلم ما بين أيديهم وما خلفهم ولا يُحيطون بشيءٍ من علمه إلا بما شآء وسع كرسيُّه السماوات والأرض ولا يـٔوده حفظهما وهو العلي العظيم".\n\n'
                        'لا حول ولا قوَّة إلا بالله العليِّ العظيم لا ملجأ من الله إلا إليه وحسبي الله ونعم الوكيل وأسلم في رأس الشهباء فيها لما لسلسبيلا وصلّى الله على محمدٍ وآله الطَّيِّبين الطاهرين.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HerzAlimamMohamadAljawadPage.screenRoute,
          pushBack: HerzAlimamAlkazemPage.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/حرز الإمام الرضا.mp3',
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
