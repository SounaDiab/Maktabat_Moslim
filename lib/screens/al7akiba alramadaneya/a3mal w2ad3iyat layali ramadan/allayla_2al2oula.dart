import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../a3mal_w2ad3iyat_layali_ramadan.dart';
import 'allayla_2alsalasin.dart';
import 'allayla_2alsalisa_3ashar.dart';

class Allayla2al2oula extends StatefulWidget {
  static String screenRoute = 'allayla_2al2oula_screen';
  const Allayla2al2oula({super.key});

  @override
  State<Allayla2al2oula> createState() => _Allayla2al2oulaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Allayla2al2oulaState extends State<Allayla2al2oula> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_allayla_2al2oula_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_allayla_2al2oula_screen', value);
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
          .pushReplacementNamed(A3malW2ad3iyatLayaliRamadan.screenRoute);
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
                      .addFavorite('الليلة الاولى', Allayla2al2oula.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الليلة الاولى',
                          Allayla2al2oula.screenRoute,
                          Allayla2al2oula.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الليلة الاولى',
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
                  title: 'وفيها أعمال :\n'
                      'الاوّل :',
                  subtitle: 'الاستهلال وقد أوجبه بعض العلماء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'اذا رأيت هلال شهر رمضان فلا تشر اليه ولكن استقبل القبلة وارفع يديك الى السّماء وخاطب الهلال تقول :\n\n'
                      'رَبّي وَرَبُّكَ اللهُ رَبُّ الْعالَمينَ، اَللّـهُمَّ اَهِلَّهُ عَلَيْنا بِالاَْمْنِ وَالاِيمانِ، وَالسَّلامَةِ وَالاِسْلامِ، وَالْمُسارَعَةِ اِلى ما تُحِبُّ وَتَرْضى، اَللّـهُمَّ بارِكْ لَنا في شَهْرِنا هذا، وَارْزُقْنا خَيْرَهُ وَعَوْنَهُ، وَاصْرِفْ عَنّا ضُرَّهُ وَشَرَّهُ وَبلاءَهُ وَفِتْنَتَهُ.\n\n'
                      'وروي انّ رسول الله (صلى الله عليه وآله وسلم) كان اذا استهلّ هلال شهر رمضان استقبل القبلة بوجهه وقال :\n\n'
                      'اَللّـهُمَّ اَهِلَّهُ عَلَيْنا بِالاَْمْنِ والاِيمانِ، وَالسَّلامَةِ وَالاِسْلامِ، وَالْعافِيَةِ الُْمجَلَّلَةِ وَدِفاعِ الاَسْقامِ، وَالْعَوْنِ عَلَى الصَّلاةِ وَالصِّيامِ وَالْقِيامِ وَتِلاوَةِ الْقُرآنِ، اَللّـهُمَّ سَلَّمْنا لِشَهْرِ رَمَضانَ وَتَسَلِّمْهُ مِّنا، وَسَلِّمْنا فيهِ حَتّى يَنْقَضِيَ عَنّا شَهْرُ رَمَضانَ وَقَدْ عَفَوْتَ عَنّا وَغَفَرْتَ لَنا وَرَحِمْتَنا .\n\n'
                      'وعن الصّادق (عليه السلام) قال : اذا رأيت الهلال فقل :\n\n'
                      'اَللّـهُمَّ قَدْ حَضَرَ شَهْرُ رَمَضانَ، وَقَدِ افْتَرَضْتَ عَلَيْنا صِيامَهُ، وَاَنْزَلْتَ فيهِ الْقُرآنَ هُدىً لِلنّاسِ وَبَيِّنات مِنَ الْهُدى وَالْفُرْقانِ، اَللّـهُمَّ اَعِنّا عَلى صِيامِهِ وَتَقَبَّلْهُ مِنّا، وَسَلِّمْنا فيهِ، وَسَلِّمْنا مِنْهُ وَسَلَّمُهَ لَنا في يُسْر مِنَكَ وَعافِيَة اِنَّكَ عَلى كُلِّ شَيْء قَديرٌ، يا رَحْمنُ يا رَحيمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'أن يدعو اذا شاهد الهلال بالدّعاء الثّالث والاربعين من دعوات الصحيفة الكاملة ، روى السيّد ابن طاووس انّ عليّ بن الحسين (عليه السلام) مرّ في طريقه يوماً فنظر الى هلال شهر رمضان فوقف فقال :\n\n'
                      'اَيُّهَا الْخَلْقُ الْمُطيعُ الدّائِبُ السَّريعُ، الْمُتَرَدِّدُ في مَنازِلِ التَّقْديرِ، الْمُتَصَرِّفُ في فَلَكِ التَّدْبيرِ، آمَنْتُ بِمَنْ نَوَّرَ بِكَ الظُّلَمَ، وَاَوْضَحَ بِكَ الْبُهَمَ، وجَعَلَكَ آيَةً مِنْ آياتِ مُلْكِهِ، وَعَلامَةً مِنْ عَلاماتِ سُلْطانِهِ، فَحَدَّ بِكَ الزَّمانَ، وامْتَهَنَكَ بِالْكَمالِ وَالنُّقْصانِ، وَالطُّلُوعِ والاُفُولِ، وَالاِنارَةِ والْكُسُوفِ، في كُلِّ ذلِكَ اَنْتَ لَهُ مُطيعٌ، وَاِلَى اِرادَتِهِ سَريعٌ، سُبْحانَهُ ما اَعْجَبَ ما دَبَّرَ مِنْ اَمْرِكَ، وَاَلْطَفَ ما صَنَعَ في شَأنِكَ، جَعَلَك مِفْتاحَ شَهْر حادِث لاَمْر حادِث، فَاَسأَلُ اللهَ رَبِّي وَرَبَّكَ، وَخالِقي وَخالِقَكَ، وَمُقَدِّري وَمُقَدِّرَكَ، وَمُصَوِّري وَمُصَوِّرَكَ اَنْ يُصَلِّيَ عَلى مُحَمَّد وآلِ مُحَمَّد، وَاَنْ يَجْعَاَلك هِلالَ بَرَكة لا تَمْحَقُها الاَيامُ، وَطَهارَة لا تُدَنِّسُهَا الاثامُ، هِلالَ اَمْن مِنَ الافاتِ، وَسَلامَة مِنَ السَّيِّئاتِ، هِلالَ سَعْد لا نَحْسَ فيهِ يُمْن لا نَكَدَ مَعَهُ، وَيُسْر لا يُمازِجُهُ عُسْرٌ، وَخَيْر لا يَشُوبُهُ شَرٌّ، هِلالَ اَمْن وَايمان وَنِعْمَة وَاِحْسان وَسَلامَة وَاِسْلام، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاجْعَلْنا مِنْ اَرْضى مَنْ طَلَعَ عَلَيْهِ، وَاَزْكى مَنْ نَظَرَ اِلَيْهِ، وَاَسْعَدَ مَنْ تَعَبَّدَ لَكَ فيهِ، وَوَفِّقْنَا اَللّـهُمَّ فيهِ لِلطّاعَةِ وَالتَّوْبَةِ، وَاعْصِمْنا فيهِ مِنَ الاثامِ وَالْحَوبَةِ، وَاَوْزِعْنا فيهِ شُكْرَ النِّعْمَةِ، واَلْبِسْنا فيهِ جُنَنَ الْعافِيَةِ، وَاَتْمِمْ عَلَيْنا بِاسْتِكْمالِ طاعَتِكَ فيهِ الْمِنَّةَ، اِنَّكَ اَنْتَ الْمَنّانُ الْحَميدُ، وَصَلَّى اللهُ عَلى مُحَمَّد وآلِهِ الطَيِّبينَ، وَاجْعَلْ لَنا فيهِ عَوناً مِنْكَ عَلى ما نَدَبْتَنا اِلَيْهِ مِنْ مُفْتَرَضِ طاعَتِكَ، وَتَقَبَّلْها اِنَّكَ الاَكْرَمُ مِنْ كُلِّ كَريم، وَالاَرْحَمُ مِنْ كُلِّ رَحيم، آمينَ آمينَ رَبَّ الْعالَمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'يستحبّ أن يأتي أهله وهذا ممّا خصّ به هذا الشّهر ويكره ذلك في أوائل سائر الشّهور.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'الغُسل ، ففي الحديث انّ من اغتسل اوّل ليلة منه لم يصبه الحكّة الى شهر رمضان القابل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'أن يغتسل في نهر جار ويصبّ على رأسه ثلاثين كفّاً من الماء ليكون على طهر معنوي الى شهر رمضان القابل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'أن يزور قبر الحسين (عليه السلام) لتذهب عنه ذنوبه ويكون له ثواب الحجّاج والمعتمرين في تلك السّنة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن :',
                  subtitle:
                      'أن يبدأ في الصّلاة ألف ركعة الواردة في هذا الشّهر التي مرّت في أواخر القسم الثّاني من أعمال هذا الشّهر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التاسع :',
                  subtitle:
                      'أن يصلّي ركعتين في هذه اللّيلة يقرأ في كلّ ركعة الحمد وسورة الانعام ويسأل الله تعالى أن يكفيه ويقيه المخاوف والاسقام.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العاشر :',
                  subtitle:
                      'أن يدعُو بدعاء اَللّـهُمَّ اِنَّ هذَا الشَّهْرَ الْمُبارَكَ الذي ذكرناه في آخر ليلة من شعبان.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الحادي عشر :',
                  subtitle:
                      'أن يرفع يديه اذا فرغ من صلاة المغرب ويدعو بهذا الدّعاء المرويّ في الاقبال عن الامام الجواد (عليه السلام) :\n\n'
                      'اَللّـهُمَّ يا مَنْ يَمْلِكُ التَّدْبيرَ وَهُوَ عَلى كُلِّ شَيء قَديرٌ، يا مَنْ يَعْلَمُ خائِنَةَ الاَعْيُنِ وَما تُخْفِي الصُّدُورِ وَتُجِنُّ الضَّميرُ وَهُوَ اللَّطيفُ الْخَبيرُ، اَللّـهُمَّ اجْعَلْنا مِمَّنْ نَوى فَعَمِلَ، وَلا تَجْعَلْنا مِمَّنْ شَقِيَ فَكَسِلَ، وَلا مِمَّنْ هُوَ عَلى غَيْرِ عَمَل يَتَّكِلُ، اَللّـهُمَّ صَحِّحْ اَبْدانَنا مِنَ الْعِلَلِ، وَاَعِنّا عَلى ما افْتَرَضْتَ عَلَيْنا مِنَ الْعَمَلِ، حَتّى يَنْقَضِيَ عَنّا شَهْرُكَ هذا وَقَدْ اَدَّيْنا مَفْرُوضَكَ فيهِ عَلَيْنا، اَللّـهُمَّ اَعِنّا عَلى صِيامِهِ، وَوَفِّقْنا لِقِيامِهِ، وَنَشِّطْنا فيهِ لِلصَّلاةِ، وَلا تَحْجُبْنا مِنَ الْقِراءَةِ، وَسَهِّلْ لَنا فيهِ ايتاءَ الزَّكاةِ، اَللّـهُمَّ لا تُسَلِّطْ عَلَيْنا وَصَباً وَلا تَعَباً وَلا سَقَماً وَلا عَطَباً، اَللّـهُمَّ ارْزُقْنا الاِفْطارَ مِنْ رِزْقِكَ الْحلالِ، اَللّـهُمَّ سَهِّلْ لَنا فيهِ ما قَسَمْتَهُ مِنْ رِزْقِكَ، وَيَسِّرْ ما قَدَّرْتَهُ مِنْ اَمْرِكَ، وَاجْعَلْهُ حَلالاً طَيِّباً نَقِيّاً مِنَ الاثامِ خالِصاً مِنَ الاصارِ وَالاَجْرامِ، اَللّـهُمَّ لا تُطْعِمْنا اِلاّ طَيِّباً غَيْرَ خَبيث وَلا حَرام، وَاجْعَلْ رِزْقَكَ لَنا حَلالاً لا يَشُوبُهُ دَنَسٌ وَلا اَسْقامٌ يا مَنْ عِلْمُهُ بِالسِّرِّ كَعِلْمِهِ باِلاِعْلانِ، يا مُتَفَضِّلاً عَلى عِبادِهِ بِالاِحْسانِ، يا مَنْ هُوَ عَلى كُلِّ شَيء قَديرٌ وَبِكُلِّ شَيء عَليمٌ خَبيرٌ اَلْهِمْنا ذِكْرَكَ وَجَنِّبْنا عُسْرَكَ، وَاَنِلْنا يُسْرَكَ، وَاَهْدِنا لِلرَّشادِ، وَوَفِّقْنا لِلسَّدادِ، وَاعْصِمْنا مِنَ الْبَلايا، وَصُنّا مِنَ الاَوْزارِ وَالْخَطايا، يا مَنْ لا يَغْفِرُ عَظيمَ الذُّنُوبِ غَيْرُهُ، وَلا يَكْشِفُ السُّوءَ إلاّ هُوَ، يا اَرْحَمَ الرّاحِمينَ، وَاَكْرَمَ الاَكْرَمينَ، صَلِّ عَلى مُحَمَّد وَاَهْلِ بَيْتِهِ الطَّيِّبينَ، وَاجْعَلْ صِيامَنا مَقْبُولاً، وَبِالْبِرِّ وَالتَّقْوى مَوْصُولاً، وَكَذلِكَ فَاجْعَلْ سَعْيَنا مَشْكُوراً وَقِيامَنا مَبْرُوراً، وَقُرْآنَنا مَرْفُوعاً، وَدُعاءَنا مَسْمُوعاً، وَاهْدِنا لِلْحُسْنى، وَجَنِّبْنَا الْعُسْرى، وَيَسِّرْنا لِلْيُسْرى، وَاَعِلْ لَنَا الدَّرَجاتِ، وَضاعِفْ لَنا الْحَسَناتِ، وَاقْبَلْ مِنَّا الصَّوْمَ وَالصَّلاةَ، واسْمَعْ مِنَّا الدَّعَواتِ، وَاغْفِرْ لَنَا الْخَطيئاتِ، وَتَجاوَزْ عَنَّا السَّيِّئاتِ، وَاجْعَلْنا مِنَ الْعامِلينَ الْفائِزينَ، وَلا تَجْعَلْنا مِنَ الْمَغْضُوبِ عَلَيْهِمْ وَلاَ الضّالّينَ، حَتّى يَنْقَضِيَ شَهْرُ رَمَضانَ عَنّا وَقَدْ قَبِلْتَ فيهِ صِيامَنا وَقِيامَنا، وَزَكَّيْتَ فيهِ اَعْمالَنا، وَغَفَرْتَ فيهِ ذُنوبَنا، وَاَجْزَلْتَ فيهِ مِنْ كُلِّ خَيْر نَصيبَنا، فَاِنَّكَ الاِْلـهُ الُْمجيبُ، وَالرَّبُّ الْقَريبُ، وَاَنْتَ بِكُلِّ شَيْء مُحيطٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني عشر :',
                  subtitle:
                      'أن يدعو بهذا الدّعاء المأثور عن الصّادق (عليه السلام) المروي في كتاب الاقبال :\n\n'
                      'اَللّـهُمَّ رَبَّ شَهْرِ رَمَضانَ، مُنَزِّلَ الْقُرْآنِ، هذا شَهْرُ رَمَضانَ الَّذي اَنْزَلْتَ فيهِ الْقُرْآنَ، وَاَنْزَلْتَ فيهِ آيات بَيِّنات مِنَ الْهُدى وَالْفُرْقانِ، اَللّـهُمَّ ارْزُقْنا صِيامَهُ، وَاَعِنّا عَلى قِيامِهِ، اَللّـهُمَّ سَلِّمْهُ لَنا وَسَلِّمْنا فيهِ وَتَسَلَّمْهُ مِنّا في يُسْر مِنَكَ وَمُعافاة، وَاجْعَلْ فيـما تَقْضي وَتُقَدِّرُ مِنَ الاَمْرِ الَْمحْتُومِ وَفيـما تَفْرُقُ مِنَ الاَمْرِ الْحَكيمِ في لَيْلَةِ الْقَدْرِ مِنَ الْقَضاءِ الَّذي لا يُرَدُّ وَلا يُبَدَّلُ، اَنْ تَكْتُبَني مِنْ حُجّاجِ بَيْتِكَ الْحَرامِ الْمَبْرُورِ حَجُّهُمُ، الْمَشْكُورِ سَعْيُهُمُ، الْمَغْفُورِ ذُنُوبُهُمُ، الْمُكَفَّرِ عَنْهُمْ سَيِّئاتُهُمْ، وَاجْعَلْ فيـما تَقْضي وَتُقَدِّرُ اَنْ تُطيلَ عُمْري وَتُوَسِّعَ عَليَّ مِنَ الرِّزْقِ الْحَلالِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث عشر :',
                  subtitle:
                      'أن يدعو بالدّعاء الرابع والاربعين من أدعية الصّحيفة الكاملة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع عشر :',
                  subtitle:
                      'أن يدعو بالدّعاء الطّويل اَللّـهُمَّ اِنَّه قَد دَخَلَ شَهْرُ رَمَضانَ … الخ ، الذي رواه السيّد في الاقبال.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس عشر :',
                  subtitle:
                      'يقول : اَللّـهُمَّ اِنَّ هذا شَهْرُ رَمَضانَ اَللّـهُمَّ رَبَّ شَهْرِ رَمَضانَ، الَّذي اَنزَلْتَ فيهِ الْقُرْآنَ، وَجَعَلْتَهُ بَيِّنات مِنَ الْهُدى وَالْفُرْقانِ، اَللّـهُمَّ فَبارِكْ لَنا في شَهْرِ رَمَضانَ، وَاَعِنّا عَلى صِيامِهِ وَصَلَواتِهِ وَتَقَبَّلْهُ مِنّا، ففي الحديث انّ النّبي (صلى الله عليه وآله وسلم)كان اذا دخل شهر رمضان دعا بهذا الدّعاء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس عشر :',
                  subtitle:
                      'عن النّبي (صلى الله عليه وآله وسلم) ايضاً انّه كان يدعو في أوّل ليلة من شهر رمضان فيقول :\n\n'
                      'اَلْحَمْد للهِ الَّذي اَكْرَمَنا بِكَ اَيُّهَا الشَّهرُ الْمُبارَكُ، اَللّـهُمَّ فَقَوِّنا عَلى صِيامِنا وَقِيامِنا، وَثبِّتْ اَقْدامَنا وَانْصُرْنا عَلَى الْقَوْمِ الْكافِرينَ، اَللّـهُمَّ اَنْتَ الْواحِدُ فَلا وَلَدَ لَكَ، واَنْتَ الصَّمَدُ فلا شِبْهَ لَكَ، واَنْتَ الْعَزيزُ فَلا يُعِزُّكَ شَيْءٌ، وَاَنْتَ الْغَنِيُّ وَاَنَا الْفَقير، وَاَنْتَ الْمَوْلى وَاَنا الْعَبْدُ، واَنْتَ الْغُفورُ وَاَنا الْمُذْنِبُ، وَاَنْتَ الرَّحيمُ وَاَنَا الُْمخْطِئُ، وَاَنْتَ الْخالِقُ وَاَنَا الَْمخْلُوقُ، وَاَنْتَ الْحَيُّ وَاَنَا الْمَيِّتُ، اَسْاَلُكَ بِرَحْمَتِكَ اَنْ تَغْفِرَ لي وَتَرْحَمَني، وَتَجاوَزَ عَنّي اِنَّكَ عَلى كُلِّ شَيْء قَديرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع عشر :',
                  subtitle:
                      'قد مرّ في الباب الاوّل من الكتاب استحباب أن يدعو بدعاء الجوشن الكبير في أوّل ليلة من رمضان.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن عشر :',
                  subtitle: 'أن يدعو بدعاء الحجّ الذي مرّ في أوّل الشّهر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التاسع عشر :',
                  subtitle:
                      'ينبغي الاكثار من تلاوة القرآن اذا دخل شهر رمضان، وروي انّ الصّادق (عليه السلام) كان يقول قبلما يتلو القرآن :\n\n'
                      'اَللّـهُمَّ اِنّي اَشْهَدُ اَنَّ هذا كِتابُكَ الْمُنْزَلُ مِنْ عِنْدِكَ عَلى رَسُولِكَ مُحَمَّدِ بْنِ عَبْدِاللهِ صَلَّى اللهُ عَلَيْهِ وآلِهِ، وَكَلامُكَ النّاطِقُ عَلى لِسانِ نَبِيِّكَ، جَعَلْتَهُ هادِياً مِنْكَ اِلى خَلْقِكَ، وَحَبْلاً مُتَّصِلاً فيـما بَيْنَكَ وَبَيْنَ عِبادِكَ، اَللّـهُمَّ اِنّي نَشَرْتُ عَهْدَكَ وَكِتابَكَ، اَللّـهُمَّ فَاجْعَلْ نَظَري فيهِ عِبادَةً، وَقِراءَتي فيهِ فِكْراً، وَفِكْري فيهِ اعْتِباراً، وَاجْعَلْني مِمَّنْ اتَّعَظَ بِبَيانِ مَواعِظِكَ فيهِ، وَاجْتَنَبَ مَعاصيكَ، وَلا تَطْبَعْ عِنْدَ قِراءَتي عَلى سَمْعي، وَلا تَجْعَلْ عَلى بَصَري غِشاوَةً، وَلا تَجْعَلْ قِراءَتي قِراءَةً لا تَدَبُّرَ فيها، بَلِ اجْعَلْني اَتَدَبَّرُ آياتِهِ وَاَحْكامَهُ، آخِذاً بِشَرايِعِ دينِكَ، وَلا تَجْعَلْ نَظَري فيهِ غَفْلَةً، وَلا قِراءَتي هَذَراً، اِنَّكَ اَنْتَ الرَّؤوفُ الرَّحيمُ.\n\n'
                      'ويقول بعدما فرغ من تلاوته :\n\n'
                      'اَللّـهُمَّ اِنّي قَدْ قَرَأتُ ما قَضَيْتَ مِنْ كِتابِكَ الَّذي اَنْزَلْتَهُ عَلى نَبِيِّكَ الصّادِقِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ، فَلَكَ الْحَمْدُ رَبَّنا، اَللّـهُمَّ اجْعَلْني مِمَّنْ يُحِلُّ حَلالَهُ، وَيُحَرِّمُ حَرامَهُ، وَيُؤْمِنُ بِمُحْكَمِهِ وَمُتَشابِهِه، وَاجْعَلْهُ لي اُنْساً في قَبْري، وَاُنْساً في حَشْري، وَاجْعَلْني مِمَّنْ تُرْقيهِ بِكُلِّ آيَة قَرَأها دَرَجَةً في اَعْلا عِلِّيّينَ، آمينَ رَبَّ الْعالَمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Allayla2alsalisa3ashar.screenRoute,
          pushBack: Allayla2alsalasin.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الليلة الاولى.mp3',
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
