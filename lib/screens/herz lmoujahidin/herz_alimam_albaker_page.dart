import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz%20lmoujahidin/herz_alrasoul_wal_aimma_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'herz_alimam_alsadek_page.dart';
import 'herz_alimam_zain_alaabidin_page.dart';

class HerzAlimamAlbakerPage extends StatefulWidget {
  static String screenRoute = 'herzalimamalbaker_screen';
  HerzAlimamAlbakerPage({super.key});

  @override
  State<HerzAlimamAlbakerPage> createState() => _HerzAlimamAlbakerPageState();
}

class _HerzAlimamAlbakerPageState extends State<HerzAlimamAlbakerPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_herzalimamalbaker_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzalimamalbaker_screen', value);
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
                      .addFavorite('حرز الإمام محمد الباقر (ع)',
                          HerzAlimamAlbakerPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'حرز الإمام محمد الباقر (ع)',
                          HerzAlimamAlbakerPage.screenRoute,
                          HerzAlimamAlbakerPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حرز الإمام محمد الباقر (ع)',
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
                        'أُعيذ نفسي بربّيَ الأكبر، ممّا يخفى وما يظهر، ومن شرِّ كلِّ أنثى وذكر، ومن شرِّ ما رأت الشمس والقمر، سُبّوحٌ قُدّوسٌ قُدّوسٌ ربُّ الملائكة والروح أدعوكم أيها الجنُّ إنْ كُنتم سامعين مطيعين وأدعوكم أيُّها الإنس والجنُّ إلى اللَّطيف الخبير وأدعوكم أيُّها والجنَّ والإنس إلى الذي ختمته بخاتم ربِّ العالمين وخاتم جبرائيل وميكائيل وإسرافيل وخاتم سليمان بن داود عليهم السلام وخاتم محمد سيد المرسلين والنَّبيِّين صلَّى الله عليه وآله وعليهم أجمعين اخسؤوا فيها ولا تكلِّمون واخسؤوا عن فلان ابن فلان كلَّما يغدو ويروح من ذي حيَّةٍ أو عقربٍ أو ساحرٍ أو شيطان رجيم أو سلطان عنيد أخذت عنه ما يُرى وما لا يُرى وما رأت عَيْنُ نائمٍ أو يَقْظان بإذنِ الله اللَّطيف الخبير لا سلطان لكم على الله لا شريك له وصلَّى الله على رسوله سيِّدنا محمَّدٍ النَّبيِّ وآله الطّاهرين وسلَّم تسليماً كثيراً. بسم الله الرحمن الرحيم "ومن قوم موسىٓ أمَّةٌ يهدون بالحقِّ وبه يعدلون".\n\n'
                        'يا حيُّ يا قيّوم يا ديّان يا ديّان يا أهيا أشراهيا آذونا أصباوثَ آل شداي.\n\n'
                        'أسألك بحقِّ هذه الأسماء الطاهرة المطهَّرة، أن تدفع عن صاحب هذا الكتاب جميع البلايا وتقضي حوائجه، إنك أنت أرحم الراحمين وصلوات الله على محمدٍ وآله الطّاهرين. اللهم كهكهيج بعسط مهحما مسلع وروره مهفتام وبعونك إلا ما أخذت لسان جميع بني آدم وبنات حوّا على فلان بن فلان إلّا بالخير يا أرحم الراحمين "فسيكفيكهم الله وهو السميع العليم". وصلّى اللّه على محمد وآله الطّاهرين.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HerzAlimamAlsadekPage.screenRoute,
          pushBack: HerzAlimamZainAlaabidinPage.screenRoute,
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
