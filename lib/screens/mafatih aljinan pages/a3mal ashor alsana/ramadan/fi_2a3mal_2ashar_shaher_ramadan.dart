import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ramadan.dart';
import 'douaa_abi_7amza_alsamali.dart';
import 'douaa_al2iftita7.dart';

class Fi2a3mal2asharShaherRamadan extends StatefulWidget {
  static String screenRoute = 'fi_2a3mal_shaher_ramadan_screen';
  const Fi2a3mal2asharShaherRamadan({super.key});

  @override
  State<Fi2a3mal2asharShaherRamadan> createState() =>
      _Fi2a3mal2asharShaherRamadanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Fi2a3mal2asharShaherRamadanState
    extends State<Fi2a3mal2asharShaherRamadan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_2a3mal_shaher_ramadan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_2a3mal_shaher_ramadan_screen', value);
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
                      .addFavorite('في أعمال أسحار شهر رمضان',
                          Fi2a3mal2asharShaherRamadan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في أعمال أسحار شهر رمضان',
                          Fi2a3mal2asharShaherRamadan.screenRoute,
                          Fi2a3mal2asharShaherRamadan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في أعمال أسحار شهر رمضان',
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
                  title: 'وهي عديدة : الاوّل :',
                  subtitle:
                      'أن يتسحّر فلا يدع السّحُور ولو على حشفة تمر أو جرعة من الماء، وأفضل السّحور السّويق والتّمر وفي الحديث انّ الله وملائكته يصلّون على المستغفرين والمستسحرين بالاسحار.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle:
                      'أن يقرأ عند السّحور سورة انّا أنزلناه، ففي الحديث ما من مؤمن صام فقرأ «انّا أنْزَلناهُ في ليلة القدر» عند سحوره وعند افطاره الّا كان فيما بينهما كالمتشحّط بدمه في سبيل الله.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle:
                      'أن يدعو بهذا الدّعاء العظيم الشّأن الذي روي عن الرّضا صلوات الله وسلامه عليه انّه قال : هو دعاء الباقر (عليه السلام) في أسحار شهر رمضان :\n\n'
                      'اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ بَهائِكَ بِاَبْهاهُ وَكُلُّ بَهائِكَ بَهِىٌّ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِبَهائِكَ كُلِّهِ، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ جَمالِكَ بِاَجْمَلِهِ وَكُلُّ جَمالِكَ جَميلٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِجَمالِكَ كُلِّهِ، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ جَلالِكَ بِاَجَلِّهِ وَكُلُّ جَلالِكَ جَليلٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِجَلالِكَ كُلِّهِ، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ عَظَمَتِكَ بِاَعْظَمِها وَكُلُّ عَظَمَتِكَ عَظَيمَةٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِعَظَمَتِكَ كُلِّها، اَللّـهُمَّ اِنّي اَسَأَلُكَ مِنْ نُورِكَ بِاَنْوَرِهِ وَكُلُّ نُورِكَ نَيِّرٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِنُورِكَ كُلِّهِ، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ رَحْمَتِكَ بِاَوْسَعِها وَكُلُّ رَحْمَتِكَ واسِعَةٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِرَحْمَتِكَ كُلِّها، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ كَلِماتِكَ بِاَتَمِّها وَكُلُّ كَلِماتِكَ تامَّةٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِكَلِماتِكَ كُلِّهَا، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ كَمالِكَ بِاَكْمَلِهِ وَكُلُّ كَمالِكَ كامِلٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِكَمالِكَ كُلِّهِ، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ اَسمائِكَ بِاَكْبَرِها وَكُلُّ اَسْمائِكَ كَبيرَةٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِاَسْمائِكَ كُلِّها، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ عِزَّتِكَ باَعَزِّها وَكُلُّ عِزَّتِكَ عَزيزَةٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِعِزَّتِكَ كُلِّها، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ مَشِيَّتِكَ بِاَمْضاها وَكُلُّ مَشِيَّتِكَ ماضِيَةٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِمَشِيَّتِكَ كُلِّها، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ قُدْرَتِكَ بِالْقُدْرَةِ الَّتي اسْتَطَلْتَ بِها عَلى كُلِّ شَيْء وَكُلُّ قُدْرَتِكَ مُسْتَطيلَةٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِقُدْرَتِكَ كُلِّها، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ عِلْمِكَ بِاَنْفَذِهِ وَكُلُّ عِلْمِكَ نافِذٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِعِلْمِكَ كُلِّهِ، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ قَوْلِكَ بِاَرْضاهُ وَكُلُّ قَوْلِكَ رَضِيٌّ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِقَوْلِكَ كُلِّهِ، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ مَسائِلِكَ بِاَحَبِّها اِلَيْكَ وَكُلُّ مَسائِلِكَ اِلَيْكَ حَبيبَةٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِمَسائِلِكَ كُلِّها، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ شَرَفِكَ بِاَشْرَفِهِ وَكُلُّ شَرَفِكَ شَريفٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِشَرَفِكَ كُلِّهِ، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ سُلْطانِكَ بِاَدْوَمِهِ وَكُلُّ سُلطانِكَ دائِمٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِسُلْطانِكَ كُلِّهِ، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ مُلْكِكَ بِاَفْخَرِهِ وَكُلُّ مُلْكِكَ فاخِرٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِمُلْكِكَ كُلِّهِ، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ عُلُوِّكَ بِاَعْلاهُ وَكُلُّ عُلُوِّكَ عال، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِعُلُوِّكَ كُلِّهِ، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ مَنِّكَ بِاَقْدَمِهِ وَكُلُّ مَنِّكَ قَديمٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِمَنِّكَ كُلِّهِ، اَللّـهُمَّ اِنّي اَسْاَلُكَ مِنْ اياتِكَ بِاَكْرَمِها وَكُلُّ آياتِكَ كَريمَةٌ، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِآياتِكَ كُلِّها، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِما اَنْتَ فيهِ مِنَ الشَّأنِ وَالْجَبَرُوتِ، وَاَسْاَلُكَ بِكُلِّ شَأْن وَحْدَهُ جَبَرُوت وَحْدَها، اَللّـهُمَّ اِنّي اَسْاَلُكَ بِما تُجيبُني بِهِ حينَ اَسْاَلُكَ فَاَجِبْني يا اَللهُ.\n\n'
                      'ثمّ سل حاجتك فانّها تقضى البتّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: DouaaAbi7amzaAlsamali.screenRoute,
        pushBack: DouaaAl2iftita7.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في اعمال اسحار شهر رمضان.mp3',
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
