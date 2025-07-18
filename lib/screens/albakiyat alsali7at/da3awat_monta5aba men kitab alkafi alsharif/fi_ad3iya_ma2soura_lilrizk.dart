import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../da3awat_monta5aba_men_kitab_alkafi_alsharif.dart';
import 'fi_da3awat_ma2soura_kabl_salat_wfi_adbariha.dart';
import 'fi_zikr_dou3a2ain_lildin.dart';

class FiAd3iyaMa2souraLilrizk extends StatefulWidget {
  static String screenRoute =
      'fi_ad3iya_ma2soura_lilrizk_screen';
  const FiAd3iyaMa2souraLilrizk({super.key});

  @override
  State<FiAd3iyaMa2souraLilrizk> createState() =>
      _FiAd3iyaMa2souraLilrizkState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiAd3iyaMa2souraLilrizkState
    extends State<FiAd3iyaMa2souraLilrizk> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_ad3iya_ma2soura_lilrizk_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_ad3iya_ma2soura_lilrizk_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(
          Da3awatMonta5abaMenKitabAlkafiAlsharif.screenRoute);
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
                          'في أدعية مأثورة للرزق',
                          FiAd3iyaMa2souraLilrizk.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في أدعية مأثورة للرزق',
                          FiAd3iyaMa2souraLilrizk.screenRoute,
                          FiAd3iyaMa2souraLilrizk.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في أدعية مأثورة للرزق',
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
                  title: 'وهي خمسة :\n'
                      'الأول :',
                  subtitle:
                      ' عن معاوية بن عمار قال : سألت الصادق (عليه السلام) أن يعلّمني دعاءً للرزق فعلّمني دعاءً مارأيت أجلب منه للرزق قال: قل : اللّهُمَّ ارْزُقْني مِنْ فَضْلِكَ الواسِعِ الحَلالِ الطَيّبِ رِزْقاً وَاسِعاً حَلالاً طَيباً بَلاغاً لِلدُنيا وَالاخِرَةِ صَبَّاً صَبَّاً هَنيئاً مَريئاً مِنْ غَيْرِ كَدٍّ وَلامَنٍّ مِنْ أحَدٍ مِنْ خَلْقِكَ إِلاّ سَعَةً مِنْ فَضْلِكَ الواسِعَ، فَإنَّكَ قُلْتَ إسْأَلوا الله مِنْ فَضْلِهِ ؛ فَمِنْ فَضْلِكَ أسْأَلُ وَمِنْ عَطيتُكَ أسْأَلُ وَمِنْ يَدِكَ المَلاى أسْأَلُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'عن الباقر (عليه السلام) أنّه قال لزيد الشحام: أدع للرزق في المكتوبة وأنت ساجد : ياخَيْرَ المَسْؤولينَ وَياخَيْرَ المُعْطينَ ارْزُقْني وارْزُقْ عيالي مِنْ فَضْلِكَ فإنَّكَ ذو الفَضْلِ العَظيمِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'عن أبي بصير قال : شكوت إلى الصادق (عليه السلام) الحاجة، وسألته أن يعلّمني دعاءً في طلب الرزق، فعلّمني دعاءً مااحتجت منذ دعوت به. قال (عليه السلام) : قل في صلاة الليل وأنت ساجد : ياخَيْرَ مَدْعوٍّ وَياخَيْرَ مسؤولٍ، يا أوسَعَ مَنْ أعْطى وَياخَيْرَ مُرْتَجى ارْزُقْنِي وَأوْسِعْ عَليّ مِنْ رِزْقِكَ وَسَبِّبْ لي رِزْقاً مِنْ قِبَلِكَ إنَّكَ عَلى كُلِّ شَيٍ قَديرٍ.\n\n'
                      'أقول : ذكر هذا الدعاء الشيخ الطوسي في السجدة الثانية من الركعة الثامنة، من نافلة الليل في كتاب (المصباح).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'روي أن رسول الله (صلّى الله عليه وآله وسلم) علّم هذا الدعاء لطلب الرزق: يارازِقَ المُقِلّينَ وياراحِمَ المَساكينَ وَيأوليَّ المؤمِنينَ وَياذا القوَّةِ المَتينِ صَلِّ عَلى مُحَمَّدٍ وَآل مُحَمَّدٍ وَارْزُقْنِي وَعافِني وَاكْفِنِي ماأهَمَّني.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'روى أبو بصير هذا الدعاء عن الصادق (عليه السلام) لطلب الرزق وقال (عليه السلام): إن هذا الدعاء هو دعاء علي بن الحسين (عليه السلام): اللّهُمَّ إِنِّي أَسْأَلُكَ حُسْنَ المَعيشَةِ مَعيشَةً أتَقَوّى بِها عَلى جَميعِ حَوائِجي وَأتَوَصَّلُ بِها في الحَياةِ إِلى آخِرَتي مِنْ غَيْرِ أنْ تَتْرُفَني فيها فَأطْغى أوْ تَقْتِّرَ بِها عَليَّ فَأشْقى، وَأوْسِعْ عَليّ مِنْ حَلالِ رِزْقِكَ، وَأفْضِلْ عَليّ مِنْ سَبَبِ فَضْلِكَ نِعْمَةً مِنْكَ سابِغَةً وَعَطاءاً غَيْرَ مَمْنونٍ، ثُمَّ لاتَشْغَلْني عَنْ شُكْرِ نِعْمَتِكَ بِإكثارٍ منها تُلْهيني بَهْجَتُهُ وَتُفْتِنُنِي زَهَراتُ زَهْوَتِهِ وَلا بِإقلالٍ عَلَيّ مِنْها يَقْتَصِرُ بِعَمَلي كَدُّهُ وَيَمْلا صَدْري هَمُّهُ.\n\n'
                      'أعْطِني مِنْ ذلك ياإلهي غنىً عَنْ شِرارِ خَلْقِكَ وَبَلاغاً أنالُ بِهِ رِضْوانَكَ، وأعوذُ بِكَ ياإلهي مِنْ شَرِّ الدُّنيا وَشَرِّ مافيها، وَلاتَجْعَلْ عَليّ الدُّنيا سِجْناً وَلا فِراقَها عَليّ حُزناً، أخْرِجْني مِنْ فِتْنَتِها مَرْضيّاً عَنّي مَقْبولاً فِيها عَمَلي إِلى دارِ الحَيوانِ وَمَساكِنَ الاخْيارِ، وَأبْدِلْني بِالدُّنيا الفانيةِ نَعيمَ الدارِ الباقيةِ، اللّهُمَّ إِنِّي أعوذُ بِكَ مِنْ أزَلِها وَزِلْزالِها وَسَطَواتِ شَياطينِها وَسَلاطينِها وَنَكالِها وَمِنْ بَغْي مَنْ بَغى عَليّ فيها، اللّهُمَّ مَنْ كادَني فَكِدْهُ وَمَنْ أرادَني فَأرِدْهُ، وَفُلَّ عَنّي حَدَّ مَنْ نَصَبَ لي حَدَّهُ، وأطْفي عَنِّي نارَ مَنْ شَبَّ لي وَقُودَهُ ، وَاكْفِني مَكْرَ المَكَرَةِ وَإفْقَأ عَنّي عُيونَ الكَفَرَةِ وَاكْفِني هَمَّ مَنْ أدْخَلَ عَلَيّ هَمَّهُ وَادْفَعْ عَنّي شَرَّ الحَسَدَةِ وَاعْصِمْني مِنْ ذلك بِالسَكينَةِ وَألْبِسْني دِرْعَكَ الحَصينَةَ وَأحْيني في سِتْرِكَ الوافي وَأصْلِحْ لي حالي وَصَدِّقْ قَوْلي بِفِعالي وَبَارِكْ لي في أهْلي.\n\n'
                      'أقول : قد مرّ في الباب الثاني، عند ذكر الصلوات، مايصلّى لزيادة الرزق.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiZikrDou3a2ainLildin.screenRoute,
          pushBack:
              FiDa3awatMa2souraKablSalatWfiAdbariha.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/في ادعية مأثورة للرزق.mp3',
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
