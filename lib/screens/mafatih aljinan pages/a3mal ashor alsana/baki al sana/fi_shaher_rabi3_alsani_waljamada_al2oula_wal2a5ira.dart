import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../baki_alsana.dart';
import 'fi_2a3mal_3ama_wa2a3mal_alnayrouz_wa2a3mal_al2ashhor_alromiya.dart';
import 'fi_shaher_rabi3_al2awal.dart';

class FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira extends StatefulWidget {
  static String screenRoute =
      'fi_shaher_rabi3_alsani_waljamada_al2oula_wal2a5ira_screen';
  const FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira({super.key});

  @override
  State<FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira> createState() =>
      _FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5iraState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5iraState
    extends State<FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_shaher_rabi3_alsani_waljamada_al2oula_wal2a5ira_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_shaher_rabi3_alsani_waljamada_al2oula_wal2a5ira_screen',
        value);
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
                      .addFavorite(
                          'في شهر ربيع الثاني والجمادى الأولى والآخرة',
                          FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في شهر ربيع الثاني والجمادى الأولى والآخرة',
                          FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira
                              .screenRoute,
                          FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira
                              .screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في شهر ربيع الثاني والجمادى الأولى والآخرة',
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
                      'قد خصّ السّيد ابن طاوس غرّة كلّ من هذه الشّهور الثّلاثة بدعاء وقال الشّيخ المفيد (رحمه الله) انّ في اليوم العاشر من شهر ربيع الّثاني سنة مائتين واثنتين وثلاثين ولد الامام الحسن العسكري (عليه السلام) وهو يوم شريف جدّاً ويستحبّ فيه الصّيام شكراً لله على هذه النّعمة العُظمى والمناسب في الثّالث عشر والرّابع عشر والخامس عشر من جمادى الاُولى زيارة فاطمة الزّهراء صلوات الله عليها واقامة ماتمها فقد روي بسند صحيح انّها عاشت بعد أبيها خمسة وسبعين يوماً وقد كانت وفاة النّبي (صلى الله عليه وآله وسلم) في الثّامن والعشرين من صَفر على المشهور فيلزم أن تكون وفاتها (عليها السلام) في أحد هذه الايّام الثّلاثة وفي يوم النّصف منه سنة ستّ وثلاثين فتح امير المؤمنين (عليه السلام) البصرة وفيه كانت ولادة الامام زين العابدين (عليه السلام)وزيارة هذين الامامين (عليهما السلام) في هذا اليوم مُناسِبة وأمّا أعمال شهر جمادى الاخرة فهي أن يصلّي كما روى السّيد ابن طاوس أربع ركعات أي بسلامين في أيّ وقت شاء من الشّهر يقرأ الحمد في الاولى مرّة وآية الكرسي مرّة وانّا أنزلناه خمساً وعشرين مرّة وفي الثّانية الحمد مرّة واَلهيكُمُ التّكاثُر مرّة وقل هو الله احد خمساً وعشرين مرّة وفي الثّالثة الحمد مرّة وقُلْ يا أيّها الكافرونَ مرّة وقل اَعوذُ بِربّ الفَلق خمساً وعشرين مرّة وفي الرّابع الحمد مرّة واذا جاء نَصرُ الله والفتح مرّة وقلْ اَعوذُ بربِّ النّاس خمساً وعشرين مرّة ويقول بعد السّلام من الرّابعة سبعين مرّة سُبْحانَ اللهِ وَالْحَمْدُ للهِ وَلا اِلهَ اِلاَّ اللهُ وَاللهُ اَكْبَرُ وسبعين مرّة اَللّـهُمَّ صَلّ عَلى مُحَمَّد وَآلِ مُحَمَّد ثمّ يقول ثلاثاً : اَللّـهُمَّ اغْفِرْ لِلْمُؤمِنينَ وَالْمُؤمِناتِ ثمّ يسجد ويقول : في سجوده ثلاث مرّات يا حَىُّ يا قَيُّومُ يا ذَا الْجَلالِ وَالاِْكْرامِ يا رَحْمنُ يا رَحيمُ يا اَرْحَمَ الرّاحِمينَ ثمّ يسئل الله حاجته يصان من فعل ذلك في نفسه وماله وأهله وولده ودينه ودنياه الى مثلها في السّنة القادمة وان مات في تلك السّنة مات على الشّهادة أي كان له ثواب الشّهداء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّالث :',
                  subtitle:
                      'من الشّهر سنة احدى عشرة توفّى فاطمة صلوات الله عليها فنبغي أن يقيم الشّيعة عزاءها ويزوروها ويلعنوا ظالميها وغاصبي حقّها والسّيد ابن طاوس في الاقبال قد ذكر وفاتها في هذا اليوم ثمّ ذكر لها هذه الزّيارة :\n\n'
                      'اَلسَّلامُ عَلَيْكِ يا سَيِّدَةَ نِسآءِ الْعالَمينَ اَلسَّلامُ عَلَيْكِ يا والِدَةَ الْحُجَجِ عَلَى النّاسِ اَجْمَعينَ. اَلسَّلامُ عَلَيْكِ اَيَّتُهَا الْمَظْلُومَةُ الْمَمْنُوعَةُ حَقَّها . ثمّ يقول : اَللّـهُمَّ صَلِّ عَلى اَمَتِكَ وَابْنَهِ نَبِيِّكَ وَزَوْجَهِ وَصِىِّ نَبِيِّكَ صَلاةً تُزْلِفُها فَوْقَ زُلْفى عِبادِكَ الْمُكَرَّمينَ مِنْ اَهْلِ السَّمواتِ وَاَهْلِ الاَْرَضينَ.\n\n'
                      'فقد روي انّ من زارها بهذه الزّيارة واستغفر الله غفر الله له وأدخله الجنّة.\n\n'
                      'أقول : قد أورد هذه الزّيارة نجل السّيد ابن طاوس أيضاً في كتاب زوائد الفوائد وقال انّها تخصّ يوم وفاتها (عليها السلام)وهو الّثالث من جمادى الاخرة وقال في كيفيّة الزّيارة بها تصلّى صلاة الزّيارة أو صلوتها (عليها السلام)وهي ركعتان تقرأ في كلّ منهما بعد الحمد سورة قُل هُوَ اللهُ اَحَدٌ ستّين مرّة فإن لم تقدر فاقرأ بعد الحمد في الاُولى قُل هُوَ اللهُ اَحَدٌ وفي الثّانية قُلْ يا اَيُّهَا الْكافِرونَ فاذا سلّمت فقل اَلسَّلامُ عَلَيْكِ الى آخر الزّيارة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم العشرون :',
                  subtitle:
                      'ولد فيه فاطمة الزّهراء سلام الله عليها بعد البعثة بخمس سنين أو سنتين ويناسب فيها عدّة أعمال :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '- الاوّل :',
                  subtitle: 'الصّيام.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '- الثّاني :',
                  subtitle: 'الخيرات والصّدقات على المؤمنين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '- الثّالث :',
                  subtitle:
                      'زيارة سيّدة نسآء الدّنيا والاخِرة وستأتي صفة زيارتها (عليها السلام) (ص317).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya
              .screenRoute,
          pushBack: FiShaherRabi3Al2awal.screenRoute,
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
