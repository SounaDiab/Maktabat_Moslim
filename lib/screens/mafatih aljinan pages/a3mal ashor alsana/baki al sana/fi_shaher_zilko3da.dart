import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../baki_alsana.dart';
import 'fi_2a3mal_3ama_wa2a3mal_alnayrouz_wa2a3mal_al2ashhor_alromiya.dart';
import 'fi_shaher_safar.dart';

class FiShaherZilko3da extends StatefulWidget {
  static String screenRoute = 'fi_shaher_zilko3da_screen';
  const FiShaherZilko3da({super.key});

  @override
  State<FiShaherZilko3da> createState() => _FiShaherZilko3daState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiShaherZilko3daState extends State<FiShaherZilko3da> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_fi_shaher_zilko3da_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fi_shaher_zilko3da_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(BakiAlsana.screenRoute);
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
                          'في شهر ذي القعدة', FiShaherZilko3da.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في شهر ذي القعدة',
                          FiShaherZilko3da.screenRoute,
                          FiShaherZilko3da.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في شهر ذي القعدة',
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
                      'اعلم انّ هذا الشّهر هو اوّل الاشهر الحرم التي ذكرها الله في كتابه المجيد، وروى السّيد ابن طاووس في حديث انّ شهر ذي القعدة موقع اجابة الدّعاء عند الشّدة، وروي عن رسول الله (صلى الله عليه وآله وسلم) صلاة في اليوم الاحّد من هذا الشّهر ذات فضل كثير، وفضلها مُلخّصاً انّ من صلّاها قبلت توبته، وغفرت ذنوبه، ورضى عنه خصماؤه يوم القيامة ومات على الايمان وما سلب منه الدّين، ويفسح في قبره، وينوّر فيه، ويرضى عنه أبواهُ، ويغفر لابويهِ ولذرّيّته، ويوسّع في رزقه، ويرفق به ملك الموت عند موته، ويخرج الرّوح من جسده بُسير وسهولة، وصفتها أن يغتسل في اليوم الاحّد ويتوضّأ ويصلّي أربع ركعات يقرأ في كلّ منها الحمد مرّة وقُلْ هُوَ اللهُ اَحَدٌ ثلاث مرّات والمعوّذتين مرّة ثمّ يستغفر سبعين مرّة ثمّ يختم بكلمة لا حَوْلَ وَلا قُوَّةَ إلاّ بِاللهِ الْعَليِّ الْعَظيمِ ثمّ يقول : يا عَزيزُ يا غَفّارُ اغْفِرْ لي ذُنُوبي وَذُنُوبَ جَميعِ المؤمِنينَ وَالْمُؤمِناتِ فَاِنَّهُ لا يَغْفِرُ الذُّنُوبَ إلاّ اَنْتَ.\n\n'
                      'أقول : الظّاهر انّ هذا الاستغفار والدّعاء الّذي ورد بعده يؤدّى بعد الصّلاة، واعلم انّ في الحديث انّ من صام من شهر حرام ثلاثة ايّام ; الخميس والجُمعة والسّبت كتب له عِبادة تسعمائة سنة، وقال الشّيخ الاجلّ عليّ بن ابراهيم القمّي: انّ السيّئات تضاعف في الاشهر الحرم وكذلك الحسنات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الحادي عشر :',
                  subtitle:
                      'كان فيه في سنة مائة وثماني وأربعين ولادة الامام الرّضا (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اللّيلة الخامسة عشرة :',
                  subtitle:
                      'ليلة مُباركة ينظر الله تعالى فيها الى عباده المؤمنين بالرّحمة وأجر العامل فيها بطاعة الله أجر مائة سائح (أي الصّائم المُلازم للمسجد) لم يعص الله طرفة عين كما في النّبوي، فاغتنمّ هذه اللّيلة واشتغل فيها بالعبادة والطّاعة والصّلاة وطلب الحاجات من الله تعالى ، فقد روي انّه من سأل الله تعالى فيها حاجة اعطاه ما سأل.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الثّالِثُ والعِشرون :',
                  subtitle:
                      'من سنة مائتين توفّي فيه الامام الرّضا صلوات الله وسلامه عليه على بعض الاقوال ومن المسنون فيه زيارة الرّضا (عليه السلام) من قرب أو بعد.\n\n'
                      'قال السّيد بن طاووس (رحمه الله) في الاقبال : ورأيت في بعض تصانيف أصحابنا العجم رضوان الله عليهم انّه يستحبّ أن يزار مولانا الرّضا (عليه السلام) يوم ثالث وعشرين من ذي القعدة من قرب أو بعد ببعض زياراته المعروفة أو بما يكون كالزّيارة من الرّواية بذلك.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اللّيلة الخامسة والعشرون :',
                  subtitle:
                      'ليلة دحو الارض (انبساط الارض من تحت الكعبة على الماء) ، وهي ليلة شريفة تنزل فيها رحمة الله تعالى، وللقيام بالعبادة فيها أجر جزيل، وروي عن الحسن بن عليّ الوشّاء قال : كنت مع أبي وأنا غلام فتعشّينا عند الرّضا (عليه السلام) ليلة خمسة وعشرين من ذي القعدة ، فقال له: ليلة خمس وعشرين من ذي القعدة ولد فيها ابراهيم (عليه السلام)، وولد فيها عيسى بن مريم (عليه السلام)، وفيها دحيت الارض من تحت الكعبة، فمن صام ذلك اليوم كان كمن صام ستّين شهراً، وقال على رواية اخرى: ألا انّ فيه يقوم القائم (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الخامس والعشرون :',
                  subtitle:
                      'يوم دحو الارض ، وهو أحد الايّام الاربعة التي خصّت بالصّيام بين أيّام السّنة، وروي انّ صيامه يعدل صيام سبعين سنة، وهو كفّارة لذنوب سبعين سنة على رواية أخرى، ومن صام هذا اليوم وقام ليلته فله عبادة مائة سنة، ويستغفر لمن صامه كلّ شيء بين السّماء والارض، وهو يوم انتشرت فيه رحمة الله تعالى، وللعبادة والاجتماع لذكر الله تعالى فيه أجر جزيل . وقد ورد لهذا اليوم سوى الصّيام والعبادة وذكر الله تعالى والغُسل عملان :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '- الأوّل :',
                  subtitle:
                      'صلاة مرويّة في كتب الشّيعة القميّين، وهي ركعتان تصلّى عند الضحى بالحمد مرّة والشّمس خمس مرّات ويقول بعد التّسليم : لا حَوْلَ وَلا قُوَّةَ إلاّ بِاللهِ الْعَلىِّ الْعَظيمِ ثمّ يدعو ويقول : يا مُقيلَ العَثَراتِ اَقِلْني عَثْرَتي، يا مُجيبَ الدَّعَواتِ اَجِبْ دَعْوَتي، يا سامِعَ الاَْصْواتِ اِسْمَعْ صَوْتي وَارْحَمْني وَتَجاوَزْ عَنْ سَيِّئاتي وَما عِنْدي يا ذَا الْجَلالِ وَالاكْرامِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '- الثاني :',
                  subtitle:
                      'هذا الدّعاء الذي قال الشّيخ في المصباح انّه يستحبّ الدّعاء به :\n\n'
                      'اَللّـهُمَّ داحِيَ الْكَعْبَةِ، وَفالِقَ الْحَبَّةِ، وَصارِفَ اللَّزْبَةِ، وَكاشِفَ كُلِّ كُرْبَة، اَسْاَلُكَ في هذَا الْيَوْمِ مِنْ اَيّامِكَ الَّتي اَعْظَمْتَ حَقَّها، وَاَقْدَمْتَ سَبْقَها، وَجَعَلْتَها عِنْدَ الْمُؤْمِنينَ وَديعَةً، وَاِلَيْكَ ذَريعَةً، وَبِرَحْمَتِكَ الْوَسيعَةِ اَنْ تُصَلِّيَ عَلى مُحَمَّد عَبْدِكَ الْمُنْتَجَبِ فِى الْميثاقِ الْقَريبِ يَوْمَ التَّلاقِ، فاتِقِ كُلِّ رَتْق، وَداع اِلى كُلِّ حَقِّ، وَعَلى اَهْلِ بَيْتِهِ الاَْطْهارِ الْهُداةِ الْمَنارِ دَعائِمِ الْجَبّارِ، وَوُلاةِ الْجَنَّةِ وَالنّارِ، وَاَعْطِنا في يَوْمِنا هذا مِنْ عَطائِكَ الَْمخْزوُنِ غَيْرَ مَقْطوع'
                      ' وَلا مَمْنوُع، تَجْمَعُ لَنا بِهِ التَّوْبَةَ وَحُسْنَ الاَْوْبَةِ، يا خَيْرَ مَدْعُوٍّ، وَاَكْرَمُ مَرْجُوٍّ، يا كَفِيُّ يا وَفِيُّ يا مَنْ لُطْفُهُ خَفِيٌّ اُلْطُفْ لي بِلُطْفِكَ، وَاَسْعِدْني بِعَفْوِكَ، وَاَيِّدْني بِنَصْرِكَ، وَلا تُنْسِني كَريمَ ذِكْرِكَ بِوُلاةِ اَمْرِكَ، وَحَفَظَةِ سِرِّكَ، وَاحْفَظْني مِنْ شَوائِبِ الدَّهْرِ اِلى يَوْمِ الْحَشْرِ وَالنَّشْرِ، وَاَشْهِدْني اَوْلِياءِكَ عِنْدَ خُرُوجِ نَفْسي، وَحُلُولِ رَمْسي، وَانْقِطاعِ عَمَلي، وَانْقِضاءِ اَجَلي، اَللّـهُمَّ وَاذْكُرْني عَلى طُولِ الْبِلى اِذا حَلَلْتُ بَيْنَ اَطْباقِ الثَّرى، وَنَسِيَنِى النّاسُونَ مِنَ الْوَرى، وَاحْلِلْني دارَ الْمُقامَةِ، وَبَوِّئْني مَنْزِلَ الْكَرامَةِ، وَاجْعَلْني مِنْ مُرافِقي اَوْلِيائِكَ وَاَهْلِ اجْتِبائِكَ وَاصْطَفائِكَ، وَباركْ لي في لِقائِكَ، وَارْزُقْني حُسْنَ الْعَمَلِ قَبْلَ حُلُولِ الاَْجَلِ، بَريئاً مِنَ الزَّلَلِ وَسوُءِ الْخَطَلِ، اَللّـهُمَّ وَاَوْرِدْني حَوْضَ نَبِيِّكَ مُحَمَّد صَلَّى اللهُ عَلَيْهِ وَآلِهِ، وَاسْقِني مِنْهُ مَشْرَباً رَوِيّاً سائِغاً هَنيئاً لا اَظْمَأُ بَعْدَهُ وَلا اُحَلاَّ وِرْدَهُ وَلا عَنْهُ اُذادُ، وَاجْعَلْهُ لي خَيْرَ زاد، وَاَوْفى ميعاد يَوْمَ يَقُومُ الاَْشْهادُ، اَللّـهُمَّ وَالْعَنْ جَبابِرَةَ الاَْوَّلينَ وَالاْخِرينَ، وَبِحُقُوقِ اَوْلِيائِكَ الْمُسْتَأثِرِينَ اَللّـهُمَّ وَاقْصِمْ دَعائِمَهُمْ وَاَهْلِكْ اَشْياعَهُمْ وَعامِلَهُمْ، وَعَجِّلْ مَهالِكَهُمْ، وَاسْلُبْهُمْ مَمالِكَهُمْ، وَضَيِّقْ عَلَيْهِمْ مَسالِكَهُمْ، وَالْعَنْ مُساهِمَهُمْ وَمُشارِكَهُمْ، اَللّـهُمَّ وَعَجِّلْ فَرَجَ اَوْلِيائِكَ، وَارْدُدْ عَلَيْهِمْ مَظالِمَهُمْ، وَاَظْهِرْ بِالْحَقِّ قائِمَهُمْ، وَاجْعَلْهُ لِدينِكَ مُنْتَصِراً، وَبِاَمْرِكَ في اَعْدائِكَ مُؤْتَمِراً اَللّـهُمَّ احْفُفْهُ بِمَلائِكَةِ النَّصْرِ وَبِما اَلْقَيْتَ اِلَيْهِ مِنَ الاَْمْرِ في لَيْلَةِ الْقَدْرِ، مُنْتَقِماً لَكَ حَتّى تَرْضى وَيَعوُدَ دينُكَ بِهِ وَعَلى يَدَيْهِ جَديداً غَضّاً، وَيَمْحَضَ الْحَقَّ مَحْضاً، وَيَرْفُضَ الْباطِلَ رَفْضاً، اَللّـهُمَّ صَلِّ عَلَيْهِ وَعَلى جَميعِ آبائِهِ، وَاجْعَلْنا مِنْ صَحْبِهِ وَاُسْرَتِهِ، وَابْعَثْنا في كَرَّتِهِ حَتّى نَكُونَ في زَمانِهِ مِنْ اَعْوانِهِ، اَللّـهُمَّ اَدْرِكْ بِنا قِيامَهُ، وَاَشْهِدْنا اَيّامَهُ، وَصَلِّ عَلَيْهِ وَارْدُدْ اِلَيْنا سَلامَهُ، وَالسَّلامُ عَلَيْهِ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.\n\n'
                      'اعلم انّ السّيد الدّاماد (رحمه الله) قال في رسالته المسمّاة الاربعة ايّام في خلال أعمال يوم دحوّ الارض انّ زيارة الرّضا (عليه السلام) في هذا اليوم هي أكد آدابه المسنونة كذلك، ويتأكّد استحباب زيارته (عليه السلام) في اليوم الاوّل من شهر رجب الفرد، وقد حثّ عليها حثّاً بالغاً.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'اليوم الاخير من الشّهر :',
                  subtitle:
                      'في هذا اليوم من سنة مائتين وعشرين على المشهور استشهد الامام محمّد بن عليّ التّقي (عليهما السلام) في بغداد، وقد سمّه المعتصم بالله العبّاسي، وكان شهادته بعد سنتين ونصف من وفاة المأمون، كما كان الامام نفسه يتنبّأ بذلك فيقول : « الفَرَجَ بَعْدَ المأمُون بِثَلاثينَ شَهراً » تشعر هذه الكلمة بما كان يعانيه من الاذى والمحن من سوء معاشرة المأمون له حتّى اعتبر الموت فرجه الذي يترقّبه كما عانى من المحن ما عاناه أبوه العظيم الامام الرّضا (عليه السلام)حينما ولّي العهد، وكان كلّما رجع من الجامع يوم الجمعة رفع يديه الى السّماء وهو عرقان مغبراً فقال : « اِلهي اِنْ كانَ فَرَجي في مَوتي فَعَجِّلْ وَفاتي لِساعَتي »، وكان دائم الكآبة والغمّ حتّى قضى نحبه، وقد توفّى الامام محمّد بن عليّ التّقيّ (عليهما السلام)وله من العمر خمساً وعشرون سنة وبضعة أشهر، ويقع قبره الشّريف خلف قبر جدّه العظيم الامام موسى الكاظم (عليه السلام)في الكاظميّة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiShaherSafar.screenRoute,
          pushBack: Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya
              .screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في شهر ذي القعدة.mp3',
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
