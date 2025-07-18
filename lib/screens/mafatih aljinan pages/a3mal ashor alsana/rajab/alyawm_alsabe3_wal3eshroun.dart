import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../rajab.dart';
import 'allayla_alsabi3a_wal3eshroun.dart';
import 'alyawm_al2a5ir_men_alshaher.dart';

class AlyawmAlsabe3Wal3eshroun extends StatefulWidget {
  static String screenRoute = 'alyawm_alsabe3_wal3eshroun_screen';
  const AlyawmAlsabe3Wal3eshroun({super.key});

  @override
  State<AlyawmAlsabe3Wal3eshroun> createState() =>
      _AlyawmAlsabe3Wal3eshrounState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlyawmAlsabe3Wal3eshrounState extends State<AlyawmAlsabe3Wal3eshroun> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alyawm_alsabe3_wal3eshroun_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alyawm_alsabe3_wal3eshroun_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Rajab.screenRoute);
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
                      .addFavorite('اليوم السابع والعشرون',
                          AlyawmAlsabe3Wal3eshroun.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'اليوم السابع والعشرون',
                          AlyawmAlsabe3Wal3eshroun.screenRoute,
                          AlyawmAlsabe3Wal3eshroun.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'اليوم السابع والعشرون',
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
                  'وهو عيد من الاعياد العظيمة وفيه كان بعثة النّبي (صلى الله عليه وآله وسلم) وهبوط جبرئيل عليه (صلى الله عليه وآله وسلم) بالرّسالة، ومن الاعمال الواردة فيه :',
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
                  subtitle: 'الغُسل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle:
                      'الصّيام، وهذا اليوم أحد الايّام الاربعة التّي خصّت بالصّيام بين أيّام السّنة ويعدل صوم هذا اليوم صيام سبعين سنة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle: 'الاكثار من الصّلاة على محمّد وآل محمّد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle:
                      'زيارة النّبي وزيارة أمير المؤمنين عليهما وآلهما السّلام.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'قال الشّيخ في المصباح : روى الريّان بن الصّلت ، قال : صام الجواد(عليه السلام) لما كان ببغداد يوم النّصف من رجب ويوم سبع وعشرين منه وصام جميع حشمه، وأمرنا أن نصلّي الصّلاة الّتي هي اثنتا عشرة ركعة، تقرأ في كلّ ركعة الحمد وسورة فاذا فرغت قرأت الحمد أربعاً و (قل هو الله أحد) أربعاً والمعوّذتين أربعاً وقلت أربعاً : لا اِلـهَ إِلاّ اللهُ واللهُ اَكْبَرُ، وَسُبْحانَ اللهِ وَالْحَمْدُ للهِ، وَلا حَوْلَ وَلا قُوَّةَ إِلاّ بِاللهِ الْعَلِيِّ الْعَظيم، وأربعاً : اللهُ اللهُ رَبِّي لا اُشْرِكُ بِهِ شَيْئاً، وأربعاً : لا اُشْرِكُ بِرَبِّي اَحَداً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادس :',
                  subtitle:
                      'وروى الشّيخ ايضاً عن أبي القاسم حسين بن روح (رحمه الله)قال : تصلّى في هذا اليوم اثنتي عشرة ركعة نقراء في كلّ ركعة فاتحة الكتاب وما تيسّر من السّور، وتتشهّد وتسلّم وتجلس وتقول بين كلّ ركعتين : اَلْحَمْدُ للهِ الَّذي لَمْ يَتَّخِذْ وَلَداً، وَلَمْ يَكُنْ لَهُ شَريكٌ في الْمُلْكِ، وَلَمْ يَكُنْ لَهُ وَلِيٌّ مِنَ الذُّلِّ وَكَبِّرْهُ تَكْبيراً، يا عُدَّتي في مُدَّتي، يا صاحِبي في شِدَّتي، يا وَليّي في نِعْمَتي، يا غِياثي في رَغْبَتي، يا نَجاحي في حاجَتي، يا حافِظي في غَيْبَتي، يا كافيَّ في وَحْدَتي، يا اُنْسي في وَحْشَتي، اَنْتَ السّاتِرُ عَوْرَتي فَلَكَ الْحَمْدُ، واَنْتَ الْمُقيلُ عَثْرَتي فَلَكَ الْحَمْدُ، وَاَنْتَ الْمُنْعِشُ صَرْعَتي فَلَكَ الْحَمْدُ، صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاسْتُرْ عَوْرَتي، وَآمِنْ رَوْعَتي، وَاَقِلْني عَثْرَتي، وَاصْفَحْ عَنْ جُرْمي، وَتَجاوَزْ عَنْ سَيِّئاتي في اَصْحابِ الْجَنَّةِ وَعْدَ الصِّدْقِ الَّذي كانُوا يُوَعَدُونَ.\n\n'
                      'فاذا فرغت من الصّلاة والدّعاء قرأت الحمد والاخلاص والمعوّذتين و(قل يا أيّها الكافرون) و (انّا أنزلناه) وآية الكرسي سبع مرّات، ثمّ تقول : لا اِلـهَ إلاَّ اللهُ واللهُ اَكْبَرُ وَسُبْحانَ اللهِ وَلا حَوْلَ وَلا قُوَّةَ إِلاّ بِاللهِ سبع مرّات، ثمّ تقول سبع مرّات : اللهُ اللهُ رَبِّي لا اُشْرِكُ بِهِ شَيْئاً، وتدعو بما أحببت.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'في الاقبال وفي بعض نسخ المصباح انّه يستحبّ الدّعاء في هذا اليوم بهذا الدّعاء:\n\n'
                      'يا مَنْ اَمَرَ بِالْعَفْوِ وَالتَّجاوُزِ، وَضَمَّنَ نَفْسَهُ الْعَفْوَ وَالتَّجاوُزَ، يا مَنْ عَفا وَتَجاوَزَ، اُعْفُ عَنّي وَتَجاوَزْ يا كَريمُ اَللّـهُمَّ وَقَدْ اَكْدَى الطَّلَبُ، وَاَعْيَتِ الْحيلَةُ وَالْمَذْهَبُ، وَدَرَسَتِ الاْمالُ، وَانْقَطَعَ الرَّجاءُ اِلاّ مِنْكَ وَحْدَكَ لا شَريكَ لَكَ، اَللّـهُمَّ اِنّي اَجِدُ سُبُلَ الْمَطالِبِ اِلَيْكَ مُشْرَعَةً، وَمناهِلَ الرَّجاءِ لَدَيْكَ مُتْرَعَةً، واَبْوابَ الدُّعاءِ لِمَنْ دَعاكَ مُفتَّحَةً، وَالاِسْتِعانَةَ لِمَنِ اسْتَعانَ بِكَ مُباحَةً، وَاَعْلَمُ اَنَّكَ لِداعيكَ بِمَوْضِعِ اِجابَة، وَللصّارِخِ اِلَيْكَ بِمَرْصَدِ اِغاثَة، وَاَنَّ فِي اللَّهْفِ اِلى جُودِكَ وَالظَّمانِ بِعِدَتِكَ عِوَضاً مِنْ مَنْعِ الْباخِلينَ، وَمَنْدُوحَةً عَمّا في اَيْدِى الْمُسْتَأثِرينَ، وَاَنَّكَ لا تَحْتَجِبُ عَنْ خَلْقِكَ إِلاّ اَنْ تَحْجُبُهُمُ الاَْعْمالُ دُونَكَ، وَقَدْ عَلِمْتُ اَنَّ اَفْضَلَ زادِ الرّاحِلِ اِلَيْكَ عَزْمُ اِرادَة يَخْتارُكَ بِها، وَقَدْ ناجاكَ بِعَزْمِ الاِرادَةِ قَلْبي، وَاَساَلُكَ بِكُلِّ دَعْوَة دَعاكَ بِها راج بَلَّغْتَهُ اَمَلَهُ، اَوْ صارِخ اِلَيْكَ اَغَثْتَ صَرْخَتَهُ، اَوْ مَلْهُوف مَكْرُوب فَرَّجْتَ كَرْبَهُ، اَوْ مُذْنِب خاطِئ غَفَرْتَ لَهُ اَوْ مُعافىً اَتْمَمْتَ نِعْمَتَكَ عَلَيْهِ، اَوْ فَقير اَهْدَيْتَ غِناكَ اِلَيْهِ، وَلِتِلْكَ الَّدعْوَةِ عَلَيْكَ حَقٌّ وَعِنْدَكَ مَنْزِلَةٌ، إِلاّ صَلَّيْتَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَقَضَيْتَ حَوائِجي حَوائِجَ الدُّنْيا وَالاْخِرَةِ، وَهـذا رَجَبٌ الْمُرَجَّبُ الْمُكَرَّمُ الَّذي اَكْرَمْتَنا بِهِ اَوَّلُ اَشْهُرِ الْحُرُمِ، اَكْرَمْتَنا بِهِ مِنْ بَيْنِ الاُْمَمِ، يا ذَا الْجُودِ وَالْكَرَمِ، فَنَسْأَلُكَ بِهِ وَبِاسْمِكَ الاَْعْظَمِ الاَْعْظَمِ الاَْعْظَمِ الاَْجَلِّ الاَْكْرَمِ، الَّذي َخَلَقْتَهُ فَاسْتَقَرَّ في ظِلِّكَ فَلا يَخْرُجُ مِنْكَ اِلى غَيْرِكَ، اَنْ تُصَلِّيَ عَلى مُحَمَّد وَاَهْلِ بَيْتِهِ الطّاهِرينَ، وَتَجْعَلَنا مِنَ الْعامِلينَ فيهِ بِطاعَتِكَ، وَالاْمِلينَ فيهِ بِشَفاعَتِكَ، اَللّـهُمَّ وَاهْدِنا اِلى سَواءِ السِّبيلِ، وَاجْعَلْ مَقيلَنا عِنْدَكَ خَيْرَ مَقيل، في ظِلٍّ ظَليل، فَاِنَّكَ حَسْبُنا وَنِعْمَ الوَكيلُ، وَالسَّلامُ عَلى عِبادِهِ المُصْطَفِيْنَ، وَصَلَواتُهُ عَلَيْهِمْ اَجْمَعينَ، اَللّـهُمَّ وَبارِكَ لَنا في يَوْمِنا هَذَا الَّذي فَضَّلْتَهُ، وَبِكَرامَتِكَ جَلَّلْتَهُ، وَبِالْمَنْزِلِ الْعظيمِ الاَْعْلى اَنْزَلْتَهُ، صَلِّ عَلى مَنْ فيهِ اِلى عِبادِكَ اَرْسَلْتَهُ، وَبالَْمحَلِّ الْكَريمِ اَحْلَلْتَهُ، اَللّـهُمَّ صَلِّ عَلَيْهِ صَلاةً دائِمَةً تَكُونُ لَكَ شُكْراً وَلنا ذُخراً، وَاجْعَلْ لَنا مِنْ اَمْرِنا يُسراً، وَاخْتِمْ لَنا بِالسَّعادَةِ اِلى مُنْتَهى آجالِنا، وَقَدْ قَبِلْتَ الْيسيرَ مِنْ اَعْمالِنا، وَبَلَّغْتَنا بِرَحْمَتِكَ اَفْضَلَ آمالِنا، اِنَّكَ عَلى كُلِّ شَيء قَديرٌ، وَصَلَّى اللهُ عَلى مُحَمَّد وَآلِهِ وَسَلَّم.\n\n'
                      'أقول : هذا دعاء الامام موسى بن جعفر (عليه السلام) وكان قد دعا به يوم انطلقوا به نحو بغداد وهو اليوم السّابع والعشرون من رجب وهو دعاء مذخور من أدعية رجب.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّامن :',
                  subtitle:
                      'قال في الاقبال قل: اَللّـهُمَّ اِنِّي اَساَلُكَ بِالنَّجْلِ الاَْعْظَمِ، الدّعاء وقد مرّ هذا الدّعاء على رواية الكفعمي في دعوات الليلة السّابعة والعشرين.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAl2a5irMenAlshaher.screenRoute,
        pushBack: AllaylaAlsabi3aWal3eshroun.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/اليوم السابع والعشرون.mp3',
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
