import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iya_mashhoura.dart';
import 'douaa_aljawshan_alkabir.dart';
import 'douaa_almojir.dart';

class DouaaAl3adila extends StatefulWidget {
  static String screenRoute = 'douaa_al3adila_screen';
  const DouaaAl3adila({super.key});

  @override
  State<DouaaAl3adila> createState() => _DouaaAl3adilaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _DouaaAl3adilaState extends State<DouaaAl3adila> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_al3adila_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_al3adila_screen', value);
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
          .pushReplacementNamed(Ad3iyaMashhoura.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (previousPage == 'favorite_screen') {
                Navigator.of(context)
                    .pushReplacementNamed(FavoritesScreen.screenRoute);
              } else {
                Navigator.of(context).pushReplacementNamed(
                    Ad3iyaMashhoura.screenRoute);
              }
            },
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
                      .addFavorite('دعاء العديلة', DouaaAl3adila.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء العديلة', DouaaAl3adila.screenRoute,
                          DouaaAl3adila.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء العديلة',
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
                      'شَهِدَ اللهُ اَنَّهُ لا اِلـهَ اِلاّ هُوَ وَالْمَلائِكَةُ وَاُولُوا الْعِلْمِ قآئِماً بِالْقِسْطِ لا اِلـهَ اِلاّ هُوَ الْعَزيزُ الْحَكيمُ، اِنَّ الدّينَ عِنْدَ اللهِ الْاِسْلامُ، وَاَنَا الْعَبْدُ الضَّعيفٌ الْمُذْنِبُ الْعاصِىُ المُحْتاجُ الْحَقيرُ، اَشْهَدُ لِمُنْعِمى وَخالِقى وَرازِقى وَمُكْرِمى كَما شَهِدَ لِذاتِهِ وَشَهِدَتْ لَهُ الْمَلائِكَةُ وَاُولُوالْعِلْمِ مِنْ عِبادِهِ بِاَنَّهُ لا اِلـهَ اِلاّ هُوَ ذُوالنِّعَمِ وَالْاِحْسانِ وَالْكَرَمِ وَالْاِمْتِنانِ، قادِرٌ اَزَلِىٌّ، عالِمٌ اَبَدِىٌّ، حَىٌّ اَحَدِىٌّ، مَوْجُودٌ سَرْمَدِىٌّ، سَميعٌ بَصيرٌ مُريدٌ كُارِهٌ مُدْرِكٌ صَمَدِىٌّ، يَسْتَحِقُّ هذِهِ الصِّفات وَهُوَ عَلى ما هُوَ عَلَيْهَ فى عِزِّ صِفاتِهِ، كانَ قَوِيّاً قَبْلَ وُجُودِ الْقُدْرَةِ وَالْقُوَّةَ، وَكانَ عَليماً قَبْلَ ايجادِ الْعِلْمِ وَالْعِلَّةِ، لَمْ يَزَلْ سُلْطاناً اِذْ لا مَمْلَكَةَ وَلا مالَ، وَلَمْ يَزَلْ سُبْحاناً عَلى جَميعِ الْاَحْوالِ وُجُودُهُ قَبْلَ الْقَبْلِ فى اَزَلِ الاْزالِ وَبَقآؤُهُ بَعْدَ الْبَعْدِ مِنْ غَيْرِ اِنْتِقال وَلا زَوال، غَنِىٌّ فِى الْاَوَّلِ وَالاْخِرِ، مُسْتَغْن فِى الْباطِنِ وَالظّاهِرِ، لا جَوْرَ فى قَضِيَّتِهِ وَلا مَيْلَ فى مَشِيَّتِهِ، وَلا ظُلْمَ فى تَقْديرِهِ وَلا مَهْرَبَ مِنْ حُكُومَتِهِ، وَلا مَلْجَاَ مِنْ سَطَواتِهِ وَلا مَنْجا مِنْ نَقِماتِهِ، سَبَقَتْ رَحْمَتُهُ غَضَبَهُ وَلا يَفُوتُهُ اَحَدٌ اِذا طَلَبَهُ، اَزاحَ الْعِلَلَ فِى التَّكْليفِ وَسَوَّى التَّوْفيقَ بَيْنَ الضَّعيفِ وَالشَّريفِ، مَكَّنَ اَدآءَ الْمَاْمُورِ وَسَهَّلَ سَبيلَ اجْتِنابِ الْمَحْظُورِ، لَمْ يُكَلِّفِ الطّاعَةَ اِلاّ دُوْنَ الْوُسْعِ والطّاقَةِ، سُبْحانَهُ ما اَبْيَنَ كَرَمَهُ وَاَعْلى شَأنَهُ، سُبْحانَهُ ما اَجَلَّ نَيْلَهُ وَاَعْظَمَ اِحْسانَهُ، بَعَثَ الْاَنْبِيآءَ لِيُبَيِّنَ عَدْلَهُ وَنَصَبَ الْاَوْصِيآءَ لِيُظْهِرَ طَوْلَهُ وَفَضْلَهُ، وَجَعَلَنا مِنْ اُمَّةِ سَيِّدِ الْاَنْبِيآءِ وَخَيْرِ الْاَوْلِيآءِ وَاَفْضَلِ الْاَصْفِيآءِ وَاَعْلَى الْاَزْكِيآءِ مُحَمَّد صَلَّى اللهُ عَلَيْهِ وَآلِهِ وَسَلَّمَ، امَنّا ازلي وَبِما دَعانا اِلَيْهِ وَبِالْقُرْآنِ الَّذى اَنْزَلَهُ عَلَيْهِ وَبِوَصِيِّهِ الَّذى نَصَبَهُ يَوْمَ الْغَديرِ وَاَشارِ بِقَوْلِهِ هذا عَلِىٌّ اِلَيْهِ، وَاَشْهَدُ اَنَّ الْاَئِمَّةَ الْاَبْرارَ وَالْخُلَفآءَ الْاَخْيارَ بَعْدَ الرَّسُولِ الْمُخْتارِ، عَلِىٌّ قامِعُ الْكُفّارِ وَمِنْ بَعْدِهِ سَيِّدُ اَوْلادِهِالْحَسَنُ بْنُ عَلِىٍّ ثُمَّ اَخُوُه السِّبْطُ التّابِعُ لِمَرْضاتِ اللهِ الْحُسَيْنُ، ثُمَّ الْعابِدُ عَلِىٌّ، ثُمَّ الْباقِرُ مُحَمَّدٌ، ثُمَّ الصّادِقُ جَعْفَرٌ، ثُمَّ الْكاظِمُ مُوسى، ثُمَّ الرِّضا عَلِىٌّ، ثُمَّ التَّقِىُّ مُحَمَّدٌ، ثُمَّ النَّقِىُّ عَلِىٌّ، ثُمَّ الزَّكِىُّ الْعَسْكَرِىُّ الْحَسَنُ، ثُمَّ الْحُجَّةُ الْخَلَفُ الْقآئِمُ الْمُنْتَظَرُ الْمَهْدِىُّ الْمُرجَى الَّذى بِبَقائِهِ بَقِيَتِ الدُّنْيا، وَبِيُمْنِهِ رُزِقَ الْوَرى، وَبِوُجُودِهِ ثَبتَتِ الْاَرْضُ وَالسَّمآءُ وَبِهِ يَمْلَاُ اللهُ الْاَرْضَ قِسْطاً وَعَدْلاً بَعْدَ ما مُلِئَتْ ظُلْماًوَجَوْراً، وَاَشْهَدُ اَنَّ اَقْوالَهُمْ حُجَّةٌ وَامْتِثالَهُمْ فَريْضَةٌ وَطاعَتَهُمْ مَفْرُوضَةٌ وَمَوَدَّتَهُمْ لازِمَةٌ مَقْضِيَّةٌ، وَالْاِقْتِدآءَ بِهِمْ مُنْجِيَةٌ، وَمُخالَفَتَهُمْ مُرْدِيَةٌ، وَهُمْ ساداتُ اَهْلِ الْجَنَّةِ اَجْمَعينَ، وَشُفَعآءُ يَوْمِ الدّينِ وَاَئِمَّةُ اَهْلِ الْاَرْضِ عَلَى الْيَقينِ، وَاَفْضَلُ الْاَوْصِيآءِ الْمَرْضِيّينَ، وَاَشْهَدُ اَنَّ الْمَوْتَ حَقٌّ وَمُسآءَلَةَ الْقَبْرِ حَقٌّ وَالْبَعْثَ حَقٌّ وَالنُّشُورَ حَقٌّ ز وَالصِّراطِ حَقٌّ، وَالْميزانَ حَقٌّ، وَالْحِسابَ حَقٌّ، وَالْكِتابَ حَقٌّ، وَالْجَنَّةَ حَقٌّ، وَالنّارَ حَقٌّ، وَاَنَّ السّاعَةَ اتِيَةٌ لا رَيْبَ فيها، وَاَنَّ اللهَ يَبْعَثُ مَنْ فِى الْقُبُورِ، اَللّـهُمَّ فَضْلُكَ رَجآئىوَكَرَمُكَ وَرَحْمَتُكَ اَمَلى لا عَمَلَ لى اَسْتَحِقُّ بِهِ الْجَنَّةَ، وَلا طاعَةَ لىْ اَسْتَوْجِبُ بِهَا الرِّضْوانَ اِلاّ اَنِّى اعْتَقَدْتُ تَوْحيدَكَ وَعَدْلَكَ، وَارْتَجَيْتُ اِحْسانَكَ وَفَضْلَكَ، وَتَشَفَّعْتُ اِلَيْكَ بِالنَّبِىِّ وَآلِهِ مَنْ اَحِبَّتِكَ وَاَنْتَ اَكْرَمُ الْاَكْرَمينَ وَاَرْحَمُ الرّاحِمينَ، وَصَلَّى اللهُ عَلى نَبِيِّنا مُحَمَّد وَآلِهِ اَجْمَعينَ الطَّيِّبينَ الطّاهِريْنَ وَسَلَّمَ تَسْليماً كَثيراً كَثيراً وَلا حَوْلَ وَلا قُوَّةَ اِلاّ بِاللهِ الْعَلِىِّ الْعَظيمِ اَللّـهُمَّ يا اَرْحَمَ الرّاحِمينَ اِنّى اَوْدَعْتُكَ يَقينى هذا وَثَباتَ دينى وَاَنْتَ خَيْرُ مُسْتَوْدَع وَقَدْ اَمَرْتَنا بِحِفْظِ الْوَدآئِعِ فَرُدَّهُ عَلَىَّ وَقْتَ حُضُورِ مَوْتى بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ. أقول: قَد وَرَد في الادعية المأثورة اَللّـهُمَّ اِنِّى اَعُوذُ بِكَ مِنَ الْعَديلَةِ عِنْدَ الْمَوْتِ، وَمعنى العديلة عند المَوت هُوالعُدول إلى الباطِل عن الحقّ وهُوبأن يحضر الشّيطان عند المحتضر ويوسوس في صَدره ويجعله يشكّ في دينه فيستل الايمان مِن فؤاده، ولهذا قد وَردت الاستعاذة منها في الدّعوات، وقال فخر المحقّقين (رحمه الله): مَن أراد أن يسلم من العديلة فليستحضر الايمان بأدلّتها والاصول الخمس ببراهينها القطعيّة بخلوص وصفاء وليودعها الله تعالى ليردّها اليه في ساعة الاحتضار بأن يقول بعد استحضار عقائده الحقّة: اَللّـهُمَّ يا اَرْحَمَ الرّحِمينَ اِنّى قَدْ اَوْدَعْتُكَ يَقينى هذا وَثَباتَ دينى وَاَنْتَ خَيْرُ مُسْتَوْدَع وَقَدْ اَمَرْتَنا بِحِفْظِ الْوَدائِعِ فَرُدَّهُ عَلَىَّ وَقْتَ حُضُورِ مَوْتى،، فَعلى رأيه (قدس سره) قراءة هذا الدّعاء الشّريف «دُعاء العديلة» واستحضار مضمونه في البال تمنح المَرء اماناً من خطر العديلة عند الموت، وأمّا هذا الدّعاء فهل هو عن المعصوم (عليه السلام) أم هو انشاء من بعض العلماء، يقول في ذلك خريت صناعة الحديث وجامع أخبار الائمة (عليهم السلام) العالم المتبحّر الخبير والمحدّث النّاقد البصير مولانا الحاج ميرزا حسين النّوري نوّر الله مرقده: وأمّا الدّعاء العديلة المعروفة فهو من مؤلّفات بعض أهل العلم ليس بمأثور ولا موجود في كتب حملة الاحاديث ونقّادها. واعلم انّه روى الطوسي عن محمّد بن سليمان الدّيلمي انّه قال للصّادق (عليه السلام): ان شيعتك تقول: انّ الايمان قسمين فمستقرّ ثابت ومستودع يزول، فعلّمني دعاءً يكمل به ايماني اذا دعوت به فلا يزول، قال (عليه السلام): قل عقيب كلّ صلاة مكتوبة: رَضيتُ بِاللهِ رَبّاً وَبِمُحَمَّد صَلَّى اللهُ عَلَيْهِ وآلِهِ نَبِيّاً وَبِالاِسْلامِ ديناً وَبِالْقُرآنِ كِتاباً وَبِالْكَعْبَةِ قِبْلَةً وَبِعَلِىٍّ وَلِيّاً وَاِماماً وَبِالْحَسَنِ وَالْحُسَيْنِ وَعَلِىِّ بْنِ الْحُسَيْنِ وَمُحَمَّدَ بْنِ عَلِىٍّ وَجَعْفَرِ بْنَ مُحَمَّد وَمُوسى بْنِ جَعْفَر وَعَلِىِّ بْنِ مُوسى وَمُحَمَّدَ بْنِ عَلِىٍّ وَعَلِىِّ بْنِ مُحَمَّد وَالْحَسَنِ بْنِ عَلِيٍّ وَالْحُجَّةِ بْنِ الْحَسَنِ صَلَواتُ اللهِ عَلَيْهِمْ اَئمَّةً، اَللّـهُمَّ اِنّى رَضيتُ بِهِمْ اَئِمَّةً فَارْضَنى لَهُمْ اِنَّكَ عَلى كُلِّ شَيء قَديرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: DouaaAljawshanAlkabir.screenRoute,
        pushBack: DouaaAlmojir.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء العديلة.mp3',
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
