import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../sha3ban.dart';
import 'fi_fadl_shaher_sha3ban.dart';
import 'yawm_alnisf_men_sha3ben.dart';

class A3malMaBakyaMenAlshaher extends StatefulWidget {
  static String screenRoute = 'a3mal_ma_bakeya_men_alshaher_screen';
  const A3malMaBakyaMenAlshaher({super.key});

  @override
  State<A3malMaBakyaMenAlshaher> createState() =>
      _A3malMaBakyaMenAlshaherState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _A3malMaBakyaMenAlshaherState extends State<A3malMaBakyaMenAlshaher> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_a3mal_ma_bakeya_men_alshaher_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_a3mal_ma_bakeya_men_alshaher_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Sha3ban.screenRoute);
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
                      .addFavorite('أعمال ما بقي من الشهر',
                          A3malMaBakyaMenAlshaher.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'أعمال ما بقي من الشهر',
                          A3malMaBakyaMenAlshaher.screenRoute,
                          A3malMaBakyaMenAlshaher.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'أعمال ما بقي من الشهر',
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
                      'عن الرّضا صلوات الله وسلامه عليه قال : من صام ثلاثة أيّام من آخر شعبان ووصلها بشهر رمضان كتب الله تعالى له صيام شهرين متتابعين، وعن أبي الصّلت الهروي قال : دخلت على الامام الرّضا (عليه السلام)في آخر جمعة من شعبان فقال لي: يا أبا الصّلت انّ شعبان قد مضى اكثره وهذا آخر جمعة فيه فتدارك فيما بقى تقصيرك فيما مضى منه وعليك بالاقبال على ما يعنيك، واكثر من الدّعاء والاستغفار وتلاوة القرآن وتب الى الله من ذنوبك ليقبل شهر رمضان اليك وأنت مخلص لله عزّوجل، ولا تدعنّ امانة في عنقك الّا أدّيتها ولا في قلبك حقداً على مؤمن الّا نزعته، ولا ذنباً انت مرتكبه إلاّ أقلعت عنه، واتقّ الله وتوكّل عليه في سرائرك وعلانيتك(وَمَنْ يَتَوكَّلْ عَلَى اللهِ فَهُوَ حَسْبُهُ اِنَّ اللهَ بالِغُ اَمْرِهِ قَدْ جَعَلَ اللهُ لِكُلِّ شَىء قَدْراً) واكثر من أن تقول في ما بقى من هذا الشّهر : اَللّـهُمَّ اِنْ لَمْ تَكُنْ غَفَرْتَ لَنا فيما مَضى مِنْ شَعْبانَ فَاغْفِرْ لَنا فيما بَقِيَ مِنْهُ، فانّ الله تبارك وتعالى يعتق في هذا الشّهر رقاباً من النّار لحرمة هذا الشّهر، وروى الشّيخ عن حارث بن مغيرة النّضري قال : كان الصّادق صلوات الله وسلامه عليه يدعو في آخر ليلة من شعبان وأوّل ليلة من رمضان :\n\n'
                      'اَللّـهُمَّ اِنَّ هذَا الشَّهْرَ الْمُبارَكَ الَّذي اُنْزِلَ فيهِ الْقُرآنُ وَجُعِلَ هُدىً لِلنّاسِ وَبَيِّناتِ مِنَ الْهُدى وَالْفُرْقانِ قَدْ حَضَرَ فَسَلِّمْنا فيهِ وَسَلَّمْهُ لَنا وَتَسَلِّمْهُ مِنّا في يُسْر مِنْكَ وعافِيَة، يا مَنْ اَخَذَ الْقَليلَ، وَشَكَرَ الْكَثيرَ، اِقْبَل مِنِّى الْيَسيرَ، اَللّـهُمَّ اِنّي اَساَلُكَ اَنْ تَجْعَلَ لي اِلى كُلِّ خَيْر سَبيلاً، وَمِنْ كُلِّ ما لا تُحِبُّ مانِعاً، يا اَرْحَمَ الرّاحِمينَ، يا مَنْ عَفا عَنّي وَعَمّا خَلَوْتُ بِهِ مِنَ السَّيِّئاتِ، يا مَنْ لَمْ يُؤاخِذْني بِارْتِكابِ الْمَعاصي، عَفْوَكَ عَفْوَكَ عَفْوَكَ ياكَريمُ، اِلـهي وَعَظتَني فَلَمْ اَتَّعِظْ، وَزَجَرْتَني عَنْ مَحارِمِكَ فلَمْ اَنْزَجِرْ، فَما عُذْري، فَاعْفُ عَنّي يا كَريمُ، عَفْوَكَ عَفْوَكَ، اَللّـهُمَّ اِنّي اَساَلُكَ الرّاحَةَ عًنْدَ الْمَوْتِ، وَالْعَفْوَ عِنْدَ الْحِسابِ، عَظُمَ الذَّنْبُ مِنْ عَبدِكَ فَلْيَحْسُنِ التَّجاوُزُ مِنْ عِنْدِكَ، يا اَهْلَ التَّقْوى وَيا اَهْلَ الْمَغْفِرَةِ، عَفْوَكَ عَفْوَكَ، اَللّـهُمَّ اِنّي عَبْدُكَ ابْنُ عَبْدِكَ وابنُ اَمَتِكَ، ضَعيْفٌ فَقيرٌ اِلى رَحْمَتِكَ وَاَنْتَ مُنْزِلُ الْغِنى والْبَرَكَةِ عَلَى الْعِبادِ قاهِرٌ مُقْتَدِرٌ اَحْصَيْتَ اَعمالَهُمْ، وَقَسَمْتَ اَرْزاقَهُمْ، وَجَعَلْتَهُمْ مُخْتَلِفَةً اَلْسِنَتُهُمْ وَاَلْوانُهُمْ خَلْقاً مِنْ بَعْدِ خَلْق، وَلايَعْلَمُ الْعِبادُ عِلْمَكَ، وَلا يَقْدِرُ الْعِبادُ قَدْرَكَ، وَكُلُّنا فَقيرٌ اِلى رَحْمَتِكَ، فَلا تَصْرِفْ عَنّي وَجْهَكَ، واجْعَلْني مِنْ صالِحِي خَلْقِكَ الْعَمَلِ وَالاْمَلِ وَالْقَضاءِ وَالْقَدَرِ، اَللّـهُمَّ اَبْقِني خَيْرَ الْبَقاءِ، وَاَفِنني خَيْرَ الْفَناءِ عَلى مُوالاةِ اَوْلِيائِكَ وَمُعادةِ اَعْدائِكَ، والرَّغْبَةِ اِلَيْكَ، والرَّهْبَةِ مِنْكَ وَالْخُشُوعِ وَالْوَفاء وَالتَّسْليمِ لَكَ وَالتَّصْديقِ بِكِتابِكَ وَاتّباعِ سُنَّةِ رَسُولِكَ، اَللّـهُمَّ ما كانَ في قَلْبي مِنْ شَكٍّ اَوْ رَيْبَة اَوْ جُحُود اَوْ قُنُوط اَوْ فَرَح اَوْ بَذَخ اَوْ بَطَر اَوْ خُيَلاءِ اَوْ رِياء اَوْ سُمْعَة اَوْ شِقاق اَوْ نِفاق اَوْ كُفْر اَوْ فُسُوق اَوْ عِصْيان اَوْ عَظَمَة اَوْ شَيء لا تُحِبُّ فَاَسْأَلُكَ يا رَبِّ أنْ تُبَدِّلَني مَكانَهُ ايماناً بِوَعْدِكَ، وَوَفاءً بِعَهْدِكَ، وَرِضاً بِقَضائِكَ، وَزُهْداً فِي الدُّنْيا، وَرَغْبَةً فيما عِنْدَكَ، وَاَثَرَةً وَطُمَأنينَةً وَتَوْبَةً نَصُوحاً اَساَلُكَ ذلِكَ يا رَبَّ الْعالَمينَ، اِلـهي اَنْتَ مِنْ حِلْمِكَ تُعْصى، وَمِنْ كَرَمِكَ وَجُودِكَ تُطاعُ، فَكَانَّكَ لَمْ تُعْصَ وَاَنَا وَمَنْ لَمْ يَعْصِكَ سُكّانُ اَرْضِكَ، فَكُنْ عَلَيْنابِالْفَضْلِ جَواداً، وَبِالْخَيْرِ عَوّاداً يا اَرْحَمَ الرّاحِمينَ، وَصَلَّى اللهُ عَلى مُحَمَّد وَآلِهِ صَلاةً دائِمَةً لا تُحْصى وَلا تُعَدُّ وَلا يَقْدِرُ قَدْرَها غَيْرُكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: FiFadlShaherSha3ban.screenRoute,
        pushBack: YawmAlnisfMenSha3ben.screenRoute,
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
