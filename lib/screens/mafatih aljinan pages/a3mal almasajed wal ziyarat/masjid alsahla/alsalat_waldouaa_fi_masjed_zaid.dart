import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../a3mal_masjid_alsahla.dart';
import 'a3mal_masjed_alsahla.dart';
import 'fi_fadl_masjed_alsahla.dart';

class AlsalatWaldouaaFiMasjedZaid extends StatefulWidget {
  static String screenRoute = 'alsalat_waldouaa_fi_masjed_zaid_screen';
  const AlsalatWaldouaaFiMasjedZaid({super.key});

  @override
  State<AlsalatWaldouaaFiMasjedZaid> createState() =>
      _AlsalatWaldouaaFiMasjedZaidState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlsalatWaldouaaFiMasjedZaidState
    extends State<AlsalatWaldouaaFiMasjedZaid> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alsalat_waldouaa_fi_masjed_zaid_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_alsalat_waldouaa_fi_masjed_zaid_screen', value);
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
                      .addFavorite('الصلاة والدعاء في مسجد زيد (رحمه الله)',
                          AlsalatWaldouaaFiMasjedZaid.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الصلاة والدعاء في مسجد زيد (رحمه الله)',
                          AlsalatWaldouaaFiMasjedZaid.screenRoute,
                          AlsalatWaldouaaFiMasjedZaid.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الصلاة والدعاء في مسجد زيد (رحمه الله)',
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
                  title:
                      'ثمّ تمضي الى مسجد زيد القريب من مسجد السّهلة فتصلّي فيه ركعتين وتبسط يديك وتقول :',
                  subtitle:
                      'اِلهي قَدْ مَدَّ اِلَيْكَ الْخاطِىءُ الْمُذْنِبُ يَدَيْهِ بِحُسْنِ ظَنِّهِ بِكَ، اِلهي قَدْ جَلَسَ الُمسيءُ بَيْنَ يَدَيْكَ مُقِرّاً لَكَ بِسُوءِ عَمَلِهِ وَراجِياً مِنْكَ الصَّفْحَ عَنْ زَلَلِهِ، اِلهي قَدْ رَفَعَ اِلَيْكَ الظّالِمُ كَفَّيْهِ راجِياً لِما لَدَيْكَ فَلا تُخَيِّبْهُ بِرَحْمَتِكَ مِنْ فَضْلِكَ، اِلهي قَدْ جَثَا الْعائِدُ اِلى الْمَعاصي بَيْنَ يَدَيْكَ خائِفاً مِنْ يَوْم تَجْثُو فيهِ الْخَلائِقُ بَيْنَ يَدَيْكَ، اِلهي جاءَكَ الْعَبْدُ الْخاطِىءُ فَزِعاً مُشْفِقاً وَرَفَعَ اِلَيْكَ طَرْفَهُ حَذِراً راجِياً، وَفاضَتْ عَبْرَتُهُ مُسْتَغْفِراً نادِماً، وَعِزَّتِكَ وَجَلالِكَ ما اَرَدْتُ بِمَعْصِيَتي مُخالَفَتَكَ، وَما عَصَيْتُكَ اِذْ عَصَيْتُكَ وَاَنَا بِكَ جاهِلٌ، وَلا لِعُقُوبَتِكَ مُتَعَرِّضٌ، وَلا لِنَظَرِكَ مُسْتَخِفٌّ، وَلكِنْ سَوَّلَتْ لي نَفْسي، وَاَعانَتْني عَلى ذلِكَ شَقْوَتي، وَغَرَّني سِتْرُكَ المْرُخْى عَلَيَّ، فَمِنَ الاْنَ مِنْ عَذابِكَ مَنْ يَسْتَنْقِذُني، وَبَحَبْلِ مَنْ اَعْتَصِمُ اِنْ قَطَعْتَ حَبْلَكَ عَنّي، فَيا سَوْاَتاهُ غَداً مِنَ الْوُقُوفِ بَيْنَ يَدَيْكَ اِذا قيلَ لِلْمُخِفّينَ جُوزُوا ولِلْمُثْقِلينَ حُطُّوا، اَفَمَعَ الُْمخِفّينَ اَجُوزُ اَمْ مَعَ الْمُثْقِلينَ اَحُطُّ، وَيْلي كُلَّما كَبُرَ سِنّي كَثُرَتْ ذُنُوبي، وَيْلي كُلَّما طالَ عُمْري كَثُرَتْ مَعاصِيّي، فَكَمْ اَتُوبُ وَكَمْ اَعُودُ اَما آنَ لي اَنْ اَسَتَحْيِيَ مِنْ رَبّي، اَللّـهُمَ فَبِحَِقِّ مُحَمَّد وَآلِ مُحَمَّد اِغْفِرَ لي وَارْحَمَني يا اَرْحَمَ الرّاحِمينَ وَخَيْرَ الْغافِرينَ.\n\n'
                      'ثمّ ابك وضَع وجهك على التّراب وقُل : اِرْحَمْ مَنْ اَساءَ وَاَقْتَرَفَ وَاسْتَكانَ وَاَعْتَرَفَ، ثمّ ضع خدّك الايمن وقُل : اِنْ كُنْتُ بِئْسَ الْعَبْدُ فَاَنْتَ نِعْمَ الرَّبُّ، ثمّ ضع خدّك الايسر وقُل : عَظُمَ الذَّنْبُ مِنْ عَبْدِكَ فَلْيَحْسُنِ الْعَفُْ مِنْ عِنْدِكَ يا كَريمُ، ثمّ عُد الى السّجود وقُل اَلْعَفْوَ اَلْعَفْوَ مائة مرّة.\n\n'
                      'أقول : هذا المسجد من المساجد الشّريفة في الكوفة وينتسب الى زيد بن صوحان وهو من كبار أصحاب امير المؤمنين (عليه السلام) ويعدّ من الابدال، وقد استشهد في ركابه (عليه السلام) في واقعة الجمل، والدّعاء السّالف هو دعاؤه الذي كان يدعو به في نافلة اللّيل، وبجوار مسجده هذا مسجد أخيه صعصعة بن صوحان وهو ايضاً من أصحاب امير المؤمنين (عليه السلام) ومن العارفين بحقّه ومن أكابر المؤمنين وقد بلغ في الفصاحة والبلاغة حيث لقّبه امير المؤمنين (عليه السلام) بالخطيب الشحشح، وأثنى عليه بالفصاحة وجودة الخطب كما مدحه بقلّة المؤنة وكثرة المعُونة، وقد حضر صعصعة تشييع جثمانه الشّريف ليلاً من الكوفة الى النّجف ولما لحدّ امير المؤمنين (عليه السلام) وقف صعصعة على القبر وأخذ كفّاً من التّراب فأهاله على رأسه وقال : بأبي أنت وأمّي يا أمير المؤمنين (عليه السلام) هنيئاً لك يا أبا الحسن (عليه السلام) فلقد طاب مولدك، وقوى صبرك، وعظم جهادك، وبلغت ما أمّلت، وربحت تجارتك، ومضيت الى ربّك، ونطق بكثير مثلها وبكى بكاء شديداً وأبكى كلّ من كان معه، '
                      'وبذلك فقد انعقد في جوف اللّيل مأتم يخطب فيه صعصعة ويحضره الامامان الحسنان (عليهما السلام)ومحمّد بن الحنفيّة وأبو الفضل العبّاس وغيرهم من أبنائه واقاربه، ولما انتهى صعصعة من خطبته عدل الحاضرون الى الامامين الحسن والحسين (عليهما السلام) وغيرهما من أبنائه فعزّوهم في أبيهم (عليه السلام) فعادوا طرّاً الى الكوفة، والخلاصة انّ مسجد صعصعة من المساجد الشّريفة في الكوفة وقد شُوهد فيه الامام الغائب صاحب العصر صلوات الله عليه، شاهده فيه جمع من الاصحاب في شهر رجب يصلّي ركعتين ويدعو بالدّعاء اَللّـهُمَّ يا ذَا الْمِنَنِ السّابِغَةِ وَالاْلاءِ الْوازِعَةِ الدّعاء، وظاهر عمله الشّريف اختصاص الدّعاء بهذا المسجد الشّريف كأدعية مسجد السّهلة ومسجد زيد، ولكن العمل قد كان في شهر رجب وهذا ما أورث احتمال اختصاص الدّعاء بالشّهر لا بالمسجد ولذلك نجد الدّعاء في كتب العلماء مذكوراً أيضاً في خلال أعمال شهر رجب، ونحن أيضاً قد أوردناه هناك فلا نعيده.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: A3malMasjedAlsahla.screenRoute,
          pushBack: FiFadlMasjedAlsahla.screenRoute,
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
