import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2a3mal_al5asa.dart';
import 'a3mal_allayla_latasi3a_3ashar.dart';
import 'dou3a2_alimam_alsadek.dart';

class A3malAllaylaAlwahidaWal3eshrin extends StatefulWidget {
  static String screenRoute = 'a3mal_allayla_alwahida_wal3eshrin_screen';
  const A3malAllaylaAlwahidaWal3eshrin({super.key});

  @override
  State<A3malAllaylaAlwahidaWal3eshrin> createState() =>
      _A3malAllaylaAlwahidaWal3eshrinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malAllaylaAlwahidaWal3eshrinState
    extends State<A3malAllaylaAlwahidaWal3eshrin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_a3mal_allayla_alwahida_wal3eshrin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_a3mal_allayla_alwahida_wal3eshrin_screen', value);
  }

      Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Al2a3malAl5asa.screenRoute);
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
                      .addFavorite('اعمال الليلة الواحدة والعشرين',
                          A3malAllaylaAlwahidaWal3eshrin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'اعمال الليلة الواحدة والعشرين',
                          A3malAllaylaAlwahidaWal3eshrin.screenRoute,
                          A3malAllaylaAlwahidaWal3eshrin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اعمال الليلة الواحدة والعشرين',
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
              Center(
                child: Text(
                  'بسم الله الرحمن الرحيم',
                  style: TextStyle(
                    fontSize: isTablet ? _fontSizeTablet + 10 : _fontSize,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'أعمال الليلة الواحدة والعشرين وفضلها أعظم من الليلة التاسعة عشرة، وينبغي أن يؤدّي فيها الأعمال العامة لليالي القدر، من الغسل والإحياء والزيارة والصلاة ذات التوحيد سبع مرات، ووضع المصحف على الرأس، ودعاء الجوشن الكبير، وغير ذلك، وقد أكّدت الأحاديث استحباب الغسل والإحياء والجد في العبادة في هذه الليلة، والليلة الثالثة والعشرين، وأنّ ليلة القدر هي إحداهما، وقد سئل المعصوم عليه السلام في أحاديث عدّة عن ليلة القدر، أي الليلتين هي؟ فلم يعيّن، بل قال: "ما أيسر ليلتين فيما تطلب"، أو قال: "ما عَلَيْكَ أن تَفْعَلَ خَيراً في لَيلَتينِ" ونحو ذلك. وقال الشيخ الصدوق قدس سره في ما أملى على المشايخ في مجلس واحد، من مذهب الإماميّة: "ربما يتوهم الناس أن في إحيائهم منقصة لأنهم لم يطلبوا العلم" وليبدأ من هذه الليلة في دعوات العشر الأواخر من الشهر، منها الدُّعاء الذي رواه الكليني في الكافي، عن الإمام الصادق عليه السلام أنّه قال: تقول في العشر الأواخر من شهر رمضان، كل ليلة:',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'أَعُوذُ بِجَلالِ وَجْهِكَ الْكَرِيمِ، أَنْ يَنْقَضِيَ عَنِّي شَهْرُ رَمَضان، أَوْ يَطْلُعَ الْفَجْرُ مِنْ لَيْلَتِي هذِهِ، وَلَكَ قِبَلِي ذَنْبٌ أَوْ تَبِعَةٌ تُعَذِّبُنِي عَلَيْهِ.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: isTablet ? _fontSizeTablet : _fontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وروى الكفعمي في هامش كتاب (البلد الأمين): إنّ الإمام الصادق عليه السلام كان يقول في كل ليلة من العشر الأواخر بعد الفرائض والنوافل:',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '"اللّهُمَّ، أَدِّ عَنَّا حَقَّ ما مَضَى مِنْ شَهْرِ رَمَضانَ، وَاغْفِرْ لَنا تَقْصِيرَنا فِيهِ، وَتَسَلَّمْهُ مِنَّا مَقْبُولاً، وَلا تُؤاخِذْنا بِإِسْرافِنا عَلَى أَنْفُسِنا، وَاجْعَلْنا مِنَ الْمَرْحُومِينَ، وَلا تَجْعَلْنا مِنَ الْمَحْرُومِينَ".',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: isTablet ? _fontSizeTablet : _fontSize,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2AlimamAlsadek.screenRoute,
          pushBack: A3malAllaylaLatasi3a3ashar.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اعمال الليلة الواحدة والعشرين.mp3',
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
