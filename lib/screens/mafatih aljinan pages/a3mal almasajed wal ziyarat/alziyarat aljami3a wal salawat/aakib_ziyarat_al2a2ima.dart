import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../alziyarat_aljami3a_walsalawat.dart';
import 'alsalat_3ala_alnabi.dart';
import 'ma_yozar_kol_2imam.dart';

class AakibZiyaratAl2a2ima extends StatefulWidget {
  static String screenRoute = 'aakib_ziyarat_al2a2ima_screen';
  const AakibZiyaratAl2a2ima({super.key});

  @override
  State<AakibZiyaratAl2a2ima> createState() => _AakibZiyaratAl2a2imaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AakibZiyaratAl2a2imaState extends State<AakibZiyaratAl2a2ima> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_aakib_ziyarat_al2a2ima_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_aakib_ziyarat_al2a2ima_screen', value);
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
          .pushReplacementNamed(AlziyaratAljami3aWalsalawat.screenRoute);
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
                          'فيما يدعى به عقيب زيارات الأئمة (عليهم السلام)',
                          AakibZiyaratAl2a2ima.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'فيما يدعى به عقيب زيارات الأئمة (عليهم السلام)',
                          AakibZiyaratAl2a2ima.screenRoute,
                          AakibZiyaratAl2a2ima.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'فيما يدعى به عقيب زيارات الأئمة (عليهم السلام)',
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
                      'قال السيد ابن طاووس : يستحبّ أن يدعى بهذا الدّعاء عقيب زيارات الائمة (عليهم السلام) :\n\n'
                      'اَللّـهُمَّ اِنْ كانَتْ ذُنوُبى قَدْ اَخْلَقَتْ وَجْهى عِنْدَكَ وَحَجَبَتْ دُعائى عَنْكَ وَحالَتْ بَيْنى وَبَيْنَكَ، فَاَسْاَلُكَ اَنْ تُقْبِلَ عَلَىَّ بِوَجْهِكَ الْكَريمِ وَتَنْشُرَ عَلَىَّ رَحْمَتَكَ وَتُنَزِّلَ عَلىَّ بَرَكاتِكَ، وَاِنْ كانَتْ قَدْ مَنَعَتْ اَنْ تَرْفَعَ لى اِلَيْكَ صَوتاً اَوْ تَغْفِرَ لى ذَنْباً اَوْ تَتَجاوَزَ عَنْ خَطيئَة مُهْلِكَة فَها اَنَاذا مُسْتَجيرٌ بِكَرَمِ وَجْهِكَ وَعِزِّ جَلالِكَ، مُتَوَسِّلٌ اِلَيْكَ مُتَقَرِّبٌ اِلَيْكَ بِاَحَبِّ خَلْقِكَ اِلَيْكَ وَاَكْرَمِهِمْ عَلَيْكَ وَاَوْلاهُمْ بِكَ، وَاَطْوَعِهِمْ لَكَ، وَاَعْظَمِهِمْ مَنْزِلَةً وَمَكاناً عِنْدَكَ مُحَمَّد، وَبِعِتْرَتِهِ الطّاهِرينَ الاَْئِمَّةِ الْهُداةِ الْمَهْدِيّينَ، الَّذينَ فَرَضْتَ عَلى خَلْقِكَ طاعَتَهُمْ وَاَمَرْتَ بِمَوَدَّتِهِمْ، وَجَعَلْتَهُمْ وُلاةَ الاَْمْرِ مِنْ بَعْدِ رَسُولِكَ صَلَّى اللهُ عَلَيْهِ وَآلِهِ، يا مُذِلَّ كُلِّ جَبّار عَنيد، وَيا مُعِزَّ الْمُؤْمِنينَ بَلَغَ مَجْهُودى فَهَبْ لى نَفْسِىَ السّاعَةَ وَرَحْمَةً مِنْكَ تَمُنُّ بِها عَلَىَّ يا اَرْحَمَ الرّاحِمينَ.\n\n'
                      'ثمّ قبّل الضّريح وضع خدّيك عليه وقُل :\n\n'
                      'اَللّـهُمَّ اِنَّ هذا مَشْهَدٌ لا يَرْجُو مَنْ فاتَتْهُ فيهِ رَحْمَتُكَ اَنْ يَنالَها فى غَيْرِهِ، وَلا اَحَدٌ اَشْقى مِنْ امْرِئ قَصَدَهُ مُؤَمِّلاً فَآبَ عَنْهُ خائِباً، اَللّـهُمَّ اِنّى اَعوُذُ بِكَ مِنْ شَرِّ الاِْيابِ وَخَيْبَةِ الْمُنْقَلَبِ وَالْمُناقَشَةِ عِنْدَ الْحِسابِ، وَحاشاكَ يا رَبِّ اَنْ تَقْرِنَ طاعَةَ وَلِيِّكَ بِطاعَتِكَ وَمُوالاتَهُ بِمُوالاتِكَ وَمَعْصِيَتَهُ بِمَعْصِيَتِكَ ثُمَّ تُؤْيِسْ زآئِرَهُ وَالْمُتَحَمِّلَ مِنْ بُعْدِ الْبِلادِ اِلى قَبْرِهِ، وَعِزَّتِكَ يا رَبِّ لا يَنْعَقِدُ عَلى ذلِكَ ضَميرى، اِذْ كانَتِ الْقُلُوبُ اِلَيْكَ بِالْجَميلِ تُشيرُ.\n\n'
                      'ثمّ صلّ للزّيارة ، فاذا شئت أن تودع وتنصرف فقُل : اَلسَّلامُ عَلَيْكُمْ يا اَهْلَ بَيْتِ النُّبُوَّةِ وَمَعْدِنَ الرِّسالَةِ سَلامَ مُوَدِّع لا سَئم وَلا قال وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.\n\n'
                      'والشّيخ المفيد (رحمه الله) ايضاً قد ذكر هذا الدّعاء ولكنّه بعد كلمة (وبالجميل تشير) ، قال : ثمّ قل :\n\n'
                      'يا وَلِىَّ اللهِ اِنَّ بَيْنى وَبَيْنَ اللهِ عَزَوَجَلَّ ذُنوُباً لا يَأتى عَلَيْها اِلاّ رِضاكَ، فَبِحَقِّ مَنِ ائْتَمَنَكَ عَلى سِرِّهِ، وَاسْتَرْعاكَ اَمْرَ خَلْقِهِ، وَقَرَنَ طاعَتَكَ بِطاعَتِهِ، وَمُوالاتَكَ بِمُوالاتِهِ، تَوَلَّ صَلاحَ حالى مَعَ اللهِ عَزَّوَجَلَّ، وَاجْعَلْ حَظّى مِنْ زِيارَتِكَ تَخْليطى بِخالِصى زُوّارِكَ الَّذينَ تَسْأَلُ اللهَ عَزَّوَجَلَّ فى عِتْقِ رِقابِهِمْ، وَتَرْغَبُ اِلَيْهِ فى حُسْنِ ثَوابِهِمْ، وَها اَنَا الْيَوْمَ بِقَبْرِكَ لائِذٌ، وَبِحُسْنِ دِفاعِكَ عَنّى عائِذٌ، فَتَلافَنى يا مَوْلاىَ وَاَدْرِكْنى وَاَسْأَلِ اللهَ عَزَّوَجَلَّ فى اَمْرى، فَاِنَّ لَكَ عِنْدَاللهِ مَقاماً كَريماً وَجاهاً عَظيماً صَلَّى اللهُ عَلَيْكَ وَسَلَّمَ تَسْليماً.\n\n'
                      'أقول : الافضل للزّائر اذا أراد أن يدعو في مشهد من المشاهد الشّريفة بل الافضل للدّاعي أينما كان وأيّا ما كانت حاجته ، أن يبدأ بالدّعاء لصحّة حجّة العصر وصاحب الامر (عليه السلام) وهذا أمر هامّ ذا فوائد هامّة لا يناسب المقام شرحها والشّيخ (رحمه الله) قد بسط الكلام في ذلك في الباب العاشر من كتاب النّجم الثّاقب وذكر أدعية تخصّ المقام فليراجعه من شاء، وأخصر تلك الدّعوات هو ما مرّ في أعمال اللّيلة الثّالثة والعشرين من شهر رمضان في خلال أدعية العشر الاواخر ونحن قد أوردنا في خلال آداب زيارة الحسين (عليه السلام) دعاء يدعى به في كافّة المشاهد الشّريفة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Alsalat3alaAlnabi.screenRoute,
          pushBack: MaYozarKol2imam.screenRoute,
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
