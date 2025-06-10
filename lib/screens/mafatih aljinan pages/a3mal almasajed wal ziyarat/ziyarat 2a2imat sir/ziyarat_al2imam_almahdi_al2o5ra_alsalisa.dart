import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_2a2imat_sir.dart';
import 'almakam_al2awal.dart';
import 'ziyarat_al2imam_almahdi_alsalat_3alaih.dart';

class ZiyaratAl2imamAlmahdiAl2o5raAlsalisa extends StatefulWidget {
  static String screenRoute = 'ziyarat_al2imam_almahdi_al2o5ra_alsalisa_screen';
  const ZiyaratAl2imamAlmahdiAl2o5raAlsalisa({super.key});

  @override
  State<ZiyaratAl2imamAlmahdiAl2o5raAlsalisa> createState() =>
      _ZiyaratAl2imamAlmahdiAl2o5raAlsalisaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratAl2imamAlmahdiAl2o5raAlsalisaState
    extends State<ZiyaratAl2imamAlmahdiAl2o5raAlsalisa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs
        .getBool('isFavorite_ziyarat_al2imam_almahdi_al2o5ra_alsalisa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_ziyarat_al2imam_almahdi_al2o5ra_alsalisa_screen', value);
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
                          'زيارة الإمام المهدي (عليه السلام) - الزيارة الأخرى',
                          ZiyaratAl2imamAlmahdiAl2o5raAlsalisa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة الإمام المهدي (عليه السلام) - الزيارة الأخرى',
                          ZiyaratAl2imamAlmahdiAl2o5raAlsalisa.screenRoute,
                          ZiyaratAl2imamAlmahdiAl2o5raAlsalisa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة الإمام المهدي (عليه السلام) - الزيارة الأخرى',
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
                      'زيارة الامام المهدي (عليه السلام) - الزيارة الأخرى زيارة الامام المهدي (عليه السلام) - الزيارة الأخرى\n\n'
                      'الرابع: قال السيد ابن طاووس فإذا أردت الانصراف من حرمه الشريف فعد إلى السرداب المنيف وصلّ فيه ما شئت ثم قم مستقبلاً القبلة وقل: [ اللّهُمَّ ادْفَعْ عَنْ وَلِيِّكَ… ]، وأورد الدعاء بتمامه. ثم قال: ثم ادع الله كَثِيراً وانصرف مسعوداً إن شاء الله تعالى.\n\n'
                      'أقول: هذا الدعاء قد رواه الشيخ في (المصباح) عن الرضا (عليه السلام) في خلال أعمال الجمعة ونحن أيضاً سنروي الدعاء طبقاً لرواية الشيخ قال: روى يونس بن عبد الرحمن عن الرضا (صلوات الله عليه) أنّه كان يأمر بالدعاء لصاحب الأمر (عليه السلام) بهذا الدعاء:\n\n'
                      '[ اللّهُمَّ ادْفَعْ عَنْ وَلِيِّكَ وَخَلِيفَتِكَ وَحُجَّتِكَ عَلى خَلْقِكَ وَلِسانِكَ المُعَبِّرِ عَنْكَ وَالنَّاطِقِ بِحِكْمَتِكَ وَعَيْنِكَ النَّاظِرَةِ بِإِذْنِكَ وَشاهِدِكَ عَلى عِبادِكَ الجَحْجاحِ المُجاهِدِ العائِذِ بِكَ العابِدِ عِنْدَكَ، وَأَعِذْهُ مِنْ شَرِّ جَمِيعِ ماخَلَقْتَ وَبَرَأْتَ وَأَنْشَأْتَ وَصَوَّرْتَ، وَاحْفَظْهُ مِنْ بَيْنِ يَدَيْهِ وَمِنْ خَلْفِهِ وَعَنْ يَمِينِهِ وَعَنْ شِمالِهِ وَمِنْ فَوْقِهِ وَمِنْ تَحْتِهِ بِحِفْظِكَ الَّذِي لايَضِيعُ مَنْ حَفِظْتَهُ بِهِ وَاحْفَظْ فِيهِ رَسُولَكَ وَآبأَهُ وَأَئِمَّتَكَ وَدَعائِمَ دِينِكَ، وَاجْعَلْهُ فِي وَدِيعَتِكَ الَّتِي لاتَضِيعُ وَفي جِوارِكَ الَّذِي لايُخْفَرُ وَفِي مَنْعِكَ وَعِزِّكَ الَّذِي لايُقْهَرُ وَآمِنْهُ بِأَمانِكَ الوَثِيقِ الَّذِي لايُخْذَلُ مَنْ آمَنْتَهُ بِهِ، وَاجْعَلْهُ فِي كَنَفِكَ الَّذِي لايُرامُ مَنْ كانَ فِيهِ وَانْصُرْهُ بِنَصْرِكَ العَزِيزِ وَأَيِّدْهُ بِجُنْدِكَ الغالِبِ وَقُوِّهِ بِقُوَّتِكَ وَارْدِفْهُ بِمَلائِكَتِكَ وَوالِ مَنْ والاهُ وَعادِ مَنْ عاداهُ وَأَلْبِسْهُ دِرْعَكَ الحَصِينَةَ وَحُفَّهُ بِالمَلائِكَةِ حَفّاً.\n\n'
                      'اللّهُمَّ اشْعَبْ بِهِ الصَّدْعَ وَارْتُقْ بِهِ الفَتْقَ وَأَمِتْ بِهِ الجَوْرَ وَأَظْهِرْ بِهِ العَدْلَ وَزَيِّنْ بِطُولِ بَقائِهِ الاَرْضَ، وَأَيِّدْهُ بِالنَّصْرِ وَانْصُرْهُ بِالرُّعْبُ وَقَوِّ ناصِرِيهِ وَاخْذُلْ خاذِلِيهِ وَدَمْدِمْ مَنْ نَصَبَ لَهُ وَدَمِّرْ مَنْ غَشَّهُ، وَاقْتُلْ بِهِ جَبابِرَةَ الكُفْرِ وَعُمُدَهُ وَدَعائِمَهُ وَاقْصِمْ بِهُ رُؤُوسَ الضَّلالَةِ وَشارِعَةَ البِدَعِ وَمُمِيتَةَ السُّنَّةِ وَمُقَوِّيَةَ الباطِلِ، وَذَلِّلْ بِهِ الجَبّارِينَ وَأَبِرْ بِهِ الكافِرِينَ وَجَمِيعَ المُلْحِدِينَ فِي مَشارِقِ الاَرْضِ وَمَغارِبِها وَبَرِّها وَبَحْرِها وَسَهْلِها وَجَبَلِها حَتّى لاتَدَعَ مِنْهُمْ دَيَّاراً وَلاتُبْقِي لَهُمْ آثاراً، اللّهُمَّ طَهِّرْ مِنْهُمْ بِلادَكَ وَاشْفِ مِنْهُمْ عِبادَكَ، وَأَعِزَّ بِهِ المُؤْمِنِينَ وَأَحْيِ بِهِ سُنَنَ المُرْسَلِينَ وَدارِسَ حُكْمِ النَّبِيِّينَ، وَجَدِّدْ بِهِ ماامْتَحى مِنْ دِينِكَ وَبُدِّلَ مِنْ حُكْمِكَ، حَتّى تُعِيدَ دِينَكَ بِهِ وَعَلى يَدَيْهِ جَدِيداً غَضّاً مَحْضاً صَحِيحاً لاعِوَجَ فِيهِ وَلابِدْعَةَ مَعَهُ، وَحَتّى تُنِيرَ بِعَدْلِهِ ظُلْمَ الجَوْرِ وَتُطْفِيَ بِهِ نِيرانَ الكُفْرِ '
                      'وَتُوَضِّحَ بِهِ مَعاقِدَ الحَقِّ وَمَجْهُولَ العَدْلِ ؛ فَإِنَّهُ عَبْدُكَ الَّذِي اسْتَخْلَصْتَهُ لِنَفْسِكَ وَاصْطَفَيْتَهُ عَلى غَيْبِكَ وَعَصَمْتَهُ مِنَ الذُّنُوبِ وَبَرَّأْتَهُ مِنَ العُيُوبِ وَطَهَّرْتَهُ مِنَ الرِّجْسِ وَسَلَّمْتَهُ مِنَ الدَّنَسِ، اللّهُمَّ فَإِنّا نَشْهَدُ لَهُ يَوْمَ القِيامَةِ وَيَوْمَ حُلُولِ الطَّامَّةِ أَنَّهُ لَمْ يُذْنِبْ ذَنْباً وَلا أَتى حَوْباً وَلَمْ يَرْتَكِبْ مَعْصِيَةً وَلَمْ يَضَيِّعْ لَكَ طاعَةً وَلَمْ يَهْتِكَ لَكَ حُرْمَةً وَلَمْ يُبَدِّلْ لَكَ فَرِيضَةً وَلَمْ يُغَيِّرْ لَكَ شَرِيعَةً، وَأَنَّهُ الهادِي المُهْتَدِي الطَّاهِرُ التَّقِيُّ النَّقِيُّ الرَّضِيُّ الزَّكِيُّ، اللّهُمَّ أعْطِهِ فِي نَفْسِهِ وَأَهْلِهِ وَوَلَدِهِ وَذرِّيَّتِهِ وَاُمَّتِهِ وَجَمِيعِ رَعِيَّتِهِ ماتُقِرُّ بِهِ عَيْنَهُ وَتَسُرُّ بِهِ نَفْسَهُ وَتَجْمَعُ لَهُ مُلْكَ المُمْلَكاتِ كُلِّها قَرِيبِها وَبَعِيدِها وَعَزِيزِها وَذَلِيلِها حَتّى تُجْرِيَ حُكْمَهُ عَلى كُلِّ حُكْمٍ وَيَغْلِبَ بِحَقِّهِ كُلَّ باطِلٍ، اللّهُمَّ اسْلُكْ بِنا عَلى يَدَيْهِ مِنْهاجَ الهُدى وَالمَحَجَّةَ العُظْمى وَالطَّرِيقَةَ الوُسْطى الَّتِي يَرْجِعُ إِلَيْها الغالِي وَيَلْحَقُ بِها التَّالِي، وَقَوِّنا عَلى طاعَتِهِ وَثَبِّتْنا عَلى '
                      'مُشايَعَتِهِ وَامْنُنْ عَلَيْنا بِمُتابَعَتِهِ وَاجْعَلنا فِي حِزْبِهِ القَوَّامِينَ بِأَمْرِهِ الصَّابِرِينَ مَعَهُ الطَّالِبِينَ رِضاكَ بِمُناصَحَتِهِ حَتّى تَحْشُرَنا يَوْمَ القِيامَةِ فِي أَنْصارِهِ وَأَعْوانِهِ وَمُقَوِّيَةِ سُلْطانِهِ، اللّهُمَّ وَاجْعَلْ ذلِكَ لَنا خالِصاً مِنْ كُلِّ شَكٍّ وَشُبْهَةٍ وَرِياءٍ وَسُمْعَةٍ حَتّى لانَعْتَمِدَ بِهِ غَيْرَكَ وَلانَطْلُبَ بِهِ إِلاّ وَجْهَكَ وَحَتّى تُحِلَّنا مَحَلَّهُ وَتَجْعَلَنا فِي الجَنَّةِ مَعَهُ، وَأَعِذْنا مِنْ السَّامةِ وَالكَسَلِ وَالفَتْرَةِ وَاجْعَلْنا مِمَّنْ تَنْتَصِرُ بِهِ لِدِينِكَ وَتُعِزُّ بِهِ نَصْرَ وَلِيِّكَ وَلاتَسْتَبْدِلْ بِنا غَيْرَنا فَإِنَّ اسْتِبْدالَكَ بِنا غَيْرَنا عَلَيْكَ يَسِيرٌ وَهُوَ عَلَيْنا كَثِيرٌ.\n\n'
                      'اللّهُمَّ صَلِّ عَلى وِلاةِ عَهْدِهِ الأَئِمَّةِ مِنْ بَعْدِهِ وَبَلِّغْهُمْ آمالَهُمْ وَزِدْ فِي آجالِهِمْ وَأَعِزَّ نَصْرَهُمْ وَتَمِّمْ لَهُمْ ماأَسْنَدْتَ إِلَيْهِمْ مِنْ أَمْرِكَ لَهُمْ وَثَبِّتْ دَعاِئَمُهْم، وَاجْعَلْنا لَهُمْ أَعْوانا وَعَلى دِينِكَ أَنْصاراً فَإِنَّهُمْ مَعادِنُ كَلِماتِكَ وَخُزَّانُ عِلْمِكَ وَأَرْكانُ تَوْحِيدِكَ وَدَعائِمُ دِينِكَ وَوُلاةُ أَمْرِكَ وَخالِصَتُكَ مِنْ عِبادِكَ وَصَفْوَتُكَ مِنْ خَلْقِكَ وَأَوْلِياؤُكَ وَسَلائِلُ أَوْلِيائِكَ وَصَفْوَةُ أَوْلادِ نَبِيِّكَ وَالسَّلامُ عَلَيْهِ وَعَلَيْهِمْ وَرَحْمَةُ الله وَبَرَكاتُهُ ].',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlmakamAl2awal.screenRoute,
          pushBack: ZiyaratAl2imamAlmahdiAlsalat3alaih.screenRoute,
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
