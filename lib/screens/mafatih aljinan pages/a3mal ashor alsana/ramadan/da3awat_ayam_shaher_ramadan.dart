import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ramadan.dart';
import 'alyawm_alsalasin_ramadan.dart';
import 'fi_fadel_shaher_ramadan_wa2a3maloh.dart';

class Da3awatAyamShaherRamadan extends StatefulWidget {
  static String screenRoute = 'da3awat_ayam_shaher_ramadan_screen';
  const Da3awatAyamShaherRamadan({super.key});

  @override
  State<Da3awatAyamShaherRamadan> createState() =>
      _Da3awatAyamShaherRamadanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Da3awatAyamShaherRamadanState extends State<Da3awatAyamShaherRamadan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_da3awat_ayam_shaher_ramadan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_da3awat_ayam_shaher_ramadan_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ramadan.screenRoute);
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
                      .addFavorite('دعوات أيام شهر رمضان',
                          Da3awatAyamShaherRamadan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعوات أيام شهر رمضان',
                          Da3awatAyamShaherRamadan.screenRoute,
                          Da3awatAyamShaherRamadan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'دعوات أيام شهر رمضان',
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
                      'فقد روي عن ابن عبّاس عن النّبي (صلى الله عليه وآله وسلم) فضلاً كثيراً لصيام كلّ يوم من شهر رمضان وذكر لكلّ يوم منه دعاءاً يخصّه ذا فضل كثير وأجر جزيل ونحن نقتصر على ايراد الدّعوات .',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'دعاء اليوم الاوّل :',
                  subtitle:
                      'اَللّـهُمَّ اجْعَلْ صِيامي فيهِ صِيامَ الصّائِمينَ، وَقِيامي فيهِ قيامَ الْقائِمينَ، وَنَبِّهْني فيهِ عَنْ نَوْمَةِ الْغافِلينَ، وَهَبْ لى جُرْمي فيهِ يا اِلـهَ الْعالَمينَ، وَاعْفُ عَنّي يا عافِياً عَنْ الُْمجْرِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّاني :',
                  subtitle:
                      'اَللّـهُمَّ قَرِّبْني فيهِ اِلى مَرْضاتِكَ، وَجَنِّبْني فيهِ مِنْ سَخَطِكَ وَنَقِماتِكَ، وَوَفِّقْني فيهِ لِقِرآءَةِ ايـاتِكَ بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّالث :',
                  subtitle:
                      'اَللّـهُمَّ ارْزُقْني فيهِ الذِّهْنَ وَالتَّنْبيهَ، وَباعِدْني فيهِ مِنَ السَّفاهَةِ وَالَّتمْويهِ، وَاجْعَلْ لى نَصيباً مِنْ كُلِّ خَيْر تُنْزِلُ فيهِ، بِجُودِكَ يا اَجْوَدَ الاَْجْوَدينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الرّابع :',
                  subtitle:
                      'اَللّـهُمَّ قَوِّني فيهِ عَلى اِقامَةِ اَمْرِكَ، وَاَذِقْني فيهِ حَلاوَةَ ذِكْرِكَ، وَاَوْزِعْني فيهِ لاَِداءِ شُكْرِكَ بِكَرَمِكَ، وَاحْفَظْني فيهِ بِحِفْظِكَ وَسَتْرِكَ، يا اَبْصَرَ النّاظِرينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الخامس :',
                  subtitle:
                      'اَللّـهُمَّ اجْعَلْني فيهِ مِنْ الْمُسْتَغْفِرينَ، وَاجْعَلْني فيهِ مِنْ عِبادِكَ الصّالِحينَ اْلقانِتينَ، وَاجْعَلني فيهِ مِنْ اَوْلِيائِكَ الْمُقَرَّبينَ، بِرَأْفَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم السّادس :',
                  subtitle:
                      'اَللّـهُمَّ لا تَخْذُلْني فيهِ لِتَعَرُّضِ مَعْصِيَتِكَ، وَلاتَضْرِبْني بِسِياطِ نَقِمَتِكَ، وَزَحْزِحْني فيهِ مِنْ مُوجِباتِ سَخَطِكَ، بِمَنِّكَ وَاَياديكَ يا مُنْتَهى رَغْبَةِ الرّاغِبينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم السّابع :',
                  subtitle:
                      'اَللّـهُمَّ اَعِنّي فِيهِ عَلى صِيامِهِ وَقِيامِهِ، وَجَنِّبْني فيهِ مِنْ هَفَواتِهِ وَآثامِهِ، وَارْزُقْني فيهِ ذِكْرَكَ بِدَوامِهِ، بِتَوْفيقِكَ يا هادِيَ الْمُضِلّينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّامن :',
                  subtitle:
                      'اَللّـهُمَّ ارْزُقْني فيهِ رَحْمَةَ الاَْيْتامِ، وَاِطْعامَ اَلطَّعامِ، وَاِفْشاءَ السَّلامِ، وَصُحْبَةَ الْكِرامِ، بِطَولِكَ يا مَلْجَاَ الاْمِلينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم التّاسع :',
                  subtitle:
                      'اَللّـهُمَّ اجْعَلْ لي فيهِ نَصيباً مِنْ رَحْمَتِكَ الْواسِعَةِ، وَاهْدِني فيهِ لِبَراهينِكَ السّاطِعَةِ، وَخُذْ بِناصِيَتي اِلى مَرْضاتِكَ الْجامِعَةِ، بِمَحَبَّتِكَ يا اَمَلَ الْمُشْتاقينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم العاشر :',
                  subtitle:
                      'اَللّـهُمَّ اجْعَلْني فيهِ مِنَ الْمُتَوَكِّلينَ عَلَيْكَ، وَاجْعَلْني فيهِ مِنَ الْفائِزينَ لَدَيْكَ، وَاجْعَلْني فيهِ مِنَ الْمُقَرَّبينَ اِلَيْكَ، بِاِحْسانِكَ يا غايَةَ الطّالِبينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الحادي عشر :',
                  subtitle:
                      'اَللّـهُمَّ حَبِّبْ اِلَيَّ فيهِ الاِْحْسانَ، وَكَرِّهْ اِلَيَّ فيهِ الْفُسُوقَ وَالْعِصْيانَ، وَحَرِّمْ عَلَيَّ فيهِ السَّخَطَ وَالنّيرانَ بِعَوْنِكَ يا غِياثَ الْمُسْتَغيثينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّاني عشر :',
                  subtitle:
                      'اَللّـهُمَّ زَيِّنّي فيهِ بِالسِّتْرِ وَالْعَفافِ، وَاسْتُرْني فيهِ بِلِباسِ الْقُنُوعِ وَالْكَفافِ، وَاحْمِلْني فيهِ عَلَى الْعَدْلِ وَالاِْنْصافِ، وَآمِنّي فيهِ مِنْ كُلِّ ما اَخافُ، بِعِصْمَتِكَ يا عِصْمَةَ الْخائِفينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّالث عشر :',
                  subtitle:
                      'اَللّـهُمَّ طَهِّرْني فيهِ مِنَ الدَّنَسِ وَالاَْقْذارِ، وَصَبِّرْني فيهِ عَلى كائِناتِ الاَْقْدارِ، وَوَفِّقْني فيهِ لِلتُّقى وَصُحْبَةِ الاْبْرارِ، بِعَوْنِكَ يا قُرَّةَ عَيْنِ الْمَساكينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الرّابع عشر :',
                  subtitle:
                      'اَللّـهُمَّ لا تُؤاخِذْني فيهِ بِالْعَثَراتِ، وَاَقِلْني فيهِ مِنَ الْخَطايا وَالْهَفَواتِ، وَلا تَجْعَلْني فيهِ غَرَضاً لِلْبَلايا وَالاْفاتِ، بِعِزَّتِكَ يا عِزَّ الْمُسْلِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الخامس عشر :',
                  subtitle:
                      'اَللّـهُمَّ ارْزُقْني فيهِ طاعَةَ الْخاشِعينَ، وَاشْرَحْ فيهِ صَدْري بِاِنابَةِ الُْمخْبِتينَ، بِاَمانِكَ يا اَمانَ الْخائِفينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم السّادس عشر :',
                  subtitle:
                      'اَللّـهُمَّ وَفِّقْني فيهِ لِمُوافَقَةِ الاَْبْرارِ، وَجَنِّبْني فيهِ مُرافَقَةَ الاَْشْرارِ، وَآوِني فيهِ بِرَحْمَتِكَ اِلى دارِ الْقَـرارِ، بِاِلهِيَّتِكَ يا اِلـهَ الْعالَمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم السّابع عشر :',
                  subtitle:
                      'اَللّـهُمَّ اهْدِني فيهِ لِصالِحِ الاَْعْمالِ، وَاقْضِ لي فيهِ الْحَوائِجَ وَالاْمالَ، يا مَنْ لا يَحْتاجُ اِلَى التَّفْسيرِ وَالسُّؤالِ، يا عالِماً بِما في صُدُورِ الْعالَمينَ، صَلِّ عَلى مُحَمَّد وَآلِهِ الطّاهِرينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّامن عشر :',
                  subtitle:
                      'اَللّـهُمَّ نَبِّهْني فيهِ لِبَرَكاتِ اَسْحارِهِ، وَنَوِّرْ فيهِ قَلْبي بِضياءِ اَنْوارِهِ، وَخُذْ بِكُلِّ اَعْضائي اِلَى اتِّباعِ آثارِهِ، بِنُورِكَ يا مُنَوِّرَ قُلُوبِ الْعارِفينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم التّاسع عشر :',
                  subtitle:
                      'اَللّـهُمَّ وَفِّرْ فيهِ حَظّي مِنْ بَرَكاتِهِ، وَسَهِّلْ سَبيلي اِلى خَيْراتِهِ، وَلا تَحْرِمْني قَبُولَ حَسَناتِهِ، يا هادِياً اِلى الْحَقِّ الْمُبينِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم العشرين :',
                  subtitle:
                      'اَللّـهُمَّ افْتَحْ لي فيهِ اَبْوابَ الْجِنانِ، وَاَغْلِقْ عَنّي فيهِ اَبْوابَ النّيرانِ، وَوَفِّقْني فيهِ لِتِلاوَةِ الْقُرْآنِ، يا مُنْزِلَ السَّكينَةِ فى قُلُوبِ الْمُؤْمِنينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الحادي والعشرين :',
                  subtitle:
                      'اَللّـهُمَّ اجْعَلْ لى فيهِ اِلى مَرْضاتِكَ دَليلاً، وَلا تَجْعَلْ لِلشَّيْطانِ فيهِ عَلَيَّ سَبيلاً، وَاجْعَلِ الْجَنَّةَ لى مَنْزِلاً وَمَقيلاً، يا قاضِيَ حَوائِجِ الطّالِبينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّاني والعشرين :',
                  subtitle:
                      'اَللّـهُمَّ افْتَحْ لى فيهِ اَبْوابَ فَضْلِكَ، وَاَنْزِلْ عَلَيَّ فيهِ بَرَكاتِكَ، وَوَفِّقْني فيهِ لِمُوجِباتِ مَرْضاتِكَ، وَاَسْكِنّي فيهِ بُحْبُوحاتِ جَنّاتِكَ، يا مُجيبَ دَعْوَةِ الْمُضْطَرّينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّالث والعشرين :',
                  subtitle:
                      'اَللّـهُمَّ اغْسِلْني فيهِ مِنَ الذُّنُوبِ، وَطَهِّرْني فيهِ مِنَ الْعُيُوبِ، وَامْتَحِنْ قَلْبي فيهِ بِتَقْوَى الْقُلُوبِ، يا مُقيلَ عَثَراتِ الْمُذْنِبينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الرّابع والعشرين :',
                  subtitle:
                      'اَللّـهُمَّ اِنّي اَسْأَلُكَ فيهِ ما يُرْضيكَ، وَاَعُوذُبِكَ مِمّا يُؤْذيكَ، وَاَسْأَلُكَ التَّوْفيقَ فيهِ لاَِنْ اُطيعَكَ وَلا اَعْصيْكَ، يا جَوادَ السّائِلينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الخامس والعشرين :',
                  subtitle:
                      'اَللّـهُمَّ اجْعَلْني فيهِ مُحِبَّاً لاَِوْلِيائِكَ، وَمُعادِياً لاَِعْدائِكَ، مُسْتَنّاً بِسُنَّةِ خاتَمِ اَنْبِيائِكَ، يا عاصِمَ قُلُوبِ النَّبِيّينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم السّادس والعشرين :',
                  subtitle:
                      'اَللّـهُمَّ اجْعَلْ سَعْيي فيهِ مَشْكُوراً، وَذَنْبي فيهِ مَغْفُوراً وَعَمَلي فيهِ مَقْبُولاً، وَعَيْبي فيهِ مَسْتُوراً، يا اَسْمَعَ السّامِعينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم السّابع والعشرين :',
                  subtitle:
                      'اَللّـهُمَّ ارْزُقْني فيهِ فَضْلَ لَيْلَةِ الْقَدْرِ، وَصَيِّرْ اُمُوري فيهِ مِنَ الْعُسْرِ اِلَى الْيُسْرِ، وَاقْبَلْ مَعاذيري، وَحُطَّ عَنّيِ الذَّنْبَ وَالْوِزْرَ، يا رَؤوفاً بِعِبادِهِ الصّالِحينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّامن والعشرين :',
                  subtitle:
                      'اَللّـهُمَّ وَفِّرْ حَظّي فيهِ مِنَ النَّوافِلِ، وَاَكْرِمْني فيهِ بِاِحْضارِ الْمَسائِلِ، وَقَرِّبْ فيهِ وَسيلَتى اِلَيْكَ مِنْ بَيْنِ الْوَسائِلِ، يا مَنْ لا يَشْغَلُهُ اِلْحـاحُ الْمُلِحّينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم التّاسع والعشرين :',
                  subtitle:
                      'اَللّـهُمَّ غَشِّني فيهِ بِالرَّحْمَةِ، وَارْزُقْني فيهِ التَّوْفيقَ وَالْعِصْمَةَ، وَطَهِّرْ قَلْبي مِنْ غَياهِبِ التُّهْمَةِ، يا رَحيماً بِعِبادِهِ الْمُؤْمِنينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّلاثين :',
                  subtitle:
                      'اَللّـهُمَّ اجْعَلْ صِيامى فيهِ بِالشُّكْرِ وَالْقَبُولِ عَلى ما تَرْضاهُ وَيَرْضاهُ الرَّسُولُ، مُحْكَمَةً فُرُوعُهُ بِالاُْصُولِ، بِحَقِّ سَيِّدِنا مُحَمَّد وَآلِهِ الطّاهِرينَ، وَالْحَمْدُ للهِ رَبِّ الْعالَمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أقول :',
                  subtitle:
                      'اختلفت كتب الدّعوات في تقديم بعض الدّعوات والعبادات على بعض، والرّواية في ذلك غير معتبرة عندي لذلك لم أتعرّض لشيء منه، وقد ذكر الكفعمي دعاء اليوم السّابع والعشرين لليوم التّاسع والعشرين ولا يبعد أن يكون الانسب على مذهب الشّيعة الدّعاء به في اليوم الثّالث والعشرين ، انتهى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: FiFadelShaherRamadanWa2a3maloh.screenRoute,
        pushBack: AlyawmAlsalasinRamadan.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/دعوات ايام شهر رمضان.mp3',
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
