import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../zi_lhoja.dart';
import 'alyawm_al5amis_wal3ishroun_zilhoja.dart';
import 'khotbat_amir_almo2minin_tawm_al8adir.dart';

class AlyawmAlrabi3Wal3ishrounZilhoja extends StatefulWidget {
  static String screenRoute = 'alyawm_alrabi3_wal3ishroun_zilhoja_screen';
  const AlyawmAlrabi3Wal3ishrounZilhoja({super.key});

  @override
  State<AlyawmAlrabi3Wal3ishrounZilhoja> createState() =>
      _AlyawmAlrabi3Wal3ishrounZilhojaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlyawmAlrabi3Wal3ishrounZilhojaState
    extends State<AlyawmAlrabi3Wal3ishrounZilhoja> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alyawm_alrabi3_wal3ishroun_zilhoja_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_alyawm_alrabi3_wal3ishroun_zilhoja_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiLhoja.screenRoute);
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
                      .addFavorite('اليوم الرابع والعشرون',
                          AlyawmAlrabi3Wal3ishrounZilhoja.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'اليوم الرابع والعشرون',
                          AlyawmAlrabi3Wal3ishrounZilhoja.screenRoute,
                          AlyawmAlrabi3Wal3ishrounZilhoja.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اليوم الرابع والعشرون',
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
                      'هُو يوم المباهلة على الاشهر، باهل فيه رسول الله (صلى الله عليه وآله وسلم) نصارى نجران وقد اكتسى بعبائه، وأدخل معه تحت الكساء عليّاً وفاطمة والحسن والحسين (عليهم السلام) وقال : « اللهمّ انّه قد كان لكلّ نبيّ من الانبياء أهل بيت هم أخصّ الخلق اليه، اللهمّ وهؤلاءِ أهل بيتي فأذهب عنهم الرِّجس وَطهّرهم تطهيراً » فهبط جبرئيل بآية التّطهير في شأنهم، ثمّ خرج النّبيّ (صلى الله عليه وآله وسلم)بهم (عليهم السلام) للمباهلة، فلمّا بصر بهم النّصارى ورأوا منهم الصّدق وشاهدوا امارات العذاب، لم يجرؤا على المباهلة، فطلبوا المصالحة وقبلوا الجزية عليهم، وفي هذا اليوم أيضاً تصدّق أمير المؤمنين (عليه السلام) بخاتمه على الفقير وهو راكع، فنزل فيه الاية انّما وَليُّكُمُ اللهُ وَرَسُولُهُ.\n\n'
                      'والخلاصة : انّ هذا اليوم يوم شريف وفيه عدّة أعمال.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle: 'الغُسل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle: 'الصّيام.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'الصّلاة ركعتان كصلاة عيد الغدير وقتاً وصفة وأجراً، ولكن فيها تقرأ آية الكرسي الى هُمْ فيها خالِدُونَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'أن يدعو بدعاء المباهِلة وهو يشابه دعاء أسحار شهر رمضان وفي هذا الدّعاء يختلف نسخة الشّيخ عن نسخة السّيد اختلافاً كثيراً وانّي أختار منهما رواية الشّيخ في المصباح ، قال : دعاء يوم المباهلة مرويّاً عن الصّادق صلوات الله وسلامه عليه بما له من الفضل، تقول :\n\n'
                      'اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ بَهآئِكَ بِاَبْهاهُ وَكُلُّ بَهآئِكَ بَهِىٌّ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِبَهآئِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ جَلالِكَ بِاَجَلِّهِ وَكُلُّ جَلالِكَ جَليلٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِجَلالِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ جَمالِكَ بِاَجْمَلِهِ وَكُلُّ جَمالِكَ جَميلٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِجَمالِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَدْعُوكَ كَما اَمَرْتَنى فَاسْتَجِبْ لى كَما وَعَدْتَنى، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ عَظَمَتِكَ بِاَعْظَمِها وَكُلُّ عَظَمَتِكَ عَظَيمَةٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِعَظَمَتِكَ كُلِّها، اَللّـهُمَّ اِنّى اَسَأَلُكَ مِنْ نُورِكَ بِاَنْوَرِهِ وَكُلُّ نُورِكَ نَيِّرٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِنُورِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ رَحْمَتِكَ بِاَوْسَعِها وَكُلُّ رَحْمَتِكَ واسِعَةٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِرَحْمَتِكَ كُلِّها، اَللّـهُمَّ اِنّى اَدْعُوكَ كَما اَمَرْتَنى فَاسْتَجِبْ لى كَما وَعَدْتَنى، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ كَمالِكَ بِاَكْمَلِهِ وَكُلُّ كَمالِكَ كامِلٌ اَللّـهُمَّ اِنّى اَسْاَلُكَ بِكَمالِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ كَلِماتِكَ بِاَتَمِّها وَكُلُّ كَلِماتِكَ تآمَّةٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِكَلِماتِكَ كُلِّهَا، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ اَسمآئِكَ بِاَكْبَرِها وَكُلُّ اَسْمآئِكَ كَبيرَةٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِاَسْمآئِكَ كُلِّها، اَللّـهُمَّ اِنّى اَدْعُوكَ كَما اَمَرْتَنى فَاسْتَجِبْ لى كَما وَعَدْتَنى، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ عِزَّتِكَ باَعَزِّها وَكُلُّ عِزَّتِكَ عَزيزَةٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِعِزَّتِكَ كُلِّها، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ مَشِيَّتِكَ بِاَمْضاها وَكُلُّ مَشِيَّتِكَ ماضِيَةٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِمَشِيَّتِكَ كُلِّها، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِقُدْرَتِكَ الَّتى اسْتَطَلْتَ بِها عَلى كُلِّ شَىْء وَكُلُّ قُدْرَتِكَ مُسْتَطيلَةٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِقُدْرَتِكَ كُلِّها، اَللّـهُمَّ اِنّى اَدْعُوكَ كَما اَمَرْتَنى فَاسْتَجِبْ لى كَما وَعَدْتَنى، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ عِلْمِكَ بِاَنْفَذِهِ وَكُلُّ عِلْمِكَ نافِذٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِعِلْمِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ قَوْلِكَ بِاَرْضاهُ وَكُلُّ قَوْلِكَ رَضِىٌّ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِقَوْلِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ مَسآئِلِكَ بِاَحَبِّهآ وَكُلُّها اِلَيْكَ حَبيبةٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِمَسآئِلِكَ كُلِّها، اَللّـهُمَّ اِنّى اَدْعُوكَ كَما اَمَرْتَنى فَاسْتَجِبْ لى كَما وَعَدْتَنى، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ شَرَفِكَ بِاَشْرَفِهِ وَكُلُّ شَرَفِكَ شَريفٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِشَرَفِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ سُلْطانِكَ بِاَدْوَمِهِ وَكُلُّ سُلطانِكَ دآئِمٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِسُلْطانِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ مُلْكِكَ بِاَفْخَرِهِ وَكُلُّ مُلْكِكَ فاخِرٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِمُلْكِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَدْعُوكَ كَما اَمَرْتَنى فَاسْتَجِبْ لى كَما وَعَدْتَنى، '
                      'اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ عَلائِكَ بِاَعْلاهُ وَكُلُّ عَلائِكَ عال، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِعَلائِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ آياتِكَ بِاَعْجَبِها وَكُلُّ آياتِكَ عَجيبَةٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِاياتِكَ كُلِّها، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ مَنِّكَ بِاَقْدَمِهِ وَكُلُّ مَنِّكَ قَديمٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِمَنِّكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَدْعُوكَ كَما اَمَرْتَنى فَاسْتَجِبْ لى كَما وَعَدْتَنى، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِما اَنْتَ فيهِ مِنَ الشُّؤُنِ وَالْجَبَرُوتِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِكُلِّ شَأْن وَكُلِّ جَبَرُوت، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِما تُجيبُنى بِهِ حينَ اَسْاَلُكَ، يا اَللهُ يا لا اِلـهَ اِلاّ اَنْتَ، اَسْاَلُكَ بِبَهآءِ لا اِلـهَ اِلاّ اَنْتَ، يا لا اِلـهَ اِلاّ اَنْتَ اَسْاَلُكَ بِجَلالِ لا اِلـهَ اِلاّ اَنْتَ، يا لا اِلـهَ اِلاّ اَنْتَ اَسْاَلُكَ بِلا اِلـهَ اِلاّ اَنْتَ، اَللّـهُمَّ اِنّى اَدْعُوكَ كَما اَمَرْتَنى فَاسْتَجِبْ لى كَما وَعَدْتَنى، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ رِزْقِكَ باَعَمِّهِ وَكُلُّ رِزْقِكَ عآمُّ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِرِزْقِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ عَطآئِكَ بِاَهْنَإِهِ وَكُلُّ عَطآئِكَ هَنيئٌ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِعَطآئِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ خَيْرِكَ باَعْجَلِهِ وَكُلُّ خَيْرِكَ عاجِلُ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِخَيْرِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَسْاَلُكَ مِنْ فَضْلِكَ بِاَفْضَلِهِ وَكُلُّ فَضْلِكَ فاضِلُ، اَللّـهُمَّ اِنّى اَسْاَلُكَ بِفَضْلِكَ كُلِّهِ، اَللّـهُمَّ اِنّى اَدْعُوكَ كَما اَمَرْتَنى فَاسْتَجِبْ لى كَما وَعَدْتَنى، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَابْعَثْنى عَلَى الاِْيمانِ بِكَ، وَالتَّصْديقِ بِرَسُولِكَ عَلَيْهِ وَآلِهِ السَّلامُ، وَالْوِلايَةِ لِعَلِىِّ بْنِ اَبيطالِب، وَالْبَرآءَةِ مِنْ عَدُوِّهِ وَالاْيتِمامِ بِالاَْئِمَّةِ مِنْ آلِ مُحَمَّد عَلَيْهِمُ السَّلامُ فَإِنّى قَدْ رَضيتُ بِذلِكَ يا رَبِّ، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد عَبْدِكَ وَرَسُولِكَ فِى الاَْوَّلينَ، وَصَلِّ عَلى مُحَمَّد فِى الاَْخِرِينَ، وَصَلِّ عَلى مُحَمَّد فِى الْمَلاِ الاَْعْلى، وَصَلِّ عَلى مُحَمَّد فِى الْمُرْسَلينَ، اَللّـهُمَّ اَعْطِ مُحَمَّدًا الْوَسيلَةَ وَالشَّرَفَ وَالْفَضيلَةَ وَالدَّرَجَةَ الْكَبيرَةَ، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَقَنِّعْنى بِما رَزَقْتَنى، وَبارِكْ لى فيـما آتَيْتَنى، وَاحْفَظْنى فى غَيْبَتى وَكُلِّ غائِب هُوَ لى، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَابْعَثْنى عَلَى الاِْيمانِ بِكَ، وَالتَّصْديقِ بِرَسُولِكَ، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاَسْاَلُكَ خَيْرَ الْخَيْرِ رِضْوانَكَ وَالْجَنَّةَ، وَاَعُوذُ بِكَ مِنْ شَرِّ الشَرِّ سَخَطِكَ وَالنّارِ، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاحْفَظْنى مِنْ كُلِّ مُصيبَة، وَمِنْ كُلِّ بَلِيَّة، وَمِنْ كُلِّ عُقُوبَة، وَمِنْ كُلِّ فِتْنَة وَمِنْ كُلِّ بَلاء، وَمِنْ كُلِّ شَرّ، وَمِنْ كُلِّ مَكْرُوه، وَمِنْ كُلِّ مُصيبَة، وَمِنْ كُلِّ آفَة، نَزَلَتْ اَوْ تَنْزِلُ مِنَ السَّمآءِ اِلَى الاَْرْضِ فى هذِهِ السّاعَةِ، وَفى هذِهِ اللّيْلَةِ، وَفى هذَا الْيَومِ، وَفى هذَا الشَّهْرِ، وَفى هذِهِ السَّنَةِ، اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاقْسِمْ لى مِنْ كُلِّ سُرُور، وَمِنْ كُلِّ بَهْجَة، وَمِنْ كُلِّ اسْتِقامَة، وَمِنْ كُلِّ فَرَج، وَمِنْ كُلِّ عافِيَة، وَمِنْ كُلِّ سَلامَة، وَمِنْ كُلِّ كَرامَة، وَمِنْ كُلِّ رِزْق واسِع حَلال طَيِّب، وَمِنْ كُلِّ نِعْمَة وِمَنْ كُلِّ سَعَة نَزَلَتُ اَوْ تَنْزِلُ مِنَ السَّمآءِ اِلَى الاَْرْضِ فى هذِهِ السّاعَةِ وَفى هذِهِ اللّيْلَةِ وَفى هذَا الْيَوْمِ وَفى هذَا الشَّهْرِ وَفى هذِهِ السَّنَةِ، اَللّـهُمَّ اِنْ كانَتْ ذُنُوبى قَدْ اَخْلَقَتْ وَجْهى عِنْدَكَ، وَحالَتْ بَيْنى وَبَيْنَكَ، وَغَيَّرَتْ حالى عِنْدَكَ فَاِنّى اَسْاَلُكَ بِنُورِ وَجْهِكَ الَّذى لا يُطْفَأْ وَبِوَجْهِ مُحَمَّد حَبيبِكَ الْمُصْطَفى، وَبِوَجْهِ وَلِيِّكَ عَلِىّ الْمُرْتَضى، وَبِحَقِّ اَوْلِيآئِكَ الَّذينَ انْتَجَبْتَهُمْ اَنْ تُصَلِّىَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تَغْفِرَ لى ما مَضى مِنْ ذُنُوبى، وَاَنْ تَعْصِمَنى فيـما بَقِىَ مِنْ عُمْرى، وَاَعُوذُ بِكَ اَللّـهُمَّ اَنْ اَعُودَ فى شَىْء مِنْ مَعاصيكَ اَبَداً ما اَبْقَيْتَنى حَتّى تَتَوَفّانى، وَاَنَا لَكَ مُطيعٌ وَاَنْتَ عَنّى راض، وَاَنْ تَخْتِمَ لى عَمَلى بِاَحْسَنِهِ، وَتَجْعَلَ لى ثَوابَهُ الْجَنَّةَ، وَاَنْ تَفْعَلَ بى ما '
                      'اَنْتَ اَهْلُهُ يا اَهْلَ التَّقْوى وَيا اَهْلَ الْمَغْفِرَةِ، صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَارْحِمْنى بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'أن يدعو بما رواه الشّيخ والسّيد بعد الصّلاة ركعتين والاستغفار سبعين مرّة ومفتتح الدّعاء اَلْحَمْدُ للهِ رَبِّ الْعالَمينَ، وينبغي التّصدّق في هذا اليوم على الفقراء تأسّياً بمولى كلّ مؤمن ومؤمنة أمير المؤمنين (عليه السلام) وينبغي أيضاً زيارته (عليه السلام) والانسب قراءة الزّيارة الجامِعة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAl5amisWal3ishrounZilhoja.screenRoute,
        pushBack: KhotbatAmirAlmo2mininTawmAl8adir.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اليوم الرابع والعشرون من ذي الحجة.mp3',
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
