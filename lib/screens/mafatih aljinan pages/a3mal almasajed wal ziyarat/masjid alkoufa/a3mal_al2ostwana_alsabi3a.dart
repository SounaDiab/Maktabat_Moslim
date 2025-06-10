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
import 'zikr_alsalat_waldou3aa_fi_wasat_almasjid.dart';

class A3malAl2ostwanaAlsabi3a extends StatefulWidget {
  static String screenRoute = 'a3mal_al2ostwana_alsabi3a_screen';
  const A3malAl2ostwanaAlsabi3a({super.key});

  @override
  State<A3malAl2ostwanaAlsabi3a> createState() =>
      _A3malAl2ostwanaAlsabi3aState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malAl2ostwanaAlsabi3aState extends State<A3malAl2ostwanaAlsabi3a> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_a3mal_al2ostwana_alsabi3a_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_a3mal_al2ostwana_alsabi3a_screen', value);
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
                      .addFavorite('أعمال الأسطوانة السابعة',
                          A3malAl2ostwanaAlsabi3a.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'أعمال الأسطوانة السابعة',
                          A3malAl2ostwanaAlsabi3a.screenRoute,
                          A3malAl2ostwanaAlsabi3a.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال الأسطوانة السابعة',
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
                  'وهي مقام وفّق الله تعالى فيه آدم للتّوبة، ثمّ امض الى الاسطوانة السّابعة وقف عندها واستقبل القبلة وقُل :',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'بِسْمِ اللهِ وَبِاللهِ وَعَلى مِلَّةِ رَسُولِ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ، وَلا اِلـهَ اِلاَّ اللهُ، مُحَمَّدٌ رَسُولُ اللهِ، اَلسَّلامُ عَلى اَبينا آدَمَ وَاُمِّنا حَوّاءَ، اَلسَّلامُ عَلى هابيلَ الْمَقْتُول ظُلْماً وَعُدْواناً عَلى مَواهِبِ اللهِ وَرِضْوانِهِ، اَلسَّلامُ عَلى شَيْث صَفْوَةِ اللهِ الُْمخْتارِ الاَْمينِ وَعَلَى الصَّفْوَةِ الصّادِقينَ مِنْ ذُرِّيَّتِهِ الطَّيِّبينَ اَوَّلِهِمْ وَآخَرِهِمْ، اَلسَّلامُ عَلى اِبْرهيمَ وَاِسْماعيلَ وَاِسْحاقَ وَيَعْقُوبَ وَعَلى ذُرِّيَّتِهِمُ الُْمخْتارينَ، اَلسَّلامُ عَلى مُوسى كَليمِ اللهِ، اَلسَّلامُ عَلى عيسى رُوحِ اللهِ، اَلسَّلامُ عَلى مُحَمَّدِ بْنِ عَبْدِ اللهِ خاتَمِ النَّبِيّينَ اَلسَّلامُ عَلى اَميرِ الْمُؤْمِنينَ وَذُرِّيَّتِهِ الطَّيّبينَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَلسَّلامُ عَلَيْكُمْ فِي الاَْوَّلينَ، اَلسَّلامُ عَلَيْكُمْ فِي الاْخِرينَ، اَلسَّلامُ عَلى فاطِمَةَ الزَّهْراءِ، اَلسَّلامُ عَلَى الاَْئِمَّةِ الْهادينَ شُهَداءِ اللهِ عَلى خَلْقِهِ، اَلسَّلامُ عَلَى الرَّقيبِ الشّاهِدِ عَلَى الاُْمَمِ للهِ رَبِّ الْعالَمينَ.\n\n'
                      'ثمّ تصلّي عندها أربع ركعات تقرأ في الاولى الحمد والقدر ( اِنّا اَنْزَلْناهُ ) وفي الثّانية الحمد والصمد ( قُلْ هُوَ اللهُ اَحَدٌ ) وفي الثّالثة والرّابعة مثل ذلك، فاذا فرغت وسبّحت تسبيح الزّهراء (عليها السلام) فقل :\n\n'
                      'اَللّـهُمَّ اِنْ كُنْتُ قَدْ عَصَيْتُكَ فَاِنّي قَدْ اَطَعْتُكَ فِي الاْيمانِ مِنّي بِكَ مَنّاً مِنْكَ عَلَيَّ لا مَنّاً مِنّي عَلَيْكَ، وَاَطَعْتُكَ في اَحَبِّ الاَْشْياءِ لَكَ لَمْ اَتَّخِذ لَكَ وَلَداً وَلَمْ اَدْعُ لَكَ شَريكاً، وَقَدْ عَصَيْتُكَ في اَشْياء كَثيرَة عَلى غَيْرِ وَجْهِ الْمُكابَرَةِ لَكَ، وَلاَ الْخُرُوجِ عَنْ عُبُودِيَّتِكَ، وَلاَ الْجُحُودِ لِرُبُوبِيَّتِكَ، وَلكِنِ اتَّبَعْتُ هَوايَ وَاَزَلَّنِي الشَّيْطانُ بَعْدَ الْحُجَّةِ عَلَيَّ وَالْبَيانِ، فَاِنْ تُعَذِّبْني فَبِذُنُوبي غَيْرَ ظالِم لي، وَاِنْ تَعْفُ عَنّي وَتَرْحَمْني فَبِجُودِكَ وَكَرَمِكَ يا كَريمُ، اَللّـهُمَّ اِنَّ ذُنُوبي لَمْ يَبْقَ لَها اِلاّ رَجاءُ عَفْوِكَ، وَقَدْ قَدَّمْت آلَةَ الْحِرْمانِ، فَاَنَا اَسْاَلُكَ اللّهُمَّ ما لا اَسْتَوْجِبُهُ، وَاَطْلُبُ مِنْكَ ما لا اَسْتِحَقُّهُ، اَللّـهُمَّ اِنْ تُعَذِّبْني فَبِذُنُوبي وَلَمْ تَظْلِمْني شَيْئاً ، وَاِنْ تَغْفِرْ لي فَخَيْرُ راحِم اَنْتَ يا سَيِّدي، اَللّـهُمَّ اَنْتَ اَنْتَ وَأَنَا أَنَا، اَنْتَ الْعَوّادُ بِالْمَغْفِرَةِ وَاَنَا الْعَوّادُ بِالذُّنُوبِ، وَاَنْتَ الْمُتَفَضِّلُ بِالْحِلْمِ وَاَنَا الْعَوّادُ بِالْجَهْلِ، اَللّـهُمَّ فَاِنّي اَسْاَلُكَ يا كَنْزَ الضُّعَفاءِ، يا عَظيمَ الرَّجاءِ، يا مُنْقِذَ الْغَرْقى، يا مُنْجِيَ الْهَلَكى، يا مُميتَ الاَْحْياءِ، يا مُحْيِيَ الْمَوْتى، اَنْتَ اللهُ لا اِلـهَ اِلاّ اَنْتَ، اَنْتَ الَّذي سَجَدَ لَكَ شُعاعُ الشَّمْسِ وَدَوِيُّ الْماءِ وَحَفيفُ الشَّجَرِ وَنُورُ الْقَمَرِ وَظُلْمَةُ اللَّيْلِ وَضَوْءُ النَّهارِ وَخَفَقانُ الطَّيْرِ، فَأَسْأَلُكَ اللّهُمَّ يا عَظيمُ بِحَقِّكَ عَلى مُحَمَّد وَآلِهِ الصّادِقينَ، وَبِحَقِّ مُحَمَّد وَآلِهِ الصّادِقينَ عَلَيْكَ، وَبِحَقِّكَ عَلى عَلِيٍّ وَبِحَقِّ عَلِيٍّ عَلَيْكَ، وَبِحَقِّكَ عَلى فاطِمَةَ وَبِحَقِّ فاطِمَةَ '
                      'عَلَيْكَ، وَبِحَقِّكَ عَلَى الْحَسَنِ وَبِحَقِّ الْحَسَنِ عَلَيْكَ، وَبِحَقِّكَ عَلَى الْحُسَيْنِ وَبِحَقِّ الْحُسَيْنِ، عَلَيْكَ فَاِنَّ حُقُوقَهُمْ عَلَيْكَ مِنْ اَفْضَلِ اِنْعامِكَ عليهم، وَبِالشَّأنِ الَّذي لَكَ عِنْدَهُمْ، وَبِالشَّأنِ الَّذي لَهُمْ عِنْدَكَ، صَلِّ عَلَيْهِمْ يا رَبِّ صَلاةً دائِمَةً مُنْتَهى رِضاكَ، وَاغْفِرْ لي بِهِمُ الذُّنُوبَ الَّتي بَيْني وَبَيْنَكَ، وَاَرْضِ عَنّي خَلْقَكَ، وَاَتْمِمْ عَلَيَّ نِعْمَتَكَ كَما اَتْمَمْتَها عَلى آبائي مِنْ قَبْلُ، وَلا تَجْعَلْ لاَِحَد مِنَ الَْمخْلُوقينَ عَلي فيهَا امْتِناناً، وَامْنُنْ عَلَيَّ كَما مَنَنْتَ عَلى آبائي مِنْ قَبْلُ يا كهيعص، اَللّـهُمَّ كَما صَلَّيْتَ عَلى مُحَمَّد وَآلِهِ فَاسْتَجِبْ لي دُعآئي فيـما سَأَلْتُ يا كَريمُ يا كَريمُ يا كَريمُ.\n\n'
                      'ثمّ اسجد وقل في سجودك :\n\n'
                      'يا مَنْ يَقْدِرُ عَلى حَوائِجِ السّائِلينَ، وَيَعْلَمُ ما في ضَميرِ الصّامِتينَ، يا مَنْ لا يَحْتاجُ اِلَى التَّفْسيرِ، يا مَنْ يَعْلَمُ خائِنَةَ الاَْعْيُنِ وَما تُخْفِي الصُّدُورُ، يا مَنْ اَنْزَلَ الْعَذابَ عَلى قَوْمِ يُونُسَ وَهُوَ يُريدُ اَنْ يُعَذِّبَهُمْ فَدَعَوْهُ وتَضَرَّعُوا اِلَيْهِ فَكَشَفَ عَنْهُمُ الْعَذابَ وَمَتَّعَهُمْ اِلى حين، قَدْ تَرى مَكاني، وَتَسْمَعُ دُعائي، وَتَعْلَمُ سِرّي وَعَلانِيَتي وَحالي، صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاكْفِني ما اَهَمَّني مِنْ اَمْرِ ديني وَدُنْيايَ وَآخِرَتي.\n\n'
                      'ثمّ قل سبعين مرّة : يا سَيِّدي . ثمّ ارفع رأسك من السجّود وقل : يا رَبِّ اَسْاَلُكَ بَرَكةَ هذَا الْمَوْضِعِ وَبَرَكَةَ اَهْلِهِ،وَاَسْاَلُكَ اَنْ تَرْزُقَني مِنْ رِزْقِكَ رِزْقاً حَلالاً طَيِّباً تَسُوقُهُ اِلَيَّ بِحَوْلِكَ وَقُوَّتِكَ، وَاَنَا خائِضٌ في عافِيَة، يا اَرْحَمَ الرّاحِمينَ.\n\n'
                      'أقول : قد ورد في كتاب المزار القديم في الدعاء في هذا المقام بعد كلمة يا كَريمُ يا كَريمُ يا كَريمُ وقبل السّجود دعاء اَللّـهُمَّ يا مَنْ تُحَلُّ بِهِ عُقَدُ الْمَكارِهِ، وهو دعاء مِن أدعية الصحيفة السّجادية وقد أودعناه الباب الاول، ثمّ قال صاحب المزار ثمّ قل : اَللّـهُمَّ اِنَّكَ تَعْلَمُ وَلا اَعْلَمُ، وَتَقْدِرُ وَلا اَقْدِرُ، وَاَنْتَ عَلاّمُ الْغُيُوبِ، صَلِّ اللّـهُمَّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاغْفِرْ لي وَارْحَمْني وَتَجاوَزْ عَنّي وَتَصَدَّقْ عَلَيَّ ما اَنْتَ اَهْلُهُ يا اَرْحَمَ الرّاحِمينَ، ثمّ اسجد وقل : يا مَنْ يَقْدِرُ عَلى حِوائِجَ السّائِلينَ الخ، واعلم ايضاً انّ ما وردت من الرّوايات في فضل الاسطوانة السّابعة عديدة، وقد روى الكليني بسند معتبر انّه كان أمير المؤمنين (عليه السلام) يصلّي الى الاسطوانة السّابعة وبينه وبين السّابعة ممرّ عنز، وفي رواية معتبرة اُخرى انّه ينزل في كلّ ليلة ستّون ألف ملكاً فتصلّي عند الاسطوانة السّابعة فلا تعود منهم ملك الى يوم القيامة، وفي حديث معتبر عن الصّادق (عليه السلام) انّ الاسطوانة السّابعة هي مقام '
                      'ابراهيم (عليه السلام)، وروى الكليني ايضاً في الكافي بسند صحيح عن أبي اسماعيل السّراج قال : قال معاوية بن وهب وأخذ بيدي وقال : قال لي أبو حمزة الثّمالي وأخذ بيدي، وقال : قال لي أصبغ بن نباتة وأخذ بيدي فأراني الاسطوانة السّابعة فقال : هذا مقام امير المؤمنين (عليه السلام) . قال : وكان الحسن (عليه السلام) يصلّي عند الاسطوانة الخامسة فاذا غاب امير المؤمنين (عليه السلام) صلّى فيها الحسن (عليه السلام) وهي من باب كندة، وبالاجمال فالرّوايات في فضلها جمّة ونحن نبغي الاختصار.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: A3malAl2ostwanaAl5amisa.screenRoute,
        pushBack: ZikrAlsalatWaldou3aaFiWasatAlmasjid.screenRoute,
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
