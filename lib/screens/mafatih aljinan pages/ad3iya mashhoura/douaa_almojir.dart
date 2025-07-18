import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ad3iya_mashhoura.dart';
import 'douaa_al3adila.dart';
import 'douaa_yastashir.dart';

class DouaaAlmojir extends StatefulWidget {
  static String screenRoute = 'douaa_almojir_screen';
  const DouaaAlmojir({super.key});

  @override
  State<DouaaAlmojir> createState() => _DouaaAlmojirState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _DouaaAlmojirState extends State<DouaaAlmojir> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_douaa_almojir_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_douaa_almojir_screen', value);
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
          .pushReplacementNamed(Ad3iyaMashhoura.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (previousPage == 'favorite_screen') {
                Navigator.of(context)
                    .pushReplacementNamed(FavoritesScreen.screenRoute);
              } else {
                Navigator.of(context).pushReplacementNamed(
                    Ad3iyaMashhoura.screenRoute);
              }
            },
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
                      .addFavorite('دعاء المجير', DouaaAlmojir.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('دعاء المجير', DouaaAlmojir.screenRoute,
                          DouaaAlmojir.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعاء المجير',
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
                      'وَهوَ دُعاء رَفيع الشّأن مَروِيّ عَنِ النّبي (صلى الله عليه وآله وسلم) نَزَل به جَبرئيل عَلَى الّنَبي (صلى الله عليه وآله وسلم) وَهْويصلّي في مَقامِ ابراهيم (عليه السلام).'
                      'ذكر الكفعمي هذا الدّعاءِ في كِتابيه البَلد الامين وَالمِصباح واشارَ في الهامِش اِلى ما لهِ مِنَ الفَضْل، وَمِن جُملتها اِنّ مَنْ دعا به في الايّام البيض مِنْ شَهر رَمَضان غفرت ذنوبه وَلَوْ كانت عَدَد قطر المطر، وَوَرق الشجر، وَرَمل، البر وَيجدى في شِفاءِ المريض وقضآءِ الدّين وَالغنى عَنِ الفقر وَيفرّج الغَم ويكشف الكرب، وهو هذا الدّعاء:',
                  weight: FontWeight.w400,
                  size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'سُبْحانَكَ يا اَللهُ تَعالَيْتَ يا رَحْمنُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا رَحيمُ تَعالَيْتَ يا كَريمُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مَلِكُ تَعالَيْتَ يا مالِكُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا قُدُّوسُ تَعالَيْتَ يا سَلامُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُؤْمِنُ تَعالَيْتَ يا مُهَيْمِنُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا عَزيزُ تَعالَيْتَ يا جَبّارُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُتَكَبِّرُ تَعالَيْتَ يا مُتَجَبِّرُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا خالِقُ تَعالَيْتَ يا بارِئُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُصَوِّرُ تَعالَيْتَ يا مُقَدِّرُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا هادى تَعالَيْتَ يا باقى اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا وَهّابُ تَعالَيْتَ يا تَوّابُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا فَتّاحُ تَعالَيْتَ يا مُرْتاحُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ ياسيِّدي تَعالَيْتَ يامولاي اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا قَريبُ تَعالَيْتَ يا رَقيبُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُبْدِئُ تَعالَيْتَ يا مُعيدُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا حَميدُ تَعالَيْتَ يا مَجيدُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا قَديمُ تَعالَيْتَ يا عَظيمُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا غَفُورُ تَعالَيْتَ يا شَكُورُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا شاهِدُ تَعالَيْتَ يا شَهيدُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا حَنّانُ تَعالَيْتَ يا مَنّانُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا باعِثُ تَعالَيْتَ يا وارِثُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُحْيى تَعالَيْتَ يا مُميتُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا شَفيقُ تَعالَيْتَ يا رَفيقُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا اَنيسُ تَعالَيْتَ يا موُنِسُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا جَليلُ تَعالَيْتَ يا جَميلُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا خَبيرُ تَعالَيْتَ يا بَصيرُ اَجِرْنا مِنَ النّارِ يا مَجيرُ، سُبْحانَكَ يا حَفِىُّ تَعالَيْتَ يا مَلِىُّ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مَعْبُودُ تَعالَيْتَ يا مَوُجُودُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا غَفّارُ تَعالَيْتَ يا قَهّارُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مَذْكُورُ تَعالَيْتَ يا مَشْكُورُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا جَوادُ تَعالَيْتَ يا مَعاذُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا جَمالُ تَعالَيْتَ يا جَلالُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا سابِقُ تَعالَيْتَ يا رازِقُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا صادِقُ تَعالَيْتَ يا فالِقُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا سَميعُ تَعالَيْتَ يا سَريعُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا رَفيعُ تَعالَيْتَ يا بديعُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا فَعّالُ تَعالَيْتَ يا مُتَعالُ اجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا قاضى تَعالَيْتَ يا راضى اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا قاهِرُ تَعالَيْتَ يا طاهِرُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا عالِمُ تَعالَيْتَ يا حكِمُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا دآئِمُ تَعالَيْتَ يا قآئِمُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا عاصِمُ تَعالَيْتَ يا قاسِمُ اِجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا غَنِىُّ تَعالَيْتَ يا مُغْنى اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا وَفِىُّ تَعالَيْتَ يا قَوِىُّ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا كافى تَعالَيْتَ يا شافى اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُقَدِّمُ تَعالَيْتَ يا مُؤَخِّرُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا اَوَّلُ تَعالَيْتَ يا آخِرُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا ظاهِرُ تَعالَيْتَ يا باطَنُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا رَجآءُ تَعالَيْتَ يا مُرْتَجى اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا ذَا الْمَنِّ تَعالَيْتَ يا ذَا الطَّوْلِ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا حَىُّ تَعالَيْتَ يا قَيّوُمُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا واحِدُ تَعالَيْتَ يا اَحَدُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا سَيِّدُ تَعالَيْتَ يا صَمَدُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا قَديرٌ تَعالَيْتَ يا كَبيْرٌ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا والى تَعالَيْتَ يا مُتَعالى اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا عَلِىُّ تَعالَيْتَ يا اَعْلى اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا وَلِىُّ تَعالَيْتَ يا مَوْلى اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا ذارِئُ تَعالَيْتَ يا بارِئُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا خافِضُ تَعالَيْتَ يا رافِعُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُقْسِطُ تَعالَيْتَ يا جامِعُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُعِزُّ تَعالَيْتَ يا مُذِلُّ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا حافِظُ تَعالَيْتَ يا حَفيظُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا قادِرُ تَعالَيْتَ يا مُقْتَدِرُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا عَليمُ تَعالَيْتَ يا حَليمُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا حَكَمُ تَعالَيْتَ يا حَكيمُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُعْطى تَعالَيْتَ يا مانِعُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا ضآرُّ تَعالَيْتَ يا نافِعُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُجيبُ تَعالَيْتَ يا حَسيبُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا عادِلُ تَعالَيْتَ يا فاصِلُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا لَطيفُ تَعالَيْتَ يا شَريفُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا رَبُّ تَعالَيْتَ يا حَقُّ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا ماجِدُ تَعالَيْتَ يا واحِدُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا عَفُوُّ تَعالَيْتَ يا مُنْتَقِمُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا واسِعُ تَعالَيْتَ يا مُوَسِّعُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا رَؤوُفُ تَعالَيْتَ يا عَطوُفُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا فَرْدُ تَعالَيْتَ يا وِتْرُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُقيتُ تَعالَيْتَ يا مُحيطُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا وَكيلُ تَعالَيْتَ يا عَدْلُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُبينُ تَعالَيْتَ يا مَتينُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا بَرُّ تَعالَيْتَ يا وَدُودُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا يارَشيدُ تَعالَيْتَ يا مُرْشِدُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا نُورُ تَعالَيْتَ يا مُنَوِّرُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا نَصيرُ تَعالَيْتَ يا ناصِرُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا صَبُورُ تَعالَيْتَ يا صابِرُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُحْصى تَعالَيْتَ يا مُنْشِئُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا سُبْحانُ تَعالَيْتَ يا دَيّانُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا مُغيثُ تَعالَيْتَ يا غِياثُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا فاطِرُ تَعالَيْتَ يا حاضِرُ اَجِرْنا مِنَ النّارِ يا مُجيرُ، سُبْحانَكَ يا ذَا الْعِزِّ والْجَمالِ تَبارَكْتَ يا ذَا الْجَبَرُوتِ وَالْجَلالِ، سُبْحانَكَ لا اِلـهِ اِلاّ اَنْتَ، سُبْحانَكَ اِنّى كُنْتُ مِنَ الظّالِمينَ فَاسْتَجَبْنا لَهُ وَنَجَّيْناهُ مِنَ الْغَمِّ وَكَذلِكَ نُنْجىِ الْمُؤمِنينَ، وَصَلَّى اللهُ عَلى سَيِّدِنا مُحَمَّد وَآلِهِ اَجْمَعينَ، وَالْحَمْدُ للهِ رَبِّ الْعالَمينَ وَحَسْبُنَا اللهُ وَنِعْمَ الْوَكيلُ وَلا حَوْلَ وَلا قُوَّةَ اِلاّ بِاللهِ الْعَليِّ العَظيمِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: DouaaAl3adila.screenRoute,
          pushBack: DouaaYastashir.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعاء المجير.mp3',
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
