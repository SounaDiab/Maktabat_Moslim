import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:maktabat_almoslim/widgets/she3er.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../rajab.dart';
import 'alyawm_al5ames_wal3ishroun.dart';
import 'alyawm_alsabe3_wal3eshroun.dart';

class AllaylaAlsabi3aWal3eshroun extends StatefulWidget {
  static String screenRoute = 'allayla_alsabe3a_wal3eshroun_screen';
  const AllaylaAlsabi3aWal3eshroun({super.key});

  @override
  State<AllaylaAlsabi3aWal3eshroun> createState() =>
      _AllaylaAlsabi3aWal3eshrounState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AllaylaAlsabi3aWal3eshrounState
    extends State<AllaylaAlsabi3aWal3eshroun> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_allayla_alsabe3a_wal3eshroun_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_allayla_alsabe3a_wal3eshroun_screen', value);
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
                      .addFavorite('الليلة السابعة والعشرون',
                          AllaylaAlsabi3aWal3eshroun.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الليلة السابعة والعشرون',
                          AllaylaAlsabi3aWal3eshroun.screenRoute,
                          AllaylaAlsabi3aWal3eshroun.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الليلة السابعة والعشرون',
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
                  'هي ليلة المبعث وهي من اللّيالي المتبرّكة وفيها اعمال :',
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
                      'قال الشّيخ في المصباح: روى عن أبي جعفر الجواد (عليه السلام) قال: انّ في رجب ليلة هي خير للنّاس ممّا طلعت عليه الشّمس، وهي ليلة السّابع والعشرين منه بُنيّ رسول الله (صلى الله عليه وآله وسلم) في صبيحتها، وانّ للعامل فيها من شيعتنا مثل أجر عمل ستّين سنة . قيل وما العمل فيها ؟ قال : اذا صلّيت العشاء ثمّ أخذت مضجعك ثمّ استيقظت أيّ ساعة من ساعات اللّيل كانت قبل منتصفه صلّيت اثنتي عشرة ركعة، تقرأ في كلّ ركعة الحمد وسورة خفيفة من المفصّل، والمفصّل سورة محمّد (صلى الله عليه وآله وسلم) الى آخر القرآن، وتسلّم بين كلّ ركعتين، فاذا فرغت من الصّلوات جلست بعد السّلام وقرأت الحمد سبعاً، والمعوذّتين سبعاً، و (قُلْ هُوَ اللهُ أحَدٌ) و (قُل يا أيّها الكافِرُونَ) كلاً منهما سبعاً، وانّا أنزلناه وآية الكُرسي كلاً منهما سبعاً، وتقول بعد ذلك كلّه:\n\n'
                      'اَلْحَمْدُ للهِ الَّذي لَمْ يَتَّخِذْ وَلَداً وَلَمْ يَكُنْ لَهُ شَريكٌ في الْمُلْكِ، وَلَمْ يَكُنْ لَهُ وَلِيٌّ مِنَ الذُّلِّ وَكَبِّرْهُ تَكْبيراً اَللّـهُمَّ اِنّي اَساَلُكَ بِمَعاقِدِ عِزِّكَ عَلَىَّ، اَرْكانِ عَرْشِكَ، وَمُنْتَهَى الرَّحْمَةِ مِنْ كِتابِكَ، وَبِاسْمِكَ الاَْعْظَمِ الاَْعْظَمِ الاَْعْظَمِ، وَذِكْرِكَ الاَْعْلَى الاَْعْلَى الاَْعْلَى، وَبِكَلِماتِكَ التّامّاتِ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِهِ، وَاَنْ تَفْعَلَ بي ما اَنْتَ اَهْلُهُ . ثمّ ادع بما شئت، ويستحبّ الغُسل في هذه اللّيلة وقد مرّت عند ذكر ليلة النّصف من رجب (ص143) صلاة تصلّى ايضاً في هذه اللّيلة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle:
                      'زيارة أمير المؤمنين (عليه السلام)، وهي أفضل أعمال هذه اللّيلة، وله (عليه السلام) في هذه اللّيلة زيارات ثلاث سنشير اليها في باب الزيارات ان شاء الله، واعلم انّ أبا عبد الله محمّد بن بطوطة الذي هو من علماء أهل السّنة وقد عاش قبل ستّة قرون قد أتى بذكر المرقد الطّاهر لمولانا امير المؤمنين (عليه السلام) في رحلته المعروفة باسمه (رحلة ابن بطُوطة) عندما ذكر دخوله مدينة النّجف الاشرف في عودته من مكّة المُعظّمة، فقال: وأهل هذه المدينة كُلّهم رافضيّة وهذه الرّوضة ظهرت لها كرامات، منها انّ في ليلة السّابع والعشرين من رجب وتسمّى عندهم ليلة المحيى يؤتى الى تلك الرّوضة بكلّ مفعد، من العراقين وخراسان وبلاد فارس والرّوم، فيجتمع منهم الثّلاثون والاربعُون ونحو ذلك، فاذا كان بعد العشاء الاخرة جعلوا فوق الضّريح المقدّس والنّاس ينتظرون قيامهم وهم ما بين مصلّ وذاكر وتال ومشاهد الرّوضة، فاذا مضى من اللّيل نصفه أو ثلثاه أو نحو ذلك قام الجميع أصحّاء من غير سوء، وهم يقولون: لا اِلـهَ إلاَّ اللهُ مُحَمَّدٌ رَسُولُ اللهِ عَلَيٌّ وَليُّ اللهِ، وهذا أمر مستفيض عندهم سمعته من الثّقات ولم أحضر تلك اللّيلة، لكنّي رأيت بمدرسة الضيّاف ثلاثة من الرّجال، أحدهم من أرض الرّوم، والثّاني من اصفهان، والثّالث من خراسان، وهم مقعدون فاستخبرتهم عن شأنهم فأخبروني انّهم لم يدركوا الليلة المحيى، وانّهم منتظرون أوانها من عام آخر، وهذه اللّيلة يجتمع لها النّاس من البلاد خلق كثير، ويقيمون سوقاً عظيمة مدّة عشرة أيّام.\n\n'
                      'أقول : لا تستبعد هذا الحديث فانّ ما برز من هذه الرّوضات الشّريفة من الكرامات الثّابتة لنا عن طريق التّواتر تفوق حدّ الاحصاء، وهذا شهر شوّال من السّنة الماضية سنة ألف وثلاثمائة وأربعين قد شاهد الملا فيه معجزة باهرة غير قابلة للافكار ومن المرقد الطّاهر لامامنا ثامِن الائمة الهداة، وضامن الامة العُصاة مولانا أبي الحسن عليّ بن موسى الرّضا صلوات الله وسلامه عليه، فثلاث نسوة مقعدة مصابة بالفالج أو نظائره قد توسّلن بهذا المرقد الشّريف والاطبّاء ودكاترة الطب كانت قد أبدت عجزها عن علاجهنّ، فبان ما رزقن من الشّفاء للملا ناصعاً كالشّمس في السماء الصّاحية، وكمعجزة انفتاح باب مدينة النّجف على أعراب البادية، وقد تجلّت هذه الحقيقة للجميع فآمن بها على ما حكى حتى دكاترة الطّب الواقفين على أماكن مصابة به من الاسقام، فأبدوا تصديقهم لها مع شدّة تبيّنهم للامر ورقّتهم فيه، وقد سجّل بعضهم كتاباً يشهد فيه على ما رزقن من الشّفاء، ولو لا ملاحظة الاختصار ومناسبة المقام لاثبتّ القصة كاملة ولقد أجاد شيخنا الحرّ العاملي في اُرجوزته:',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle: 'وَما بَدا مِنْ بَرَكاتِ مَشْهَدهِ\n'
                      'في كُلِّ يَوْم اَمْسُهُ مِثْلُ غَدِهِ\n\n'
                      'وَكَشِفَا الْعمى وَالمَرْضى بِهِ\n'
                      'اِجابَةُ الدُّعاءِ في اَعْتابِهِ',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle:
                      'قال الكفعمي في كتاب البلد الامين: اُدع في ليلة المبعث بهذا الدّعاء :\n\n'
                      'اَللّـهُمَّ اِنّي اَساَلُكَ بِالتَّجَلِي الاَْعْظَمِ في هذِهِ اللَّيْلَةِ مِنَ الشَّهْرِ الْمُعَظَّمِ وَالْمُرْسَلِ الْمُكَرَّمِ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِهِ، وَاَنْ تَغْفِرَ لَنا ما اَنْتَ بِهِ مِنّا اَعْلَمُ، يا مَنْ يَعْلَمُ وَلا نَعْلَمُ، اَللّـهُمَّ بارِكْ لَنا في لَيْلَتِنا هذِهِ الَّتي بِشَرَفِ الرِّسالَةِ فَضَّلْتَها، وَبِكَرامَتِكَ اَجْلَلْتَها، وَبِالَْمحَلِّ الشَّريفِ اَحْلَلْتَها، اَللّـهُمَّ فَاِنّا نَسْأَلُكَ بِالْمَبْعَثِ الشَّريفِ، وَالسَّيِّدِ اللَّطيفِ، وَالْعُنْصُرِ الْعَفيفِ، اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِهِ، وَ اَنْ تَجْعَلَ اَعْمالَنا في هذِهِ اللَّيْلَةِ وَفي سايِرِ اللَّيالي مَقْبُولَةً، وَذُنُوبَنا مَغْفُورَةً، وَحَسَناتِنا مَشْكُورَةً، وَسَيِّئاتِنا مَسْتُورَةً، وَقُلُوبَنا بِحُسْنِ الْقَوْلِ مَسْرُورَةً، وَاَرْزاقَنا مِنْ لَدُنْكَ بِالْيُسْرِ مَدْرُورَةً، اَللّـهُمَّ اِنَّكَ تَرى وَلا تُرى، وَاَنْتَ بِالْمَنْظَرِ الاَْعْلى، وَاِنَّ اِلَيْكَ الرُّجْعى وَالْمُنْتَهى، وَاِنَّ لَكَ الْمَماتَ وَالَْمحْيا، وَاِنَّ لَكَ الاْخِرَةَ وَالاُْولى، اَللّـهُمَّ اِنّا نَعُوذُ بِكَ اَنْ نَذِلَّ وَنَخْزى، وَاَنْ نَأتِيَ ما عَنْهُ تَنْهى اَللّـهُمَّ اِنّا نَسْأَلُكَ الْجَنَّةَ بِرَحْمَتِكَ، وَنَسْتَعيذُ بِكَ مِنَ النّارِ فَاَعِذْنا مِنْها بِقُدْرَتِكَ وَنَسْأَلُكَ مِنَ الْحُورِ الْعينِ فَارْزُقْنا بِعِزَّتِكَ، وَاجْعَلْ اَوْسَعَ اَرْزاقِنا عِنْدَ كِبَرِ سِنِّنا، وَاَحْسَنَ اَعْمالِنا عِنْدَ اقْتِرابِ آجالِنا، وَاَطِلْ في طاعَتِكَ وَما يُقَرِّبُ اِلَيْكَ وَيُحْظي عِنْدَكَ وَيُزْلِفُ لَدَيْكَ اَعْمارَنا، وَاَحْسِنْ في جَميعِ اَحْوالِنا وَاُمُورِنا مَعْرِفَتَنا، وَلا تَكِلْنا اِلى اَحَد مِنْ خَلْقِكَ فَيَمُنَّ عَلَيْنا، وَتَفَضَّلْ عَلَيْنا بجَميعِ حَوائِجِنا لِلدُّنْيا وَالاْخِرَةِ، وَابْدَأ بِابائِنا وَاَبْنائِنا وَجَميعِ اِخْوانِنَا الْمُؤْمِنينَ في جَميعِ ما سَأَلْناكَ لاَِنْفُسِنا يا اَرْحَمَ الرّاحِمينَ، اَللّـهُمَّ اِنّا نَسْأَلُكَ بِاسْمِكَ الْعَظيمِ، وَمُلْكِكَ الْقَديمِ، اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تَغْفِرَ لَنَا الذَّنْبَ الْعَظيمَ اِنَّهُ لا يَغْفِرُ الْعَظيمَ الْعَظيمُ، اَللّـهُمَّ وَهذا رَجَبٌ الْمُكَرَّمُ الَّذي اَكْرَمْتَنا بِهِ، اَوَّلُ اَشْهُرِ الْحُرُمِ، اَكْرَمْتَنا بِهِ مِنْ بَيْنِ الاُْمَمِ، فَلَكَ الْحَمْدُ يا ذَا الْجُودِ وَالْكَرَمِ، فَاَسْأَلُكَ بِهِ وَبِاسْمِكَ الاَْعْظَمِ الاَْعْظَمِ الاَْعْظَمِ الاَْجَلِّ الاَْكْرَمِ، الَّذي خَلَقْتَهُ فَاسْتَقَرَّ في ظِلِّكَ فَلا يَخْرُجُ مِنْكَ اِلى غَيْرِكَ، اَنْ تُصَلِّيَ عَلى مُحَمَّد وَاَهْلِ بَيْتِهِ الطّاهِرينَ، وَاَنْ تَجْعَلَنا مِنَ الْعامِلينَ فيهِ بِطاعَتِكَ، وَالاْمِلينَ فيهِ لِشَفاعَتِكَ، اَللّـهُمَّ اهْدِنا اِلى سَواءِ السَّبيلِ، وَاجْعَلْ مَقيلَنا عِنْدَكَ خَيْرَ مَقيل، في ظِلٍّ ظَليل، وَمُلك جَزيل، فَاِنَّكَ حَسْبُنا وَنِعْمَ الْوَكيلُ، اَللّـهُمَّ اقْلِبْنا مُفْلِحينَ مُنْجِحينَ غَيْرَ مَغْضُوب عَلَيْنا وَلا ضالّينَ، بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ، اَللّـهُمَّ اِنّي اَساَلُكَ بِعَزائِمِ مَغْفِرَتِكَ، وَبِواجِبِ رَحْمَتِكَ، السَّلامَةَ مِنْ كُلِّ اِثْم، وَالْغَنيمَةَ مِنْ كُلِّ بِرٍّ، وَالْفَوْزَ بِالْجَنَّةِ وَالنَّجاةَ مِنَ النّارِ، اَللّـهُمَّ دَعاكَ الدّاعُونَ وَدَعَوْتُكَ، وَسَأَلَكَ السّائِلُونَ وَسَأَلْتُكَ وَطَلَبَ اِلَيْكَ الطّالِبُونَ وَطَلَبْتُ اِلَيْكَ، اَللّـهُمَّ اَنْتَ الثِّقَةُ وَالرَّجاءُ، وَاِلَيْكَ مُنْتَهَى الرَّغْبَةِ فِي الدُّعاءِ، اَللّـهُمَّ فَصَلِّ عَلى مُحَمَّد وَآلِهِ، وَاجْعَلِ الْيَقينَ في قَلْبي، وَالنُّورَ في بَصَري، وَالنَّصيحَةَ في صَدْري، وَذِكْرَكَ بِاللَّيْلِ وَالنَّهارِ عَلى لِساني، وَرِزْقاً واسِعاً غَيْرَ مَمْنُون وَلا مَحْظُور فَارْزُقْني، وَبارِكْ لي فيما رَزَقْتَني، وَاجْعَلْ غِنايَ في نَفْسي، وَرَغْبَتي فيما عِنْدَكَ بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ، ثمّ اسجد وقُلْ : اَلْحَمْدُ للهِِ الَّذي هَدانا لِمَعْرِفَتِهِ، وَخَصَّنا بِوِلايَتِهِ، وَوَفَّقَنا لِطاعَتِهِ، شُكْراً شُكْراً مائة مرّة، ثمّ ارفع رأسك من السّجود وقُل : اَللّـهُمَّ اِنّي قَصَدْتُكَ بِحاجَتي، وَاعْتَمَدْتُ عَلَيْكَ بِمَسْأَلَتي، وَتَوَجَّهْتُ اِلَيْكَ بِاَئِمَّتي وَسادَتي، اَللّـهُمَّ انْفَعْنا بِحُبِّهِم، وَاَوْرِدْنا مَوْرِدَهُمْ، وَارْزُقْنا مُرافَقَتَهُمْ، وَاَدْخِلْنَا الْجَنَّةَ في زُمْرَتِهِمْ، بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAlsabe3Wal3eshroun.screenRoute,
        pushBack: AlyawmAl5amesWal3ishroun.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الليلة السابعة والعشرون.mp3',
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
