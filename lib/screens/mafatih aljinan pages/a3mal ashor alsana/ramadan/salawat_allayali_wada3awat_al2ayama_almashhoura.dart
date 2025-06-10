import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ramadan.dart';
import 'allayla_al2oula_ramadan.dart';
import 'fi_2a3mal_shaher_ramadan_al5asa.dart';

class SalawatAllayaliWada3awatAl2ayamaAlmashhoura extends StatefulWidget {
  static String screenRoute = 'salawat_allayali_walda3awat_almashhoura_screen';
  const SalawatAllayaliWada3awatAl2ayamaAlmashhoura({super.key});

  @override
  State<SalawatAllayaliWada3awatAl2ayamaAlmashhoura> createState() =>
      _SalawatAllayaliWada3awatAl2ayamaAlmashhouraState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalawatAllayaliWada3awatAl2ayamaAlmashhouraState
    extends State<SalawatAllayaliWada3awatAl2ayamaAlmashhoura> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs
        .getBool('isFavorite_salawat_allayali_walda3awat_almashhoura_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_salawat_allayali_walda3awat_almashhoura_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ramadan.screenRoute);
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
                          'صلوات الليالي ودعوات الأيام المشهورة',
                          SalawatAllayaliWada3awatAl2ayamaAlmashhoura
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلوات الليالي ودعوات الأيام المشهورة',
                          SalawatAllayaliWada3awatAl2ayamaAlmashhoura
                              .screenRoute,
                          SalawatAllayaliWada3awatAl2ayamaAlmashhoura
                              .screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلوات الليالي ودعوات الأيام المشهورة',
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
                      'وقد ذكرها العلاّمة المجلسي (رحمه الله) في كتاب زاد المعاد في الفصل الاخير من أعمال شهر رمضان، وانّني اقتصر هُنا على ما ذكر هُناك ، قال :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الاُولى :',
                  subtitle:
                      'اربع ركعات في كلّ ركعة بعد الحمد التّوحيد خمس عشرة مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الثانية :',
                  subtitle:
                      'أربع ركعات في كلّ ركعة بعد الحمد عشرون مرّة انّا اَنْزَلناهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الثالثة :',
                  subtitle: 'عشر ركعات في كلّ ركعة الحمد والتّوحيد خمسون مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الرابعة :',
                  subtitle:
                      ' ثمان ركعات في كلّ ركعة الحمد وانّا اَنْزَلناهُ عشرون مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الخامسة :',
                  subtitle:
                      'ركعتان في كلّ منهما الحمد والتّوحيد خمسون مرّة ويقول بعد الفراغ مائة مرّة اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة السادسة :',
                  subtitle:
                      'أربع ركعات في كلّ منها الحمد وسورة تَبارَكَ الّذي بِيَدِهِ المُلْكُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة السابعة :',
                  subtitle:
                      'أربع ركعات في كلّ منها الحمد وثلاث عشرة مرّة انّا اَنْزَلناهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الثامنة :',
                  subtitle:
                      'ركعتان في كلّ منهما الحمد والتّوحيد عشر مرّات ويقول بعد السّلام ألف مرّة سُبْحانَ اللهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة التاسعة :',
                  subtitle:
                      'ستّ ركعات بين المغرب والعشاء في كلّ منها الحمد وآية الكرسي سبع مرّات ويقول بعد الفراغ خمسين مرّة اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة العاشرة :',
                  subtitle:
                      'عشرون ركعة في كلّ ركعة الحمد والتّوحيد ثلاثون مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الحادية عشرة :',
                  subtitle:
                      'ركعتان في كلّ منهما الحمد وعشرون مرّة اِنّا اَعْطَيْناكَ الْكَوثَرَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الثانية عشرة :',
                  subtitle:
                      'ثمان ركعات في كلّ منها الحمد وثلاثون مرّة انّا اَنْزَلناهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الثالثة عشرة :',
                  subtitle:
                      'أربع ركعات في كلّ منها الحمد والتّوحيد خمساً وعشرون مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الرابعة عشرة :',
                  subtitle:
                      'ستّ ركعات في كلّ ركعة الحمد وثلاثون مرّة سورة اِذا زُلزِلَت.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الخامسة عشرة :',
                  subtitle:
                      'أربع ركعات في الاوّليين يقرأ بعد الحمد التّوحيد مائة مرّة، وفي الاخريين يقرؤها خمسون مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة السادسة عشرة :',
                  subtitle:
                      'اثنتا عشرة ركعة في كلّ ركعة الحمد واثنتا عشرة مرّة سورة اَلْهيكُمُ التَّكاثُرُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة السابعة عشرة :',
                  subtitle:
                      'ركعتان في الاولى يقرأ بعد الحمد ما شاء من السّور وفي الثّانية يقرأ بعدها التّوحيد مائة مرّة. ويقول بعد السّلام مائة مرّة لا اِلـهَ إلاّ اللهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الثامنة عشرة :',
                  subtitle:
                      'أربع ركعات في كلّ ركعة الحمد وخمس وعشرون مرّة سورة اِنّا اَعْطَيْناكَ الْكَوثَرَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة التاسعة عشرة :',
                  subtitle:
                      'خمسون ركعة بالحمد وخمسين مرّة سورة اِذا زُلْزِلَت والظاهر انّ المراد أن تقرأ السّورة في كلّ ركعة مرّة واحدة فانّ من الصّعب أن يقرأ سورة اذا زلزلت في ليلة واحدة الفين وخمسمائة مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title:
                      'صلاة اللّيلة العشرين والحادية والعشرين والثّانية والعشرين والثّالثة والعشرين والرّابعة والعشرين :',
                  subtitle:
                      'في كلّ من هذه اللّيالي يصلّي ثمان ركعات بما تيسّر من السّور.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الخامسة والعشرين :',
                  subtitle: 'ثمان ركعات في كلّ منها الحمد والتّوحيد عشر مرّات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة السادسة والعشرين :',
                  subtitle: 'ثمان ركعات في كلّ منها الحمد والتّوحيد مائة مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة السابعة والعشرين :',
                  subtitle:
                      'أربع ركعات في كلّ منها الحمد وسورة تَبارَكَ الّذي بِيَدِهِ المُلْكُ فان لم يتمكّن قرأ التّوحيد خمساً وعشرين مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الثامنة والعشرين :',
                  subtitle:
                      'ستّ ركعات في كلّ منها الحمد وآية الكرسي مائة مرّة، والتّوحيد مائة مرّة، وسورة الكوثر مائة مرّة، وبعد الصّلاة يصلّي على النّبي وآله مائة مرّة.\n\n'
                      'أقول : صلاة اللّيلة الثّامنة والعشرين على ما وجدتها في الاحاديث ستّ ركعات بفاتحة الكتاب وآية الكرسي عشر مرّات والكوثر عشراً وقُلْ هُوَ اللهُ اَحَدٌ عشراً ويُصلّي على النّبي وآله مائة مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة التاسعة والعشرين :',
                  subtitle: 'ركعتان في كلّ منهما الحمد والتّوحيد عشرون مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'صلاة اللّيلة الثلاثين :',
                  subtitle:
                      'اثنتا عشرة ركعة في كلّ ركعة الحمد والتّوحيد عشرون مرّة ويصلّي بعد الفراغ على محمّد وآل محمّد مائة مرّة وهذه الصّلوات كلّها يفصل بين كلّ ركعتين منها بالسّلام كما ذكر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AllaylaAl2oulaRamadan.screenRoute,
        pushBack: Fi2a3malShaherRamadanAl5asa.screenRoute,
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
