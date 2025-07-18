import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'a3mal_al2ostwana_al5amisa.dart';
import 'a3mal_bab_alfaraj.dart';

class AamalAl2ostwanaAlsalisa extends StatefulWidget {
  static String screenRoute = 'aamal_al2ostwana_alsalisa_screen';
  const AamalAl2ostwanaAlsalisa({super.key});

  @override
  State<AamalAl2ostwanaAlsalisa> createState() =>
      _AamalAl2ostwanaAlsalisaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AamalAl2ostwanaAlsalisaState extends State<AamalAl2ostwanaAlsalisa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_aamal_al2ostwana_alsalisa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_aamal_al2ostwana_alsalisa_screen', value);
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
          .pushReplacementNamed(FadlLakoufaWmasjidoha.screenRoute);
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
                          'عمل الأسطوانة الثالثة مقام الإمام زين العابدين (عليه السلام)',
                          AamalAl2ostwanaAlsalisa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'عمل الأسطوانة الثالثة مقام الإمام زين العابدين (عليه السلام)',
                          AamalAl2ostwanaAlsalisa.screenRoute,
                          AamalAl2ostwanaAlsalisa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'عمل الأسطوانة الثالثة مقام الإمام زين العابدين (عليه السلام)',
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
                      'ثمّ امض الى دكّة زين العابدين (عليه السلام) وهي عند الاسطوانة الثّامنة ممّا يلي باب كندة.\n\n'
                      'أقول : يُحاذي هذا المقام من ناحية القبلة دكّة باب امير المؤمنين (عليه السلام) ومن الغرب باب كندة وهو مسدود الان، وقيل ينبغي أن يتأخّر المُصلّي قدر خمسة أذرع عن الاسطوانة لانّ الدّكة انّما كانت هُنالك وبالجملة فتصلّى عليها ركعتين تقرأ فيهما الحمد وما أردت مِن السّور فاذا سلّمت وسبَّحت فَقُل :\n\n'
                      'بِسْمِ اللهِ الرَّحْمنِ الرَّحيمِ اَللّـهُمَّ اِنَّ ذُنُوبي قَدْ كَثُرَتْ وَلَمْ يَبْقَ لَها اِلاّ رَجاءُ عَفْوِكَ، وَقَدْ قَدَّمْتُ آلَةَ الْحِرْمانِ اِلَيْكَ فَأنا اَسْاَلُكَ اللّهُمَّ ما لا اَسْتَوْجِبُهُ، وَاطْلُبُ مِنْكَ ما لا اَسْتَحِقُّهُ، اَللّـهُمَّ اِنْ تُعَذِّبْني فَبِذُنوُبي وَلَمْ تَظْلِمْني شَيْئاً، وَاِنْ تَغْفِرْ لي فَخَيْرُ راحِم اَنْتَ يا سَيِّدي، اَللّـهُمَّ اَنْتَ اَنْتَ وَأنَا أنَا، اَنْتَ الْعَوّادُ بِالْمِغْفِرَةِ وَاَنَا الْعَوّادُ بِالذُّنُوبِ، وَاَنْتَ الْمُتَفَضِّلُ بِالْحِلْمِ وَاَنَا الْعَوّادُ بِالْجَهْلِ، اَللّـهُمَّ فَاِنّي اَسْاَلُكَ يا كَنْزَ الضُّعَفاءِ، يا عَظيمَ الرَّجاءِ، يا مُنْقِذَ الْغَرْقى، يا مُنْجِيَ الْهَلْكى يا مُميتَ الاَْحْياءِ، يا مُحْيِىَ الْمَوْتى، اَنْتَ اللهُ الَّذي لا اِلـهَ اِلاّ اَنْتَ، اَنْتَ الَّذي سَجَدَ لَكَ شُعاعُ الشَّمْسَ، وَنُورُ الْقَمَرِ، وَظُلْمَةُ اللَّيْلِ، وَضَوْءُ، النَّهارِ وَخَفَقانُ الطَّيْرِ، فَأَسْأَلُكَ اللّهُمَّ يا عَظيمُ بِحَقِّكَ يا كَريمُ عَلى مُحَمَّد وَآلِهِ الصّادِقينَ، وَبِحَقِّ '
                      'مُحَمَّد وَآلِهِ الصّادِقينَ عَلَيْكَ، وَبِحَقِّكَ عَلى عَلِيٍّ وَبِحَقِّ عَلِيٍّ عَلَيْكَ، وَبِحَقِّكَ عَلى فاطِمَةَ وَبِحَقِّ فاطِمَةَ عَلَيْكَ ،وَبِحَقِّكَ عَلَى الْحَسَنِ وَبِحَقِّ الْحَسَنِ عَلَيْكَ، وَبِحَقِّكَ عَلَى الْحُسَيْنِ وَبِحَقِّ الْحُسَيْنِ عَلَيْكَ، فَاِنَّ حُقُوقَهُمْ مِنْ اَفْضَلِ اِنْعامِكَ عَلَيْهِمْ، وَبِالشَّأنِ الَّذي لَكَ عِنْدَهُمْ وَبِالشَّأنِ الَّذي لَهُمْ عِنْدَكَ، صَلِّ يا رَبِّ عَلَيْهِمْ صَلاةً دائِمَةً مُنْتَهى رِضاكَ، وَاغْفِرْ لي بِهِمْ الذُّنُوبَ الَّتي بَيْني وَبَيْنَكَ، وَاَتْمِمْ نِعْمَتَكَ عَلَيَّ كَما اَتْمَمْتَها عَلى آبائي مِنْ قَبْلُ يا كهيعص، اَللّـهُمَّ كَما صَلَّيْتَ عَلى مُحَمَّد وَآلِ مُحَمَّد فَاسْتَجِبْ لي دُعائي فيـما سَأَلْتُكَ.\n\n'
                      'ثمّ اسجد وضَع خدّك الايمن على الارضِ وقُل : يا سَيِّدي يا سَيِّدي يا سَيِّدي صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاغْفِرْ لي وَاغْفِرْ لي، وأكثر من قولك ذلكِ باكياً خاشعاً، ثمّ ضع الخدّ الايسر وقل مثل ذلك القول ثمّ ادعُ بما شئت.\n\n'
                      'أقول : ورد في بعض المجاميع الغير المعتبرة انّ في هذا المقام يؤدّى ما علّمه الصّادق (عليه السلام) بعض أصحابه والصّحيح انّ العمل لا يخصّ هذا المقام، وأمّا صفة العمل فعَنِ الصّادق (عليه السلام) انّه قال لبعض أصحابه : ألا تباكر لحاجة فتمرّ بجامع الكوفة الكبير ، قال : بلى ، قال : فَصَلِّ هنالك أربع ركعات ثمّ قُل :\n\n'
                      'اِلهي اِنْ كُنْتُ قَدْ عَصَيْتُكَ فَاِنّي قَدْ اَطَعْتُكَ في اَحَبِّ الاَْشْياءِ اِلَيْكَ لَمْ اَتَّخِذْ لَكَ وَلَداً وَلَمْ اَدْعُ لَكَ شَريكاً، وَقَدْ عَصيتُكَ في اَشْياء كَثيرَة عَلى غَيْرِ وَجْهِ الْمُكابَرَةَ لَكَ، وَلاَ الاْسْتِكْبارِ عَنْ عِبادَتِكَ، وَلاَ الْجُحُودِ لِرُبُوبِيَّتِكَ، وَلاَ الْخُرُوجِ عَنِ الْعُبُودِيَّةِ لَكَ، وَلكِنِ اتَّبَعْتُ هَوايَ وَازَلَّنِيَ الشَّيْطانُ بَعْدَ الْحُجَّةِ وَالْبَيانِ، فَاِنْ تُعَذِّبْني فَبِذُنُوبي، غَيْرَ ظالِم اَنْتَ لي، وَاِنْ تَعْفُ عَنّي وَتَرْحَمْني فَبِجُودِكَ وَكَرَمِكَ يا كَريمُ.\n\n'
                      'وتقول أيضاً :\n\n'
                      'غَدَوْتُ بِحَوْلِ اللهِ وَقُوَّتِهِ، غَدَوْتُ بِغَيْرِ حَوْل مِنّي وَلا قُوَّة وَلكِنْ بِحَوْلِ اللهِ وَقُوَّتِهِ، يا رَبِّ اَسْاَلُكَ بَرَكَةَ هذَا الْبَيْتِ وَبَرَكَةَ اَهْلِهِ، وَاَسْاَلُكَ اَنْ تَرْزُقَني رِزْقاً حَلالاً طَيِّباً تَسُوقُهُ اِلَيَّ بِحَوْلِكَ وَقُوَّتِكَ وَاَنَا خائِضٌ في عافِيَتِكَ.\n\n'
                      'والشّيخ الشّهيد ومحمّد ابن المشهدي قد أوردا هذا العمل لصحن المسجد بعدما ذكرا عمل الاسطوانة الرّابعة وقالا : يقرأ في ركعتين منها الحمد والتّوحيد وفي الاخريين الحمد والقدر ويسبّح بعد السّلام تسبيح الزّهراء (عليها السلام)، وفي رواية معتبرة عن أبي حمزة الثّمالي قال : قد كنت جالِساً يوماً في جامع الكوفة واذا أنا برجل يدخل من باب كندة هو أصبح النّاس وجهاً وأطيبهم طيباً وأنظفهم ثوباً قد تعمّم بعمامة وعليه رداء ودرّاعة يحتذي نعلين عربيين فخلع نعليه ووقف عند الاسطوانة السّادسة فرفع يديه الى حذاء اُذُنيه وكبّر تكبيرة قفّ لها كلّ شعرة في بدني، '
                      'فصلّى أربع ركعات فأحسن ركوعها وسجودها ثمّ دعا بالدّعاء اِلهي اِنْ كُنْتُ قَدْ عَصَيْتُكَ حتى اذا بلغ يا كَريمُ سجد وكرّر قوله يا كَريمُ بقدر ما يفي به النّفس، ثمّ قال في سجوده : يا مَنْ يَقْدِرُ عَلى حَوائِجِ السّائِلينَ الى أن أتمّ السّبعين مرّة يا سيّدي، وقد مرّ الدّعاء في أعمال الاسطوانة السّابعة، فلما رفع رأسه من السّجود دقّقت فيه النّظر فاذا هو زين العابدين (عليه السلام) فقبّلت يديه وسألته ما أتى به هنا، فأجاب ما رأيتَ، أي الصّلاة في مسجد الكوفة، وعلى رواية رويناها في ذيل الزّيارة السّابعة للامير (عليه السلام) ثمّ سار (عليه السلام) بأبي حمزة الى زيارة الامير (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: A3malBabAlfaraj.screenRoute,
          pushBack: A3malAl2ostwanaAl5amisa.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اعمال الاسطوانة الثالثة.mp3',
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
