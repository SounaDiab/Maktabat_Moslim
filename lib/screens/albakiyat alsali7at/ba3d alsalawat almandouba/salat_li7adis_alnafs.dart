import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_al2isti5ara_zat_alrka3.dart';
import 'salat_alja2i3.dart';

class SalatLi7adisAlnafs extends StatefulWidget {
  static String screenRoute = 'salat_li7adis_alnafs_screen';
  const SalatLi7adisAlnafs({super.key});

  @override
  State<SalatLi7adisAlnafs> createState() => _SalatLi7adisAlnafsState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatLi7adisAlnafsState extends State<SalatLi7adisAlnafs> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_li7adis_alnafs_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_li7adis_alnafs_screen', value);
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
          .pushReplacementNamed(Ba3dAlsalawatAlmandouba.screenRoute);
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
                          'صلاة لحديث النفس', SalatLi7adisAlnafs.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة لحديث النفس',
                          SalatLi7adisAlnafs.screenRoute,
                          SalatLi7adisAlnafs.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة لحديث النفس',
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
                      'عن الصادق (عليه السلام) قال: ليس من مؤمن يمر عليه أربعون صباحا إِلاّ حدّث نفسه فإذا عرض له ذلك فليصلّ ركعتين وليستعذ بالله من ذلك. وعنه (عليه السلام) قال: شكا اَّدم (عليه السلام) إلى الله عزَّ وجلَّ حديث النفس فهبط عليه جبرائيل وقال: قل: لا حَوْلَ وَلا قوَةَ إِلاّ بِاللّهِ. فقاله آدم (عليه السلام) فزال عنه ذلك ثم قال (عليه السلام) الاصل هو: لا حَوْلَ وَلا قوَةَ إِلاّ بِاللّهِ. وعن الباقر (عليه السلام) أنّ رجلاً شكا إلى رسول الله (صلّى الله عليه وآله وسلم) الوسوسة وحديث النفس ودينا قد أثقله، فقال له النبي (صلّى الله عليه وآله وسلم) قل: تَوَكَّلْتُ عَلى الحَيِّ الَّذِي لايَموتُ وَالحَمْدُ لله الَّذِي لَمْ يَتَّخِذْ وَلَداً وَلَمْ يَكُنْ لَهُ شَريكٌ في المُلْكِ وَلَمْ يَكُنْ لَهُ وَليُّ مِنَ الذُّلِّ وَكَبِّرْهُ تَكْبيراً. فعاد إليه بعد مدّة فقال: يارسول الله (صلّى الله عليه وآله وسلم) إن الله قد أزال الوسوسة عنّي وأدّى ديني وأغناني من الفقر.\n\n'
                      'وروي أيضا: قل لدفع وساوس الشيطان إذا عرض لك شك: هوَ الأول وَالاخِرُ وَالظّاهِرُ وَالباطِنُ وَهوَ بِكُلِّ شَيٍ عَليمٌ.\n\n'
                      'ولوساوس الشيطان أيضاً عن الصادق (عليه السلام) قال: إمسح بيدك صدرك وقل: بِسْمِ الله وَبِالله مُحَمَّدٌ رَسولِ الله ، وَلا حَوْلَ وَلا قوَةَ إِلاّ بِالله العَليّ العَظيمِ، اللَّهُمَّ امْسَحْ عَنِّي ماأحْذَرُ. ثم امسح بطنك وقله ثلاث مرات فتزول إن شاء اللّه.\n\n'
                      'وينفع لدفع الوساوس أيضاً غسل الرأس بالسدر وينفع السواك وأكل الرمان والشرب من الماء الماطر في نيسان.\n\n'
                      'وصوم ثلاثة أيام من كل شهر: الخميس الأول والاخير من الشهر ويوم الاربعاء وسط الشهر. ويقول أيضا: أعوذُ بِالله القَوي مِنَ الشَّيْطانِ الغَويّ، وَأعوذُ بِمُحَمَّدٍ الرَّضي مِنْ شرِّ ما قَدَّرَ وَقَضى وَأعوذُ بِإلهِ النّاسَ مِنْ شَرِّ الجِنَّةِ وَالنّاسِ أجْمَعينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAl2isti5araZatAlrka3.screenRoute,
          pushBack: SalatAlja2i3.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/صلاة لحديث النفس.mp3',
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
