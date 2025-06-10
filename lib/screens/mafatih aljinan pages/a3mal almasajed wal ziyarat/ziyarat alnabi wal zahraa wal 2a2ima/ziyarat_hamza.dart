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
import 'ziyarat_fatima_bent_2asad.dart';
import 'ziyarat_kobour_alshohada2.dart';

class ZiyaratHamza extends StatefulWidget {
  static String screenRoute = 'ziyarat_hamza_screen';
  const ZiyaratHamza({super.key});

  @override
  State<ZiyaratHamza> createState() => _ZiyaratHamzaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratHamzaState extends State<ZiyaratHamza> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_ziyarat_hamza_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_ziyarat_hamza_screen', value);
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
                      .addFavorite(
                          'زيارة حمزة(رض) في أحد', ZiyaratHamza.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('زيارة حمزة(رض) في أحد',
                          ZiyaratHamza.screenRoute, ZiyaratHamza.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة حمزة(رض) في أحد',
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
                  subtitle: 'تقول عند قبره اذا مضيت لزيارَته:\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا عَمَّ رَسُولِ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِه، اَلسَّلامُ عَلَيْكَ يا خَيْرَ الشُّهَداءِ، اَلسَّلامُ عَلَيْكَ يا اَسَدَ اللهِ وَاَسَدَ رَسُولِهِ، اَشْهَدُ اَنَّكَ قَدْ جاهَدْتَ فِي اللهِ عَزَّوَجَلَّ، وَجُدْتَ بِنَفْسِكَ، وَنَصَحْتَ رَسُولَ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ، وَكُنْتَ فيـما عِنْدَ اللهِ سُبْحانَهُ راغِباً، بَاِبي اَنْتَ وَاُمّي اَتَيْتُكَ مُتَقَرِّباً اِلى رَسُولِ اللهِ صَلَّى اللهُ عَلَيْهِ وَآلِهِ بِذلِكَ راغِباً اِلَيْكِ فِي الشَّفاعَةِ، اَبْتَغي بِزِيارَتِكَ خَلاصَ نَفْسي، مُتَعَوِّذاً بِكَ مِنْ نار اسْتَحَقَّها مِثْلي بِما جَنَيْتُ عَلى نَفْسي، هارِباً مِنْ ذُنُوبِيَ الَّتي احْتَطَبْتُها عَلى ظَهْري، فَزِعاً اِلَيْكَ رَجاءَ رَحْمَةِ رَبّي، اَتَيْتُكَ مِنْ شُقَّة بَعيدَة طالِباً فَكاكَ رَقَبَتي مِنَ النّارِ، وَقَدْ اَوْقَرَتْ ظَهْري ذُنُوبي، وَاَتَيْتُ ما اَسْخَطَ رَبّي، وَلَمْ اَجِدْ اَحَدًا اَفْزَعُ اِلَيْهِ خَيْراً لي مِنْكُمْ اَهْلَ بَيْتِ الرَّحْمَةِ، فَكُنْ لي شَفيعاً يَوْمَ فَقْري وَحاجَتي، فَقَدْ سِرْتُ اِلَيْكَ مَحْزُوناً، وَاَتَيْتُكَ مَكْرُوباً، وَسَكَبْتُ عَبْرَتي عِنْدَكَ باكِياً، وَصِرْتُ اِلَيْكَ مُفْرَداً، وَاَنْتَ مِمَّنْ اَمَرَنِي اللهُ بِصِلَتِهِ، وَحَثَّني عَلى بِرِّهِ، وَدَلَّني عَلى فَضْلِهِ، وَهَداني لِحُبِّهِ، وَرَغَّبَني فِي الْوِفادَةِ اِلَيْهِ، وَاَلْهَمَني طَلَبَ الْحَوائِجِ عِنْدَهُ، اَنْتُمْ اَهْلُ بَيْت لا يَشْقى مَنْ تَوَلاّكُمْ، وَلا يَخيبُ مَنْ اَتاكُمْ، وَلا يَخْسَرُ مَنْ يَهْواكُمْ وَلا يَسْعَدُ مَنْ عاداكُمْ.\n\n'
                      'ثمّ تستقبل القبلة وتصلّي ركعتين للزّيارة وبعد الفراغ تنكبّ على القبر وتقول :\n\n'
                      'اَللّـهُمَّ صَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، اَللّـهُمَّ اِنّي تَعَرَّضْتُ لِرَحْمَتِكَ بِلُزُومي لِقَبْرِ عَمِّ نَبِيِّكَ صَلَّى اللهُ عَلَيْهِ وَآلِهِ لِيُجيرَني مِنْ نِقْمَتِكَ وَسَخَطِكَ وَمَقْتِكَ في يَوْم تَكْثُرُ فيهِ الاَْصْواتُ، وَتَشْغَلُ كُلُّ نَفْس بِما قَدَّمَتْ، وَتُجادِلُ عَنْ نَفْسِها، فَاِنْ تَرْحَمْنِي الْيَوْمَ فَلا خَوْفٌ عَلَيَّ وَلا حُزْنٌ، وَاِنْ تُعاقِبْ فَمَوْلىً لَهُ الْقُدْرَةُ عَلى عَبْدِهِ، وَلا تُخَيِّبْني بَعْدَ الْيَوْمِ، وَلا تَصْرِفْني بِغَيْرِ حاجَتي، فَقَدْ لَصِقْتُ بِقَبْرِ عَمِّ نَبِيِّكَ، وَتَقَرَّبْتُ بِهِ اِلَيْكَ ابْتِغاءَ مَرْضاتِكَ، وَرَجاءَ رَحْمَتِكَ، فَتَقَبَّلْ مِنّي، وَعُدْ بِحِلْمِكَ عَلى جَهْلي، وَبِرَأفَتِكَ عَلى جِنايَةِ نفْسي، فَقَدْ عَظُمَ جُرْمي، وَما اَخافُ اَنْ تَظْلِمَني وَلكِنْ اَخافُ سُوءَ الْحِسابِ، فَانْظُرِ الْيَوْمَ تَقَلُّبىِ عَلى قَبْرِ عَمِّ نَبِيِّكَ، فَبِهِما فُكَّني مِنَ النّارِ وَلا تُخَيِّبْ سَعْيي، وَلا يَهُونَنَّ عَلَيْكَ ابْتِهالي، وَلا تَحْجُبَنَّ عَنْكَ صَوْتي، وَلا تَقْلِبْني بِغَيْرِ حَوائِجي، يا غِياثَ كُلِّ مَكْرُوب وَمَحْزُون، وَيا مُفَرِّجاً عَنِ الْمَلْهُوفِ الْحَيْرانِ الْغَريقِ الْمُشْرِفِ عَلَى الْهَلَكَةِ، فَصَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَانْظُرْ اِلَيَّ نَظْرَةً لا اَشْقى بَعْدَها اَبَداً، وَارْحَمْ تَضَرُّعي وَعَبْرَتي وَانْفِرادي، فَقَدْ رَجَوْتُ رِضاكَ، وَتَحَرَّيْتُ الْخَيْرَ الَّذي لا يُعْطيهِ اَحَدٌ سِواكَ، فَلا تَرُدَّ اَمَلي، اَللّـهُمَّ اِنْ تُعاقِبْ فَمَوْلىً لَهُ الْقُدْرَةُ عَلى عَبْدِهِ، وَجَزائُهِ بِسُوءِ فِعْلِهِ، فَلا اَخيبَنَّ الْيَوْمَ، وَلا تَصْرِفْني بِغَيْرِ حاجَتي، وَلا تُخَيِّبَنَّ شُخُوصي وَوِفادَتي، فَقَدْ اَنْفَدْتُ نَفَقَتي، وَاَتْعَبْتُ بَدَني، وَقَطَعْتُ الْمَفازاتِ، وَخَلَّفْتُ الاَْهْلَ وَالْمالَ وَما خَوَّلْتَني، وَآثَرْتُ ما عِنْدَكَ عَلى نَفْسي، وَلُذْتُ بِقَبْرِ عَمِّ نَبِيِّكَ صَلَّى اللهُ عَلَيْهِ وَآلِهِ، وَتَقَرَّبْتُ بِهِ ابْتِغاءَ مَرْضاتِكَ، فَعُدْ بِحِلْمِكَ عَلى جَهْلي، وَبِرَأفَتِكَ عَلى ذَنْبي، فَقَدْ عَظُمَ جُرْمي بِرَحْمَتِكَ يا كَريمُ يا كَريمُ.\n\n'
                      'أقول : فضائل حمزة سلام الله عليه وفضل زيارته اكثر من أن يذكر وقال فخر المحقّقين (رحمه الله) في الرّسالة الفخريّة يستحبّ زيارة حمزة (رضي الله عنه) وباقي الشّهداء باُحد لما روي عن النّبي (صلى الله عليه وآله وسلم) انّه قال : من زارني ولم يزر عمّي حمزة فقد جفاني.\n\n'
                      'وأقول : انّي قد ذكرت في كتاب بيت الاحزان في مصائب سيّدة النّسوان انّ فاطمة صلوات الله عليها كانت تخرج يومي الاثنين والخميس من كلّ اسبوع بعد وفاة أبيها الى زيارة حمزة وباقي شُهداء اُحد، فتصلّي هناك وتدعو الى أن توفّيت، وقال محمُود بن لبيد: انّها كانت تأتي قبر حمزة وتبكي هناك، فلمّا كان في '
                      'بعض الايّام أتيت قبر حمزة فوجدتها تبكي هناك فأمهلتها حتّى سكنت فأتيتها وسلّمت عليها وقلت : يا سيّدة النّسوان قد والله قطّعت أنياط قلبي من بُكائكِ ، فقالت : يا أبا عمرو ويحقّ لي البكاء فلقد أصبت بخير الاباء رسول الله (صلى الله عليه وآله وسلم) ثمّ قالت : واشوقاه الى رسُول الله ثمّ أنشدت تقول :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: She3er(
                  subtitle:
                      'اِذا ماتَ يَوْماً مَيِّتٌ قَلَّ ذِكرُهُ      وَذِكْرُ اَبي مُذْ ماتَ وَاللهِ اَكْثَرُ',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وقال الشّيخ المفيد : وكان رسول الله (صلى الله عليه وآله وسلم) أمر في حياته بزيارة قبر حمزة (عليه السلام) وكان يلمّ به وبالشّهداء ولم تزل فاطمة (عليها السلام) بعد وفاته (صلى الله عليه وآله وسلم) تغدو الى قبره وتَرُوح والمسلمُون يَنتابُونَ على زيارتِهِ ومُلازَمَةِ قَبره.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiyaratKobourAlshohada2.screenRoute,
          pushBack: ZiyaratFatimaBent2asad.screenRoute,
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
