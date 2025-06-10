import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'fi_ad3iya_ma2soura_lilrizk.dart';
import 'fi_zikr_3idat_da3awat_yod3a_bha_2iza_5araj_l2insan_men_manzlhi.dart';

class FiDa3awatMa2souraKablSalatWfiAdbariha extends StatefulWidget {
  static String screenRoute =
      'fi_da3awat_ma2soura_kabl_salat_wfi_adbariha_screen';
  const FiDa3awatMa2souraKablSalatWfiAdbariha({super.key});

  @override
  State<FiDa3awatMa2souraKablSalatWfiAdbariha> createState() =>
      _FiDa3awatMa2souraKablSalatWfiAdbarihaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiDa3awatMa2souraKablSalatWfiAdbarihaState
    extends State<FiDa3awatMa2souraKablSalatWfiAdbariha> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_da3awat_ma2soura_kabl_salat_wfi_adbariha_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_da3awat_ma2soura_kabl_salat_wfi_adbariha_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(
          Al2ad3iyaWal3awzatLil2alamWal2askam.screenRoute);
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
                          'في دعوات مأثورة قبل الصلاة وفي أدبارها',
                          FiDa3awatMa2souraKablSalatWfiAdbariha.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في دعوات مأثورة قبل الصلاة وفي أدبارها',
                          FiDa3awatMa2souraKablSalatWfiAdbariha.screenRoute,
                          FiDa3awatMa2souraKablSalatWfiAdbariha.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في دعوات مأثورة قبل الصلاة وفي أدبارها',
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
                  title: 'وهي خمسة أدعية :\n'
                      'الأول :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : كان أمير المؤمنين (عليه السلام) يقول : من قال هذا القول كان مع محمد واَّل محمد (صلّى الله عليه وآله وسلم) يقول إذا قام قبل أن تفتح الصلاة : اللّهُمَّ إِنِّي أتَوجَّهُ إلَيكَ بمُحَمَّدٍ وَآلِ مُحَمَّدٍ وأقَدِّمُهُمْ بَيْنَ يَدَي صَلَواتي وَأتَقَرَّبُ بِهِمْ إلَيْكَ، فَاجْعَلْني بِهِمْ وَجيها في الدُّنْيا والاخِرَةِ وَمِنْ المُقَرَّبينَ، مَنَنْتَ عَلي بِمَعْرِفَتِهِمْ فَاخْتِمْ لي بِطاعَتِهِمْ وَمَعْرِفَتِهِمْ وَوِلايَتِهُمْ فِإنَّها السَّعادَةُ، وإخْتِمْ لي بِها فَإنَّكَ عَلى كُلِّ شَيٍ قَديرٌ. ثم تصلّي، فإذا انصرفت قلت: اللّهُمَّ اجْعَلْني مَعَ مُحَمَّدٍ وَآلِ مُحَمَّدٍ في كُلِّ عافيةٍ وَبَلاٍ، وَاجْعَلْني مَعَ مُحَمَّدٍ وَآلِ مُحَمَّدٍ في كُلِّ مَثْوىً وَمُنْقَلَبٍ. اللّهُمَّ اجْعَلْ مَحْياي مَحْياُهْم وَمَماتي مَماتَهُمْ، وَاحْعَلْني مَعَهُمْ في المَواطِنِ كُلِّها وَلاتُفَرِّقْ بَيْني وَبَيْنَهُمْ إنَّكَ عَلى كُلِّ شَيٍ قَديرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'عن صفوان الجمّال، قال : شهدت الصادق (عليه السلام) استقبل القبلة قبل التكبير وقال : اللّهُمَّ لاتؤيسْني مِنْ رَوحِكَ وَلاتُقْنِطْني مِنْ رَحْمَتِكَ وَلاتؤمِنّي مَكْرَكَ فَإنَّهُ لايَأمَنُ مَكْرَ الله إِلاّ القَوْمُ الخاسِرونَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : كان أمير المؤمنين (عليه السلام) يقول إذا فرغ من الزوال : اللّهُمَّ إِنِّي أتَقَرَّبُ إلَيْكَ بِجودِكَ وَكَرَمِكَ، وَأتَقَرَّبُ إلَيْكَ بِمُحَمَّدٍ عَبْدِكَ وَرَسُولِكَ، وأتَقَرَّبُ إلَيْكَ بِمَلائِكَتِكَ المُقَرَّبينَ وَأنْبيائِكَ المُرْسَلينَ وَبِكَ، اللّهُمَّ أنْتَ الغَنيّ عَنّي وَبي الفاقَةُ إلَيْكَ أنْتَ الغَنيّ وَأنا الفَقيرُ إلَيْكَ، أقَلْتَني عَثْرَتي وَسَتَرْتَ عَليَّ ذُنوبي فَاقْضِ اليَوْمَ حاجَتي، وَلاتُعَذِّبْني بِقَبيحِ ما تَعْلَمُ مِنّي، بَلْ عَفْوُكَ وَجودُكَ يَسَعُني،\n\n'
                      'ثم يخر ساجد ويقول : ياأهْلَ التَقْوى وَياأهْلَ المَغْفِرَهَ يابَرُّ يارَحيمُ، أنْتَ أبَرُّ مِنْ أبي وأُمي وَمِنْ جَميعِ الخَلائِقِ، اقْلِبْني بِقَضاء حاجَتي مُجابا دُعائي مَرْحوما صَوتي قَدْ كَشَفْتَ أنْواعَ البَلاءِ عَنّي.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'عن محمد التقي (عليه السلام) قال: إذا انصرفت من صلاة مكتوبة فقل: رَضيتُ بِالله رَبّا وَبِمُحَمَّدٍ نَبيا وَبِالاسْلامِ دِينا وَبِالقُرآنِ كِتابا وَبِفُلانٍ وَفُلانٍ اللّهُمَّ وَلِيُّكَ فُلان (وقل عوض فلان القائم الحجة) فَاحْفِظْهُ مِنْ بَيْنِ يَدَيهِ وَمِنْ خَلْفِهِ وَعَنْ شِمالِهِ وَمِنْ فَوقِهِ وَمِنْ تَحْتِهِ وَامْدُدْ لَهُ في عُمُرِهِ، وَاجْعَلْهُ القائِمَ بِأمْرِكَ وَالمُنْتَصِرَ لِدينِكَ، وَأرِهِ ما يُحِبُّ وَما تَقَرُّ بِهِ عَيْنُهُ، في نَفْسِهِ وَذُرِّيَتِهِ وَفي أهْلِهِ وَمالِهِ وَفي شيعَتِهِ وَفي عَدوِّهِ، وَأرِهُمْ مِنْهُ مايَحْذَرونَ، وَأرِهُ فيهِمْ مايَحِبُّ وتَقَرُّ بِهِ عَيْنُهُ، وَاشْفِ صُدورَ قَوْمٍ مؤمِنينَ. وقال: وكان النبي (صلّى الله عليه وآله وسلم) يقول إذا فرغ من الصلاة: اللّهُمَّ اغْفِرْ لي ماقَدَّمْتُ وَما أخَّرْتُ وَما أسْرَرْتُ وَما أعْلَنْتُ وَاسْرافي عَلى نَفْسي وَما أنْتَ أعْلَمُ بِهِ مِنّي، اللّهُمَّ أنْتَ المُقَدِّمُ وَالمؤخِّرُ، لا إلهَ إِلاّ أنْتَ، بِعِلْمِكَ الغَيْبَ وَبِقُدْرَتِكَ عَلى الخَلْقِ أجْمَعينَ، ماعَلِمْتَ الحَياةُ خَيْراً لي فَأحْيني وَتَوَفَّني إذا عَلِمْتَ الوفاة خَيْراً لي اللّهُمَّ إِنِّي أَسْأَلُكَ خَشْيَتُكَ في السِرِّ وَالعَلانيَة وَكَلِمَةَ الحَقِّ في الغَضَبِ وَالرِّضا وَالقَصْدَ في الفَقْرِ وَالغِنى، وَأَسْأَلُكَ نَعيما لايَنْفَدُ وَقُرَّةَ عَيْنٍ لاتَنْقَطِعُ، وَأَسْأَلُكَ الرِّضا بِالقَضاء وَبَرَكَةَ المَوتِ بَعْدَ العَيْشِ وَبَرْدَ العيَشِ بَعْدَ المَوتِ وَلَذَّةَ المَنْظَرِ إِلى وَجْهِكَ وَشَوْقا إِلى رؤيَتِكَ وَلِقائِكَ مِنْ غَيْرِ ضَراءٍ مُضِرَّةٍ وَلافِتْنَةٍ مُضِلَّةٍ، اللّهُمَّ زَينّا بِزينَةِ الايمانِ وَاجْعَلْنا هُداةً مَهْتَدِينَ، اللّهُمَّ اهْدِنا فيمَن هَدَيْتَ، اللّهُمَّ إِنِّي أَسْأَلُكَ عَزيمَةَ الرَّشادِ وَالثَّباتِ في الامْرِ وَالرُّشْدِ، وَأَسْأَلُكَ شُكْرَ نِعْمَتِكَ وَحُسْنِ عافيَتِكَ وَأَداءِ حَقِّكَ، وَأَسْأَلُكَ يارَبِّ قَلْبا سَلِيماً وَلِسانا صادِقا، وَأسْتَغْفُرِكَ لِما تَعْلَمُ، وَأسْألُكَ خَيْرَ ماتَعْلَمُ، وَأعوذُ بِكَ مِنْ شَرِّ ماتَعَلمُ فَإنَّكَ تَعْلَمُ وَلانَعْلَمُ وأنْتَ عَلاّمُ الغُيوبِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال من قال هذه الكلمات عند كل صلاة مكتوبة، حفظ في نفسه وداره وماله وولده :\n\n'
                      'أُجيرُ نَفْسي وَمالي وَوَلَدِي وَأهْلي وَداري وَكُلَّ ما هوَ مِنّي بِالله الواحِدِ الاحَدِ الصَّمَدِ الَّذي لَمْ يَلِدْ وَلَمْ يولَدْ وَلَمْ يَكُنْ لَهُ كُفْوا أحَد، وَأجيرُ نَفْسي وَمالي وَوَلَدي وَكُلَّ ما هوَ مِنّي بِرَبِّ الفَلَقِ مِن شَرِّ ما خَلَقَ… إلى اَّخر السورة، وَأجيرُ نَفْسي وَمالي وَوَلَدي وَكُلَّ ما هوَ مِنّي بِرَبِّ النّاسِ مَلِكِ النّاسِ… إلى اَّخر السورة، وَأجيرُ نَفْسي وَمالي وَوَلَدِي وَكُلَّ ما هوَ مِنّي بِالله لا إلهَ إِلاّ هوَ الحَي القَيّومُ لاتَأخُذَهُ سِنَةٌ وَلانَوْمٌ… إلى آخر آية الكرسي.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiAd3iyaMa2souraLilrizk.screenRoute,
          pushBack:
              FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi.screenRoute,
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
