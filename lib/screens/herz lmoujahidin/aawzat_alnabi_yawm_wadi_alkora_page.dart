import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/herz_almoujahidin_home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../widgets/list_of_nine_verses.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import 'ayat_alikhtifaa_men_alaadow_page.dart';
import 'herz_alimam_aljawad_page.dart';

class AawzatAlnabiYawmWadiAlkoraPage extends StatefulWidget {
  static String screenRoute = 'aawzatalnabiyawmwadialkora_screen';
  AawzatAlnabiYawmWadiAlkoraPage({super.key});

  @override
  State<AawzatAlnabiYawmWadiAlkoraPage> createState() =>
      _AawzatAlnabiYawmWadiAlkoraPageState();
}

class _AawzatAlnabiYawmWadiAlkoraPageState
    extends State<AawzatAlnabiYawmWadiAlkoraPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_aawzatalnabiyawmwadialkora_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_aawzatalnabiyawmwadialkora_screen', value);
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
          .pushReplacementNamed(HerzAlmoujahidinHomeScreen.screenRoute);
      return false;
    }
  }

  double _fontSize = 18;
  double _fontSizeTablet = 30;
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
                      .addFavorite('عوذة النبي (ص) يوم وادي القرى',
                          AawzatAlnabiYawmWadiAlkoraPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'عوذة النبي (ص) يوم وادي القرى',
                          AawzatAlnabiYawmWadiAlkoraPage.screenRoute,
                          AawzatAlnabiYawmWadiAlkoraPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'عوذة النبي (ص) يوم وادي القرى',
            style: TextStyle(
              fontSize: isTablet
                  ? 40
                  : size > 1.0
                      ? 16
                      : 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(
              top: 10,
              right: 30,
              left: 30,
              bottom: 10,
            ),
            alignment: Alignment.topRight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: ListOfNineVerses(
                    title: 'تعريف:',
                    subtitle: 'ذكرها السيد ابن طاوس في المهج.\n'
                        'قال السيدابن طاوس:\n'
                        'تصلح لكل شيء من كتبها وعلّقها عليه كان في أمان الله وكنفه وحجابه وعزِّه ومنعه وكانت الملائكة تحفظه.',
                    weight: FontWeight.w400,
                    size: isTablet ? _fontSizeTablet - 4 : _fontSize - 4,
                  ),
                ),
                Container(
                  child: ListOfNineVerses(
                    title: 'العوذة:',
                    subtitle:
                        'بسم الله الرحمن الرحيم الحمدالله رب العالمين الرحمن الرحيم مالك يوم الدين إيّاك نعبد وإيّاك نستعين إهدنا الصراط المستقيم صراط الذين أنعمت عليهم غير المغضوب عليهم ولا الضالِّين، الله لا إله إلا هو الحي القيّوم لا تأخذه سنة ولا نوم له ما في السماوات والأرض من ذا الذي يشفع عنده إلا بإذنه يعلم ما بين أيديهم وما خلفهم ولا يحيطون بشيءٍ من علمه إلا بما شاء ويع كرْسيُّه السماوات والأرض ولا يؤوده حفظهما وهو العلي العظيم، شهد الله أنَّهُ لا إله إلا هو والملائكة وأولوا العلم قائماً بالقسط لا إله إلّا هو العزيز الحكيم هو الله الذي لا إله إلا هو عالم الغيب والشهادة هو الرحمن الرحيم، هو الله الذي لا هو الملك القدُّوس السلام المؤمن المهيمن العزيز الجبَّار المتكبِّر سبحان الله عما يشركون، هو الله الخالق البارئ المصوّر له الأسماء الحسنى يسبِّح له ما في السماوات والأرض وهو العزيز الحكيم، قل اللَّهُمَّ مالك الملك تؤتي الملك من تشاء وتنزع الملك ممن تشاء وتذِلُّ من تشاء بيدك الخير إنك على كل شيءٍ قدير تولج الليل في النهار وتولج النهار في الليل وتخرج الحي من الميت وتخرج الميت من الحي وترزق من تشاء بغير حساب، هو الله الذي لا إله إلا هو إلهاً واحداً فرداً صمداً لم يتَّخذ صاحبةً ولا ولداً ولم يكن له شريكٌ في الملك ولم يكن له وليٌ من الذل وكبِّره تكبيراً، وهو الله الذي لا نعرف له سميّاً وهو الرجاء والمرتجى والملتجأ وإليه المشتكى ومنه الفرج والرجاء، وأسألك يا الله بحقِّ هذه الأسماء الجليلة الرفيعة عندك العالية المنيعة التي اخترتها لنفسك واختصصتها لذكرك ومنعتها جميع خلقك وأفردتها عن كلِّ شيءٍ دونك وجعلتها دليلةً عليك وسبباً إليك فهي أعظم الأسماء وأجلُّ الأقسام وأفخر الأشياء وأكبر ااعزائم وأوثق الدعائم ولا تردُّ داعيك بها ولا تخيِّب راجيك والمتوسل إليك ولا يذلُّ من اعتمد عليك ولا يضام من لجأ إليك ولا يفتقر سائلك ولا ينقطع رجاؤ مؤمِّلك ولا تُخْفَرُ ذمَّته ولا تُضَيَّعُ حُرْمته فيا من لا يُعان ولا يُضام ولا يُغالب ولا يُنازع ولا يُقاوم اغفر لي ذنوبي كلَّها وأصلِح لي شؤوني كلَّها واكفني المهمَّ في الدنيا والآخرة وعافني في الدنيا والآخرة واحفظني في الدنيا والآخرة واسترني غي الدنيا والآخرة وقرِّب جواري منك فأنت الله لا إله إلا أنت باسمك الجليل العظيم توسَّلت وبه تعلَّقت وعايه اعتمدت وهو العروة الوثقى التي لا انفصام لها فلا تُخْفِرْ ذمَّتي تردَّ مسألتي ولا تحجب دعوتي ولا حافظ إلا أنت يا الله يا الله يا الله يا الله يا الله يا الله يا الله يا الله يا الله يا الله لا إله إلا أنت وحدك لا شريك لك ولا إله غيرك أنت رب الأرباب ومالك الرقاب وصاحب العفو والعقاب أسألك بالربوبيَّة التي انفردت بها أن تُعتقني من النار بقدرتك وتُدخلني الجنة برحمتك وتجعلني من الفائزين عندك، اللهم احجبني بسترك واسترني بعزِّك واكفني بحفظك واحفظني بحرزك واحرزني في أمنك واعصمني بحياطتك وحطَّني بعزِّك وامنع منِّي بقوَّتك وقوِّني بسلطانك ولا تسلِّط عليَّ عدوّاً بجودك وكرمك إنك على كلِّ شيءٍ قدير.',
                    weight: FontWeight.w600,
                    size: isTablet ? _fontSizeTablet : _fontSize,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AyatAlikhtifaaMenAlaadowPage.screenRoute,
          pushBack: HerzAlimamAljawadPage.screenRoute,
          soud:
              'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/عوذة النبي يوم وادي القرى.mp3',
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
