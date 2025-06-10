import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_2a2imat_sir.dart';
import 'almakam_alsani.dart';
import 'ziyarat_al2imam_almahdi_al2o5ra_alsaniya.dart';

class ZiyaratAl2imamAlmahdiAlmankoula extends StatefulWidget {
  static String screenRoute = 'ziyarat_al2imam_almahdi_almankoula_screen';
  const ZiyaratAl2imamAlmahdiAlmankoula({super.key});

  @override
  State<ZiyaratAl2imamAlmahdiAlmankoula> createState() =>
      _ZiyaratAl2imamAlmahdiAlmankoulaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratAl2imamAlmahdiAlmankoulaState
    extends State<ZiyaratAl2imamAlmahdiAlmankoula> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_al2imam_almahdi_almankoula_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_ziyarat_al2imam_almahdi_almankoula_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ziyarat2a2imatSir.screenRoute);
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
                          'زيارة الإمام المهدي (عليه السلام) - الزيارة الأخرى منقولة عن الكتب المعتبرة',
                          ZiyaratAl2imamAlmahdiAlmankoula.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة الإمام المهدي (عليه السلام) - الزيارة الأخرى منقولة عن الكتب المعتبرة',
                          ZiyaratAl2imamAlmahdiAlmankoula.screenRoute,
                          ZiyaratAl2imamAlmahdiAlmankoula.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة الإمام المهدي (عليه السلام) - الزيارة الأخرى منقولة عن الكتب المعتبرة',
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
                      '[ السَّلامُ عَلى الحَقِّ الجَدِيدِ وَالعالِمِ الَّذِي عِلْمُهُ لايَبِيدُ السَّلامُ عَلى مُحْيي المُؤْمِنِينَ وَمُبِيرِ الكافِرِينَ السَّلامُ عَلى مَهْدِيِّ الاُمَمِ وَجامِعِ الكَلِمِ السَّلامُ عَلى خَلَفِ السَّلَفِ وَصاحِبِ الشَّرَفِ، السَّلامُ عَلى حُجَّةِ المَعْبُودِ وَكَلِمَةِ المَحْمُودِ السَّلامُ عَلى مُعِزِّ الأوْلِياء وَمُذِلَّ الأعداء السَّلامُ عَلى وَارِثِ الأنْبِياءِ وَخاتَمِ الأوْصِياءِ، السَّلامُ عَلى القائِمِ المُنْتَظَرِ وَالعَدْلِ المُشْتَهَرِ السَّلامُ عَلى السَّيْفِ الشَّاهِرِ وَالقَمَرِ الزَّاهِرِ وَالنُّورِ الباهِرِ، السَّلامُ عَلى شَمْسِ الظَّلامِ وَبَدْرِ التَّمامِ السَّلامُ عَلى رَبِيعِ الأنامِ وَنَضْرَةِ الأيّامِ السَّلامُ عَلى صاحِبِ الصَّمْصامِ وَفَلا قِ الهامِ، السَّلامُ عَلى الدِّينِ المَأْثُورِ وَالكِتابِ المَسْطُورِ السَّلامُ عَلى بَقِيَّةِ الله فِي بِلادِهِ وَحُجَّتِهِ عَلى عِبادِهِ المُنْتَهى إِلَيْهِ مَوارِيثُ الأَنْبِياءِ وَلَدَيْهِ مَوْجُودٌ آثارُ الأصْفِياء، المُؤْتَمَنِ عَلى السِّرِّ وَالوَلِيِّ لِلاَمْرِ '
                      'السَّلامُ عَلى المَهْدِيِّ الَّذِي وَعَدَ الله عَزَّوَجَّل بِهِ الاُمَمَ أَنْ يَجْمَعَ بِهِ الكَلِمَ وَيَلُمَّ بِهِ الشَّعَثَ وَيَمْلأَ بِهِ الاَرْضَ قِسْطاً وَعَدْلاً وَيُمَكِّنَ لَهُ وَيُنْجِزَ بِهِ وَعْدَ المُؤْمِنِينَ. أَشْهَدُ يامَوْلايَ أَنَّكَ وَالأَئِمَّةِ مِنْ آبائِكَ أَئِمَّتِي وَمَوالِيَّ فِي الحَياةِ الدُّنْيا وَيَوْمَ يَقُومُ الاَشْهادُ، أَسْأَلُكَ يامَوْلايَ أَنْ تَسْأَلَ الله تَبارَكَ وَتَعالى فِي صَلاحِ شَأْنِي وَقَضاء حَوائِجِي وَغُْفرانِ ذُنُوبِي وَالاَخْذِ بِيَدِي فِي دِينِي وَدُنْيايَ وَآخِرَتِي لِي وَلاِخْوانِي وَأَخَواتِي المُؤْمِنِينَ وَالمُوْمِناتِ كافَّةً إِنَّهُ غَفُورٌ رَحِيمٌ ].ثم صلّ صلاة الزيارة بما قدمناه، أي اثنتي عشرة ركعة، تسلّم بعد كل ركعتين منها، وتسبح تسبيح الزهراء (عليها السلام)، واهدها إليه (عليه السلام) فإذا فرغت من صلاة الزيارة فقل:\n\n'
                      '[ اللّهُمَّ صَلِّ عَلى حُجَّتِكَ فِي أَرْضِكَ وَخَلِيفَتِكَ فِي بِلادِكَ الدَّاعِي إِلى سَبِيلِكَ وَالقائِمِ بِقِسْطِكَ وَالفائِزِ بِأَمْرِكَ وَلِيِّ المُؤْمِنِينَ وَمُبِيرِ الكافِرِينَ وَمُجَلِّي الظُّلْمَةِ وَمُنِيرِ الحَقِّ وَالصَّادِعِ بِالحِكْمَةِ وَالمَوْعِظَةِ الحَسَنَةِ وَالصِّدْقِ، وَكَلِمَتِكَ وَعَيْبَتِكَ وَعَيْنِكَ فِي أَرْضِكَ المُتَرَقِّبِ الخائِفِ الوَلِيِّ النَّاصِحِ سَفِينَةِ النَّجاةِ وَعَلَمِ الهُدى وَنُورِ أَبْصارِ الوَرى وَخَيْرِ مَنْ تَقَمَّصَ وَارْتَدى وَالوِتْرِ المَوْتُورِ وَمُفَرِّجِ الكَرْبِ وَمُزِيلِ الهَمِّ وَكاشِفِ البَلْوى، صَلَواتُ الله عَلَيْهِ وَعَلى آبائِهِ الأَئِمَّةِ الهادِينَ وَالقادَةِ المَيامِينَ ماطَلَعَتْ كَواكِبُ الأسحارِ وَأَوْرَقَتِ الاَشْجارِ وَأَيْنَعَتْ الاَثْمارِ وَأَخْتَلَفَ اللَيْلُ وَالنَّهارُ وَغَرَّدَتِ الاَطْيارُ، اللّهُمَّ انْفَعْنا بِحُبِّهِ وَاحْشُرْنا فِي زُمْرَتِهِ وَتَحْتَ لِوائِهِ إِلهَ الحَقِّ آمِينَ رَبَّ العالَمِينَ ].\n\n'
                      'الصلاة عليه (عليه السلام): [ اللّهمَّ صَلِّ عَلى مُحَمَّدٍ وأَهْلِ بَيْتِهِ وَصَلِّ عَلى وَلِيِّ الحَسَنِ وَوَصِيِّهِ وَوارِثِهِ القائِمِ بأَمْرِكَ وَالغائِبِ فِي خَلْقِكَ وَالمُنْتَظِرِ لاِذْنِكَ، اللّهُمَّ صَلِّ عَلَيْهِ وَقَرِّبْ بُعْدَهُ وَأَنْجِزْ وَعْدَهُ وَأَوْفِ عَهْدَهُ وَاكْشِفْ عَنْ بَأسِهِ حِجابَ الغَيْبَةِ وَأَظْهِرْ بِظُهُورِهِ صَحائِفَ المحْنَةِ، وَقَدِّمْ أَمامَهُ الرُّعْبَ وَثَبِّتْ بِهِ القَلْبَ وَأَقِمْ بِهِ الحَرْبَ وَأَيِّدْهُ بِجُنْدٍ مِنَ المَلائِكَةِ مُسَوِّمِينَ وَسَلِّطْهُ عَلى أَعْداء دِينِكَ أَجْمَعِينَ، وَأَلْهِمْهُ أَنْ لايَدَعَ مِنْهُمْ رُكْناً إِلاّ هَدَّهُ وَلا هَاماً إِلاّ قَدَّهُ وَلا كَيْداً إِلاّ رَدَّهُ وَلا فاسِقاً إِلاّ حَدَّهُ وَلا فِرْعَوْنَ إِلاّ أَهْلَكَهُ وَلا سِتْراً إِلاّ هَتَكَهُ وَلا عَلَماً إِلاّ نَكَّسَهُ وَلا سُلْطاناً إِلاّ كَسَبَهُ وَلا رُمْحاً إِلاّ قَصَفَهُ وَلا مِطْرَداً إِلاّ خَرَقَهُ وَلاجُنْداً إِلاّ فَرَّقَهُ وَلا مِنْبَراً إِلاّ أَحْرَقَهُ وَلا سَيْفاً إِلاّ كَسَرَهُ وَلا صَنَماً إِلاّ رَضَّهُ وَلادَماً إِلاّ أَراقَهُ وَلا جَوْراً إِلاّ أَبادَهُ وَلا حِصْناً إِلاّ هَدَمَهُ وَلا باباً إِلاّ رَدَمَهُ '
                      'َلا قَصْراً إِلاّ خَرَّبَهُ وَلا مَسْكَناً إِلاّ فَتَّشَهُ وَلا سَهْلاً إِلاّ أَوْطَأَهُ وَلا جَبَلاً إِلاّ صَعِدَهُ وَلا كَنْزاً إِلاّ أَخْرَجَهُ بِرَحْمَتِكَ ياأَرْحَمَ الرَّاحِمِينَ ].أقول: أورد المفيد الزيارة السالفة التي أولها: [ الله أَكْبَرُ الله أَكْبَرُ لا إِلهَ إِلاّ الله وَالله أَكْبَرُ…]. ثم قال: روي بطريق آخر تقول عند نزول السرداب: السَّلامُ عَلى الحَقِّ الجَدِيدِ، فأورد الزيارة إلى موضع صلاتها ثم قال: ثم تصلي صلاة الزيارة اثنتي عشرة ركعة كل ركعتين بتسليمة ثم تدعو بعدها بالدعاء المروي عنه (عليه السلام) وهو:\n\n'
                      '[ اللّهُمَّ عَظُمَ البَلاُء وَبَرِحَ الخَفاءُ وَانْكَشَفَ الغِطاءُ وَضاقَتِ الاَرْضُ وَمُنِعَتِ السَّماء وَإِلَيْكَ يارَبِّ المُشْتَكى وَعَلَيْكَ المُعَوَّلُ فِي الشِّدَّةِ وَالرَّخاءِ، اللّهُمَّ صَلِّ عَلى مُحَمَّدٍ وَآلِهِ الَّذِينَ فَرَضْتَ عَلَيْنا طاعَتَهُمْ فَعَرَّفْتَنا بِذلِكَ مَنْزِلَتَهُمْ، فَرِّجْ عَنَّا بِحَقِّهِمْ فَرَجاً عاجِلاً كَلَمْحِ البَصَرِ أَوْ هُوَ أَقْرَبُ مِنْ ذلِكَ يامُحَمَّدُ ياعَلِيُّ ياعَلِيُّ يامُحَمَّدُ انْصُرانِي فَإِنَّكُما ناصِرانَ وَاكْفِيانِي فَإِنَّكُما كافِيانَ، يامَوْلايَ ياصاحِبَ الزَّمانِ الغَوْثَ الغَوْثَ الغَوْثَ أَدْرِكْنِي أَدْرِكْنِي أَدْرِكْنِي ].\n\n'
                      'أقول: هذا دعاء شريف وينبغي أن يكرر الدّعاء به في ذلك الحرم الشريف وفي غيره من الاماكن. ونحن قد أثبتناه في الباب الأول باختلاف يسير.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiyaratAl2imamAlmahdiAl2o5raAlsaniya.screenRoute,
          pushBack: AlmakamAlsani.screenRoute,
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
