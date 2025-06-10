import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../zi_lhoja.dart';
import 'alyawm_al2awal_zilhoja.dart';
import 'ziyarat_amir_almo2minin_yawm_al8adir.dart';

class FiA3malShaherZilhoja extends StatefulWidget {
  static String screenRoute = 'fi_a3mal_shaher_zilhoja_screen';
  const FiA3malShaherZilhoja({super.key});

  @override
  State<FiA3malShaherZilhoja> createState() => _FiA3malShaherZilhojaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiA3malShaherZilhojaState extends State<FiA3malShaherZilhoja> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fi_a3mal_shaher_zilhoja_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_a3mal_shaher_zilhoja_screen', value);
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
                      .addFavorite('في أعمال شهر ذي الحجة',
                          FiA3malShaherZilhoja.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في أعمال شهر ذي الحجة',
                          FiA3malShaherZilhoja.screenRoute,
                          FiA3malShaherZilhoja.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في أعمال شهر ذي الحجة',
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
                      'وهو شهر شريف وكان صلحاء الصّحابة والتّابعين يهتمّون بالعبادة فيه اهتماماً بالغاً، والعشر الاوائل من ايّامه هي الايّام المعلومات المذكورة في القرآن الكريم وهي أيّام فاضلة غاية الفضل، وقد روي عن النّبي (صلى الله عليه وآله وسلم) ما من أيّام العمل فيها أحبّ الى الله عزّوجلّ من أيّام هذه العشر ولهذه العشر، أعمال :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle:
                      'صيام الايّام التسّعة الاوُل منها فانّه يعدل صيام العمر كلّه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّاني :',
                  subtitle:
                      'أن يصلّي بين فريضتي المغرب والعشاء في كلّ ليلة من لياليها ركعتين يقرأ في كلّ ركعة فاتحة الكتاب والتّوحيد مرّة واحدة، وهذه الاية وَواعَدْنا مُوسى ثَلاثينَ لَيْلَةً وَاَتْمَمْناها بِعَشْر فَتَمَّ ميقاتُ رَبِّهِ اَرْبَعينَ لَيْلَةً وَقالَ مُوسى لاَِخيهِ هارُونَ اخْلُفنى فى قَوْمى وَاَصْلِحْ وَلا تَتَّبِعْ سَبيلَ الْمُفْسِدينَ ليشارك الحاج في ثوابهم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالث :',
                  subtitle:
                      'أن يدعو بهذا الدّعاء من أوّل يوم من عشر ذي الحجّة الى عشيّة عرفة في دبر صلاة الصّبح وقبل المغرب، وقد رواه الشّيخ والسّيد عن الصّادق (عليه السلام) :\n\n'
                      'اَللّـهُمَّ هذِهِ الاَْيّامُ الَّتى فَضَّلْتَها عَلَى الاَْيّامِ وَشَرَّفْتَها قَدْ بَلَّغْتَنيها بِمَنِّكَ وَرَحْمَتِكَ، فَاَنْزِلْ عَلَيْنا مِنْ بَرَكاتِكَ، وَاَوْسِعْ عَلَيْنا فيها مِنْ نَعْمآئِكَ، اَللّـهُمَّ اِنّى اَسْاَلُكَ اَنْ تُصَلِّىَ عَلى مُحَمَّد وَآلِ مُحَمَّد وَاَنْ تَهْدِيَنا فيها لِسَبيلِ الْهُدى وَالْعِفافِ وِالْغِنى وَالْعَمَلِ فيها بِما تُحِبُّ وَتَرْضى، اَللّـهُمَّ اِنّى اَسْاَلُكَ يا مَوْضِعَ كُلِّ شَكْوى، وَيا سامِعَ كُلِّ نَجْوى، وَيا شاهِدَ كُلِّ مَلاَء، وَيا عالِمَ كُلِّ خَفِيَّةً اَنْ تُصَلِّىَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تَكْشِفَ عَنّا فيهَا الْبَلاءَ، وَتَسْتَجيبَ لَنا فيهَا الدُّعآءَ، وَتُقَوِّيَنا فيها وَتُعينَنا وَتُوَفِّقَنا فيها لِما تُحِبُّ رَبَّنا وَتَرْضى وَعَلى مَا افْتَرَضْتَ عَلَيْنا مِنْ طاعَتِكَ وَطاعَةِ رَسوُلِكَ وَاَهْلِ وَلايَتِكَ، اَللّـهُمَّ اِنّى اَسْاَلُكَ يا اَرْحَمَ الرّاحِمينَ اَنْ تُصَلِّىَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تَهَبَ لَنا فيهَا الرِّضا اِنَّكَ سَميعُ الدُّعآءِ، وَلا تَحْرِمْنا خَيْرَ ما تُنْزِلُ فيها مِنَ السَّمآءِ، وَطَهَّرْنا مِنَ الذُّنوُبِ يا عَلاّمَ الْغُيوُبِ، وَاَوْجِبْ لَنا فيها دارَ الْخُلوُدِ، اَللّهمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَلا تَتْرُكْ لَنا فيها ذَنْباً اِلاّ غَفَرْتَهُ، وَلا هَمّاً اِلاّ فَرَّجْتَهُ، وَلا دَيْناً اِلاّ قَضَيْتَهُ، وَلا غائِباً اِلاّ اَدَّيْتَهُ، وَلا حاجَةً مِنْ حَوائِجِ الدُّنْيا وَالاْخِرَةِ اِلاّ سَهَّلْتَها وَيَسَّرْتَها اِنَّكَ عَلى كُلِّ شَىْء قَديرٌ، اَللّـهُمَّ يا عالِمَ الْخَفِيّاتِ، يا راحِمَ الْعَبَراتِ، يا مُجيبَ الدَّعَواتِ، يا رَبَّ الاَْرَضينَ وَالسَّماواتِ، يا مَنْ لا تَتَشابَهُ عَلَيْهِ الاَْصْواتِ، صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاجْعَلْنا فيها مِنْ عُتَقآئِكَ وَطُلَقآئِكَ مِنَ النّارِ، وَالْفائِزينَ بِجَنَّتِكَ وَالنّاجينَ بِرَحْمَتِكَ يا اَرْحَمَ الرّاحِمينَ، وَصَلَّى اللهُ عَلَيْهِ سَيِّدِنا مُحَمَّد وَآلِهِ اَجْمَعينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع :',
                  subtitle:
                      'أن يدعو في كلّ يوم من أيّام العشر بهذه الدّعوات الخمس وقد جاء بها جبرئيل الى عيسى بن مريم هديّة من الله تعالى ليدعو بها في أيّام العشر، وهذه هي الدّعوات الخمس :\n\n'
                      '(1) اَشْهَدُ اَنْ لا اِلـهَ اِلاَّ اللهُ وَحْدَهُ لا شَريكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، بِيَدِهِ الْخَيْرُ وَهُوَ عَلى كُلِّ شَىْء قَديرٌ (2) اَشْهَدُ اَنْ لا اِلـهَ اِلاَّ اللهُ وَحْدَهُ لا شَريكَ لَهُ، اَحَداً صَمَداً لَمْ يَتَّخِذْ صاحِبَةً وَلا وَلَداً (3) اَشْهَدُ اَنْ لا اِلـهَ اِلاَّ اللهُ وَحْدَهُ لا شَريكَ لَهُ اَحَداً صَمَداً لَمْ يَلِدْ وَلَمْ يُولَدْ وَلَمْ يَكُنْ لَهُ كُفُواً اَحَدٌ (4) اَشْهَدُ اَنْ لا اِلـهَ اِلاَّ اللهُ وَحْدَهُ لا شَريكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ يُحْيى وَيُميتُ وَهُوَ حَىٌّ لا يَمُوتُ، بِيَدِهِ الْخَيْرُ وَهُوَ عَلى كُلِّ شَىْء قَديرٌ (5) حَسْبِىَ اللهُ وَكَفى سَمِعَ اللهُ لِمَنْ دَعا، لَيْسَ وَرآءَ اللهِ مُنْتَهى، اَشْهَدُ للهِ بِما دَعا وَاَنَّهُ بَرىءٌ مِمَّنْ تَبَرَأَ وَاَنَّ لِلّهِ الاْخِرَةَ وَالاُْولى.\n\n'
                      'ثمّ ذكر عيسى (عليه السلام) اجراً جزيلاً للدّعاء بكلّ من هذه الدّعوات الخمس مائة مرّة، ولا يبعد أن يكون الدّاعى لله بكلّ من هذه الدّعوات في كلّ يوم عشر مرّات ممتثلاً لما ورد في الحديث، كما احتمله العلاّمة المجلسي (رحمه الله) والافضل أن يدعى بكُلّ منها في كلّ يوم مائة مرّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'أن يهلّل في كلّ يوم من العشر بهذا التّهليل المروي عن أمير المؤمنين (عليه السلام) بأجره الجزيل، والافضل التهليل به في كلّ يوم عشر مرّات :\n\n'
                      'لا اِلـهَ اِلاَّ اللهُ عَدَدَ الّلَيالى وَالدُّهُورِ، لا اِلـهَ اِلاَّ اللهُ عَدَدَ اَمْواجِ الْبُحُورِ، لا اِلـهَ اِلاَّ اللهُ و رَحْمَتُهُ خَيْرٌ مِما يَجْمَعُونَ، لا اِلـهَ اِلاَّ اللهُ عَدَدَ الشَّوْكِ الشَّجَرِ، لا اِلـهَ اِلاَّ اللهُ عَدَدَ الشَّعْرِ وَالْوَبَرِ، لا اِلـهَ اِلاَّ اللهُ عَدَدَ الْحَجَرِ وَالْمَدَرِ، لا اِلـهَ اِلاَّ اللهُ عَدَدَ لَمْحِ الْعُيُونِ، لا اِلـهَ اِلاَّ اللهُ فِى الّلَيْلِ اِذا عَسْعَسَ وَالصُّبْحِ اِذا تَنَفَّسَ، لا اِلـهَ اِلاَّ اللهُ عَدَدَ الرِّياحِ فِى الْبَرارى وَالصُّخُورِ، لا اِلـهَ اِلاَّ اللهُ مِنَ الْيَوْمِ اِلى يَوْمِ يُنْفَخُ فِى الصُّورِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlyawmAl2awalZilhoja.screenRoute,
        pushBack: ZiyaratAmirAlmo2mininYawmAl8adir.screenRoute,
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
