import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:maktabat_almoslim/widgets/she3er.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alnabi_walzahraa_wal2a2ima.dart';
import 'zikr_sa2ir_alziyarat.dart';
import 'ziyarat_alnabi.dart';

class Ziyarat2a2imatBelbaki3 extends StatefulWidget {
  static String screenRoute = 'ziyarat_2a2imat_belbaki3_screen';
  const Ziyarat2a2imatBelbaki3({super.key});

  @override
  State<Ziyarat2a2imatBelbaki3> createState() => _Ziyarat2a2imatBelbaki3State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Ziyarat2a2imatBelbaki3State extends State<Ziyarat2a2imatBelbaki3> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_ziyarat_2a2imat_belbaki3_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_2a2imat_belbaki3_screen', value);
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
          .pushReplacementNamed(ZiyaratAlnabiWalzahraaWal2a2ima.screenRoute);
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
                      .addFavorite('زيارة أئمة البقيع عليهم السلام',
                          Ziyarat2a2imatBelbaki3.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة أئمة البقيع عليهم السلام',
                          Ziyarat2a2imatBelbaki3.screenRoute,
                          Ziyarat2a2imatBelbaki3.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة أئمة البقيع عليهم السلام',
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
                      'أي الامام الحسن المجتبى، والامام زين العابدين، والامام محمّد الباقر، والامام جعفر الصّادق (عليهم السلام).\n\n'
                      'اذا أردت زيارتهم فاعمل بما سبق من آداب الزّيارة من الغسل والكون على الطّهارة ولبس الثّياب الطّاهرة النّظيفة والتّطيّب والاستئذان للدّخول ونحو ذلك وقُل أيضاً :\n\n'
                      'يا مَوالِيَّ يا اَبْناءَ رَسُولِ اللهِ، عَبْدُكُمْ وَابْنُ اَمَتِكُمُ الذَّليلُ بَيْنَ اَيْديكُمْ، وَالْمُضْعِفُ في عُلُوِّ قَدْرِكُمْ، وَالْمُعْتَرِفُ بِحَقِّكُمْ، جاءَكُمْ مُسْتَجيراً بِكُمْ، قاصِداً اِلى حَرَمِكُمْ، مُتَقَرِّباً اِلى مَقامِكُمْ، مُتَوَسِّلاً اِلَى اللهِ تَعالى بِكُمْ، أَدْخُلُ يا مَوالِيَّ، أَدْخُلُ يا اَوْلِياءَ اللهِ، أَدْخُلُ يا مَلائِكَةَ اللهِ الُْمحْدِقينَ بِهذَا الْحَرَمِ الْمُقيمينَ بِهذَا الْمَشْهَدِ.\n\n'
                      'وادخل بعد الخشُوع والخضُوع ورقّة القلب وقدّم رجلك اليمنى وقُل:\n\n'
                      'اَللهُ اَكْبَرُ كَبيراً، وَالْحَمْدُ للهِ كَثيراً، وَسُبْحانَ اللهِ بُكْرَةً وَاَصيلاً، وَالْحَمْدُ للهِ الْفَرْدِ الصَّمَدِ الْماجِدِ الاَْحَدِ الْمُتَفَضِّلِ الْمَنّانِ، الْمُتَطَوِّلِ الْحَنّانِ الَّذي مَنَّ بِطَوْلِهِ، وَسَهَّلَ زِيارَةَ ساداتي بِاِحْسانِهِ، وَلَمْ يَجْعَلْني عَنْ زِيارَتِهِمْ مَمْنُوعاً بَلْ تَطَوَّلَ وَمَنَحَ.\n\n'
                      'ثمّ اقترب من قبُورهم المقدّسة واستقبلها واستدبر القبلة وَقُل :\n\n'
                      'اَلسَّلامُ عَلَيْكُمْ اَئِمَّةَ الْهُدى، اَلسَّلامُ عَلَيْكُمْ اَهْلَ التَّقْوى، اَلسَّلامُ عَلَيْكُمْ اَيُّهَا الْحُجَجُ على اَهْلِ الدُّنْيا، اَلسَّلامُ عَلَيْكُمْ اَيُّهَا الْقُوّامُ في الْبَرِيَّةِ بِالْقِسْطِ، اَلسَّلامُ عَلَيْكُمْ اَهْلَ الصَّفْوَةِ، اَلسَّلامُ عَلَيْكُمْ آلَ رَسُولِ اللهِ، اَلسَّلامُ عَلَيْكُمْ اَهْلَ النَّجْوى، اَشْهَدُ اَنَّكُمْ قَدْ بَلَّغْتُمْ وَنَصَحْتُمْ وَصَبَرْتُمْ في ذاتِ اللهِ، وَكُذِّبْتُمْ وَاُسيءَ اِلَيْكُمْ فَغَفَرْتُمْ، وَاَشْهَدُ اَنَّكُمُ الاَْئِمَّةُ الرّاشِدُونَ الْمُهْتَدُونَ، وَاَنَّ طاعَتَكُمْ مَفْرُوضَةٌ، وَاَنَّ قَوْلَكُمُ الصِّدْقُ، وَاَنَّكُمْ دَعْوَتُمْ فَلَمْ تُجابُوا، وَاَمَرْتُمْ فَلَمْ تُطاعُوا، وَاَنَّكُمْ دَعائِمُ الدّينِ وَاَرْكانُ الاَْرْضِ، لَمْ تَزالُوا بِعَيْنِ اللهِ يَنْسَخُكُمْ مِنْ اَصْلابِ كُلِّ مُطَّهَر، وَيَنْقُلُكُمْ مِنْ اَرْحامِ الْمُطَهَّراتِ، لَمْ تُدَنِّسْكُمُ الْجاهِلِيَّةُ الْجَهْلاءُ، وَلَمْ تَشْرَكْ فيكُمْ فِتَنُ الاَْهْواءِ، طِبْتُمْ وَطابَ مَنْبَتُكُمْ، مَنَّ بِكُمْ عَلَيْنا دَيّانُ الدّينِ، فَجَعَلَكُمْ في بُيُوت اَذِنَ اللهُ اَنْ تُرْفَعَ وَيُذْكَرَ فيهَا اسْمُهُ، وَجَعَلَ صَلَاتَنا عَلَيْكُمْ رَحْمَةً لَنا وَكَفّارَةً لِذُنُوبِنا، اِذِ اخْتارَكُمُ اللهُ لَنا، وَطَيَّبَ خَلْقَنا بِما مَنَّ عَلَيْنا مِنْ وِلايَتِكُمْ، وَكُنّا عِنْدَهُ مُسَمِّينَ بِعِلْمِكُمْ، مُعْتَرِفينَ بِتَصْديقِنا اِيّاكُمْ، وَهذا مَقامُ مَنْ اَسْرَفَ وَاَخْطَاَ وَاسْتَكانَ وَاَقَرَّ بِما جَنى وَرَجا بِمَقامِهِ الْخَلاصَ، وَاَنْ يَسْتَنْقِذَهُ بِكُمْ مُسْتَنْقِذُ الْهَلْكى مِنَ الرَّدى، فَكُونُوا لي شُفَعاءَ، فَقَدْ وَفَدْتُ اِلَيْكُمْ اِذْ رَغِبَ عَنْكُمْ اَهْلُ الدُّنْيا، وَاتَّخَذُوا آياتِ اللهِ هُزُواً وَاسْتَكْبَرُوا عَنْها (ثم ارفع رأسك الى السماء وقل:)يا مَنْ هُوَ قائِمٌ لا يَسْهُو، وَدائِمٌ لا يَلْهُو، وَمُحيطٌ بِكُلِّ شَىْء لَكَ الْمَنُّ بِما وَفَّقْتَني وَعَرَّفْتَني بِما اَقَمْتَني عَلَيْهِ، اِذْ صَدَّ عَنْهُ عِبادُكَ، وَجَهِلُوا مَعْرِفَتَهُ، وَاسْتَخَفُّوا بِحَقِّهِ، وَمالُوا اِلى سِواهُ، فَكانَتِ الْمِنَّةُ مِنْكَ عَلَيَّ مَعَ اَقْوام خَصَصْتَهُمْ بِما خَصَصْتَني بِهِ، فَلَكَ الْحَمْدُ اِذْ كُنْتُ عِنْدَكَ في مَقامي هذا مَذْكُوراً مَكْتُوباً، فَلا تَحْرِمْني ما رَجَوْتُ، وَلا تُخَيِّبْني فيـما دَعَوْتُ، بِحُرْمَةِ مُحَمَّد وَآلِهِ الطّاهِرينَ، وَصَلَّى اللهُ عَلى مُحَمَّد وَآلِ مُحَمَّد.\n\n'
                      'ثمّ ادعُ لنفسك بما تُريد ، وقال الطّوسي (رحمه الله) في التّهذيب: ثمّ صلّ صلاة الزّيارة ثمان ركعات أي صلّ لكلّ امام ركعتين.\n\n'
                      'وقال الشّيخ الطّوسي والسّيد ابن طاووس : اذا أردت أن تودّعهم (عليهم السلام) فقُل :\n\n'
                      'اَلسَّلامُ عَلَيْكُمْ اَئِمَّةَ الْهُدى وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَسْتَوْدِعُكُمُ اللهَ وَاَقْرَأُ عَلَيْكُمُ السَّلامَ، آمَنّا بِاِللهِ وَبِالرَّسُولِ، وَبِما جِئْتُمْ بِهِ وَدَلَلْتُمْ عَلَيْهِ، اَللّـهُمَّ فَاكْتُبْنا مَعَ الشّاهِدينَ.\n\n'
                      'ثمّ اكثر من الدّعاء وسل الله العود وأن لا تكون هذه آخر عهدك من زيارتهم، والعلامة المجلسي (رحمه الله) قد أورد في البحار زيارة مبسُوطة لهم (عليهم السلام)، ونحن هُنا قد اقتصرنا على ما مضى من زيارتهم فانّ أفضل الزّيارات لهم (عليهم السلام) هي الزّيارة الجامعة الاتية على ما صرّح به المجلسي وغيره، وفي الباب الاوّل من الكتاب عند ذكر زيارات الحجج الطّاهرة موزعة على أيّام الاسبُوع قد اثبتنا زيارة للحسن (عليه السلام) وزيارة اخرى للائمة الثّلاثة الاخرون بالبقيع فلا تغفل عنها، واعلم انّا نورد لكلّ من الحجج الطّاهرين عند ذكر زيارته كيفيّة الصّلاة عليه سوى ائمة البقيع حيث اقتصرنا في الصلاة عليهم بما سيذكر '
                      'في آخر باب الزّيارات فلاحظها هُناك وثقّل ميزان حسناتك بالصّلاة عليهم، واعلم ايضاً انّ شدّة شوقي أنا المهجور الكسير الى تلك المشاهد الشريفة تبعثني على أن اشغل خاطرى بايراد عدّة ابيات تناسب المقام من القصيدة الهائية للفاضل الاوحد مادح آل احمد حضرة الشّيخ الاُزري رضوان الله عليه، وكان شيخ الفقهاء العظام خاتم المجتهدين الفخام الشّيخ محمّد حسن صاحب الجواهر يتمنّى على ما يروى عنه أن تكتب له القصيدة في ديوان أعماله، ويسجّل كتاب الجواهر في ديوان اعمال الاُزري قال (رحمه الله) :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'اِنَّ تِلْكَ الْقُلُوبَ اَقْلَقَها الْوَجْدُ   وَاَدْمى تِلْكَ الْعُيُونَ بُكاها\n\n'
                      'كانَ اَنْكَى الْخُطُوبِ لَمْ يُبْكِ مِنّي   مُقْلَةً لكِنِ الْهَوى اَبْكاها\n\n'
                      'كُلَّ يَوْم لِلْحادِثاتِ عَواد   لَيْسَ يَقْوى رَضْوى عَلى مُلْتَقاها\n\n'
                      'كَيْفَ يُرْجَى الْخَلاصُ مِنْهُنَّ إلاّ   بِذِمام مِنْ سَيِّدِ الرُّسْلِ طه\n\n'
                      'مَعْقِلُ الْخائِفِينَ مِنْ كُلِّ خَوْف   اَوْفَرُ الْعُرْبِ ذِمَّةً اَوْفاها\n\n'
                      'مَصْدَرُ الْعِلْمِ لَيْسَ إلاّ لَدَيْهِ   خَبَرُ الْكائِناتِ مِنْ مُبْتَداها\n\n'
                      'فاضَ لِلْخَلْقِ مِنْهُ عِلْمٌ وَحِلْمٌ   اَخَذَتْ مِنْهُمَا الْعُقُولُ نُهاها\n\n'
                      'نَوَّهَتْ بِاسْمِهِ السَّماواتُ وَالاَْرْ   ضُ كَما نَوَّهَتْ بِصُبْح ذُكاها\n\n'
                      'وَغَدَتْ تَنْشُرُ الْفَضائِلَ عَنْهُ   كُلُّ قَوْم عَلَى اخْتِلافِ لُغاها\n\n'
                      'طَرِبَتْ لاِسْمِهِ الثَّرى فَاسْتَطالَتْ   فَوْقَ عُلْوِيَّةِ السَّما سُفْلاها\n\n'
                      'جازَ مِنْ جَوْهَرِ التَّقَدُّسِ ذاتاً   تاهَتِ الاَْنْبِياءُ في مَعْناها\n\n'
                      'لا تُجِلْ في صِفاتِ اَحْمَدَ فِكْراً   فَهِيَ الصُّورَةُ الَّتي لَنْ تَراها\n\n'
                      'اَىُّ خَلْق للهِ اَعْظَمُ مِنْهُ   وَهُوَ الْغايَةُ الَّتِي اسْتَقْصاها\n\n'
                      'قَلَّبَ الْخافِقَيْنِ ظَهْراً لِبَطْن   فَرَآى ذاتَ اَحْمَد فَاجْتَباها\n\n'
                      'لَسْتُ اَنْسى لَهُ مَنازِلَ قُدْس   قَدْ بَناها التُّقى فَاَعْلا بِناها\n\n'
                      'وَرِجالاً اَعِزَّةً في بُيُوت   اَذِنَ اللهُ اَنْ يُعَزَّ حِماها\n\n'
                      'سادَةٌ لا تُريدُ إلاّ رِضَى اللهِ   كَما لا يُريدُ إلاّ رِضاها\n\n'
                      'خَصَّها مِنْ كَمالِهِ بِالْمَعاني   وَبِاَعْلى اَسْمائِهِ سَمّاها\n\n'
                      'لَمْ يَكُونُوا لِلْعَرْشِ إلاّ كُنُوزاً   خافِيات سُبْحانَ مَنْ اَبْداها\n\n'
                      'كَمْ لَهُمْ أَلْسُنٌ عَنِ اللهِ تُنْبي   هِيَ اَقْلامُ حِكْمَة قَدْ بَراها\n\n'
                      'وَهُمُ الاَْعْيُنُ الصَّحيحاتُ تَهْدي   كُلَّ عَيْن مَكْفُوفَة عَيْناها\n\n'
                      'عُلَماءٌ اَئِمَّةٌ حُكَماءٌ   يَهْتَدِى النَّجْمُ بِاِتِّباعِ هُداها\n\n'
                      'قادَةٌ عِلْمُهُم وَرَأىُ حِجاهُم   مَسْمَعا كُلِّ حِكْمَة مَنْظَراها\n\n'
                      'ما اُبالي وَلَوْ اُهيلَتْ عَلَى الاَْرْضِ   السَّماواتُ بَعْدَ نَيْلِ وِلاها',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZikrSa2irAlziyarat.screenRoute,
          pushBack: ZiyaratAlnabi.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة أئمة البقيع.mp3',
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
