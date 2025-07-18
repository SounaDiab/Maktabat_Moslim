import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:maktabat_almoslim/widgets/she3er.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alnabi_walzahraa_wal2a2ima.dart';
import 'zikr_almasajed_almo3azama.dart';
import 'ziyarat_alnabi_walzahraa_wal2a2ima_belbaki3.dart';

class Alwada3 extends StatefulWidget {
  static String screenRoute = 'alwada3_screen';
  const Alwada3({super.key});

  @override
  State<Alwada3> createState() => _Alwada3State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Alwada3State extends State<Alwada3> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_alwada3_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alwada3_screen', value);
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
          .pushReplacementNamed(ZiyaratAlnabiWalzahraaWal2a2ima.screenRoute);
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
                      .addFavorite('الوداع', Alwada3.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الوداع', Alwada3.screenRoute, Alwada3.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الوداع',
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
                      'اذا أردت أن تخرج من المدينة فاغتسل وامض الى قبر النّبي (صلى الله عليه وآله وسلم) واعمل ما كنت تعمله مِن قبل ثمّ ودّعه وقُل :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا رَسُولَ اللهِ، اَسْتَوْدِعُكَ اللهَ وَاَسْتَرْعيكَ وَاَقْرَأُ عَلَيْكَ السَّلامُ، آمَنْتُ بِاللهِ وَبِما جِئْتَ بِهِ وَدَلَلْتَ عَلَيْهِ، اَللّـهُمَّ لا تَجْعَلْهُ آخِرَ الْعَهْدِ مِنّي لِزِيارَةِ قَبْرِ نَبِيِّكَ، فَاِنْ تَوَفَّيْتَني قَبْلَ ذلِكَ فَاِنّي اَشْهَدُ في مَماتي عَلى ما شَهِدْتُ عَلَيْهِ في حَياتي اَنْ لا اِلهَ إلاّ اَنْتَ وَاَنَّ مُحَمَّداً عَبْدُكَ وَرَسُولُكَ صَلَّى اللهُ عَلَيْهِ وَآلِهِ.\n\n'
                      'وقال الصّادق (عليه السلام) ليونس بن يعقوب : قُل في وداع النّبي (صلى الله عليه وآله وسلم) صَلَّى اللهُ عَلَيْكَ، السَّلامُ عَلَيْكَ لا جَعَلَهُ اللهُ آخِرَ تَسْليمي عَلَيْكَ.\n\n'
                      'أقول : قد قلنا في كتاب هديّة الزّائرين عند بيان ما ينبغي أن يصنع زوّار المدينة الطيّبة انّ مِن مهام الامور أن يغتنموا الفرصة ما أقاموا في المدينة المعظّمة، فيكثروا من الصّلاة في مسجد النّبي (صلى الله عليه وآله وسلم) فانّ الصّلاة فيه تعدل عشرة آلاف صلاة في غيره من المواضِع، وأفضل الاماكن فيه مسجد الرّوضة وهو بين القبر والمنبر، واعلم انّه قال شيخنا في التحيّة : انّ موضع جسد نبيّنا والائمة صلوات الله عليهم أجمعين في الارض أشرف من الكعبة المعظّمة باتّفاق جميع الفقهاء كما صرّح به الشّهيد في القواعد، وفي حديث حسن عن الحضرمي قال : أمرني الصّادق (عليه السلام) : أن أكثر من الصّلاة في مسجد النّبي (صلى الله عليه وآله وسلم) ما امكنتني الصّلاة وقال : انّه لا يتيسّر لك دائماً الحضُور في هذه البُقعة الشّريفة الخ.\n\n'
                      'وروى الشّيخ الطّوسي (رحمه الله) في التّهذيب بسند معتبر عن مرازم عن الصّادق صلوات الله وسلامه عليه قال : الصّيام بالمدينة والقيام عند الاساطين ليس بمفروض ولكن من شآء فليصم فانّه خير له انّما المفروض الصّلوات الخمس وصيام شهر رمضان، فاكثروا الصّلاة في هذا المسجد ما استطعتم فانّه خير لكم، واعلموا انّ الرّجل قد يكون كيّساً في أمر الدّنيا فيقال : ما أكيس فلاناً فكيف من كاس في أمر آخرته، وكرّر ما امكنتك في كلّ يوم زيارة النّبي (صلى الله عليه وآله وسلم) وكذلك زيارة أئمة البقيع (عليهم السلام) وسلّم على النّبي (صلى الله عليه وآله وسلم) مهما وقع بصرك على حجرته، وراقب نفسك ما دمت في المدينة، وصُن نفسك من المعاصي والمظالم، وتدبّر في شرف تلك المدينة ولا سيّما مسجدها مسجد النّبي (صلى الله عليه وآله وسلم)، فتلك البقاع هي مواضع أقدام النّبي (صلى الله عليه وآله وسلم)وقد تردّد النّبي (صلى الله عليه وآله وسلم) في مسالك هذه المدينة وأسواقها وصلّى في مسجدها، وهناك موضع الوحي والتّنزيل، وكان يهبط فيها جبرئيل والملائكة المقرّبون، ولنعم ما قيل :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'اَرْضٌ مَشى جِبْريلُ في عَرَصاتِها    وَاللهُ شَرَّفَ اَرْضَها وَسَماءَها',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وتصدّق ما استطعت في المدينة ولا سيّما في المسجد وخاصّة على السّادة وذريّة الرّسول (صلى الله عليه وآله وسلم) فانّ لها ثواباً جزيلاً وأجراً عظيماً، وقال العلامة المجلسي (رحمه الله): في رواية معتبرة انّ درهماً يتصدّق بها فيها يعدل عشرة آلاف درهم في غيرها، وجاور المدينة الطّيّبة ان أمكنتك فانّها مستحبّة، وقد ورد في فضلها أحاديث مستفيضة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'سَقَى اللهُ قَبْراً بِالْمَدينَةِ غَيْثَهُ    فَقَدْ حَلَّ فيهِ الاَْمْنُ بِالْبَرَكاتِ\n\n'
                      'نَبِيُّ الْهُدى صَلّى عَلَيْهِ مَليكُهُ    وَبَلَّغَ عَنّا رُوحَهُ التُّحَفاتِ\n\n'
                      'وَصَلّى عَلَيْهِ اللهُ ما ذَرَّ شارِقٌ    وَلاحَتْ نُجُومُ اللَّيْلِ مُبْتَدِراتِ',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3.screenRoute,
          pushBack: ZikrAlmasajedAlmo3azama.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الوداع.mp3',
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
