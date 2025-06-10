import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'al5amisa_almo5asasa.dart';
import 'alsalisa_almo5asasa.dart';

class Alrbi3aAlmo5asasa extends StatefulWidget {
  static String screenRoute = 'alrbi3a_almo5asasa_screen';
  const Alrbi3aAlmo5asasa({super.key});

  @override
  State<Alrbi3aAlmo5asasa> createState() => _Alrbi3aAlmo5asasaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Alrbi3aAlmo5asasaState extends State<Alrbi3aAlmo5asasa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_alrbi3a_almo5asasa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alrbi3a_almo5asasa_screen', value);
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
                      .addFavorite('الرابعة المخصوصة: زيارة ليالي القدر',
                          Alrbi3aAlmo5asasa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الرابعة المخصوصة: زيارة ليالي القدر',
                          Alrbi3aAlmo5asasa.screenRoute,
                          Alrbi3aAlmo5asasa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الرابعة المخصوصة: زيارة ليالي القدر',
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
                      'اعلم انّ الاحاديث كثيرة في فضل زيارة الحسين (عليه السلام) في شهر رمضان ولا سيّما في أوّل ليلة منه وليلة النّصف منه وآخر ليلة منه وفي خُصوص ليلة القدر . وروي عن الامام محمّد التّقي (عليه السلام) قال : من زار الحسين (عليه السلام) ليلة ثلاث وعشرين من شهر رمضان وهي اللّيلة الّتي يرجى أن تكون ليلة القدر وفيها يُفرَقُ كُلُّ اَمْر حَكيم، صافحه رُوح أربعة وعشرين ألف نبيّ كلّهم يستأذن الله في زيارة الحسين (عليه السلام) في تلك اللّيلة، وفي حديث معتبر آخر عن الصّادق (عليه السلام) : اذا كان ليلة القدر ونادى مناد من السّماء السّابعة من بطنان العرش انّ الله عزّوجل قد غفر لمن أتى قبر الحسين (عليه السلام) . وفي رواية انّ من كان عند قبر الحسين (عليه السلام) ليلة القدر يصلّي عنده ركعتين أو ما تيسّر له وسأل الله الجنّة واستعاذ به من النّار أعطاه الله ما سأل واعاذه الله ممّا استعاذ منه.\n\n'
                      'وروى ابن قولويه عن الصّادق (عليه السلام) انّ من زار قبر الحسين بن علي (عليهما السلام) في شهر رمضان ومات في الطّريق لم يعرض ولم يحاسب وقيل له ادخل الجنّة آمناً، وامّا الالفاظ الّتي يُزار بها الحسين (عليه السلام) في ليلة القدر فهي زيارة أوردها الشّيخ والمفيد ومحمّد بن المشهدي وابن طاوُس والشّهيد (رحمهم الله) في كتب الزّيارة وخصّوها بهذه اللّيلة وبالعيدين أي عيد الفطر وعيد الاضحى.\n\n'
                      'وروى الشّيخ محمّد ابن المشهدي باسناده المعتبرة عن الصّادق (عليه السلام) قال : اذا أردت زيارته (عليه السلام) فأت مشهده المقدّس بعد أن تغتسل وتلبس أطهر ثيابك فاذا وقفت على قبره فاستقبله بوجهك واجعل القبلة بين كتفيك وقُل :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يَا بْنَ رَسُولِ اللهِ، اَلسَّلامُ عَلَيْكَ يَا بْنَ اَميرِ الْمُؤْمِنينَ، اَلسَّلامُ عَلَيْكَ يَا بْنَ الصِّديقَةِ الطّاهِرَةِ فاطِمَةَ سَيِّدَةِ نِساءِ الْعالَمينَ، اَلسَّلامُ عَلَيْكَ يا مَوْلايَ اَبا عَبْدِاللهِ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، اَشْهَدُ اَنَّكَ قَدْ اَقَمْتَ الصَّلاةَ وَآتَيْتَ الزَّكاةَ وَاَمَرْتَ بِالْمَعْرُوفِ وَنَهَيْتَ عَنِ الْمُنْكَرِ، وَتَلَوْتَ الْكِتابَ حَقَّ تِلاوَتِهِ وَجاهَدْتَ فِي اللهِ حَقَّ جِهادِهِ وَصَبَرْتَ عَلَى الاَْذى فِي جَنْبِهِ مُحْتَسِباً حَتّى اَتاكَ الْيَقينُ، اَشْهَدُ اَنَّ الَّذينَ خالَفُوكَ وَحارَبُوكَ وَالَّذينَ خَذَلُوكَ وَالَّذينَ قَتَلُوكَ مَلْعُونُونَ عَلى لِسانِ النَّبِيِّ الاُْمّي وَقَدْ خابَ مَنِ افْتَرى، لَعَنَ اللهُ الظّالِمينَ لَكُمْ مِنَ الاَْوَّلينَ وَالاْخِرينَ وَضاعَفَ عَلَيْهِمُ الْعَذابَ الاَْليمَ، اَتَيْتُكَ يا مَوْلايَ يَا بْنَ رَسُولِ اللهِ زائِراً عارِفاً بِحَقِّكَ مُوالِياً لاَِوْلِيائِكَ مُعادِياً لاَِعْدائِكَ، مُسْتَبْصِراً بِالْهُدَى الّذي أَنْتَ عَلَيْهِ، عارِفاً بِضَلالَةِ مَنْ خالَفَكَ، فَاشْفَعْ لي عِنْدَ رَبِّكَ.\n\n'
                      'ثمّ انكبّ على القبر وقبّله وضع خدّك عليه ثمّ انحرف الى عند الرّأس وقل :\n\n'
                      'اَلسَّلامُ عَلَيْكَ يا حُجَّةَ اللهِ فِي اَرْضِهِ وَسَمائِهِ، صَلَّى اللهُ عَلى رُوحِكَ الطَّيِّبِ وَجَسَدِكَ الطّاهِرِ، وَعَلَيْكَ السَّلامُ يا مَوْلايَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.\n\n'
                      'ثمّ انكبّ على القبر وقبّله وضع خدّك عليه ثمّ انحرف الى عند الرّأس فصلّ ركعتين للزّيارة وصلّ بعدهما ما تيسّر ثمّ تحول الى عند الرّجلين وزُر عليّ بن الحسين (عليهما السلام) وقُل :اَلسَّلامُ عَلَيْكَ يا مَوْلايَ وَابْنَ مَوْلايَ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ، لَعَنَ اللهُ مَنْ ظَلَمَكَ، وَلَعَنَ اللهُ مَنْ قَتَلَكَ، وَضاعَفَ عَلَيْهِمُ الْعَذابَ الاَْليمَ، وادعُ بما تريد ثمّ زُر الشّهداء منحرفاً من عند الرّجلين الى القبلة فقُل : اَلسَّلامُ عَلَيْكُمْ اَيُّهَا الصِّدّيقُونَ، اَلسَّلامُ عَلَيْكُمْ اَيُّهَا الشُّهَداءُ الصّابِرُونَ، اَشْهَدُ اَنَّكُمْ جاهَدْتُمْ فِي سَبيلِ اللهِ وَصَبَرْتُمْ عَلَى الاَْذى فِي جَنْبِ اللهِ، وَنَصَحْتُمْ للهِ وَلِرَسُولِهِ حَتّى اَتاكُمُ الْيَقينُ، اَشْهَدُ اَنَّكُمْ اَحْياءٌ عِنْدَ رَبِّكُمْ تُرْزَقُونَ، فَجَزاكُمُ اللهُ عَنِ الاِْسْلامِ وَاَهْلِهِ اَفْضَلَ جَزاءِ الُْمحْسِنينَ، وَجَمَعَ بَيْنَنا وَبَيْنَكُمْ فِي مَحَلِّ النَّعيمِ ثمّ امض الى مشهد العبّاس بن امير المؤمنين 8 فاذا وقفت عليه فقُل : اَلسَّلامُ عَلَيْكَ يا بْنَ اَميرِ الْمُؤْمِنينَ، اَلسَّلامُ عَلَيْكَ اَيُّهَا الْعَبْدُ الصّالِحُ الْمُطيعُ للهِ وَلِرَسُولِهِ، اَشْهَدُ اَنَّكَ قَدْ جاهَدْتَ وَنَصَحْتَ وَصَبَرْتَ حَتّى اَتاكَ الْيَقينُ، لَعَنَ اللهُ الظّالِمينَ لَكُمْ مِنَ الاَْوَّلينَ وَالاْخِرينَ وَاَلْحَقَهُمْ بِدَرْكِ الْجَحيمِ، ثمّ صلّ تطوّعاً في مسجده ما تشاء وانصرف.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Al5amisaAlmo5asasa.screenRoute,
          pushBack: AlsalisaAlmo5asasa.screenRoute,
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
