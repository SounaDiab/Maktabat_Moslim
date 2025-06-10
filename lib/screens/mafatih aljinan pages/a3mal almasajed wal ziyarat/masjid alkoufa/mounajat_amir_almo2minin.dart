import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../fadl_lakoufa_wmasjidoha.dart';
import 'a3mal_mi7rab_amir_almo2minin.dart';
import 'ziyarat_mouslim_ben_3akil.dart';

class MounajatAmirAlmo2minin extends StatefulWidget {
  static String screenRoute = 'mounajat_amir_almo2minin_screen';
  const MounajatAmirAlmo2minin({super.key});

  @override
  State<MounajatAmirAlmo2minin> createState() => _MounajatAmirAlmo2mininState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MounajatAmirAlmo2mininState extends State<MounajatAmirAlmo2minin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_mounajat_amir_almo2minin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_mounajat_amir_almo2minin_screen', value);
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
                      .addFavorite('مناجاة أمير المؤمنين (عليه السلام)',
                          MounajatAmirAlmo2minin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجاة أمير المؤمنين (عليه السلام)',
                          MounajatAmirAlmo2minin.screenRoute,
                          MounajatAmirAlmo2minin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجاة أمير المؤمنين (عليه السلام)',
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
                      'اَللّـهُمَّ اِنّي اَسْاَلُكَ الاَْمانَ يَوْمَ لا يَنْفَعُ مالٌ وَلابَنُونَ اِلاّ مَنْ اَتَى اللهَ بِقَلْب سَليم، وَاَسْاَلُكَ الاَْمانَ يَوْمَ يَعَضُّ الظّالِمُ عَلى يَدَيْهِ يَقُولُ يا لَيْتِني اتَّخَذْتُ مَعَ الرَّسُولِ سَبيلاً، وَاَسْاَلُكَ الاَْمانَ يَوْمَ يُعْرَفُ الُْمجْرِمُونَ بِسيمـاهُمْ فَيُؤْخَذُ بِالنَّواصي وَالاَْقْدامِ، وَاَسْاَلُكَ الاَْمانَ يَوْمَ لا يَجْزي والِدٌ عَنْ وَلَدِهِ وَلا مَوْلُودٌ هُوَ جاز عَنْ والِدِهِ شَيْئاً اِنَّ وَعْدَ اللهِ حَقٌّ، وَاَسْاَلُكَ الاَْمانَ يَوْمَ لا يَنْفَعُ الظّالِمينَ مَعْذِرَتُهُمْ وَلَهُمُ اللَّعْنَةُ وَلَهُمْ سُوءُ الدّارِ، وَاَسْاَلُكَ الاَْمانَ يَوْمَ لا تَمْلِكُ نَفْسٌ لِنَفْس شَيْئاً وَالاَْمْرُ يَوْمَئِذ للهِ، وَاَسْاَلُكَ الاَْمانَ يَوْمَ يَفِرُّ الْمَرْءُ مِنْ اَخيهِ وَاُمِّهِ وَاَبيهِ وَصاحِبَتِهِ وَبَنيهِ لِكُلِّ امْرِئً مِنْهُمْ يَوْمَئِذ شَأْنٌ يُغْنيهِ، وَاَسْاَلُكَ الاَْمانَ يَوْمَ يَوَدُّ الُْمجْرِمُ لَوْ يَفْتَدي مِنْ عَذابِ يَوْمَئِذ بِبَنيهِ وَصاحِبَتِهِ وَاَخيهِ وَفَصيلَتِهِ الَّتي تُؤْويهِ وَمَنْ فِي الاَْرْضِ جَميعاً ثُمَّ يُنْجيهِ كَلاّ اِنَّها لَظى نَزّاعَةً لِلشَّوى، مَوْلايَ يا مَوْلايَ اَنْتَ الْمَوْلى وَاَنَا الْعَبْدُ وَهَلْ يَرْحَمُ الْعَبْدَ اِلاَّ الْمَوْلى، مَوْلايَ يا مَوْلايَ اَنْتَ الْمالِكُ وَاَنَا الْمَمْلُوكُ وَهَلْ يَرْحَمُ الْمَمْلُوكَ اِلاَّ الْمالِكُ، مَوْلايَ يا مَوْلايَ اَنْتَ الْعَزيزُ وَاَنَا الذَّليلُ وَهَلْ يَرْحَمُ الذَّليلَ اِلاَّ الْعَزيزُ، مَوْلايَ يا مَوْلايَ اَنْتَ الْخالِقُ وَاَنَا الَْمخْلُوقُ وَهَلْ يَرْحَمُ الَْمخْلُوقَ اِلاَّ الْخالِقُ، مَوْلايَ يا مَوْلايَ اَنْتَ الْعَظيمُ وَاَنَا الْحَقيرُ وَهَلْ يَرْحَمُ الْحَقيرَ اِلاَّ الْعَظيمُ، مَوْلايَ يا مَوْلايَ اَنْتَ الْقَوِيُّ وَاَنَا الضَّعيفُ وَهَلْ يَرْحَمُ الضَّعيفَ اِلاَّ الْقَوِيُّ، '
                      'مَوْلايَ يا مَوْلايَ اَنْتَ الْغَنِيُّ وَاَنَا الْفَقيرُ وَهَلْ يَرْحَمُ الْفَقيرَ اِلاَّ الْغَنِيُّ، مَوْلايَ يا مَوْلايَ اَنْتَ الْمُعْطي وَاَنـَا السّائِلُ وَهَلْ يَرْحَمُ السّائِلَ اِلاَّ الْمُعْطي، مَوْلايَ يا مَوْلايَ اَنْتَ الْحَيُّ وَاَنَا الْمَيِّتُ وَهَلْ يَرْحَمُ الْمَيِّتَ اِلاَّ الْحَيُّ، مَوْلايَ يا مَوْلايَ اَنْتَ الْباقي وَاَنَا الْفاني وَ هَلْ يَرْحَمُ الْفانيَ اِلاَّ الْباقي، مَوْلايَ يا مَوْلايَ اَنْتَ الدّائِمُ وَاَنَا الزّائِلُ وَهَلْ يَرْحَمُ الزّائِلَ اِلاَّ الدّائِمُ، مَوْلايَ يا مَوْلايَ اَنْتَ الرّازِقُ وَاَنَا الْمَرْزُوقُ وَهَلْ يَرْحَمُ الْمَرْزُوقَ اِلاَّ الرّازِقُ، مَوْلايَ يا مَوْلايَ اَنْتَ الْجَوادُ وَاَنـَا الْبَخيلُ وَهَلْ يَرْحَمُ الْبَخيلَ اِلاَّ الْجَوادُ، مَوْلايَ يا مَوْلايَ اَنْتَ الْمُعافي وَاَنَا الْمُبْتَلى وَهَلْ يَرْحَمُ الْمُبْتَلى اِلاَّ الْمُعافي، مَوْلايَ يا مَوْلايَ اَنْتَ الْكَبيرُ وَاَنَا الصَّغيرُ وَهَلْ يَرْحَمُ الصَّغيرَ اِلاَّ الْكَبيرُ، مَوْلايَ يا مَوْلايَ اَنْتَ الْهادي وَاَنَا الضّالُّ وَهَلْ يَرْحَمُ الضّالَّ اِلاَّ الْهادي، مَوْلايَ يا مَوْلايَ اَنْتَ الرَّحْمنُ وَاَنـَا الْمَرْحُومُ وَهَلْ يَرْحَمُ الْمَرْحُومَ اِلاَّ الرَّحْمنُ، مَوْلايَ يامَوْلايَ اَنْتَ السُّلْطانُ وَاَنَا الْمُمْتَحَنُ وَهَلْ يَرْحَمُ الْمُمْتَحَنَ اِلاَّ السُّلْطانُ، '
                      'مَوْلايَ يا مَوْلايَ اَنْتَ الدَّليلُ وَاَنَا الْمُتَحَيِّرُ وَهَلْ يَرْحَمُ الْمُتَحَيِّرَ اِلاَّ الدَّليلُ، مَوْلايَ يا مَوْلايَ اَنْتَ الْغَفُورُ وَاَنَا الْمُذْنِبُ وَهَلْ يَرْحَمُ الْمُذْنِبَ اِلاَّ الْغَفُورُ، مَوْلايَ يا مَوْلايَ اَنْتَ الْغالِبُ وَاَنـَا الْمَغْلُوبُ وَهَلْ يَرْحَمُ الْمَغْلُوبَ اِلاَّ الْغالِبُ، مَوْلايَ يا مَوْلايَ اَنْتَ الرَّبُّ وَاَنَا الْمَرْبُوبُ وَهَلْ يَرْحَمُ الْمَرْبُوبَ اِلاَّ الرَّبُّ، مَوْلايَ يا مَوْلايَ اَنْتَ الْمُتَكَبِّرُ وَاَنَا الْخاشِعُ وَهَلْ يَرْحَمُ الْخاشِعَ اِلاَّ الْمُتَكَبِّرُ، مَوْلايَ يا مَوْلايَ اِرْحَمْني بِرَحْمَتِكَ، وَارْضَ عَنّي بِجُودِكَ وَكَرَمِكَ وَفَضْلِكَ يا ذَا الْجُودِ وَالاِْحْسانِ وَالطَّوْلِ وَالاِْمْتِنانِ، بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.\n\n'
                      'أقول : روى السّيد ابن طاووس عنه (عليه السلام) بعد هذه المناجاة دعاءً طويلاً موسوماً بدعاء الامان لا يسعه المقام، وتدعُو أيضاً في هذا المقام بما سنذكره عقيب الصّلاة في مسجد زيد بن صوحان ان شاء الله، واعلم انّا قد ألمحنا في كتاب هديّة الزّائر الى الخلاف في تعيين المحراب الّذي ضرب فيه امير المؤمنين (عليه السلام) هل هو المحراب المعروف أم المحراب المتروك وقلنا هناك انّ غاية الاحتياط هي أن تؤدّي الاعمال في كلا الموضعين أو أن تؤدّي في المعروف تارة وفي المتروك أخرى.\n\n'
                      'أعمال دكّة الصّادق (عليه السلام) : ثمّ امض الى مقام الصّادق (عليه السلام) وهو قريب من مسلم بن عقيل رضوان الله عليه فصَلِّ عليها ركعتين فاذا سلّمت وسبّحت فقُل :\n\n'
                      'يا صانِعَ كُلِّ مَصْنُوع، وَيا جابِرَ كُلِّ كَبير، وَيا حاضِرَ كُلِّ مَلاء، وَيا شاهِدَ كُلِّ نَجْوى، وَيا عالِمَ كُلِّ خَفِيَّة، وَيا شاهِداً غَيْرَ غائِب، وَيا غالِباً غَيْرَ مَغْلُوب، وَيا قَريباً غَيْرَ بَعيد، وَيا مُونِسَ كُلِّ وَحيد، وَيا حَيّاً حينَ لا حَيَّ غَيْرُهُ، يا مُحيِي الْمَوْتى وَمُمِيتَ الاَْحْياءِ، الْقائِمَ عَلى كُلِّ نَفْس بِما كَسَبَتْ، لا اِلـهَ اِلاّ اَنْتَ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، ثمّ ادعُ بما احببت.\n\n'
                      'أقول : قد قلنا فيما مضى ونعيد الحديث انّ ما في كتاب المزار القديم وما هو المشهور بين النّاس في ترتيب أعمال هذا الجامع هو أن تؤخّر عن عمل هذا المقام أعمال دكّة القضاء وبيت الطّست، ونحن قد جارينا كتاب مصباح الزّائر والبحار وغيرهما فاثبتناها بعد أعمال الاسطوانة الرّابعة ولك اذا شئت أن توافق المشهور فتؤدّي الان بعد فراغك من سائر الاعمال ما أوردناه هُناك ان شاء الله تعالى.\n\n'
                      'ذكر صلاة الحاجة في جامع الكوفة : عن الصّادق (عليه السلام) : من صلّى في جامع الكوفة ركعتين يقرأ في كلّ ركعة الحمد والمعوّذتين والاخلاص والكافرون والنّصر والقدر وسَبِّحِ اسمَ رَبِّكَ الاعْلى فاذا سلّم سبّح تسبيح الزّهراء (عليها السلام) ثمّ سأل الله ما شاء قضى حاجته واستجاب دعاءه.\n\n'
                      'أقول : الذي اثبتناه من التّرتيب في السّور يوافق رواية السّيد ابن طاووس في المصباح، وفي رواية الطّوسي في الامالي قد اُخّر ذكر سورة القدر عن سورة سبّح اسم ومُراعاة التّرتيب لعلّها غير لازمة فيجزي أن يتّبع الحمد بهذه السّور السّبع والله العالم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: ZiyaratMouslimBen3akil.screenRoute,
        pushBack: A3malMi7rabAmirAlmo2minin.screenRoute,
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
