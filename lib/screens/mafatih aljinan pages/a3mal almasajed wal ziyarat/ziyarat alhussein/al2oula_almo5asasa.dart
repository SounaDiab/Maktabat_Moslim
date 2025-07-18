import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'alsania_almo5asasa.dart';
import 'ziyarat_al3abas_ben_3ali.dart';

class Al2oulaAlmo5asasa extends StatefulWidget {
  static String screenRoute = 'al2oula_almo5asasa_screen';
  const Al2oulaAlmo5asasa({super.key});

  @override
  State<Al2oulaAlmo5asasa> createState() => _Al2oulaAlmo5asasaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Al2oulaAlmo5asasaState extends State<Al2oulaAlmo5asasa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_al2oula_almo5asasa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_al2oula_almo5asasa_screen', value);
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
                          'الأولى المخصوصة: ما يزار بها (عليه لسلام) في أول رجب وفي النصف منه ومن شعبان',
                          Al2oulaAlmo5asasa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الأولى المخصوصة: ما يزار بها (عليه لسلام) في أول رجب وفي النصف منه ومن شعبان',
                          Al2oulaAlmo5asasa.screenRoute,
                          Al2oulaAlmo5asasa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الأولى المخصوصة: ما يزار بها (عليه لسلام) في أول رجب وفي النصف منه ومن شعبان',
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
                      'عن الصّادق (عليه السلام) قال : مَن زار الحسين صلوات الله عليه في اوّل يوم من رجب غفر الله له البتّة، وعن ابن ابي نصر قال : سألت الرّضا (عليه السلام) : أيّ الاوقات أفضل أن تزُور فيه الحسين (عليه السلام) ؟ قال : النّصف من رجب والنّصف من شعبان . وهذه الزّيارة التي سنذكرها هي على رأي الشّيخ المفيد والسّيد ابن طاوُس تخصّ اليوم الاوّل من رجب وليلة النّصف من شعبان ولكن الشّهيد اضاف اليها اوّل ليلة من رجب وليلة النّصف منه ونهاره، ويوم النّصف من شعبان فعلى رأيه الشّريف يُزار (عليه السلام) بهذه الزّيارة في ستّة أوقات.\n\n'
                      'وأمّا صفة هذه الزّيارة فهي كما يلي : اذا أردت زيارته (عليه السلام) في الاوقات المذكورة فاغتسل والبس أطهر ثيابك وقِف على باب قبّته مستقبل القبلة وسلّم على سيّدنا رسول الله وعليّ امير المؤمنين وفاطمة والحسن والحسين والائمة صلوات الله عليهم اجمعين، وسيأتي في الاستيذان لزيارة عرفة كيفيّة السّلام عليهم (عليهم السلام) ثمّ ادخل وقِف عند الضّريح المقدّس وقُل مائة مرّة : اَللهُ اَكْبَرُ ثمّ قُل :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يَا بْنَ رَسُولِ اللهِ، اَلسَّلامُ عَلَيْكَ يا بْنَ خاتَمِ النَّبِيّينَ، اَلسَّلامُ عَلَيْكَ يا بْنَ سَيِّدِ الْمُرْسَلينَ، اَلسَّلامُ عَلَيْكَ يا بْنَ سَيِّدِ الْوَصِيّينَ، اَلسَّلامُ عَلَيْكَ يا اَبا عَبْدِاللهِ، اَلسَّلامُ عَلَيْكَ يَا حُسَيْنَ بْنَ عَلِيِّ، اَلسَّلامُ عَلَيْكَ يَا بْنَ فاطِمَةَ سَيِّدَةِ نِساءِ الْعالَمينَ، اَلسَّلامُ عَلَيْكَ يَا وَلِيَّ اللهِ وَابْنَ وَلِيِّهِ، اَلسَّلامُ عَلَيْكَ يَا صَفِيَّ اللهِ وَابْنَ صَفِيِّهِ، اَلسَّلامُ عَلَيْكَ يَا حُجَّةَ اللهِ وَابْنَ حُجَّتِهِ، اَلسَّلامُ عَلَيْكَ يَا حَبيبَ اللهِ وابْنَ حَبيبِهِ، اَلسَّلامُ عَلَيْكَ يَا سَفيرَ اللهِ وَابْنَ سَفيرِهِ، اَلسَّلامُ عَلَيْكَ يَا خازِنَ الْكِتابَ الْمَسْطُورِ، اَلسَّلامُ عَلَيْكَ يَا وارِثَ التَّوْراةِ وَالاِْنْجيلِ وَالزَّبُورِ، اَلسَّلامُ عَلَيْكَ يَا اَمينَ الرَّحْمنِ، اَلسَّلامُ عَلَيْكَ يَا شَريكَ الْقُرْآنِ، السَّلامُ عَلَيْكَ يا '
                      'عَمُودَ الدِّينِ، اَلسَّلامُ عَلَيْكَ يَا بابَ حِكْمَةِ رَبِّ الْعالَمينَ، اَلسَّلامُ عَلَيْكَ يَا بابَ حِطَّة الَّذي مَنْ دَخَلَهُ كانَ مِنَ الاْمِنينَ، اَلسَّلامُ عَلَيْكَ يَا عَيْبَةَ عِلْمِ اللهِ، اَلسَّلامُ عَلَيْكَ يَا مَوْضِعَ سِرِّ اللهِ، اَلسَّلامُ عَلَيْكَ يَا ثارَ اللهِ وَابْنَ ثارِهِ وَالْوِتْرَ الْمَوْتُورَ، اَلسَّلامُ عَلَيْكَ وَعَلى الاَْرْواحِ الّتي حَلَّتْ بِفِنائِكَ وَاَناخَتْ بِرَحْلِكَ، بِاَبي اَنْتَ وَاُمّي وَنَفْسي يا اَبا عَبْدِاللهِ لَقَدْ عَظُمَتِ الْمُصيبَةُ وَجَلَّتِ الرَّزِيَّةُ بِكَ عَلَيْنا وَعَلى جَميعِ اَهْلِ الاِْسْلامِ، فَلَعَنَ اللهُ اُمَّةً اَسَّسَتْ اَساسَ الظُّلْمِ وَالْجَوْرِ عَلَيْكُمْ اَهْلَ الْبَيْتِ، وَلَعَنَ اللهُ اُمَّةً دَفَعَتْكُمْ عَنْ مَقامِكُمْ وَاَزالَتْكُمْ عَنْ مَراتِبِكُمْ الَّتي رَتَّبَكُمُ اللهُ فيها، بِاَبي اَنْتَ وَاُمّي وَنَفْسي يا اَبا عَبْدِاللهِ اَشْهَدُ لَقَدِ اقْشَعَرَّتْ لِدِمائِكُمْ اَظِلَّةَ '
                      'الْعَرْشِ مَعَ اَظِلَّةُ الْخَلائِقِ، وَبَكَتْكُمُ السَّماءُ وَالاَْرْضُ وَسُكّانُ الْجِنانِ وَالْبَرِّ وَالْبَحْرِ، صَلَّى اللهُ عَلَيْهِ عَدَدَ ما فِي عِلْمِ اللهِ، لَبَّيْكَ داعِيَ اللهِ اِنْ كانَ لَمْ يُجِبْكَ بَدَني عِنْدَ اسْتِغاثَتِكَ وَلِساني عِنْدَ اسْتِنْصارِكَ، فَقَدْ اَجابَكَ قَلْبي وَسَمْعي وَبَصَرَي، سُبْحانَ رَبِّنا اِنْ كانَ وَعْدُ رَبِّنا لَمَفْعُولاً، اَشْهَدُ اَنَّكَ طُهْرٌ طاهِرٌ مُطَهَّرٌ مِنْ طُهْر طاهِر مُطَهَّر، طَهُرْتَ وَطَهُرَتْ بِكَ الْبِلادُ وَطَهُرَتْ اَرْضٌ اَنْتَ بِها وَطَهُرَ حَرَمُكَ، اَشْهَدُ اَنَّكَ قَدْ اَمَرْتَ بِالْقِسْطِ وَالْعَدْلِ وَدَعَوْتَ اِلَيْهِما، وَاَنَّكَ صادِقٌ صِدّيقٌ صَدَقْتَ فيـما دَعَوْتَ اِلَيْهِ، وَاَنَّكَ ثارُ اللهِ فِي الاَْرْضِ، وَاَشْهَدُ اَنَّكَ قَدْ بَلَّغْتَ عَنِ اللهِ وَعَنْ جَدِّكَ رَسُولِ اللهِ وَعَنْ اَبيكَ اَميرِ الْمُؤْمِنينَ وَعَنْ اَخيكَ الْحَسَنِ، وَنَصَحْتَ '
                      'وَجاهَدْتَ فِي سَبيلِ اللهِ وَعَبَدْتَهُ مُخْلِصاً حَتّى اَتيكَ الْيَقينُ، فَجَزاكَ اللهُ خَيْرَ جَزاءِ السّابِقينَ، وَصَلَّى اللهُ عَلَيْكَ وَسَلَّمَ تَسْليماً، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَصَلِّ عَلَى الْحُسَيْنِ الْمَظْلُومِ الشَّهيدِ الرَّشيدِ قَتيلِ الْعَبَراتِ وَاَسيرِ الْكُرُباتِ، صَلاةً نامِيَةً زاكِيَةً مُبارَكَةً يَصْعَدُ اَوَّلُها وَلا يَنْفَدُ آخِرُها، اَفْضَلَ ما صَلَّيْتَ عَلى اَحَد مِنْ اَوْلادِ اَنْبِيائِكَ الْمُرْسَلينَ يا اِلـهَ الْعالَمينَ.\n\n'
                      'ثمّ قبّل الضّريح وضع خدّك الايمن عليه ثمّ الايسر ثمّ طف حول الضّريح وقبّله من جوانبه الاربعة وقال المفيد (رحمه الله) : ثمّ امض الى ضريح عليّ بن الحسين (عليه السلام) وقِف عليه وقُل :\n\n'
                      'اَلسَّلامُ عَلَيْكَ اَيُّهَا الصِّدّيقُ الطَّيِّبُ الزَّكِيُّ الْحَبيبُ الْمُقَرَّبُ وَابْنَ رَيْحانَةِ رَسُولِ اللهِ، اَلسَّلامُ عَلَيْكَ مِنْ شَهيد مُحْتَسِب وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، ما اَكْرَمَ مَقامَكَ وَاَشْرَفَ مُنْقَلَبَكَ، اَشْهَدُ لَقَدْ شَكَرَ اللهُ سَعْيَكَ وَاَجْزَلَ ثَوابَكَ، وَاَلْحَقَكَ بِالذِّرْوَةِ الْعالِيَةِ، حَيْثُ الشَّرَفُ كُلُّ الشَّرفِ وَفِي الْغُرَفِ السّامِيَةِ كَما مَنَّ عَلَيْكَ مِنْ قَبْلُ وَجَعَلَكَ مِنْ اَهْلِ الْبَيْتِ الَّذينَ اَذْهَبَ اللهُ عَنْهُمُ الرِّجْسَ وَطَهَّرَهُمْ تَطْهيراً، صَلَواتُ اللهِ عَلَيْكَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ وَرِضْوانُهُ، فَاشْفَعْ اَيُّهَا السَّيِّدُ الطّاهِرُ اِلى رَبِّكَ فِي حَطِّ الاَْثْقالِ عَنْ ظَهْري وَتَخْفيفِها عَنّي وَارْحَمْ ذُلّي وَخُضُوعي لَكَ وَلِلسَّيِّدِ اَبيكَ صَلَّى اللهُ عَلَيْكُما.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'ثمّ انكب على القبر وقل :',
                  subtitle:
                      'زادَ اللهُ فِي شَرَفِكُمْ فِي الاْخِرَةِ كَما شَرَّفَكُمْ فِي الدُّنْيا، وَاَسْعَدَكُمْ كَما اَسْعَدَ بِكُمْ، وَاَشْهَدُ اَنَّكُمْ اَعْلامُ الدّينِ وَنُجُومُ الْعالَمينَ، وَاَلسَّلامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'ثمّ توجّه الى الشّهداء وقل :',
                  subtitle:
                      'اَلسَّلامُ عَلَيْكُمْ يا اَنْصارَ اللهِ وَاَنْصارَ رَسُولِهِ وَاَنْصارَ عَلِيّ بْنِ اَبي طالِب وَاَنْصارَ فاطِمَةَ وَاَنْصارَ الْحَسَنِ وَالْحُسَيْنِ وَاَنْصارَ الاِْسْلامِ، اَشْهَدُ اَنَّكُمْ قَدْ نَصَحْتُمْ للهِ وَجاهَدْتُمْ فِي سَبيلِهِ فَجَزاكُمُ اللهُ عَنِ الاِْسْلامِ وَاَهْلِهِ اَفْضَلَ الْجَزاءِ، فُزْتُمْ وَاللهِ فَوْزاً عَظيماً، يا لَيْتَني كُنْتُ مَعَكُمْ فَاَفُوزَ فَوْزاً عَظيماً، اَشْهَدُ اَنَّكُمْ اَحْياءٌ عِنْدَ رَبِّكُمْ تُرْزَقُونَ، اَشْهَدُ اَنَّكُمُ الشُّهَداءُ وَالسُّعَداءُ وَاَنَّكُمُ الْفائِزوُنَ فِي دَرَجاتِ الْعُلى، واَلسَّلامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.\n\n'
                      'ثمّ عُد الى عند الرّأس فَصَلِّ صلاة الزّيارة وادعُ لنفسك ولوالديك ولاخوانك المؤمنين، واعلم انّ السّيد ابن طاوُس(رحمه الله) قد أورد زيارة لعليّ الاكبر والشّهداء قدّس الله أرواحهم تشتمل على أسمائهم وقد أعرضنا عن ذكرها لطولها واشتهارها.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlsaniaAlmo5asasa.screenRoute,
          pushBack: ZiyaratAl3abasBen3ali.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الاولى المخصصة.mp3',
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
