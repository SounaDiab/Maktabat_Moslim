import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:maktabat_almoslim/widgets/she3er.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'al2oula_almo5asasa.dart';
import 'alziyarat_almotlaka_alsabi3a.dart';

class ZiyaratAl3abasBen3ali extends StatefulWidget {
  static String screenRoute = 'ziyarat_al3abas_ben_3ali_screen';
  const ZiyaratAl3abasBen3ali({super.key});

  @override
  State<ZiyaratAl3abasBen3ali> createState() => _ZiyaratAl3abasBen3aliState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratAl3abasBen3aliState extends State<ZiyaratAl3abasBen3ali> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_al3abas_ben_3ali_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_al3abas_ben_3ali_screen', value);
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
          .pushReplacementNamed(ZiyaratAlhousseinWa2adabiha.screenRoute);
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
                          'زيارة العباس بن علي بن ابي طالب (عليه السلام)',
                          ZiyaratAl3abasBen3ali.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة العباس بن علي بن ابي طالب (عليه السلام)',
                          ZiyaratAl3abasBen3ali.screenRoute,
                          ZiyaratAl3abasBen3ali.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة العباس بن علي بن ابي طالب (عليه السلام)',
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
                      'روى الشّيخ الاجلّ جعفر بن قولويه القمّي بسند معتبر عن أبي حمزة الثّمالي عن الصّادق (عليه السلام) قال : اذا أردت زيارة قبر العبّاس بن علي وهو على شطّ الفرات بحذاء الحبر فقف على باب السّقيفة (الرّوضة) وقُل:\n\n'
                      'سَلامُ اللهِ وَسَلامُ مَلائِكَتِهِ الْمُقَرَّبينَ وَاَنْبِيائِهِ الْمُرْسَلينَ وَعِبادِهِ الصّالِحينَ وَجَميعِ الشُّهَداءِ وَالصِّدّيقينَ، وَالزَّاكِياتُ الطَّيِّباتُ فيـما تَغْتَدي وَتَرُوحُ عَلَيْكَ يَا بْنَ اَميرِ الْمُؤْمِنينَ، اَشْهَدُ لَكَ بِالتَّسْليمِ وَالتَّصْديقِ وَالْوَفاءِ وَالنَّصيحَةِ لِخَلَفِ النَّبِيِّ صَلَّى اللهُ عَلَيْهِ وَآلِهِ الْمُرْسَلِ، وَالسِّبْطِ الْمُنْتَجَبِ، وَالدَّليلِ الْعالِمِ، وَالْوَصِيِّ الْمُبَلِّغِ، وَالْمَظْلُومِ الْمُهْتَضَمِ، فَجَزاكَ اللهُ عَنْ رَسُولِهِ وَعَنْ اَميرِ الْمُؤْمِنينَ وَعَنِ الْحَسَنِ وَالْحُسَيْنِ صَلَواتُ اللهِ عَلَيْهِمْ اَفْضَلَ الْجَزاءِ بِما صَبَرْتَ وَاحْتَسَبْتَ وَاَعَنْتَ فَنِعْمَ عُقْبَى الدّارِ، لَعَنَ اللهُ مَنْ قَتَلَكَ وَلَعَنَ اللهُ مَنْ جَهِلَ حَقَّكَ وَاسْتَخَفَّ بِحُرْمَتِكَ، وَلَعَنَ اللهُ مَنْ حالَ بَيْنَكَ وَبَيْنَ ماءِ الْفُراتِ، اَشْهَدُ اَنَّكَ قُتِلْتَ مَظْلُوماً، وَاَنَّ اللهَ مُنْجِزٌ لَكُمْ ما وَعَدَكُمْ، جِئْتُكَ يَا بْنَ اَميرِ اْلُمْؤْمِنينَ وَافِداً اِلَيْكُمْ، وَقَلْبي مُسَلِّمٌ لَكُمْ وَتابِعٌ، وَاَنَا لَكُمْ تابِـعٌ وَنُصْرَتي لَكُمْ مُعَدَّةٌ حَتّى يَحْكُمَ اللهُ وَهُوَ خَيْرُ الْحاكِمينَ، فَمَعَكُمْ مَعَكُمْ لا مَعَ عَدُوِّكُمْ اِنّي بِكُمْ وَبِإيابِكُمْ مِنَ الْمُؤْمِنينَ، وَبِمَنْ خالَفَكُمْ وَقَتَلَكُمْ مِنَ الْكافَرينَ، قَتَلَ اللهُ اُمَّةً قَتَلَتْكُمْ بِالاَْيْدي وَ الاَْلْسُنِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'ثمّ ادخل فانكبّ على القبر وقُل :',
                  subtitle:
                      'اَلسَّلامُ عَلَيْكَ اَيُّهَا الْعَبْدُ الصّالِحُ الْمُطيعُ للهِ وَلِرَسُولِهِ وَلاَِميرِالْمُؤْمِنينَ وَالْحَسَنِ والْحُسَيْنِ صَلَّى اللهُ عَلَيْهِمْ وَسَلَّمَ، اَلسَّلامُ عَلَيْكَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ وَمَغْفِرَتُهُ وَرِضْوانُهُ وَعَلى رُوحِكَ وَبَدَنِكَ، اَشْهَدُ و اُشْهِدُ اللهَ اَنَّكَ مَضَيْتَ عَلى ما مَضى بِهِ الْبَدْرِيُّونَ وَالُْمجاهِدُونَ فِي سَبيلِ اللهِ الْمُناصِحُونَ لَهُ فِي جِهادِ اَعْدائِهِ الْمُبالِغُونَ فِي نُصْرَةِ اَوْلِيائِهِ الذّابُّونَ عَنْ اَحِبّائِهِ فَجَزاكَ اللهُ اَفْضَلَ الْجَزاءِ، وَاَكْثَرَ الْجَزاءِ، وَاَوْفَرَ الْجَزاءِ، وَاَوْفى جَزاءِ اَحَد مِمَّنْ وَفى بِبَيْعَتِهِ وَاسْتَجابَ لَهُ دَعْوَتَهُ وَاَطاعَ وُلاةَ، اَمْرِهِ اَشْهَدُ اَنَّكَ قَدْ بالَغْتَ فِي النَّصيحَةِ، وَاَعْطَيْتَ غايَةَ اْلَْمجْهُودِ، فَبَعَثَكَ اللهُ فِي الشُّهَداءِ، وَجَعَلَ رُوحَكَ مَعَ اَرْواحِ السُّعَداءِ، وَاَعْطاكَ مِنْ جِنانِهِ اَفْسَحَها مَنْزِلاً وَاَفْضَلَها غُرَفاً، وَرَفَعَ ذِكْرَكَ فِي عِلِّيّينَ، وَحَشَرَكَ مَعَ النَّبِيّينَ وَالصِّدّيقينَ وَالشُّهَداءِ وَالصّالِحينَ وَحَسُنَ اُولئِكَ رَفيقاً، اَشْهَدُ اَنَّكَ لَمْ تَهِنْ وَلَمْ تَنْكُلْ، وَاَنَّكَ مَضَيْتَ عَلى بَصيرَة مِنْ اَمْرِكَ مُقْتَدِياً بِالصّالِحينَ، وَمُتَّبِعاً لِلنَّبِيّينَ، فَجَمَعَ اللهُ بَيْنَنا وَبَيْنَكَ وَبَيْنَ رَسُولِهِ وَاَوْلِيائِهِ فِي مَنازِلِ الُْمخْبِتينَ، فَاِنَّهُ اَرْحَمُ الرّاحِمينَ.\n\n'
                      'أقول : مِن المستحسن أن يُزار بهذه الزّيارة خلف القبر مستقبل القبلة كما قال الشّيخ في التّهذيب ، ثمّ ادخل فانكبّ على القبر وقُل وأنت مستقبل القبلة : اَلسَّلامُ عَلَيْكَ اَيُّهَا الْعَبْدُ الصّالِحُ، واعلم ايضاً انّ الى هُنا تنتهي زيارة العبّاس على الرّواية السّالفة ولكن السّيد ابن طاوُس والشّيخ المفيد وغيرهما ذيلوها قائلين: ثمّ انحرف الى عند الرّأس فصلّ ركعتين ثمّ صلّ بعدهما ما بدا لك وادعُ الله كثيراً وقُل عقيب الرّكعات :\n\n'
                      'اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَلا تَدَعْ لي فِي هذَا الْمَكانِ الْمُكَرَّمِ وَالْمَشْهَدِ الْمُعَظَّمِ ذَنْباً اِلاّ غَفَرْتَهُ، وَلا هَمّاً اِلاّ فَرَّجَتَهُ، وَلا مَرَضاً اِلاّ شَفَيْتَهُ، وَلا عَيْباً اِلاّ سَتَرْتَهُ، وَلا رِزْقاً اِلاّ بَسَطْتَهُ، وَلا خَوْفاً الاّ آمَنْتَهُ، وَلا شَمْلاً اِلاّ جَمَعْتَهُ، وَلا غائِباً اِلاّ حَفَظْتَهُ وَاَدْنَيْتَهُ، وَلا حاجَةً مِنْ حَوائِجِ الدُّنْيا وَالاْخِرَةِ لَكَ فيها رِضىً وَلِيَ فيها صَلاحٌ اِلاّ قَضَيْتَها يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'ثمّ عُد الى الضّريح فقف عند الرّجلين وقُل :',
                  subtitle:
                      'اَلسَّلامُ عَلَيْكَ يا اَبَا الْفَضْلِ الْعَبّاسَ ابْنَ اَميرِ الْمُؤْمِنينَ، اَلسَّلامُ عَلَيْكَ يَا بْنَ سَيِّدِ الْوَصِيّينَ، اَلسَّلامُ عَلَيْكَ يَا بْن  اَوَّلِ الْقَوْمِ اِسْلاماً وَاَقْدَمِهِمْ ايماناً وَاَقْوَمِهِمْ بِدينِ اللهِ، وَاَحْوَطِهِمْ عَلَى الاِْسْلامِ، اَشْهَدُ لَقَدْ نَصَحْتَ للهِ وَلِرَسُولِهِ وَلاَِخيكَ فَنِعْمَ الاَْخُ الْمُواسي، فَلَعَنَ اللهُ اُمَّةً قَتَلَتْكَ، وَلَعَنَ اللهُ اُمَّةً ظَلَمَتْكَ، وَلَعَنَ اللهُ اُمَّةً اسْتَحَلَّتْ مِنْكَ الَْمحارِمَ، وَانْتَهَكَتْ حُرْمَةَ الاِْسْلامِ، فَنِعْمَ الصّابِرُ الُْمجاهِدُ الُْمحامِي النّاصِرُ وَالاَْخُ الدّافِعُ عَنْ اَخيهِ، الُْمجيبُ اِلى طاعَةِ رَبِّهِ، الرّاغِبُ فيـما زَهِدَ فيهِ غَيْرُهُ مِنَ الثَّوابِ '
                      'الْجَزيلِ وَالثَّناءِ الْجَميلِ، وَاَلْحَقَكَ اللهُ بِدَرَجَةِ آبائِكَ فِي جَنّاتِ النَّعيمِ، اَللّـهُمَّ اِنّي تَعَرَّضْتُ لِزِيارَةِ اَوْلِيائِكَ رَغْبَةً فِي ثَوابِكَ وَرَجاءً لِمَغْفِرَتِكَ وَجَزيلِ اِحْسانِكَ، فَاَسْاَلُكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِهِ الطّاهِرينَ، وَاَنْ تَجْعَلَ رِزْقي بِهِمْ دارّاً وَعَيْشي بِهِمْ قارّاً، وَزِيارَتي بِهِمْ مَقْبُولَةً وَحَياتي بِهِمْ طَيِّبَةً، وَاَدْرِجْني اِدْراجَ الْمُكْرَمينَ، وَاجْعَلْني مِمَّنْ يَنْقَلِبُ مِنْ زِيارَةِ مَشاهِدِ اَحِبّائِكَ مُفْلِحاً مُنْجِحاً، قَدِ اسْتَوْجَبَ غُفْرانَ الذُّنُوبِ وَسَتْرَ الْعُيُوبِ وَكَشْفَ الْكُرُوبِ، اِنَّكَ اَهْلُ التَّقْوى وَاَهْلُ الْمَغْفِرَةِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title:
                      'فاذا أردت وداعه فادنُ من القبر الشّريف وودّعه بما وَرد في رواية أبي حمزة الثّمالي وذكره العلماء أيضاً :',
                  subtitle:
                      'اَسْتَوْدِعُكَ اللهَ وَاَسْتَرْعيكَ وَاَقْرَأُ عَلَيْكَ اَلسَّلامَ، آمَنّا بِاللهِ وَبِرَسُولِهِ وَبِكِتابِهِ وَبِما جاءَ بِهِ مِنْ عِنْدِ اللهِ، اَللّـهُمَّ فَاكْتُبْنا مَعَ الشّاهِدينَ، اَللّـهُمَّ لا تَجْعَلْهُ آخِرَ الْعَهْدِ مِنْ زِيارَتي قَبْرَ ابْنِ اَخي رَسُولِكَ صَلَّى اللهُ عَلَيْهِ وَآلِهِ، وَارْزُقْني زِيارَتَهُ اَبَداً ما اَبْقَيْتَني وَاحْشُرْني مَعَهُ وَمَعَ آبائِهِ فِي الجِنانِ، وَعَرِّفْ بَيْني وَبَيْنَهُ وَبَيْنَ رَسُولِكَ وَاَوْلِيائِكَ، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَتَوَفَّني عَلَى الاْيمانِ بِكَ وَالتَّصْديقِ بِرَسُولِكَ وَالْوِلايَةِ لِعَليِّ بْنِ اَبي طالِب وَالاَْئِمَّةِ مِنْ وُلْدِهِ عَلَيْهِمُ السَّلامُ وَالْبَراءَةِ مِنْ عَدُوِّهِمْ، فَاِنّي قَدْ رَضيتُ يا رَبِّي بِذلِكَ، وَصَلَّى اللهُ عَلى مُحَمَّد وَآلِ مُحَمَّد.\n\n'
                      'ثمّ ادعُ لنفسك ولابويك وللمؤمنين والمسلمين واختر من الدّعاء ما شئت.\n\n'
                      'أقول : في رواية عن السّجاد صلوات الله وسلامه عليه قال : رحم الله العبّاس فلقد آثر وفدى أخاه بنفسه حتّى قطعت يداهُ فأبدله الله عزّوجل بهما جناحين يطير بهما مع الملائكة في الجنّة كما جعل لجعفر بن أبي طالب (عليهما السلام) وانّ للعبّاس (عليه السلام)عند الله تبارك وتعالى منزلة يغبطه بها جميع الشّهداء يوم القيامة.\n\n'
                      'وروى انّ العبّاس (عليه السلام) استشهد وله من العُمر أربع وثلاثون سنة وانّ اُمّه امّ البنين كانت تخرج لرثاء العبّاس (عليه السلام)واخوته الى البقيع فتبكي وتندب، فتُبكي كلّ من يمرّ بها ولا يستغرب البكاء من الموالي فقد كانت امّ البنين تُبكي مروان بن الحكم اذا مرّ بها وشاهد شجُوها وهو أكبر المعادين لال بيت الرّسول (صلى الله عليه وآله وسلم)، ومن قول امّ البنين في رثاء أبي الفضل العبّاس وسائر ابنائها :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'يا مَنْ رَاَى الْعَبّاسَ كَرَّ عَلى جَماهيرِ النَّقَدْ\n'
                      'وَوَراهُ مِنْ اَبْناءِ حَيْدَرَ كُلّ لَيْث ذي لَبَدْ\n\n'
                      'اُنْبِئْتُ اَنَّ ابْني اُصيبَ بِرَأسِهِ مَقْطُوعَ يَدْ\n'
                      'وَيْلي عَلى شِبْلي اَمالَ بِرَأسِهِ ضَرْبُ الْعَمَدْ\n\n'
                      'لَوْ كانَ سَيْفُكَ فِي يَدَيْكَ لَما دَنا مِنْهُ اَحَدْ',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: Text(
                  'ولها ايضاً :',
                  style: TextStyle(
                    fontSize: isTablet ? 40 : 18,
                    fontWeight: FontWeight.w900,
                    color: Colors.green,
                  ),
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'لا تَدْعُوَنّي وَيْكِ اُمَّ الْبَنينْ   تُذَكِّريني بِلُيُوثِ الْعَرينْ\n\n'
                      'كانَتْ بَنُونَ لِيَ اُدْعى بِهِمْ   وَالْيَوْمَ اَصْبَحْتُ وَلا مِنْ بَنينْ\n\n'
                      'اَرْبَعَةٌ مِثْلُ نُسُورِ الرُّبى   قَدْ واصَلُوا الْمَوْتَ بِقَطْعِ الْوَتينْ\n\n'
                      'تَنازَعَ الْخِرْصانُ اَشْلاءَهُمْ   فَكُلُّهُمْ اَمْسى صَريعاً طَعينْ\n\n'
                      'يا لَيْتَ شِعْري اَكَما اَخْبَرُوا   بِاَنَّ عَبّاساً قَطيعُ الَْيمينْ',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Al2oulaAlmo5asasa.screenRoute,
          pushBack: AlziyaratAlmotlakaAlsabi3a.screenRoute,
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
