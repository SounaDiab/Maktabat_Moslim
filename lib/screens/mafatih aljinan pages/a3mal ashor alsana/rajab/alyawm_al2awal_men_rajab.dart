import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../rajab.dart';
import 'al2a3mal_al5asa_brajab.dart';
import 'allayla_alsalisa_3ashara.dart';

class AlyawmAl2awalMenRajab extends StatefulWidget {
  static String screenRoute = 'alyaw_al2awal_men_rajab_screen';
  const AlyawmAl2awalMenRajab({super.key});

  @override
  State<AlyawmAl2awalMenRajab> createState() => _AlyawmAl2awalMenRajabState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlyawmAl2awalMenRajabState extends State<AlyawmAl2awalMenRajab> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alyaw_al2awal_men_rajab_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alyaw_al2awal_men_rajab_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Rajab.screenRoute);
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
                      .addFavorite('اليوم الأول من رجب',
                          AlyawmAl2awalMenRajab.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'اليوم الأول من رجب',
                          AlyawmAl2awalMenRajab.screenRoute,
                          AlyawmAl2awalMenRajab.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اليوم الأول من رجب',
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
                padding: EdgeInsets.all(20),
                child: Text(
                  'وهو يوم شريف وفيه أعمال :',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle:
                      'الصّيام وقد روي انّ نوحاً (عليه السلام)كان قد ركب سفينته في هذا اليوم فأمر مَنْ معهُ أن يصوموه ومن صام هذا اليوم تباعدت عنه النّار مسير سنة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle: 'الغُسل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle:
                      'زيارة الحُسين (عليه السلام) . روى الشيخ عن بشير الدّهان عن الصّادق (عليه السلام) قال : من زار الحسين بن علي (عليهما السلام) أوّل يوم من رجب غفر الله له البتّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle: 'أن يدعو بالدّعاء الطّويل المروي في كتاب الاقبال.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'أن يبتديء صلاة سلمان (رضي الله عنه)، وهي ثلاثون ركعة يصلّي منها في هذا اليوم عشر ركعات، يسلّم بعد كلّ ركعتين، ويقرأ في كلّ ركعة فاتحة الكتاب مرّة، وقُل هُوَ اللهُ اَحَدٌ ثلاث مرّات، وقُل يا أيّها الكافِرُونَ ثلاث مرّات، فاذا سلّم رفع يديه وقال:\n\n'
                      'لا اِلـهَ إلاَّ اللهُ وَحْدَهُ لا شَريكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ يُحْيي وَيُميتُ، وَهُوَ حَيٌّ لا يَمُوتُ بِيَدِهِ الْخَيْرُ وَهُوَ عَلى كُلِّ شَيْيء  قَديرٌ، ثمّ يقول : اَللّـهُمَّ لا مانِعَ لِما اَعْطَيْتَ، وَلا مُعْطِيَ لِما مَنَعْتَ، وَلا يَنْفَعُ ذَا الْجَدِّ مِنْكَ الْجَدُّ، ثمّ يمسح بهما وجهه ويصلّي عشراً بهذه الصّفة في يوم النّصف من رجب ولكن يقول بعد (عَلى كُلِّ شَيْيء  قَديرٌ) وَصَلَّى اللهُ عَلى مُحَمَّد وَآلِهِ الطّاهِرينَ وَلا حَوْلَ وَلا قُوَّةَ إِلاّ بِاللهِ الاعَلِيِّ ْلْعَظيمِ، ثمّ يمسح وجهه بيديه، ويسأل حاجته وهذه صلاة ذات فوائد جمّة لا ينبغي التّغاضى عنها، ولسلمان (رحمه الله) أيضاً صلاة اُخرى في هذا اليوم وهي عشر ركعات يقرأ في كلّ ركعة الفاتحة مرّة والتّوحيد ثلاث مرّات وهي صلاة ذات فضل عظيم، فانّها توجب غفران الذّنوب، والوقاية مِن فتنة القبر ومن عذاب يوم القيامة، ويصرف عن من صلّاها الجذام والبرص وذات الجنب.\n\n'
                      'وروى السيّد في الاقبال صلاة اُخرى لهذا اليوم ايضاً فراجعه إن شئت، وفي مثل هذا اليوم من سنة سبع وخمسين كان على بعض الاقوال ولادة الامام الباقر (عليه السلام)، وامّا مختاري فيها فهو اليوم الثّالث من شهر صفر.\n\n'
                      'وفي اليوم الثالث من هذا الشّهر على بعض الرّوايات كانت ولادة الامام عليّ النّقي (عليه السلام) وكان وفاته في الثّالث من هذا الشّهر سنة مائتين وأربع وخمسين في سرّ من رأى.\n\n',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'وفي اليوم العاشر كان فيه على قول ابن عيّاش ولادة الامام محمّد التّقي (عليه السلام).',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 54, 80, 158),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AllaylaAlsalisa3ashara.screenRoute,
          pushBack: Al2a3malAl5asaBrajab.screenRoute,
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
