import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ala7raz_walad3iya_almoujaza.dart';
import 'almonajat_belisti5araa.dart';
import 'dou3a2_alsajad_fi_zikr_altawba.dart';

class FiBa3dAla7razWalad3iyaAlmoujaza extends StatefulWidget {
  static String screenRoute = 'fi_ba3d_ala7raz_walad3iya_almoujaza_screen';
  const FiBa3dAla7razWalad3iyaAlmoujaza({super.key});

  @override
  State<FiBa3dAla7razWalad3iyaAlmoujaza> createState() =>
      _FiBa3dAla7razWalad3iyaAlmoujazaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiBa3dAla7razWalad3iyaAlmoujazaState
    extends State<FiBa3dAla7razWalad3iyaAlmoujaza> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_ba3d_ala7raz_walad3iya_almoujaza_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_ba3d_ala7raz_walad3iya_almoujaza_screen', value);
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
          .pushReplacementNamed(Ala7razWalad3iyaAlmoujaza.screenRoute);
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
                          'في بعض الاحراز والادعية الموجزة المقتطفة من كتاب (مهج الدعوات) و(المجتنى)',
                          FiBa3dAla7razWalad3iyaAlmoujaza.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في بعض الاحراز والادعية الموجزة المقتطفة من كتاب (مهج الدعوات) و(المجتنى)',
                          FiBa3dAla7razWalad3iyaAlmoujaza.screenRoute,
                          FiBa3dAla7razWalad3iyaAlmoujaza.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في بعض الاحراز والادعية الموجزة المقتطفة من كتاب (مهج الدعوات) و(المجتنى)',
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
                  title: 'الأول :',
                  subtitle:
                      'عن موسى بن جعفر (عليه السلام) قال: قال رسول الله (صلّى الله عليه وآله وسلم) لعلي (عليه السلام): إذا عرضتك شدّة فقل: اللّهُمَّ اني أَسْأَلُكَ بِحَقِّ مُحَمَّدٍ وَآلِ مُحَمَّدٍ أَنْ تُصَلِّيَ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَأنْ تُنَجيَني مِنْ هذا الغَمِّ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'حرز فاطمة (عليه السلام): بِسْمِ الله الرَّحْمنِ الرَّحيمِ ياحَيُّ ياقَيّومُ بِرَحْمَتِكَ أَسْتَغيثُ فَأَغِثْني وَلا تَكِلْني إِلى نَفْسي طَرْفَةَ عَيْنٍ أَبَداً وَأصْلِحْ لي شَأني كُلَّهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'حرز الإمام زين العابدين (عليه السلام): بِسْمِ الله الرَّحْمنِ الرَّحيمِ بِسْمِ الله وَبِالله سَدَدْتُ أَفْواهَ الجِنِّ والانْسِ وَالشَّياطينِ وَالسَّحَرَةِ وَالاَبالِسَةِ مِنَ الجِنِّ وَالانْسِ وَالسَّلاطينِ وَمَنْ يَلُوذُ بهِمْ بِالله العَزيزِ الاَعَزِّ وَبِالله الكَبيرِ الاكْبَرِ، بِسْمِ الله الظّاهِرِ الباطِنِ المَكْنُونِ الَمخْزونِ الَّذي أَقامَ بِهِ السَّماواتِ وَالارْضَ ثُمَّ اسْتَوى عَلى العَرْشِ، بِسْمِ اللّهِ الرَّحْمنِ الرَّحيمِ وَوَقَع القَوْلُ عَلَيْهِمْ بِما ظَلَموا فَهُمْ لا يَنْطِقونَ قالَ اخْسَئوا فِيها وَلا تُكَلِّمُونِ، وَعَنَتْ الوُجُوهُ لِلْحَيِّ القَيُومِ وَقَدْ خابَ مَنْ حَمَلَ ظُلْما وَخَشَعَتْ الاَصْواتِ لِلْرَّحْمنِ فَلا تَسْمَعُ إِلاّ هَمْسا، وَجَعَلْنا عَلى قُلُوبِهِمْ أَكِنَّةً أَنْ يَفْقَهوهُ وَفي آذانِهِمْ وَقْراً، وَإذا ذَكَرْتَ رَبَّكَ في القُرآنِ وَحْدَهُ وَلَّوا عَلى أَدْبارِهِمْ نُفوراً، وَإذا قَرأتَ القُرآنَ جَعَلْنا بَيْنَكَ وَبَيْن‌الَّذينَ لايِؤْمِنُونَ بِالاخِرَةِ حِجابا مَسْتُوراً، وَجَعَلْنا مِنْ بَيْنِ أَيْديهِمْ سَداً وَمِنْ خَلْفِهِمْ سَداً فَأَغْشيناهُمْ فَهُمْ لايُبْصِرونَ، اليَوْمَ نَخْتِمُ عَلى أَفْواهِهِمْ وَتُكَلِّمُنا أَيْدِيهِمْ فَهُمْ لا يَنْطِقُونَ، لَوْ أَنْفَقْتَ ما في الارْضِ جَميعاً ما أَلَّفْتَ بَيْنَ قُلُوبِهِمْ لكِنَّ الله أَلَّفَ بَيْنَ قُلُوبِهِمْ إنَّهُ عَزيزٌ حَكيمٌ، وَصَلّى الله عَلى مُحَمَّدٍ وَآلِهِ الطّاهرينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'حرز الإمام جعفر الصادق (عليه السلام): بِسْمِ اللّهِ الرَّحْمنِ الرَّحيمِ ياخالِقَ الخَلْقِ وَياباسِطَ الرِّزْقِ ويافالِقَ الحَبِّ وَيابارِيَ النَّسَمِ وَمُحْييَ المَوْتى وَمُميتَ الاحياءِ وَدائِمَ الثَّباتِ وَمُخْرِجَ النَّباتِ، إفْعَلْ بي ما أَنْتَ أَهْلُهُ وَلا تَفْعَلْ بي ما أَنا أَهْلُهُ وَأَنْتَ أَهْلُ التَّقوى وَأَهْلُ المَغْفِرَةِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'حرز الإمام موسى الكاظم (عليه السلام) عن عليّ بن يقطين أنّه قال: أنمي الخبر إلى أبي الحسن موسى بن جعفر (عليه السلام) وعنده جماعة من أهل بيته، بما عزم عليه موسى بن المهدي في أمره، فقال لاهل بيته: ماترون، قالوا: نرى أن تتباعد منه وأن تغيب شخصك عنه، فإنّه لايؤمن شرّه، فتبسم أبو الحسن (عليه السلام) ثم تمثل بشعر كعب بن مالك: زَعَمَتْ سُخَيْنَةُ أَنْ سَتَغْلِبُ رَبِّها فَلَيُغْلَبَنَّ مَغالِبَ الغُلاّب.\n\n'
                      'ثم رفع يده إلى السماء وقال : إلهي كَمْ مِنْ عَدُوٍّ شَحَذَ لي ظُبَةَ مُدْيَتِهِ وَأَرْهَفَ لي شَباحَدِّهِ وَدافَ لي قَواتِلَ سُمُومِهِ وَلَمْ تَنَمْ عَنّي عَيْنُ حِراسَتِهِ، فَلَمّا رَأيْتَ ضَعْفي عَنْ احْتِمالِ الفَوادِحِ وَعَجْزي عَنْ مُلِمّاتِ الحَوائِجِ صَرَفْتَ ذلِكَ عَنّي بِحَوْلِكَ وَقُوَّتِكَ لابِحَوْلٍ مِنّي وَلاقُوَّةٍ فَأَلْقَيْتَهُ في الحَفيرِ الَّذي احْتَفَرَهُ لي خائِباً مِمّا أَمَّلَهُ في الدُّنْيا مُتَباعِداً مِمّا رَجاهُ في الاخِرَةِ، فَلَكَ الحَمْدُ عَلى ذلِكَ قَدْرَ اسْتِحْقاقِكَ سَيّدي.\n\n'
                      'اللّهُمَّ فَخُذْهُ بِعِزَّتِكَ وَافْلُلْ حَدَّهُ عَنّي بِقُدْرَتِكَ وَاجْعَلْ لَهُ شُغْلاً فيما يَليهِ وَعَجْزاً عَمّا يُناديهِ، اللّهُمَّ وَأَعْدِني عَلَيْهِ عَدْوىً حاضِرَةً تَكُونُ مِنْ غَيْظي شِفاءً وَمِنْ حَنَقي عَلَيْهِ وَقاءً، وَصِلِ اللّهُمَّ دُعائي بِالاجابَةِ وَانْظِمْ شِكايَتي بِالتَّغْيير وَعَرِّفْهُ عَمّا قَليلٍ ماأَوْعَدْتَ الظّالِمينَ وَعَرِّفْني ما وَعَدْتَ في إجابَةِ المُضْطَرّينَ إنَّكَ ذو الفَضْلِ العَظيمِ وَالمَنِّ الكَريمِ.\n\n'
                      'فتفرق القوم وما اجتمعوا إِلاّ لقراءة نبأ وفاة موسى بن المهدي.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'رقعة الجيب وهي حرز الإمام الرضا (عليه السلام): روي عن ياسر خادم المأمون أنه قال: لما نزل أبو الحسن علي بن موسى الرضا (عليه السلام) قصر حميد بن قحطبة نزع ثيابه وناولها حميداً، فاحتملها وناولها جارية لتغسلها، فما لبثت أن جاءت ومعها رقعة فناولتها حميداً، وقالت: وجدتها في جيب قميص أبي الحسن (عليه السلام) فسأل حميد عنها أبا الحسن، فقال: جعلت فداك إن الجارية قد وجدت رقعة في جيب قميصك فما هي ؟ فقال: ياحميد هذه عوذة لا أعزلها عن نفسي، فقال حميد: ألا تشرفنا بها ؟\n\n'
                      'فقال : هذه عوذة من امسكها في جيبه كان البَلاءِ مدفوعا عنه، وكانت له حرزاً من الشيطان الرجيم، ثم أملى على حميد العوذة وهي: بِسْمِ الله الرَّحْمنِ الرَّحيمِ بِسْمِ الله ، إِنِّي أعُوذُ بِالرَّحْمنِ مِنْكَ إنْ كُنْتَ تَقيا أوْ غَيْرَ تَقيٍّ. أَخَذْتُ بِالله السَّميعِ البَصيرِ عَلى سَمْعِكَ وَبَصَرِكَ، لاسُلْطانَ لَكَ عَلَيَّ وَلا عَلى سَمْعي وَلا عَلى بَصَري وَلا عَلى شَعْري وَلا عَلى بَشَري وَلا عَلى لَحمي وَلا عَلى دَمي وَلا عَلى مُخِّي وَلا عَلى عَصَبي وَلا عَلى عِظامي وَلا عَلى مالي وَلا عَلى ما رَزَقَنِي رَبِّي. سَتَرْتُ بَيْني وَبَيْنَكَ بَسِتْرِ النُّبُوَّةِ الَّذي اسْتَتَرَ أَنْبِياءُ الله بِهِ مِنْ سَطَواتِ الجَبابِرَةِ وَالفَراعِنَةِ، جِبْرَئيلَ عَنْ يَميني وَميكائيلَ عَنْ يَساري وَإسْرافيل عَنْ وَرائي وَمُحَمَّدٌ صَلّى الله عَلَيْهِ وَآلِهِ إمامي وَالله مُطَّلِعٌ عَلَيَّ يَمْنَعُكَ مِنّي وَيَمْنَعَ الشَّيْطانُ مِنّي. اللّهُمَّ لايَغْلِبُ جَهْلُهُ أَناتَكَ أَنْ تَسْتَفِزَّني وَتَسْتَخِفَّني، اللّهُمَّ إلَيْكَ الْتَجأتُ اللّهُمَّ إلَيْكَ الْتَجأتُ اللّهُمَّ إلَيْكَ إلْتَجأتُ.\n\n'
                      'ولهذا الحرز حكاية عجيبة رواها أبو الصلت الهروي، قال: كان مولاي علي بن موسى الرضا (عليه السلام)، ذات يوم جالسا في منزله إذ دخل عليه رسول المأمون فقال: أجب دعوة الأمير فقام علي بن موسى الرضا (عليه السلام) فقال لي: يا أبا الصلت إنّه لايدعوني في هذا الوقت إِلاّ لداهية والله لايمكنه أن يعمل بي شَيْئاً أكرهه بكلمات وقعت إليَّ من جدّي رسول الله (صلّى الله عليه وآله وسلم)، قال أبو الصلت: فخرجت معه إلى المأمون، فلما بصره الرضا (عليه السلام) قرأ هذا الحرز إلى آخره، فلما وقف بين يديه نظر إليه المأمون وقال: يا أبا الحسن قد أمرنا لك بمائة ألف درهم، واكتب حوائجك فلما ولّى الإمام عنه، نظر المأمون في قفاه فقال: أردت وأراد الله ، وما أراد الله خير.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'حرز الجواد (عليه السلام): يانُورُ يابُرْهانُ يامُبينُ يامُنيرُ يارَبِّ اكْفِني الشُّرُورَ وَآفاتِ الدُّهورَ وَأَسْأَلُكَ النَّجاةَ يَوْمَ يُنْفَخُ في الصُّورِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن :',
                  subtitle:
                      'حرز الإمام علي النقي (عليه السلام): بِسْمِ الله الرَّحْمنِ الرَّحيمِ ياعَزيزَ العِزِّ في عِزِّهِ ما أَعَزَّ عَزيزَ العِزِّ في عِزِّهِ ! ياعَزيزُ أَعِزَّني بِعِزِّكَ وَأَيِّدْني بِنَصْرِكَ وَادْفَعْ عَنّي هَمَزاتِ الشَّياطينِ وَادْفَعْ عَنّي بِدَفْعِكَ وَامْنَعْ عَنّي بِصُنْعِكَ وَاجْعَلْني مِنْ خِيارِ خَلْقِكَ ياواحدُ ياأَحَدُ يافَرْدُ ياصَمَدُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التاسع :',
                  subtitle:
                      'حرز الإمام الحسن العسكري (عليه السلام): بِسْمِ الله الرَّحْمنِ الرَّحيمِ ياعُدَّتي عِنْدَ شِدَّتي وَياغَوْثي عِنْدَ كُرْبَتي وَيامُؤْنِسي عِنْدَ وَحْدَتي إحْرُسْني بِعَيْنِكَ الَّتي لاتَنامُ وَاكْفِني بِرُكْنِكَ الَّذي لايُرامُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العاشر :',
                  subtitle:
                      'حرز مولانا القائم (عليه السلام): بِسْمِ الله الرَّحْمنِ الرَّحيمِ يامالِكَ الرِّقابِ ياهازِمَ الاَحْزابِ يا مُفَتِّحَ الاَبْوابِ يا مُسَبِّبَ الاَسْبابِ سَبِّبْ لَنا سَبَبا لانَسْتَطيعُ لَهُ طَلَبا بِحَقِّ لا إلهَ إِلاّ الله مُحَمَّدٌ رَسُولُ الله صَلّى الله عَلَيْهِ وَآلِهِ أَجْمَعينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الحادي عشر :',
                  subtitle:
                      'قنوت الحسين (عليه السلام): اللّهُمَّ مَنْ اَّوى إِلى مأوى فَأَنْتَ مَأوايَ وَمَنْ لَجَأ إِلى مَلْجأٍ فَأَنْتَ مَلْجأيَ، اللّهُمَّ صَلِّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَاسْمَعْ نِدائي وَأَجِبْ دُعائي وَاجْعَلْ مابي عِنْدَكَ وَمَثْوايَ وَاحْرُسْني في بَلْوايَ مِنْ افْتِتانِ الامْتِحانِ ولَمَّةِ الشَّيْطانِ بِعَظَمَتِكَ الَّتي لايَشوبُها وَلَعُ نَفْسٍ بيَقينٍ وَلا وَارِدُ طَيْفٍ بِتَظْنينٍ وَلا يَلُمُّ بِها فَرَحٌ حَتّى تَقْلِبَني إلَيْكَ بِإرادَتِكَ غَيْرَ ظَنينٍ وَلا مَظْنونٍ وَلا مُرْتابٍ إنَّكَ أَرْحَمُ الرّاحِمينَ.\n\n'
                      'أقول : قد جمع السيد ابن طاووس رض قنوتات الأئمة (عليهم السلام) في كتاب (مهج الدعوات) ولطولها قد اكتفيت منها بهذا القنوت.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني عشر :',
                  subtitle:
                      'دعاء النبي (صلّى الله عليه وآله وسلم) وهو أمان من الجن والانس: بِسْمِ الله الرَّحْمنِ الرَّحيمِ لا إلهَ إِلاّ الله عَلَيْهِ تَوَكَّلْتُ وَهُوَ رَبُّ العَرْشِ العَظيمِ، ماشاءَ الله كانَ وَمالَمْ يَشَاء لَمْ يَكُنْ. أَشْهَدُ أنَّ الله عَلى كُلِّ شَيٍ قَديرٌ وَأَنَّ الله قَدْ أَحاطَ بِكُلِّ شَيٍ عِلْما، اللّهُمَّ إِنِّي أعوذُ بِكَ مِنْ شَرِّ نَفْسي وَمِنْ شَرِّ كُلِّ دابَّةٍ أنْتَ آخِذٌ بِناصيَتِها إنَّ رَبّي عَلى صِراطٍ مُسْتَقيمٍ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث عشر :',
                  subtitle:
                      'دعاء مجرّب، روي عن أنس قال: قال رسول الله (صلّى الله عليه وآله وسلم) من دعا بهذا الدعاء في كل صباح ومساء وكّل الله تعالى به أربعا من الملائكة يحفظونه من بين يديه ومن خلفه وعن يمينه وشماله وكان في أمان الله عزَّ وجلَّ، وإن حأولت الخلائق من الجن والانس أن تضره ماتمكّنت وهو هذا الدعاء: بِسْمِ الله الرَّحْمنِ الرَّحيمِ بِسْمِ اللّهِ خَيْرِ الاسَّماء بِسْمِ الله رَبِّ الارْضِ وَالسَّماء بِسْمِ الله الَّذي لايَضُرُّ مَعَ اسْمِهِ سَمُّ وَلا داءٌ بِسْمِ الله أَصْبَحْتُ وَعلى الله تَوَكَّلْتُ بِسْمِ الله عَلى قَلْبي وَنَفْسي بِسْمِ الله عَلى ديني وَعَقْلي بِسْمِ الله عَلى أَهْلي وَمالي بِسْمِ الله عَلى ما أَعْطاني رَبِّي بِسْمِ اللّهِالَّذي لايَضُرُّ مَعَ اسْمِهِ شَيٌ في الارضِ وَلا في السَّماء وَهُوَ السَّميعُ العَليمُ. الله الله رَبّي لا أُشْرِكُ بِهِ شَيْئاً الله أكْبَرُ الله أكْبَرُ وَأعَزُّ وَأجَلُّ مِمّا أَخافُ وَأَحْذَرُ عَزَّ جارُكَ وَجَلَّ ثَناؤكَ وَلا إلهَ غَيْرُكَ، اللّهُمَّ إِنِّي أعُوذُ بِكَ مِنْ شَرِّ نَفْسي وَمِنْ شَرِّ كُلِّ سُلْطانٍ شَديدٍ وَمِنْ شَرِّ كُلَّ جَبّارٍ عَنيدٍ وَمِنْ شَرِّ قَضاء السوءِ وَمِنْ كُلِّ دابَّةٍ أَنْتَ آخِذٌ بِناصيَتِها، إنَّكَ عَلى صِراطٍ مُسْتَقيمٍ وأَنْتَ عَلى كُلُّ شَيٍ حَفيظٍ. إنَّ وَلِييَّ الله الَّذي نَزَّلَ الكِتابَ وَهوَ يَتَوَلّى الصّالِحينَ فَإنْ تَوَلّوا فَقُلْ حَسْبِيَ الله لا إلهَ إِلاّ هوَ عَلَيْهِ تَوَكَّلْتُ وَهوَ رَبُّ العَرْشِ العَظيمِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع عشر :',
                  subtitle:
                      'دعاء النبي (صلّى الله عليه وآله وسلم): اللّهُمَّ إِنِّي أعُوذُ بِكَ أنْ أفْتَقِرَ في غِناكَ وَأَضِلَّ في هُداكَ أوْ أَذِلَّ في عِزِّكَ أوْ أُضامَ في سُلْطانِكَ وَأُضْطَهَدَ وَالامْرُ إلَيْكَ، اللّهُمَّ إِنِّي أعُوذُ بِكَ أنْ أقُولَ زوراً أوْ أَغْثى فُجُوراً أوْ أَكونَ بِكَ مَغْروراً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس عشر :',
                  subtitle:
                      'دعاء مروي عن الباقر (عليه السلام): قال أبو حمزة الثمالي استأذنت الباقر(عليه السلام) لادخل عليه فخرج (عليه السلام) من الدار وشفتاه تتحركان فقال: هل علمت قولي ؟ قلت بلى جعلت فداك. قال: تكلمت بكلام ماقاله أحد إِلاّ كفاه الله تعالى ما أهمه من أمر دنياه وآخرته، قلت: جعلت فداك فأخبرني به قال: بلى من قال هذا القول حين يخرج من منزله تيسّر له ما أهمه: بِسْمِ الله الرَّحْمنِ الرَّحيمِ حَسْبيَ الله تَوَكَّلْتُ عَلى الله اللّهُمَّ إِنِّي أَسْأَلُكَ خَيْرَ أُموري كُلِّها وَأعُوذُ بِكَ مِنْ خِزْي الدُّنْيا وَعَذابِ الاخِرَةِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس عشر :',
                  subtitle:
                      'أدعية الوسائل إلى المسائل عن محمد بن حارث النوفلي، خادم الإمام محمد التقي (عليه السلام) قال: لما زوّج المأمون محمد بن علي بن موسى (عليه السلام) ابنته، كتب إليه أنّ لكل زوجةٍ صداقا من مال زوجها، وقد جعل الله لنا أموالاً في الاخره مؤجلة لنا كما جعل اموالكم في الدنيا معجّلة لكم، وقد مهرت ابنتك الوسائل إلى المسائل، وهي مناجاة دفعها إليّ أبي، وقال: دفعها إليّ موسى أبي وقال: دفعها إليّ جعفر أبي وقال: دفعها إليّ محمد أبي وقال: دفعها إليّ عليّ أبي وقال دفعها إليّ الحسين بن علي أبي وقال: دفعها إليّ الحسن أخي وقال دفعها إليّ علي بن أبي طالب (عليه السلام) وقال: دفعها إليّ النبي محمد (صلّى الله عليه وآله وسلم) وقال: دفعها إليّ جبرائيل (عليه السلام) وقال: يامحمّد رب العزّة يبلغك السلام، ويقول: هذه مفاتيح كنوز الدنيا والاخرة، فاجعلها وسائلك إلى مسائلك، تصل إلى بغيتك وتنجح في طلبك ولا تؤثرها لحوائج دنياك، فتبخسن بها الحظ من آخرتك، وهي عشرة وسائل تطرق بها أبواب الرغبات، فتفتتح وتطلب بها الحاجات فتنجح.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlmonajatBelisti5araa.screenRoute,
          pushBack: Dou3a2AlsajadFiZikrAltawba.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/المناجاة في بعض الاحراز والادعية الموجزة.mp3',
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
