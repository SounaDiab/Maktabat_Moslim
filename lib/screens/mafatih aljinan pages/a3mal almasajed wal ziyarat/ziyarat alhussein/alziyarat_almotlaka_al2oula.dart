import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'alziyarat_almotlaka_alsaniya.dart';
import 'fima_3ala_alza2ir_mora3atoh.dart';

class AlziyaratAlmotlakaAl2oula extends StatefulWidget {
  static String screenRoute = 'alziyarat_almotlaka_al2oula_screen';
  const AlziyaratAlmotlakaAl2oula({super.key});

  @override
  State<AlziyaratAlmotlakaAl2oula> createState() =>
      _AlziyaratAlmotlakaAl2oulaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlziyaratAlmotlakaAl2oulaState extends State<AlziyaratAlmotlakaAl2oula> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alziyarat_almotlaka_al2oula_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alziyarat_almotlaka_al2oula_screen', value);
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
          .pushReplacementNamed(ZiyaratAlhousseinWa2adabiha.screenRoute);
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
                          'الزيارة المطلقة الأولى للحسين (عليه السلام)',
                          AlziyaratAlmotlakaAl2oula.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الزيارة المطلقة الأولى للحسين (عليه السلام)',
                          AlziyaratAlmotlakaAl2oula.screenRoute,
                          AlziyaratAlmotlakaAl2oula.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الزيارة المطلقة الأولى للحسين (عليه السلام)',
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
                      'روى الكليني في الكافي بسنده عن الحسين بن ثُوير قال : كنتُ أنا ويُونس بن ظبيان والمفضّل بن عمر وأبو سلمة السّراج جلوساً عند أبي عبد الله جعفر بن محمّد (عليه السلام) وكانَ المتكلّم يُونس وكان اكبرنا سنّاً، فقال له : جعلت فداك انّي أحضر مجالِس هؤلاء القوم يعني ولد عبّاس فما أقول ؟ قال : اذا حضرتهم وذكرتنا فقُل : اَللّـهُمَّ اَرِنَا الرَّخاءَ وَالسُّرُورَ، لتبلغ ما تريد من الثّواب أو الرّجوع عند الرّجعة ، فقلت : جعلت فداك انّي كثيراً ما أذكر الحسين (عليه السلام) فأيّ شيء أقول ؟ قال : تقول وتعيدُ ذلك ثلاثاً : صَلَّى اللهُ عَلَيْكَ يا اَبا عَبْدِاللهِ، فانّ السّلام يصل اليه من قريب وبعيد. ثمّ قال : انّ أبا عبد الله (عليه السلام) لمّا مضى بكت عليه السّماوات السّبع والارضُون السّبع وما فيهنّ وما بينهنّ ومن يتقلّب في الجنّة والنّار من خلق ربّنا وما يُرى وما لا يُرى بكاءً على أبيعبد الله (عليه السلام) الاّ ثلاثة أشياء لم تبك عليه ، قلت : جُعلت '
                      'فداك ما هذه الثلاثة الاشياء ؟ قال : لم تبك عليه البصرة ولا الدّمشق ولا آل عثمان ، قال : قلت: جعلت فداك انّي أريد أن أزوره فكيف أقول وكيف أصنع ؟ قال : اذا أتيت أبا عبد الله (عليه السلام)فاغتسل على شاطيء الفرات ثمّ البس ثيابك الطّاهرة ثمّ امش حافياً فانّك في حرم من حرم الله ورسُوله بالتّكبير والتّهليل والتّمجيد والتّعظيم لله كثيراً والصّلاة على محمّد وأهل بيته حتّى تصير الى باب الحائر ثمّ قُل : اَلسَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ وَابْنَ حُجَّتِهِ، اَلسَّلامُ عَلَيْكُمْ يا مَلائِكَةَ اللهِ وَزُوّارَ قَبْرِ ابْنِ نَبِيِّ اللهِ، ثمّ قِف فكبّر ثلاثين تكبيرة ثمّ امش الى القبر من قبل وجهه واستقبل وجهك بوجهه واجعل القبلة بين كتفيك ثمّ تقول :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ وَابْنَ حُجَّتِهِ، اَلسَّلامُ عَلَيْكَ يا قَتيلَ اللهِ وَابْنَ قَتيلِهِ، اَلسَّلامُ عَلَيْكَ يا ثارَ اللهِ وَابْنَ ثارِهِ، اَلسَّلامُ عَلَيْكَ يا وِتْرَ اللهِ الْمَوْتُورَ فِي السَّماواتِ وَالاَْرْضِ، اَشْهَدُ اَنَّ دَمَكَ سَكَنَ فِي الْخُلْدِ وَاقْشَعَرَّتْ لَهُ اَظِلَّةُ الْعَرْشِ، وَبَكى لَهُ جَميعُ الْخَلائِقِ وَبَكَتْ لَهُ السَّماواتُ السَّبْعُ وَالاَْرَضُونَ السَّبْعُ وَما فيهِنَّ وَما بَيْنَهُنَّ وَمَنْ يَتَقَلَّبُ فِي الْجَنَّةِ وَالنّارِ مِنْ خَلْقِ رَبِّنا وَما يُرى وَما لا يُرى، اَشْهَدُ اَنَّكَ حُجَّةُ اللهِ وَابْنُ حُجَّتِهِ، وَاَشْهَدُ أنَّكَ قَتيلُ اللهِ وابنُ قَتيلِهِ واَشْهَدُ أنَّكَ ثارُ اللهِ وابْنَ ثارِهِ، وَاَشْهَدُ اَنَّك وِتْرُ اللهِ الْمَوْتورُ فِي السَّماواتِ وَالاَْرْضِ، وَاَشْهَدُ اَنَّكَ قَدْ بَلَّغْتَ وَنَصَحْتَ وَوَفَيْتَ وَاَوْفَيْتَ وَجاهَدْتَ فِي سَبيلِ اللهِ وَمَضَيْتُ لِلَّذي كُنْتَ عَلَيْهِ شهَيداً وَمُسْتَشْهِداً وَشاهِداً وَمَشْهُوداً، اَنَا عَبْدُاللهِ وَمَوْلاكَ وَفِي طاعَتِكَ وَالْوافِدُ اِلَيْكَ اَلَْتمِسُ كَمالَ الْمَنْزِلَةِ عِنْدَ اللهِ وَثَباتَ الْقَدَمِ فِي الْهِجْرَةِ اِلَيْكَ، وَالسَّبيلَ الَّذي لا يَخْتَلِجُ دوُنَكَ مِنَ الدُّخُولِ فِي كِفالَتِكَ الَّتي اَمَرْتَ بِها، مَنْ اَرادَ اللهَ بَدَأَ بِكُمْ، بِكُمْ يُبَيِّنُ اللهُ الْكَذِبَ، وَبِكُمْ يُباعِدُ اللهُ الزَّمانَ الْكَلِبَ، وَبِكُمْ فَتَحَ اللهُ وَبِكُمْ يَخْتِمُ اللهُ، وَبِكُمْ يَمْحُو ما يَشاءُ وَيُثْبِتُ، وبِكُمْ يَفُكُّ الذُّلَّ مِنْ رِقابِنا، وَبِكُمْ يُدْرِكُ اللهُ وِتْرَةَ كُلِّ مُؤْمِن يَطْلَبُ بِها، وَبِكُمْ تَنْبِتُ '
                      'الاَْرْضُ اَشْجارَها، وَبِكُمْ تُخْرِجُ الاَْرْضُ ثِمارَها، وَبِكُمْ تُنْزِلُ السَّماءُ قَطْرَها وَرِزْقَها، وَبِكُمْ يَكْشِفُ اللهُ الْكَرْبَ، وَبِكُمْ يُنَزِّلُ اللهُ الْغَيْثَ، وَبِكُمْ تُسَبِّحُ الاَْرْضُ الَّتي تَحْمِلْ اَبْدانَكُمْ وَتَسْتَقِرُّ جِبالُها عَنْ مَراسيها اِرادَةُ الرَّبِّ في مَقاديرِ اُمُورِهِ تَهْبِطُ اِلَيْكُمْ وَتَصْدُرُ مِنْ بُيُوتِكُمْ وَالصّادِرُ عَمّا فُصِّلَ مِنْ اَحْكامِ الْعِبادِ، لُعِنَتْ اُمَّةٌ قَتَلَتْكُمْ، وَاُمَّةٌ خالَفَتْكُمْ، وَاُمَّةٌ جَحَدَتْ وَلايَتَكُمْ، وَاُمَّةٌ ظاهَرَتْ عَلَيْكُمْ، وَاُمَّةٌ شَهِدَتْ وَلَمْ تُسْتَشْهَدْ، اَلْحَمْدُ للهِ الَّذي جَعَلَ النّارَ مَأواهُمْ وَبِئْسَ وِرْدُ الْوارِدينَ، وَبِئْسَ الْوِرْدُ الْمَوْرُودُ، وَالْحَمْدُ للهِ رَبِّ الْعالَمينَ.\n\n'
                      'فقل ثلاث مرات : وَصَلَّى اللهُ عَلَيْكَ يا اَبا عَبْدِاللهِ وقُل ثلاث مرّة : اَنَا اِلَى اللهِ مِمَّنْ خالَفَكَ بَريءٌ ثمّ تقوم فتأتي ابنه عليّاً وهو عند رجله فتقُول : اَلسَّلامُ عَلَيْكَ يا ابْنَ رَسُولِ اللهِ، اَلسَّلامُ عَلَيْكَ يا ابْنَ اَميرِ الْمُؤْمِنينَ، اَلسَّلامُ عَلَيْكَ ياابْنَ الْحَسَنِ وَالْحُسَيْنِ، اَلسَّلامُ عَلَيْكَ يا ابْنَ خَديجَةَ وَفاطِمَةَ صَلَّى اللهُ عَلَيْكَ صَلّى اللهُ عَلَيْكَ صَلّى اللهُ عَلَيْكَ، لَعَنَ اللهُ مَنْ قَتَلَكَ تقول ذلك ثلاثاً، وثلاثاً: انا اِلَى اللهِ مِنْهُمْ بَريءٌ، ثمّ تقوم فتومىء بيدك الى الشّهداء رضي الله عنهم وتقُولُ : اَلسَّلامُ عَلَيْكُمْ اَلسَّلامُ عَلَيْكُمْ اَلسَّلامُ عَلَيْكُمْ، فُزْتُمْ وَاللهِ فُزْتُمْ وَاللهِ فُزْتُمْ وَاللهِ، فَلَيْتَ اَنّي مَعَكُمْ فَاَفُوزَ فَوْزاً عَظيماً، ثمّ تدور فتجعل قبر أبي عبد الله (عليه السلام)بين يَديك أي تقف خلف القبر المُطهّر فتصلّي ستّ ركعات وقد تمّت زيارتك فإنْ شئت فانصَرف.\n\n'
                      'أقول : قد روى ايضاً هذه الزّيارة الشّيخ الطّوسي في التّهذيب، والصّدوق في كتاب من لا يحضره الفقيه ، وقال الصّدوق: انّي قد ذكرت في كتابي المزار والمقتل أنواعاً من الزّيارات وانتخبت هذه الزّيارة لهذا الكتاب فانّها أصَحّ الزّيارات عندي رواية، وهي تكفينا وتفي بالمقصود ، انتهى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlziyaratAlmotlakaAlsaniya.screenRoute,
          pushBack: Fima3alaAlza2irMora3atoh.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الزيارة الطلقة الاولى.mp3',
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
