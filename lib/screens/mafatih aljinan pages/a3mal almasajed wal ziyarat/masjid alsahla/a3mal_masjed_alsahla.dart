import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../a3mal_masjid_alsahla.dart';
import 'alsalat_waldouaa_fi_masjed_zaid.dart';
import 'fi_fadl_masjed_alsahla.dart';

class A3malMasjedAlsahla extends StatefulWidget {
  static String screenRoute = 'a3mal_masjed_alsahla_screen';
  const A3malMasjedAlsahla({super.key});

  @override
  State<A3malMasjedAlsahla> createState() => _A3malMasjedAlsahlaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malMasjedAlsahlaState extends State<A3malMasjedAlsahla> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_a3mal_masjed_alsahla_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_a3mal_masjed_alsahla_screen', value);
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
          .pushReplacementNamed(A3malMasjidAlsahla.screenRoute);
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
                          'أعمال مسجد السهلة', A3malMasjedAlsahla.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'أعمال مسجد السهلة',
                          A3malMasjedAlsahla.screenRoute,
                          A3malMasjedAlsahla.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال مسجد السهلة',
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
                      'فمن المسنون فيه الصّلاة ركعتين بين العشاءين، عن الصّادق (عليه السلام) ما صلاها مكروب ودعا الله الاّ فرّج الله كربته، وعن بعض كتب الزّيارة انّه اذا أردت أن تدخل المسجد فقف على الباب وقُل :\n\n'
                      'بِسْمِ اللهِ وَبِاللهِ وَمِنَ اللهِ وَاِلَى اللهِ وَما شاءَ اللهُ وَخَيْرُ الاَْسْماءِ للهِ، وَتَوَكَّلْتُ عَلَى اللهِ وَلا حَوْلَ و لا قُوَّةَ اِلاّ بِاللهِ الْعَلِيِّ الْعَظيمِ، اَللّـهُمَّ اجْعَلْني مِنْ عُمّارِ مَساجِدِكَ وَبُيُوتِكَ، اَللّـهُمَّ اِنّي اَتَوَجَّهُ اِلَيْكَ بِمُحَمَّد وَآلِ مُحَمَّد وَاُقَدِّمُهُمْ بَيْنَ يَدَيْ حَوائِجي، فَاجْعَلْنِي اَللّـهُمَّ بِهِمْ عِنْدَكَ وَجيهاً فِي الدُّنْيا وَالاْخِرةِ وَمِنَ الْمُقَرَّبينَ، اَللّـهُمَّ اجْعَلْ صَلاتي بِهِمْ مَقْبُولَهً، وَذَنْبي بِهِمْ مَغْفُوراً، وَرِزْقي بِهِمْ مَبْسُوطاً، وَدُعائي بِهِمْ مُسْتَجاباً، وَحَوائِجي بِهِمْ مَقْضِيَّةً، وَانْظُرْ اِلَيَّ بِوَجْهِكَ الْكَريمِ نَظَرْةً رَحيمَةً اَسْتَوْجِبُ بِها الْكَرامَةَ عِنْدَكَ، ثُمَّ لا تَصْرِفْهُ عَنّي اَبَداً بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ، يا مُقَلِّبَ الْقُلُوبِ وَالاَْبْصارِ ثَبِّتْ قَلْبي عَلى دينِكَ وَدينِ نَبِيِّكَ وَوَلِيِّكَ، '
                      'وَلا تُزِغْ قَلْبي بَعْدَ اِذْ هَدَيْتَني، وَهَبْ لي مِنْ لَدُنْكَ رَحْمَةً اِنَّكَ اَنْتَ الْوَهّابُ، اَللّـهُمَّ اِلَيْكَ تَوَجَّهْتُ وَمَرْضاتَكَ طَلَبْتُ وَثَوابَكَ ابْتَغَيْتُ، وَبِكَ آمَنْتُ وَعَلَيْكَ تَوَكَّلْتُ، اَللّـهُمَّ فَاَقْبِلْ بِوَجْهِكَ الَيِّ، وَاَقْبِلْ بِوَجْهي اِلَيْكَ ثمّ اقرأ آية الكرسي والمعوّذتين وسبّح الله سبع مرّات واحمده سبعاً وهلّل سبعاً وكبّر سبعاً أي كرّر كلّ جملة مِن سُبْحانَ اللهِ وَالْحَمْدُ للهِ وَلا اِلـهَ اِلاّ اللهُ و اللهُ اَكْبَرُ سبع مرّات ثمّ قل : اَللّـهُمَّ لَكَ الْحَمْدُ عَلَى ما هَدَيْتَني، وَلَكَ الْحَمْدُ عَلى ما فَضَّلْتَني، وَلَكَ الْحَمْدُ عَلى ما شَرَّفْتَني، وَلَكَ الْحَمْدُ عَلى كُلِّ بَلاء حَسَن ابْتَلَيْتَني، اَللّـهُمَّ تَقَبَّلْ صَلاتي وَدُعائي، وَطَهِّرْ قَلْبي، وَاشْرَحْ لي صَدْري، وَتُبْ عَلَيَّ اِنَّكَ اَنْتَ التَّوّابُ الرَّحيمُ.\n\n'
                      'وقال السّيد ابن طاووس اذا أردت أن تمضي الى السّهلة فاجعل ذلك بين المغرب والعشاء الاخرة من ليلة الاربعاء وهو أفضل من غيره من الاوقات فاذا اتيته فصلّ المغرب ونافلتها ثمّ قم فصلّ ركعتين تحيّة المسجد قربةً الى الله تعالى، فاذا فرغت فارفع يدك الى السّماء وقُل : اَنْتَ اللهُ لا اِلـهَ اِلاّ اَنْتَ مُبْدِئُ الْخَلْقِ وَمُعيدُهُمْ، وَاَنْتَ اللهُ لا اِلـهَ اِلاّ اَنْتَ خالِقُ الْخَلْقِ وَرازِقُهُمْ، وَاَنْتَ اللهُ لا اِلـهَ اِلاّ اَنْتَ الْقابِضُ الْباسِطُ، وَاَنْتَ اللهُ لا اِلـهَ اِلاّ اَنْتَ مُدَبِّرُ الاُْمُورِ وَباعِثُ مَنْ فِي الْقُبُورِ، اَنْتَ وارِثُ الاَْرْضِ '
                      'وَمَنْ عَلَيْها، اَسْاَلُكَ بِاسْمِكَ الَمخْزُنِ الْمَكْنُونِ الْحَيِّ الْقَيُّومِ وَاَنْتَ اللهُ لا اِلـهَ اِلاّ اَنْتَ عالِمُ الِسِّر وَاَخْفى، اَسْاَلُكَ بِاسْمِكَ الَّذي اِذا دُعيتَ بِهِ اَجَبْتَ، وَاِذا سُئِلْتَ بِهِ اَعْطَيْتَ، وَاَسْاَلُكَ بِحَقِّكَ عَلى مُحَمَّد وَاَهْلِ بَيْتِهِ وَبِحَقِّهِمُ الَّذي اَوْجَبْتَهُ عَلى نَفْسِكَ اَنْ تُصَلِّىَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تَقْضِيَ لي حاجَتي السّاعَةَ السّاعَةَ، يا سامِعَ الدُّعاءِ، يا سَيِّداهُ يا مَوْلاهُ يا غِياثاهُ، اَسْاَلُكَ بِكُلِّ اسْم سَمَّيْتَ بِهِ نَفْسَكَ اَوْ اسْتَأثَرْتَ بِهِ في عِلْمِ الْغَيْبِ عِنْدَكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تُعَجِّلَ فَرَجَنا السّاعَةَ، يا مُقَلِّبَ الْقُلُوبِ وَالاَْبْصارِ، يا سَميعَ الدُّعاءِ.\n\n'
                      'ثمّ اسجد واخشع وادعُ الله بما تريد ثمّ صلّ في الزّاوية الغربيّة الشّماليّة ركعتين وهي موضع دار ابراهيم الخليل (عليه السلام) حيث كان يذهب منها الى قتال العمالقة، فاذا فرغت من الصّلاة فسبّح ثمّ قُل بعد ذلك : اَللّـهُمَّ بِحَقِّ هذِهِ الْبُقْعَةِ الشَّريفَةِ، وَبِحَقِّ مِنْ تَعَبَّدَ لَكَ فيها، قَدْ عَلِمْتَ حَوائِجي، فَصَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاقْضِها، وَقَدْ اَحْصَيْتَ ذُنُوبي فَصَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاغْفِرْها، اَللّـهُمَّ اَحْيِني ما كاَنَتِ الْحَياةُ خَيْراً لي، وَاَمِتْني اِذا كانَتِ الْوَفاةُ خَيْراً لي عَلى مُوالاةِ اَوْلِيائِكَ وَمُعاداةِ اَعْدائِكَ، وَافْعَلْ بي ما اَنْتَ اَهْلُهُ يا اَرْحَمَ الرّاحِمينَ، ثمّ تصلّي ركعتين في الزّاوية الغربية الاخرى التي هي في سمت القبلة، ثمّ ترفع يديك وتقول : اَللّـهُمَّ اِنّي صَلَّيْتُ هذِهِ الصَّلاةَ ابْتِغاءَ مَرْضاتِكَ، وَطَلَبَ نائِلِكَ، وَرَجاءَ رِفْدِكَ وَجَوائِزِكَ، فَصَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَتَقَبَّلْها مِنّي بِاَحْسَنِ قَبُول، '
                      ' وَبَلِّغْني بِرَحْمَتِكَ الْمَأْمُولَ، وَافْعَلْ بي ما اَنْتَ اَهْلُهُ يا اَرْحَمَ الرّاحِمينَ، ثمّ اهو الى السّجود وضع خدّيك على التّراب ثمّ امض الى الزّاوية الشّرقيّة فصلّ ركعتين وابسط يديك وقُل : اَللّـهُمَّ اِنْ كانَتْ الذُّنُوبُ وَالْخَطايا قَدْ اَخْلَقَتْ وَجْهي عِنْدَكَ فَلَمْ تَرْفَعْ لي اِلَيْكَ صَوْتاً وَلَمْ تَسْتَجِبْ لي دَعْوَةً فَاِنّي اَسْاَلُكَ بِكَ يا اللهُ فاَنَّهُ لَيْسَ مِثْلَكَ اَحَدٌ، وَاَتَوَسِّلُ اِلَيْكَ بِمُحَمَّد وَآلِهِ وَاَسْاَلُكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاَنْ تُقْبِلَ اِلَيَّ بِوَجْهِكَ الْكَريمِ وَتُقْبِلَ بِوَجْهي اِلَيْكَ وَلا تُخَيِّبْني حَيْنَ اَدْعُوكَ، وَلا تَحْرِمْني حَيْنَ اَرْجُوكَ يا اَرْحَمَ الرّاحِمينَ.\n\n'
                      'أقول : نقل عن كتاب غير معروف من كتب الزّيارات انّه ثمّ تمضى الى الزّاوية الشّرقيّة الاخرى وتصلّي هناك ركعتين وتقول : اَللّـهُمَّ اِنّي اَسْاَلُكَ بِاِسْمِكَ يا اللهُ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تَجْعَلَ خَيْرَ عُمْري آخِرَهُ، وَخَيْرَ اَعْمالي خَواتِيمَها وَخَيْرَ اَيّامي يَوْمَ اَلْقاكَ فيهِ اِنَّكَ عَلى كُلِّ شَيْء قَديرٌ، اَللّـهُمَّ تَقَبَّلْ دُعائي وَاسْمَعْ نَجْوايَ يا عَلِيُّ يا عَظيمُ يا قادِرُ يا قاهِرُ يا حَيّاً لا يَمُوتُ، صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاغْفِرْ لِيَ الذُّنُوبَ الَّتي بَيْني وَبَيْنَكَ، وَلا تَفْضَحْني عَلى رُؤوسِ الاَْشْهادِ، وَاحْرُسْني بِعينِكَ الَّتي لا تَنامُ وَارْحَمَني بِقُدْرَتِكَ عَلَيَّ يا اَرْحَمَ الرّاحِمينَ، وَصَلَّىَ اللهُ عَلى سَيِّدِنا مُحَمَّد وَآلِهِ الطّاهِرينَ يا رَبَّ الْعالَمينَ.\n\n'
                      'ثمّ تصلّي في البيت الذي في وسط المسجد ركعتين وتقول : يا مَنْ هُوَ اَقْرَبُ اِلَيَّ مِنْ حَبْلِ الْوَريدِ، يا فَعّالاً لِما يُريدُ، يا مَنْ يَحُولُ بَيْنَ الْمَرْءِ وَقَلْبِهِ صَلِّ عَلى مُحَمَّد وَآلِهِ، وَحُلْ بَيْنَنا وَبَيْنَ مَنْ يُؤْذينا بِحَوْلِكَ وَقُوَّتِكَ يا كافي مِنْ كُلِّ شَيْء وَلا يَكْفي مِنْهُ شَيْءٌ، اِكْفِنا الْمُهِمَّ مِنْ اَمْرِ الدُّنْيا وَالاْخِرَةِ يا اَرْحَمَ الرّاحِمينَ، ثمّ ضع جانبي وجهك على التّراب.\n\n'
                      'أقول : هذه البُقعة الشّريفة تعرف في العصر الحاضر بمقام الامام زين العابدين (عليه السلام) وقال في كتاب المزار القديم انّه يدعى فيها بعد الصّلاة ركعتين بدعاء اَللّـهُمَّ اِنّي اَسْاَلُكَ يا مَنْ لا تَراهُ الْعُيُونَ، الخ والدّعاء قد سلف في أعمال دكّة باب امير المؤمنين (عليه السلام) في مسجد الكوفة فراجعه هناك  ويقرب من هذه البُقعة موضِع يعرف بمقام المهدي (عليه السلام) ومن المناسب فيه زيارته (عليه السلام)، ونقل عن بعض كتب الزّيارات انّه ينبغي أن يزوره الزّائر هنا قائماً على قدميه بهذه الزّيارة سَلامُ اللهِ الكامِلُ التّآمُّ الشّامِلُ الخ وهذه هي الاستغاثة السّالفة في الفصل السّابع من الباب الاوّل من الكتاب نقلاً عن كتاب الكلم الطّيب فلا نعيدها وقد عدّها السيّد ابن طاووس من الزّيارات التي يزار بها في السّرداب المقدّس بعد الصّلاة ركعتين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiFadlMasjedAlsahla.screenRoute,
          pushBack: AlsalatWaldouaaFiMasjedZaid.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اعمال مسجد السهلة.mp3',
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
