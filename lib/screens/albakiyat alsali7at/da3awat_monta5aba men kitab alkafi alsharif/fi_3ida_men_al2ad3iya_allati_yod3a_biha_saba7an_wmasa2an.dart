import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../da3awat_monta5aba_men_kitab_alkafi_alsharif.dart';
import 'dou3a2_al2i7tijab_amir_almo2minin.dart';
import 'fi_ad3iya_yod3a_bha_3ind_alnom_w3ind_l2intibah_menh.dart';

class Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an extends StatefulWidget {
  static String screenRoute =
      'fi_3ida_men_al2ad3iya_allati_yod3a_biha_saba7an_wmasa2an_screen';
  const Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an({super.key});

  @override
  State<Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an> createState() =>
      _Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2anState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2anState
    extends State<Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_3ida_men_al2ad3iya_allati_yod3a_biha_saba7an_wmasa2an_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_3ida_men_al2ad3iya_allati_yod3a_biha_saba7an_wmasa2an_screen',
        value);
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
          Da3awatMonta5abaMenKitabAlkafiAlsharif.screenRoute);
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
                          'في عدة من الادعية التي يدعى بها صباحاً ومساءً',
                          Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في عدة من الادعية التي يدعى بها صباحاً ومساءً',
                          Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an
                              .screenRoute,
                          Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an
                              .screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في عدة من الادعية التي يدعى بها صباحاً ومساءً',
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
                  title: 'عبر ما مر وهي عشرة :\n'
                      'الأول :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : كان علي بن الحسين (عليه السلام) إذا أصبح قال : أبْتَدي يَومي هذا بَيْنَ يَدي نِسْياني وَعَجَلَتي بِسْمِ الله وَماشاءَ اللّهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : من قال هذا القول ثلاث مرات حين يمسي حفّ بجناح من أجنحة جبرائيل حتى يصبح: أستَوْدِعُ الله العَليَّ الاعْلى الجَليلَ العَظيمَ نَفْسي وَمَنْ يَعْنيني أمْرُهُ، أسْتَودُعُ الله نَفْسي المَرْهوبَ الَمخُوفَ المُتَضَعْضَعَ لِعَظَمَتِهِ كُلُّ شَيٍ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'وعنه (عليه السلام) أيضاً قال: إذا أمسيت فقل : اللّهُمَّ إِنِّي أَسْأَلُكَ عِنْدَ إقْبالِ لَيْلِكَ وَإدْبارِ نَهارِكَ وَحُضورِ صَلَواتِكَ وَأصْواتِ دُعاتِكَ أنْ تُصَلّي عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ، وادع بما شئت.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'عن الصادق (عليه السلام) قال : كان أبي (عليه السلام) يقول إذا أصبح : بِسْمِ الله وَبالله وإِلى الله وَفي سَبيلِ الله وَعَلى مِلَّةِ رَسولِ الله صَلّى الله عَلَيْهِ وَآلِهِ وَسَلَّمْ، اللّهُمَّ إلَيكَ أسْلَمْتُ نَفْسي وَإلَيْكَ فَوَّضْتُ أمْري وَعَلَيْكَ تَوَكَّلْتُ يارَبَّ العالَمينَ، اللّهُمَّ إحْفَظْني بِحِفْظِ الايمانِ مِنْ بَيْنِ يَدَيَّ وَمِنْ خَلْفي وَعَنْ يَميني وَعَنْ شِمالي وَمِنْ فَوْقي وَمِنْ تَحْتي وَمِنْ قِبَلي. لا إلهَ إِلاّ أنْتَ لاحَوْلَ وَلاقوَّةَ إِلاّ بِالله ، نَسْأَلُكَ العَفْوَ وَالعافيَةَ مِنْ كُلِّ سوءٍ وَشَرٍّ في الدُّنْيا وَالاخِرَةِ.\n\n'
                      'اللّهُمَّ إِنِّي أعوذُ بِكَ مِنْ عَذابِ القَبْرِ وَمِنْ ضَغْطَةِ القَبْرِ وَمِنْ ضِيقِ القُبورِ أعوذُ بِكَ مِنْ سَطَواتِ اللَّيْلِ وَالنَّهارِ. اللّهُمَّ رَبَّ المَشْعَرِ الحَرامِ وَرَبَّ البَلَدِ الحَرامِ وَرَبَّ الحِلِّ وَالاحْرامِ أبْلِغْ مُحَمَّداً وَآلَ مُحَمَّدٍ عَنّي السَّلامَ. اللّهُمَّ إِنِّي أعوذُ بِدِرْعِكَ الحَصينَةَ وَأعوذُ بِجَمْعِكَ أنْ تُميتَني غَرْقا أوْ حَرْقا أوْ شَرْقا أوْ قَوْداً أوْ صَبْراً أوْ مُسَمّا أوْ تَرَدّيا في بِئْرٍ أوْ أكيلَ السَّبُعِ أوْ موتَ الفُجأَةِ أوْ بِشَيٍ مِنْ ميتاتِ السَّوءِ، وَلكِنْ أمِتْني عَلى فِراشي في طاعاتِكَ وَطاعَةِ رَسولِكَ صَلّى الله عَلَيْهِ وَآلِهِ وَسَلَّمْ مُصيباً لِلْحَقِّ غَيْرَ مُخْطيٍ، أوْ في الصَفِّ الَّذينَ نَعَتَّهُمْ في كِتابِكَ كَأنَّهُمْ بُنْيانٌ مَرْصوصٌ، أعيذُ نَفْسي وَولَدي وَما رَزَقَني رَبّي بِقُلْ أعوذُ بِرَبِّ الفَلَقْ… الى اخر السورة.\n\n'
                      'وأعيذُ نَفْسي وَولَدي وَمارَزَقَني رَبِّي بِقُلْ أعوذُ بِرَبِّ النّاسِ… الى اخر السورة، وتقول: الحَمْدُ لله عَدَدَ ما خَلَقَ الله ، وَالحَمْدُ لله مِثْلَ ماخَلَقَ الله ، وَالحَمْدُ لله مِلأ ماخَلَقَ الله ، وَالحَمْدُ لله مِدادَ كَلِماتِهِ، وَالحَمْدُ لله زِنَةَ عَرْشِهِ، وَالحَمْدُ لله رِضا نَفْسِهِ، وَلا إلهَ إِلاّ الله الحَليمُ الكَريمُ، وَلا إلهَ إِلاّ الله العَليّ العَظيمِ. سُبْحانَ الله رَبِّ السَّماواتِ وَالارَضينَ وَمابَيْنَهُما وَرَبَّ العَرْشِ العَظيمِ. اللّهُمَّ إِنِّي أعوذُ بِكَ مِنْ دَرَكِ الشَّقاءِ وَمِنْ شَماتَةِ الأعْداءِ، وَأعوذُ بِكَ مِنْ الفَقْرِ وَالوَقَرِ وَأعوذُ بِكَ مِنْ سوءِ المَنْظَرِ في الاهْلِ وَالمالِ وَالوَلَدِ. وتصلي على محمد واَّل محمد عشر مرات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'عن الصادق (عليه السلام) أيضاً قال : إذا صلّيت المغرب والغداة فقل سبع مرات : بِسْمِ الله الرَّحْمنِ الرَّحيمِ لاحَوْلَ وَلاقوَّةَ إِلاّ بِالله العَليّ العَظيمِ، فإنه من قاله، لم يصبه جذام، ولا برص، ولا جنون، ولا سبعون نوعا من أنواع البلاء.\n\n'
                      'وتقول إذا أصبحت وأمسيت : الحَمْدُ لِرَبِّ الصَباحِ الحَمْدُ لِفالِقْ الاصْباحِ مرتين، الحَمْدُ لله الَّذي أذْهَبَ اللَّيلَ بِقُدْرَتِهِ وَجاءَ بِالنَّهارِ بِرَحْمَتِهِ وَنَحْنُ في عافيَةٍ، وتقرأ آية الكرسي، واَّخر الحشر، وعشر اَّيات من الصافات و : سُبْحانَ رَبِّكَ رَبِّ العِزَّةِ عَمّا يَصِفُونَ وَسَلامٌ عَلى المُرْسَلينَ وَالحَمْدُ لله رَبِّ العالَمينَ فَسُبْحانَ الله حينَ تُمْسونَ وَحينَ تُصْبِحونَ وَلَهُ الحَمْدُ في السَّماواتِ وَالارضِ وَعَشِيا وَحينَ تُظْهِرونَ. يُخْرِجْ الحَيَّ مِنَ المَيِّتِ وَيُخرِجَ المَيِّتَ مِنَ الحَيِّ وَيُحْيي الارضَ بَعْدَ مَوتِها وَكَذلِكَ تُخْرَجونَ سُبُّوحٌ قُدُّوسٌ رَبُّنا وَرَبُّ المَلائِكَةِ وَالرُّوحِ. سَبِقَتْ رَحْمَتُكَ غَضَبَكَ، لا إلهَ إِلاّ أنْتَ سُبْحانَكَ إِنِّي ظَلَمْتُ نَفْسي، فَاغْفِرْ لي وإرْحَمْني وَتُبْ عَليَّ إنَّكَ أنْتَ التَّوابُ الرَّحيمُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'أيضاً روي عن الصادق (عليه السلام) هذا الدعاء للصباح : اللّهُمَّ لَكَ الحَمْدُ أحْمُدَكَ وَأسْتَعينُكَ وَأنْتَ رَبّي وَأنا عَبْدُكَ أصْبَحْتُ عَلى عَهْدِكَ وَوَعْدِكَ وَأومِنُ بِوَعْدِكَ وَأوْفي بِعَهْدِكَ ماأسْتَطَعْتُ، وَلاحَوْلَ وَلاقوَّةَ إِلاّ بِالله وَحْدَهُ لاشَريكَ لَهُ، وَأشْهَدُ أنَّ مُحَمَّداً عَبْدُهُ وَرَسولُهُ، أصْبَحْتُ عَلى فِطْرَةِ الاِسْلامِ وَكَلِمَةِ الاخْلاصِ وَمِلَّةِ إبْراهيمَ وَدينِ مُحَمَّدٍ صَلَواتُ الله عَلَيْهِما وَآلِهِما ؛ عَلى ذلِكَ أحْيى وَأموتُ إنْ شاءَ اللّهِ.\n\n'
                      'اللّهُمَّ أحْيني ماأحْيَتْنَي وَأمِتْني إذا أمَتَّني عَلى ذلِكَ، وَابْعَثْني إذا بَعَثْتَني عَلى ذلِكَ. أبْتَغي بِذلِكَ رِضْوانَكَ وَاتّباعَ سَبيلِكَ، إلَيْكَ أَلْجأتُ ظَهْري وَإلَيْكَ فَوَّضْتُ أمْري، آلُ مُحَمَّدٍ أَئِمَّتِي لَيْسَ لي أئِمَّةً غَيْرُهُمْ، بِهِمْ أئْتَمُّ وَإيّاهُمْ أتَوَلّى وَبِهِمْ أقْتَدي، اللّهُمَّ إجْعَلْهُمْ أوليائي في الدُّنْيا وَالاخِرَةَ، وَإجْعَلْني أوالي أَوْلياَئهُمْ وَأعادي أعدائَهُمْ في الدُّنْيا وَالاخِرَةِ وألْحَقْنِي بِالصالِحينَ وَآبائي مَعَهُمْ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'وعنه (عليه السلام) أيضاً قال : مهما تركت من شي فلا تترك أن تقول في كل صباح ومساء : اللّهُمَّ إِنِّي أصْبَحْتُ أسْتَغْفِرُكَ في هذا الصَّباحِ وَفي هذا اليَوْمِ لاجْلِ رَحْمَتِكَ وَأبْرَأُ إلَيْكَ مِنْ أهْلِ لَعْنَتِكَ، اللّهُمَّ إِنِّي أصْبَحْتُ أبْرَأُ إلَيْكَ في هذا اليَوْمِ وَفي هذا الصَّباحِ مِمَّنْ نَحْنُ بَيْنَ ظَهْرانيهِمْ مِنَ المُشْركينَ وَمِما كانوا يَعْبُدون إنَّهم كانوا قَوْمَ سَوءٍ فاسقينَ، اللّهُمَّ اجْعَلْ ما أنْزَلْتَ مِنَ السَّماء إِلى الارضِ في هذا الصَّباحِ وَفي هذا اليومِ بَرَكَةً عَلى أوْليائِكَ وَعِقابا عَلى أعْدائِكَ، اللّهُمَّ والِ مَنْ وَالاكَ وَعادِ مَنْ عاداكَ، اللّهُمَّ اخْتِمْ لي بالامنِ وَالايمانِ كُلَّما طَلَعَتِ الشَّمْسَ أوْ غَرَبَتْ، اللّهُمَّ اغْفِرْ لي ولوالدَيَّ وَإرْحَمْهُما كَما رَبَّياني صَغيراً، اللّهُمَّ اغْفِرْ للمؤمنينَ وَالمؤمناتِ وَالمُسلمينَ وَالمُسلماتِ الاحياءِ مِنْهُم وَالاموات، إنَّكَ تَعْلَمُ مُنْقَلَبُهُمْ وَمَثْواهُمْ، اللّهُمَّ احْفِظْ إمامَ المُسْلمينَ بِحِفْظِ الايمانِ وَإنْصُرْهُ نَصْراً عَزيزاً وَافْتَحْ لَهُ فَتْحاً يَسيراً وَاجْعَلْ لَهُ وَلَنا مِنْ لَدُنْكَ سُلْطانا نَصيراً، اللّهُمَّ إلْعَنْ فُلانا وَفُلانا والفِرَقَ الُمخْتَلِفة عَلى رَسولِكَ وَوِلاةِ الامرِ بَعْدَ رَسولِكَ وَالأَئِمَّةِ مِنْ بَعْدِهِ وَشيَعِهِمْ. وَأَسْأَلُكَ الزِّيادةَ مِنْ فَضْلِكَ وَالاقْرارَ بِما جاءَ بِهِ مِنْ عِنْدِكَ وَالتَّسليمَ لامْرِكَ وَالُمحافَظَةَ عَلى ماأمَرْتَ بِهِ، لا أبْتَغي بِهِ بَدَلاً ولا أشْتَري بِهِ ثَمَنا قَليلاً، اللّهُمَّ اهْدِني فيمَنْ هَدَيْتَ وَقِنِي شَرَّ ما قَضَيْتَ إنَّكَ تَقْضي وَلايُقْضى عَلَيْكَ ولايُذَلُّ مَنْ وَالَيتَ، تَبارَكْتَ وَتَعاليتَ سُبْحانَكَ رَبَّ البيتِ تَقَبَّلْ مِنّي دُعائي، وَماتَقَرَّبْتُ بِهِ إلَيْكَ مِنْ خَيْرِ فَضاعِفْهُ لي أضْعافاً كَبيرَةً، وَآتِنا مِنْ لَدُنْكَ أَجْراً عَظيما رَبِّ ماأحْسَنَ ماابْلَيْتَني وَأَعْظَمْ ماأعْطَيْتَني وأطْوَلَ ماعافَيْتَني وَأكْثَرَ ماسَتَرْتَ عَلي ! فَلَكَ الحَمْدُ ياإلهي كَثِيراً طَيِّباً مُبارَكاً عَلَيْهِ مِل السَّماواتِ ومِل الارضِ، ماشاءَ رَبّي وَرَضِي وَكَما يَنْبَغي لِوَجْهِ رَبّي ذي الجَّلالِ وَالاكرامِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن :',
                  subtitle:
                      'عن الباقر (عليه السلام) : من قال عند الطلوع الفجر : لا إلهَ إِلاّ الله وَحْدَهُ لاشَريكَ لَهُ لَهُ المُلْكُ وَلهُ الحَمْدُ يُحْيي ويُميتُ وَهوَ حَيّ لايَموتُ بِيَدِهِ الخَيْرُ وَهوَ عَلى كُلِّ شَيٍ قَديرٌ. عشر مرات، وصلّى عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ عشراً، وسبح خمسا وثلاثين مرة، وهلّل خمسا وثلاثين مرّة، وحمد الله خمسا وثلاثين مرّة لم يكتب في يومه ذلك من الغافلين وإن قاله ليلاً لم يكتب فيه من الغافلين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التاسع :',
                  subtitle:
                      'عن محمد بن فضيل قال : كتبت إلى محمد التقي (عليه السلام) أسأله أن يعلّمني دعاءً فكتب إليّ: تقول إذا أصبحت وأمسيت: الله الله الله رَبّي الرَّحْمنِ الرَّحيمُ لا أشْرِكُ بِهِ شَيْئاً. ثم تدعو بما بداً لك في حاجتك، فهذه الكلمات كمقدمه لطلب كل حاجة بإذن الله تعالى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العاشر :',
                  subtitle:
                      'روي أن الصادق (صلوات الله وسلامه عليه) قال لداود الرقّي: لاتدع أن تقول ثلاثا صباحاً وثلاثا مساءً: اللّهُمَّ اجْعَلْني في دِرْعِكَ الحَصينَةِ الَّتي تَجْعَلُ فيها مِنْ تُريدُ.\n\n'
                      'فقد قال أبي (عليه السلام) : إن هذا دعاء من الادعية المخزونة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext:
              FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh.screenRoute,
          pushBack:
              Dou3a2Al2i7tijabAmirAlmo2minin.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في عدة من الادعية يدعى بها صباحا ومساء.mp3',
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
