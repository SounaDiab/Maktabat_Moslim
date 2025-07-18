import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz%20lmoujahidin/herz_alrasoul_wal_aimma_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'herz_alimam_alaaskari_page.dart';
import 'herz_alimam_mohamad_aljawad_page.dart';

class HerzAlimamAlhadiPage extends StatefulWidget {
  static String screenRoute = 'herzalimamalhadi_screen';
  HerzAlimamAlhadiPage({super.key});

  @override
  State<HerzAlimamAlhadiPage> createState() => _HerzAlimamAlhadiPageState();
}

class _HerzAlimamAlhadiPageState extends State<HerzAlimamAlhadiPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_herzalimamalhadi_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_herzalimamalhadi_screen', value);
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
                      .addFavorite('حرز الإمام الهادي (ع)',
                          HerzAlimamAlhadiPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'حرز الإمام الهادي (ع)',
                          HerzAlimamAlhadiPage.screenRoute,
                          HerzAlimamAlhadiPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'حرز الإمام الهادي (ع)',
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
                        'لا حول ولا قوَّة إلا بالله العليِّ العظيم، اللهم ربَّ الملائكة والروح والنَّبيّين والمرسلين وقاهر من في السماوات والأرضين، وخالق كلِّ شيءٍ ومالكه، كفَّ عنّا بأس أعدائنا ومن أراد بنا سوءاً من الجنِّ والإنس واعم ابصارهم وقلوبهم، واجعل بيننا وبينهم حجاباً وحرساً ومدفعاً إنَّك ربُّنا لا حول ولا قوَّة لنا إلا بالله، عليه توكَّلنا وإليه أنبنا وإليه المصير، ربَّنا لا تجعلنا فتنةً للذين كفروا، واغفر لنا ربَّنا، إنك أنت العزيز الحكيم، ربّنا عافنا من كلِّ سوءٍ، ومن شرِّ كلِّ دابةٍ أنت آخذ بناصيتها، ومن شرِّ ما يسكن في الليل والنهار، ومن شرِّ كاِّ سوءٍ، ومن شرِّ كلِّ ذي شرٍّ، ربَّ العالمين وإله المرسلين صلِّ على محمدٍ وآله أجمعين بأتمِّ ذلك، ولا حول ولا قوَّة إلا بالله العليِّ العظيم، باسم الله وبالله أؤمن وبالله أعوذ وبالله أعتصم وبالله أستجير وبعزَّة الله ومنعته أمتنع من شياطين الإنس والجنِّ، ومن رجلهم وخيلهم وركضهم وعطفهم ورجعتهم وكيدهم وشرِّهم وشرِّ ما يأتون به تحت الليل وتحت النهار من البعد والقرب، ومن شرِّ الغائب والحاضر والشاهد والزائر أخياءً وأمواتاً أعمىً وبصيراً، ومن شرِّ العامَّة والخاصَّة، ومن شرِّ نفسٍ ووسوستها، ومن شرِّ الدَّناهش والحسِّ واللمس واللبس، ومن عين الجن والإنس، وبالاسم الذي اهتزَّ به عرش بلقيس. وأُعيذ ديني ونفسي وجميع ما تحوطه عنايتي من شرِّ كل صورةٍ وخيالٍ أو بياضٍ أو سوادٍ أو تمثالٍ أو مُعاهدٍ أو غير مُعاهدٍ ممن يسكن الهواء والسّحاب والظُّلمات والنّور والظِّلَّ والحَرور والبرَّ والبحور والسهل والوعور والخراب والعمران والآكام والآجام والغياض والكنائس والنَّواويس والفلوات والجبّانات، ومن شرِّ الصيادين والواردين ممن يبدو بالليل وينتشر بالنهار وبالعشيِّ والإبكار والغُدُوِّ والآصال والمريبين والأسامرة والأفاثرة (ترة) والفراعنة والأبالسة ومن جنودهم وأزواجهم وعشائرهم وقبائلهم ومن هزمهم ولمزهم ونفْثهم ووِقاعهم وأخذهم وسحرهم وضربهم وعبثهم ولمحهم واحتيالهم واختلافهم، ومن شرِّ كلِّ ذي شرٍّ من السحرة والغيلان وادأمِّ الصِّبيان وما ولدوا وما وردوا، ومن شرِّ كلِّ ذب شرٍّ داخل وخارج وعارضٍ ومتعرِّضٍ وساكن ومتخركٍ وضربان عرقٍ وصداعٍ وشقيقةٍ وأمِّ ملدمٍ والحمّى والمثلّثة والرِّبع والغبِّ والنافضة والصالية والداخلة والخارجة، ومن شرِّ كلِّ دابةٍ أنت آخذٌ بناصيتها إنك على صراطٍ مستقيمٍ، وصلّى الله على بدنبيِّه محمدٍ وآله الطاهرين.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: HerzAlimamAlaaskariPage.screenRoute,
          pushBack: HerzAlimamMohamadAljawadPage.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/حرز الإمام الهادي.mp3',
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
