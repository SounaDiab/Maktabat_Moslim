import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:maktabat_almoslim/widgets/she3er.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../baki_alsana.dart';
import 'fi_shaher_rabi3_al2awal.dart';
import 'fi_shaher_zilko3da.dart';

class FiShaherSafar extends StatefulWidget {
  static String screenRoute = 'fi_shaher_safar_screen';
  const FiShaherSafar({super.key});

  @override
  State<FiShaherSafar> createState() => _FiShaherSafarState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiShaherSafarState extends State<FiShaherSafar> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_fi_shaher_safar_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_shaher_safar_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(BakiAlsana.screenRoute);
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
                      .addFavorite('في شهر صفر', FiShaherSafar.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('في شهر صفر', FiShaherSafar.screenRoute,
                          FiShaherSafar.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في شهر صفر',
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
                      'اعلم انّ هذا الشّهر معروف بالنّحوسة ولا شيء أجدى لرَفع النّحوسة من الصّدقة والادعية والاستعاذات المأثورة ومن أراد أن يصان ممّا ينزل في هذا الشّهر من البلاء فليقل كلّ يوم عشر مرّات كما روى المحدّث الفيض وغيره :\n\n'
                      'يا شَديدَ الْقُوى وَيا شَديدَ الْمِحالِ يا عَزيزُ يا عَزيزُ يا عَزيزُ ذَلَّتْ بِعَظَمَتِكَ جَميعُ خَلْقِكَ فَاكْفِنى شَرَّ خَلْقِكَ يا مُحْسِنُ يا مُجْمِلُ يا مُنْعِمُ يا مُفْضِلُ يا لا اِلـهَ اِلاّ اَنْتَ سُبْحانَكَ اِنّى كُنْتُ مِنَ الظّالِمينَ فَاسْتَجَبْناهُ لَهُ وَنَجَّيْناهُ مِنَ الْغَمِّ وَكَذلِكَ نُنْجِى الْمُؤْمِنينَ وَصَلَّى اللهُ عَلى مُحَمَّد وَآلِهِ الطَّيِّبينَ الطّاهِرينَ.\n\n'
                      'والسّيد قد روى دعاء يدعى به عند الاستهلال.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الاوّل :',
                  subtitle:
                      'فيه في السّنة السّابعة والثّلاثين ابتدئ القتال في واقعة صفّين وفيه على بعض الاقوال في السّنة الحادية والسّتين أدخل دمشق رأس سيّد الشّهداء (عليه السلام) فجعله بنو أميّة عيداً لهم وهو يوم يتجدّد فيه الاحزان :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'كانَتْ مَـاتِمُ بِالْعِراقِ تَعُدُّها   اَمَوِيَّةُ بِالشّامِ مِن اَعْيادِها',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وفيه أيضاً على بعض الاقوال أو في الثّالث منه في السّنة الحادية والعشرين بعد المائة استشهد زيد بن عليّ بن الحسين (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّالث :',
                  subtitle:
                      'روى السّيد ابن طاوس عن كتب أصحابنا الاماميّة استحباب الصّلاة في هذا اليوم ركعتين يقرأ في الاُولى الحمد وسورة اِنّا فَتَحنا وفي الثّانية الحمد والتّوحيد ويصلّي بعد السّلام على محمّد وآله مائة مرّة ويقول مائة مرّة اَللّـهُمَّ الْعَنْ آلَ اَبى سُفْيانَ ويستغفر مائة مرّة ثمّ يسئل حاجته.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم السّابع :',
                  subtitle:
                      'استشهد فيه في سنة خمسين الامام الحسن المجتبى (عليه السلام) على قول الشّهيد والكفعمي وغيرهما وكانت الشّهادة في اليوم الثّامن والعشرين من الشّهر على قول الشّيخين وفيه في سنة 128 كانت ولادة الامام موسى بن جعفر (عليهما السلام) في أبواء وهو منزل بين مكّة والمدينة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم العشرون :',
                  subtitle:
                      'يوم الاربعين وعلى قول الشّيخين هو يوم ورود حرم الحسين (عليه السلام) المدينة عائداً من الشّام وهو يوم ورود جابر بن عبد الله الانصاري كربلاء لزيارة الحسين وهو اوّل من زاره (عليه السلام) ويستحبّ فيه زيارته (عليه السلام) وعن الامام العسكري (عليه السلام) قال : علامات المؤمن خمس : صلاة احدى وخمسين الفرائض والنّوافل اليوميّة ، وزيارة الاربعين ، والتّختّم في اليمين وتعفير الجبين والجهر ببسم الله الرحمن الرحيم.\n\n'
                      'وقد روى الشّيخ في التّهذيب والمصباح زيارة خاصّة لهذا اليوم عن الصّادق (عليه السلام) سنوردها في باب الزّيارات ان شاء الله.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّامن والعشرون :',
                  subtitle:
                      'من سنة احدى عشرة يوم وفاة خاتم النّبيّين صلوات الله عليه وآله وقد صادفت يوم الاثنين من ايّام الاسبوع باتّفاق الاراء وكان له عندئذ من العمر ثلاث وستّون سنة هبط عليه الوحي وله أربعون سنة ثمّ دعا النّاس الى التّوحيد في مكّة مدّة ثلاث عشرة سنة ثمّ هاجر الى المدينة وقد مضى من عمره الشّريف ثلاث وخمسون سنة وتوفي في السّنة العاشرة من الهجرة فبدأ أمير المؤمنين (عليه السلام) في تغسيله وتحنيطه وتكفينه ثمّ صلّى عليه ثمّ كان الاصحاب يأتون أفواجاً فيصلّون عليه فرادى من دون امام يأتمّون به وقد دفنه امير المؤمنين صلوات الله عليه في الحجرة الطّاهرة في الموضع الذي توفي فيه.\n\n'
                      'عن أنس بن مالك قال : لمّا فرغنا من دفن النّبي (صلى الله عليه وآله وسلم) أتت اليّ فاطمة (عليها السلام) فقالت : كيف طاوعتكم أنفسكم على أن تهيلوا التّراب على وجه رسول الله ثمّ بكت وقالت : يا اَبَتاهُ اَجابَ رَبّاً دَعاهُ يا اَبَتاهُ مِنْ رَبِّهِ ما اَدْناهُ الخ ولنعم ما قيل :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'اى دون جهان زير زمين از چه   خاك نه خاك نشين از چه',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'وعلى رواية معتبرة انّها أخذت كفّاً من تراب القبر الطّاهر فوضعته على عينيه وقالت :',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'ماذا عَلَى الْمُشْتَمِّ تُرْبَةَ اَحْمَد   اَنْ لا يَشَمَّ الزَّمانِ غَوالِيا\n\n'
                      'صُبَّتْ عَلىَّ مَصآئِبٌ لَوْ اَنَّها   صُبَّتْ عَلَى الاَْيّامِ صِرْنَ لَيالِيا',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'وروى الشّيخ يوسف الشّامي في كتاب الدّرّ النّظيم انّها قالت في رثاء أبيها :',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'قُلْ لِلْمُغيَّبِ تَحْتَ اَثْوابِ الثَّرى   اِنْ كُنْتَ تَسْمَعُ صَرْخَتى وَنِدائيا\n\n'
                      'صُبَّتْ عَلىَّ مَصآئِبُ لَوْ اَنَّها   صُبَّتْ عَلَى الاَْيّامِ صِرْنَ لَيالِيا\n\n'
                      'قَدْ كُنْتُ ذاتَ حِمىً بِظِلِّ مُحَمَّد   لا اَخْشَ مِنْ ضَيْم وَكانَ حِمالِيا\n\n'
                      'فَالْيَوْمَ اَخْضَعُ لِذَّليلِ وَاَتَّقى   ضَيْمى وَاَدْفَعُ ظالِمى بِرِدائيا\n\n'
                      'فَاِذا بَكَتْ قُمْرِيَّةٌ فى لَيْلِها   شَجَناً عَلى غُصْن بَكَيْتُ صَباحِيا\n\n'
                      'فَلاََجْعَلَنَّ الْحُزْنَ بَعْدَكَ مُونِسى   وَلاََجْعَلَنَّ الدَّمْعَ فيكَ وِشاحيا',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الاخير من الشّهر :',
                  subtitle:
                      'فيه في سنة ثلاث ومائتين على رواية الطّبرسي وابن الاثير استشهد الامام الرّضا '
                      '(عليه السلام)بعنب دسّ فيه السّم وكان له من العمر خمس وخمسون سنة وقبره الشّريف في بيت حميد بن قحطبة في قرية سناباد بأرض طوس وفي ذلك البيت دفن الرّشيد أيضاً في شهر ربيع الاوّل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiShaherRabi3Al2awal.screenRoute,
          pushBack: FiShaherZilko3da.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في شهر صفر.mp3',
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
