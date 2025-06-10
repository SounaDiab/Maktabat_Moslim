import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ramadan.dart';
import 'allayla_al2oula_ramadan.dart';
import 'alyawm_alsadis_ramadan.dart';

class AlyawmAl2awalRamadan extends StatefulWidget {
  static String screenRoute = 'alyawm_al2awal_ramadan_screen';
  const AlyawmAl2awalRamadan({super.key});

  @override
  State<AlyawmAl2awalRamadan> createState() => _AlyawmAl2awalRamadanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlyawmAl2awalRamadanState extends State<AlyawmAl2awalRamadan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alyawm_al2awal_ramadan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alyawm_al2awal_ramadan_screen', value);
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
                      .addFavorite(
                          'اليوم الأول', AlyawmAl2awalRamadan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'اليوم الأول',
                          AlyawmAl2awalRamadan.screenRoute,
                          AlyawmAl2awalRamadan.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اليوم الأول',
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
                  'وفيه أعمال :',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 17, 126, 20),
                  ),
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle:
                      'أن يغتسل في ماء جار ويصبّ على رأسه ثلاثين كفّاً من الماء، فانّ ذلك يورث الامن من جميع الالام والاسقام في تلك السّنة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'أن يغسل وجهه بكفّ من ماء الورد لينجو من المذلّة والفقر وأن يصب شيئاً منه على رأسه ليأمن من السِرسام.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle: 'أن يؤدي ركعتي صلاة اوّل الشّهور والصّدقة بعدهما.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'أن يصلّي ركعتين يقرأ في الاُولى الحمد وسورة انّا فتحنا، وفي الثّانية الحمد وما شاء من السّور ليدرأ الله عنه كلّ سوء ويكون في حفظ الله الى العام القادم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle: 'أن يقول اذا طلع الفجر :\n\n'
                      'اَللّـهُمَّ قَدْ حَضَرَ شَهْرُ رَمَضانَ، وَقَدِ افْتَرَضْتَ عَلَيْنا صِيامَهُ، وَاَنْزَلْتَ فيهِ الْقُرآنَ هُدىً لِلنّاسِ وَبَيِّنات مِنَ الْهُدى وَالْفُرْقانِ، اَللّـهُمَّ اَعِنّا عَلى صِيامِهِ، وَتَقَبَّلْهُ مِنّا وَتَسَلَّمْهُ مِنّا وَسَلِّمْهُ لَنا في يُسْر مِنَكَ وَعافِيَة اِنَّكَ عَلى كُلِّ شَيْء قَديرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'أن يدعو بالدّعاء الرّابع والاربعين من أدهية الصّحيفة الكاملة إن لم يدع به ليلاً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'قال العلاّمة المجلسي في كتاب زاد المعاد : روى الكليني والطّوسي وغيرهما بسند صحيح عن الامام موسى الكاظم (عليه السلام) قال : ادع بهذا الدّعاء في شهر رمضان في اوّل السّنة، أي اليوم الاوّل من الشّهر على ما فهمه العلماء وقال (عليه السلام) : من دعا الله تعالى خلواً من شوائب الاغراض الفاسدة والرّياء لم تصبه في ذلك العام فتنة ولا ضلالة ولا آفة يضرّ دينه أو بدنه، وصانه الله تعالى من شرّ ما يحدث في ذلك العام من البلايا، وهو هذا الدّعاء :\n\n'
                      'اَللّـهُمَّ اِنّي اَسْاَلُكَ بِإسْمِكَ الَّذي دانَ لَهُ كُلُّ شَيْء، وَبِرَحْمَتِكَ الَّتي وَسِعَتْ كُلَّ شَيْء، وَبِعَظَمَتِكَ الَّتي تَواضَعَ لَها كُلُّ شَيْء، وَبِعِزَّتِكَ الَّتي قَهَرَتْ كُلَّ شَيْء، وَبِقُوَّتِكَ الَّتي خَضَعَ لَها كُلُّ شَيْء، وَبِجَبَرُوتِكَ الَّتي غَلَبَتْ كُلَّ شَىْء، وَبِعِلْمِكَ الَّذي اَحاطَ بِكُلِّ شَيْء، يا نُورُ يا قُدُّوسُ، يا اَوَّلَ قبْلَ كُلِّ شَيْء، وَيا باقِياً بَعْدَ كُلِّ شَيْء، يا اَللهُ يا رَحْمنُ، صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاغْفِرْ لِيَ الذُّنُوبَ الَّتي تُغَيِّرُ النِّعَمَ، وَاغْفِرْ لِيَ الذُّنُوبَ الَّتي تُنْزِلُ النِّقَمَ، وَاغْفِرْ لِيَ الذُّنُوبَ الَّتي تَقْطَعُ الرَّجاءَ، وَاغْفِرْ لايَ لذُّنُوبَ الَّتي تُديلُ الاَعْداءَ، وَاغْفِرْ لِيَ الذُّنُوبَ الَّتى تَرُدُّ الدُّعاءَ، وَاغْفِرْ لِيَ الذُّنُوبَ الَّتي يُسْتَحَقُّ بِها نُزُولُ الْبَلاءِ وَاغْفِرْ لِيَ الذُّنُوبَ الَّتي تَحْبِسُ غَيْثَ السَّماءِ، وَاغْفِرْ لِيَ الذُّنُوبَ الَّتي تَكْشِفُ الْغِطاءَ، وَاغْفِرْ لِيَ الذُّنُوبَ الَّتي تُعَجِّلُ الْفَناءَ، وَاغْفِرْ لِيَ الذُّنُوبَ الَّتي تُورِثُ النَّدَمَ، وَاغْفِرْ لِيَ الذُّنُوبَ الَّتي تَهْتِكُ الْعِصَمَ، وَاَلْبِسْني دِرْعَكَ الْحَصينَةَ الَّتي لا تُرامُ، وَعافِني مِنْ شَرِّ ما اُحاذِرُ بِاللَّيْلِ وَالنَّهارِ في مُسْتَقْبِلِ سَنَتي هذِهِ، اَللّـهُمَّ رَبَّ السَّماواتِ السَّبْعِ، وَرَبَّ الاَرَضينَ السَّبْعِ وَما فيهِنَّ وَما بَيْنَهُنَّ، وَرَبَّ الْعَرْشِ الْعَظيمِ، وَرَبَّ السْبْعِ الْمَثاني، وَالْقُرْآنِ الْعَظيمِ، وَرَبَّ اِسْرافيلَ وَميكائيلَ وَجَبْرائيلَ، وَرَبَّ مُحَمَّد صَلَّى اللهُ عَلَيْهِ وَآلِهِ سَيِّدِ الْمُرْسَلينَ وَخاتَمِ النَّبِيّينَ، اَسْاَلُكَ بكَ وَبِما سَمَّيْتَ بهِ نَفْسَكَ يا عَظيمُ، اَنْتَ الَّذي تَمُنَّ بِالْعَظيمِ، وَتَدْفَعُ كُلَّ مَحْذُور، وَتُعْطي كُلَّ جَزِيل، وَتُضاعِفُ الْحَسَناتِ بِالْقَليلِ وَبِالْكَثيرِ، وَتَفْعَلُ ما تَشاءُ يا قَديرُ يا اَللهُ يا رَحْمن، صَلِّ عَلى مُحَمَّد وَاَهْلِ بَيْتِهِ، وَاَلْبِسْني في مُسْتَقْبَلِ سَنَتي هذِهِ سِتْرَكَ، وَنَضِّرْ وَجْهي بِنُورِكَ، وَاَحِبَّني بِمَحبَّتِكَ، وَبَلِّغْني رِضْوانَكَ، وَشَريفَ كَرامَتِكَ، وَجَسيمَ عَطِيَّتِكَ، وَاَعْطِني مِنْ خَيْرِ ما عِنْدَكَ وَمِنْ خَيْرِ ما اَنْتَ مُعْطيهِ اَحَداً مِنْ خَلْقِكَ، وَاَلْبِسْني مَعَ ذلِكَ عافِيَتَكَ يا مَوْضِعَ كُلِّ شَكْوى، وَيا شاهِدَ كُلِّ نَجْوى، وَيا عالِمَ كُلِّ خَفِيَّة، وَيا دافِعَ ما تَشاءُ مِنْ بَلِيَّة، يا كَريمَ الْعَفْوِ، يا حَسَنَ التَّجاوُزِ، تَوَفَّني عَلى مِلَّةِ اِبْراهيمَ وَفِطْرَتِهِ، وَعَلى دينِ مُحَمَّد صَلَّى اللهُ عَلَيْهِ وآلِهِ وَسُنَّتِهِ، وَعَلى خَيْرِ الْوَفاةِ، فَتَوَفَّني مُوالِياً لاَِولِيائِكَ، وَمُعادِياً لاَِعْدائِكَ، اَللّـهُمَّ وَجَنِّبْني في هذِهِ السَّنَةِ كُلَّ عَمَل اَوْ قَوْل اَوْ فِعْل يُباعِدُني مِنْكَ، وَاَجْلِبْني اِلَى كُلِّ عَمَل اَوْ قَوْل اَوْ فِعْل يُقَرِّبُني مِنْكَ في هذِهِ السَّنَةِ يا اَرْحَمَ '
                      'الرّاحِمينَ، وَامْنَعْني مِنْ كُلِّ عَمَل اَوْ قَوْل اَوْ فِعْل يَكُونُ مِنّي اَخافُ ضَرَرَ عاقِبَتهِ، وَاَخافُ مَقْتَكَ اِيّايَ عَلَيْهِ حِذارَ اَنْ تَصْرِفَ وَجْهَكَ الْكَريمَ عَنّي فَاَستَوجِبَ بِهِ نَقْصاً مِنْ حَظٍّ لي عِنْدَكَ يا رَؤوفُ يا رَحيمُ، اَللّـهُمَّ اجْعَلْني في مُسْتَقْبَلِ سَنَتي هذِهِ في حِفْظِكَ وفي جِوارِكَ وَفي كَنَفِكَ، وَجَلِّلْني سِتْرَ عافِيَتِكَ، وَهَبْ لي كَرامَتَكَ، عَزَّ جارُكَ وَجَلَّ ثَناؤُكَ وَلا اِلـهَ غَيْرُكَ، اَللّـهُمَّ اجْعَلني تابِعاً لِصالِحي مَنْ مَضى مِنْ اَوْلِيائِكَ، وَاَلْحِقْني بِهِمْ وَاَجْعَلْني مُسْلِماً لِمَنْ قالَ بِالصِّدْقِ عَلَيْكَ مِنْهُمْ، وَاَعُوذُ بِكَ اَللّـهُمَّ اَنْ تُحيطَ بي خَطيئَتي وَظُلْمي وَاِسْرافي عَلى نَفْسي، وَاتِّباعي لِهَوايَ، واشْتِغالي بِشَهَواتي، فَيَحُولُ ذلِكَ بَيْني وَبَيْنَ رَحْمَتِكَ وَرِضْوانِكَ فَاَكُونُ مَنْسِيّاً عِنْدَكَ، مُتَعَرِّضاً لِسَخَطِكَ وَنِقْمَتِكَ، اَللّـهُمَّ وَفِّقْني لِكُلِّ عَمَل صالِح تَرْضى بِهِ عَنّي، وَقَرِّبْني اِلَيْكَ زُلْفى، اَللّـهُمَّ كَما كَفَيْتَ نَبيَّكَ مُحَمَّداً صَلَّى اللهُ عَلَيْهِ وآلِهِ هَوْلَ عَدُوِّهِ، وَفَرَّجْتَ هَمَّهُ، وَكَشَفْتَ غَمَّهُ، وَصَدَقْتَهُ، وَعْدَكَ، وَاْنجَزْتَ لَهُ عَهْدَكَ، اَللّـهُمَّ فَبِذلِكَ فَاكْفِني هَوْلَ هذهِ السَّنَةِ وَآفاتِها وَاَسقامَها وَفِتْنَتَها وَشُرُورَها وَاَحزانَها وَضيقَ الْمَعاشِ فيها، وَبَلِّغْني بِرَحْمَتِكَ كَمالَ الْعافِيَةِ بِتَمامِ دَوامِ النِّعْمَةِ عِنْدي اِلى مُنْتَهى اَجَلَي، اَسْاَلُكَ سُؤالَ مَنْ اَساءَ وَظَلَمَ وَاسْتَكانَ وَاعْتَرَفَ، وَاَسْأَلفكَ اَنْ تَغْفِرَ لي ما مَضى مِنَ الذُّنُوبِ الَّتي حَصْرَتَها حَفَظَتُكَ وَاَحْصَتْها كِرامُ مَلائِكَتِكَ عَلَيَّ، وَاَنْ تَعْصِمَني يا اِلـهي مِنَ الذُّنُوبِ فيـما بَقِيَ مِنْ عمْري اِلى مُنْتَهى اَجَلي، يا اَللهُ يا رَحْمنُ يا رَحيمُ، صَلِّ عَلَى مُحمَّد وَاَهْلِ بَيْتِ مُحَمَّد، وَآتِني كُلَّ ما سَاَلْتُكَ وَرَغِبْتُ اِلَيْكَ فيهِ، فَاِنكَ اَمَرْتَني بِالدُّعاءِ وَتَكَفَّلْتَ لي بِالاِجابَةِ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'أقول : قد أورد السّيد هذا الدّعاء في اللّيلة الاُولى من هذا الشّهر.',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: isTablet ? _fontSizeTablet + 4 : _fontSize - 1,
                    color: const Color.fromARGB(255, 54, 80, 158),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAlsadisRamadan.screenRoute,
        pushBack: AllaylaAl2oulaRamadan.screenRoute,
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
