import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:maktabat_almoslim/widgets/she3er.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alkazimin.dart';
import 'fi_fadl_ziyarat_lkazimin.dart';
import 'ziyarat_alnowab_al2arba3a.dart';

class ZiyaratSalman extends StatefulWidget {
  static String screenRoute = 'ziyarat_salman_screen';
  const ZiyaratSalman({super.key});

  @override
  State<ZiyaratSalman> createState() => _ZiyaratSalmanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratSalmanState extends State<ZiyaratSalman> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ziyarat_salman_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_salman_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiyaratAlkazimin.screenRoute);
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
                      .addFavorite('في زيارة سلمان (رضي الله عنه)',
                          ZiyaratSalman.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('في زيارة سلمان (رضي الله عنه)',
                          ZiyaratSalman.screenRoute, ZiyaratSalman.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في زيارة سلمان (رضي الله عنه)',
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
                      'اعلم انّ من وظائف الزّوار في مدينة الكاظمين التّوجّه الى المدائن لزيارة عبد الله الصّالح سلمان المحمّدي رضوان الله عليه وهو اوّل الاركان الاربعة، وقد خصّه النّبي (صلى الله عليه وآله وسلم) بقوله : سَلْمانُ مِنّا اَهْلَ الْبَيْتِ، فجعله في زُمرة أهل بيت النّبوة والعصمة، وقال (صلى الله عليه وآله وسلم) ايضاً في فضله : سَلْمانُ بَحْرٌ لا يُنْزَفُ وَكَنْزٌ لا يَنْفَدُ سَلْمانُ مِنّا اَهْلَ الْبَيْتِ يُمْنَحُ الْحِكْمَةَ وَيُؤْتَى الْبُرْهانَ . وشبّهه أمير المؤمنين (عليه السلام) بلقمان الحكيم، بل عدّه الصّادق (عليه السلام)أفضل منه، وعدّه الباقر (عليه السلام)من المتوسّمين، ويستفاد من الاحاديث انّه كان يعرف الاسم الاعظم، وانّه كان من المحدَّثين (بفتح الدّال) وانّ للايمان عشر مراتب وهُو قد نال المرتبة العاشرة، وانّه كان يعلم الغيب '
                      'والمنايا، وانّه كان قد أكل وهو في الدّنيا من تحف الجنّة، وانّ الجنّة كانت تشتاق اليه وتعشقه، وانّه كان يحبّه الله ورسوله، وانّ الله تعالى قد أمر النّبي (صلى الله عليه وآله وسلم) بحُبّ أربعة كان سلمان أحدهم، وانّه قد نزل في الثّناء عليه وعلى أقرانه آيات من القرآن الكريم، وانّ جبرئيل كان اذا هبط على النّبي (صلى الله عليه وآله وسلم)يأمره أن يبلغ سلمان سلاماً عن الله تعالى ويطلعه على علم المنايا والبلايا والانساب، وانّه كان له ليلاً مجلس يخلو فيه برسُول الله (صلى الله عليه وآله وسلم) وانّ النّبي (صلى الله عليه وآله وسلم) وأمير المؤمنين (عليه السلام)قد علّماه من علم الله المخزون المكنُون ما لا '
                      'يطيق حمله سواه، وانّه قد بلغ مبلغاً شهد في حقّه الصّادق (عليه السلام) قائلاً : اَدْرَكَ سَلْمانُ الْعِلْمَ الاَْوَّلَ وَالْعِلْمَ الاْخِرَ وَهُوَ بَحْرٌ لا يُنْزَحُ وَهُوَ مِنّا اَهْلَ الْبَيْتِ .وحسب الزّائر ترغيباً في زيارته التّأمّل في اختصاص سلمان وانفراده بين الصّحابة والامّة بمنقبة عظيمة هي انّ أمير المؤمنين (عليه السلام) طوى المسافة بين المدينة والمدائن في ليلة واحدة فحضر جنازته وباشر بنفسه غُسله وتكفينُه ثمّ صلّى عليه بصُفُوف من الملائكة، فعاد الى المدينة في ليلته، فيا له من الشّرف الرّفيع ولاءُ آل الرّسول وحبّهم حيث يبلغ به المرء مثل هذه الدّرجة الرّفيعة والمرتبة السّامية.\n\n'
                      'وأمّا في صفة زيارته فاعلم انّ السّيد ابن طاوُس قد ذكر له في مصباح الزّائر أربع زيارات ونحن نقتصر هُنا بالاُولى من تلك الزّيارات، وقد أثبتنا الزّيارة الرّابعة منها في كتاب الهديّة، وقد أوردها الشّيخ أيضاً في التّهذيب، فاذا شئت زيارته فقف على قبره مستقبل القبلة وقُل :\n\n'
                      'اَلسَّلامُ عَلى رَسُولِ اللهِ مُحَمَّدِ بْنِ عَبْدِ اللهِ خاتَمِ النَّبِيَّينَ، اَلسَّلامُ عَلى اَميرِ الْمُؤْمِنينَ سَيِّدِ الْوَصِيّينَ، اَلسَّلامُ عَلى الاَْئِمَّةِ الْمَعْصُومينَ الرّاشِدينَ، اَلسَّلامُ عَلى الْمَلائِكَةِ الْمُقَرّبينَ، اَلسَّلامُ عَلَيْكَ يا صاحِبَ رَسُولِ اللهِ الاَْمينَ، اَلسَّلامُ عَلَيْكَ يا وَلِيَّ اَميرِ الْمُؤْمِنينَ، اَلسَّلامُ عَلَيْكَ يا مُودَعَ اَسْرارِ السَّادَةِ الْمَيامينَ، اَلسَّلامُ عَلَيْكَ يا بَقِيَّةَ اللهِ مِنَ الْبَرَرَةِ الْماضينَ، اَلسَّلامُ عَلَيْكَ يا اَبا عَبْدِ اللهِ وَ رَحْمَةُ اللهِ وَبَرَكاتُهُ، اَشْهَدُ أنَّكَ اَطَعْتَ اللهِ كَما اَمَرَكَ، وَاتَّبَعْتَ الرَّسُولَ كَما نَدَبَكَ، وَتَوَلَّيْتَ خَليفَتَهُ كَما اَلْزَمَكَ، وَدَعَوْتَ اِلَى الاِْهْتِمامِ بِذُرِّيَّتِهِ كَما وَقَفَكَ، وَعَلِمْتَ الْحَقَّ يَقيناً وَاعْتَمَدْتَهُ كَما اَمَرَكَ، اَشْهَدُ أنَّكَ بابُ وَصِيِّ الْمُصْطَفى، وَطَريقُ حُجَّةِ اللهِ الْمُرْتَضى، وَاَمينُ اللهِ فيـما اسْتُوْدِعْتَ مِنْ '
                      'عُلُومِ الاَْصْفِياءِ، اَشْهَدُ اَنَّكَ مِنْ اَهْلِ بَيْتِ النَّبِيِّ النُّجَباءِ الُْمخْتارينَ لِنُصْرَةِ الْوَصِيِّ، اَشْهَدُ اَنَّكَ صاحِبُ الْعاشِرَةِ وَالْبَراهينِ وَالدَّلائِلِ الْقاهِرَةِ، وَاَقَمْتَ الصَّلاةَ وَآتَيْتَ الزَّكاةَ، وَاَمَرْتَ بِالْمَعْرُوفِ، وَنَهَيْتَ عَنِ الْمُنْكَرِ، وَاَدَّيْتَ الاَْمانَةَ وَنَصَحْتَ للهِ وَلِرَسُولِهِ، وَصَبَرْتَ عَلَى الاَْذى في جَنْبِهِ حَتّى أتاكَ الْيَقينُ، لَعَنَ اللهُ مَنْ جَحَدَكَ حَقَّكَ وَحَطَّ مِنْ قَدْرِكَ، لَعَنَ اللهُ مَنْ آذاكَ في مَواليكَ، لَعَنَ اللهُ مَنْ اَعْنَتَكَ في اَهْلِ بَيْتِ نَبِيِّكَ، لَعَنَ اللهُ مَنْ لامَكَ في ساداتِكَ، '
                      'لَعَنَ اللهُ عَدُوَّ آلِ مُحَمَّد مِنَ الْجِنِّ وَالاِْنْسِ مِنَ الاَْوَّلينَ وَالاْخِرينَ وَضاعَفَ عَلَيْهِمُ الْعَذابَ الاَْليمَ، صَلَّى اللهُ عَلَيْكَ يا اَبا عَبْدِاللهِ، صَلَّى اللهُ عَلَيْكَ يا صاحِبَ رَسُولِ اللهِ، صَلَّى اللهِ عَلَيْهِ وَآلِهِ وَعَلَيْكَ يا مَوْلى اَميرِ الْمُؤْمِنينَ وَصَلَّى اللهِ عَلى رُوحِكَ الطَّيِّبَةِ، '
                      'وَجَسَدِكَ الطّاهِر وَألْحَقْنا بِمَنِّهِ وَرأفَتِهِ اِذا تَوَفّانا بِكَ وَبِمَحَلِّ السّادَةِ الْمَيامينَ وَجَمَعَنا مَعَهُمْ بِجِوارِهِمْ في جَنّاتِ النَّعيِمِ، صَلَّى اللهِ عَلَيْكَ يا اَبا عَبْدِ اللهِ، وَصَلَّى اللهُ عَلى اِخْوانِكَ الشّيعَةِ الْبَرَرَةِ مِنَ السَّلَفِ الْمَيامينَ، وَادْخَلَ الرُّوحَ وَالرِّضْوانَ عَلَى الْخَلَفِ مِنَ الْمُؤْمِنينَ، وَالْحَقْنا وَاَيّاهُمْ بِمَنْ تَوَلاّهُ مِنْ الْعِتْرَةِ الطّاهِرينَ، وَعَلَيْكَ وَعَلَيْهِمُ اَلسَّلامُ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.\n\n'
                      'ثمّ اقرأ اِنّا اَنْزَلْناهُ في لَيْلَةِ الْقَدْرِ سبع مرّات ثمّ صلّ مندُوباً ما بدا لك.\n\n'
                      'أقول : فاذا عزمت على الانصراف من زيارته فقِف عليه مودّعاً وقُل ما ذيّل به السّيد زيارته الرّابعة وهُوَ : اَلسَّلامُ عَلَيْكَ يا اَبا عَبْدِ اللهِ، اَنْتَ بابُ اللهِ الْمُؤْتى مِنْهُ وَالْمَأخُوذُ عَنْهُ، اَشْهَدُ اَنَّكَ قُلْتَ حَقّاً وَنَطَقْتَ صِدْقاً، وَدَعَوْتَ اِلى مَوْلايَ وَمَوْلاكَ عَلانِيَةً وَسِرّاً، اَتَيْتُكَ زائِراً وَحاجاتي لَكَ مُسْتَوْدِعاً، وَها اَنَا ذا مُوَدِّعُكَ، اَسْتَوْدِعُكَ ديني وَاَمانَتي وَخَواتيمَ عَمَلي وَجَوامِعَ اَمَلي اِلى مُنْتَهى اَجَلي، وَاَلسَّلامُ عَلَيْكَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، وَصَلَّى اللهُ عَلى مُحَمَّد وَآلِهِ الاَْخْيارِ . ثمّ ادعُ كثيراً وانصرف.\n\n'
                      'أقول : اذا فرغ الزّائر من زيارة سلمان (رحمه الله) فعليه وظيفتان :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاُولى :',
                  subtitle:
                      'الصّلاة ركعتين أو اكثر عند طاق كسرى فقد صلّى هُناك أمير المؤمنين (عليه السلام) ، روي عن عمّار السّاباطي قال : قدم أمير المؤمنين (عليه السلام)المدائن ونزل أيوان كسرى وكان معه دلف بن بحير ، فلمّا صلّى قام وقال لدلف : قُم معي، وكان معه جماعة من أهل ساباط، فما زال يطوف منازل كسرى ويقول لدلف : كان لكسرى في هذا المكان كذا وكذا ويقول دلف : هو والله كذا، حتّى طاف المواضِع بجميع من كان عنده ودلف يقول : يا سيّدي ومولاي كأنّك وضعت هذه الاشياء في هذه المساكن.\n\n'
                      'وروي انّ أمير المؤمنين (عليه السلام) مرّ على المدائن فلمّا رأى آثار كسرى ، قال رجل ممّن معه :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'جَرَتِ الرِّياحُ عَلى رُسُومِ دِيارِهِمْ   فَكَاَنَّهُمْ كانُوا عَلى ميعاد',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'فقال (عليه السلام) : أفلا قُلت : (كَمْ تَرَكُوا مِنْ جَنّات وَعُيُون * وَزُرُوع وَمَقام كَريم * وَنَعْمَة كانُوا فيها فاكِهينَ * كَذلِكَ وَاَوْرَثْناها قَوْماً آخَرينَ * فَما بَكَتْ عَلَيْهِمُ السَّماءُ وَالاَْرْضُ وَما كانُوا مُنْظَرينَ) ثمّ قال (عليه السلام) : اِنَّ هـؤلاءِ كانُوا وارِثينَ، فَاَصْبَحُوا مَوْرُوثينَ لَمْ يَشْكُرُوا النِّعْمَةَ فَسُلِبُوا دُنْياهُمْ بِالْمَعْصِيَةِ، اِيّاكُمْ وَكُفْرَ النِّعَمِ لا تَحُلُّ بِكُمُ النِّقَمُ.\n\n'
                      'أقول : قد نظم الحكيم الخاقاني بالفارسيّة في شأن الايوان قائلاً :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle: 'هان اى دل عبرت بين از ديده نظر كن هان\n'
                      'ايوان مدائن را آيينه عبرت دان\n\n'
                      'پرويز كه بنهادى بر خوان تره زرّين\n'
                      'زرّين تره كو برخوان رو كَمْ تَرَكُوا برخوان',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّانية :',
                  subtitle:
                      'أن يزور حُذيفة بن اليمان وهُو من كبار صحابة رسُول الله (صلى الله عليه وآله وسلم)، ومن خواصّ أصحاب أمير المؤمنين (عليه السلام)وكان في الصّحابة يمتاز بمعرفة المنافقين ومعرفة اسمائهم، وكان الخليفة الثّاني لا يصلّي على جنازة لم يحضرها حذيفة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiFadlZiyaratLkazimin.screenRoute,
          pushBack: ZiyaratAlnowabAl2arba3a.screenRoute,
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
