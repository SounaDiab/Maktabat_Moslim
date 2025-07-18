import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'dou3a2_li7al_almarbout.dart';
import 'dou3a2_lilza7ir.dart';

class AwzatAl7oma extends StatefulWidget {
  static String screenRoute = 'awzat_al7oma_screen';
  const AwzatAl7oma({super.key});

  @override
  State<AwzatAl7oma> createState() =>
      _AwzatAl7omaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AwzatAl7omaState
    extends State<AwzatAl7oma> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_awzat_al7oma_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_awzat_al7oma_screen', value);
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
          Al2ad3iyaWal3awzatLil2alamWal2askam.screenRoute);
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
                      .addFavorite('عوذة الحمّى',
                          AwzatAl7oma.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'عوذة الحمّى',
                          AwzatAl7oma.screenRoute,
                          AwzatAl7oma.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'عوذة الحمّى',
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
                      '1- تعوذ بهذا التعويذ الذي علمه النبي (صلّى الله عليه وآله وسلم) عليّاً (عليه السلام) للحمّي : اللّهُمَّ ارْحَمْ جِلْدي الرَّقيقَ وَعَظْميَ الدَّقيقَ، وَأعوذُ بِكَ مِنْ فَوْرَةِ الحَريقَ. ياأُمَّ مُلْدَمٍ إنْ كُنْتِ آمَنْتِ بِالله فَلا تأكُلي اللَّحْمَ وَلا تَشْرَبي الدَّمَ وَلا تَفوري مِنَ الَفمِّ، وَانْتَقِلي إِلى مَنْ يَزْعَمُ أنَّ مَعَ الله إلها آخَرَ فَإنّي أشْهَدُ أنْ لا إلهَ إِلاّ الله وَحْدَهُ لا شريكَ لَهُ، وَأشْهَدُ أنْ مُحَمَّداً عَبْدُهُ وَرَسولُهُ.\n\n'
                      '2- وليواظب على قراءة دعاء النور صباحا ومساءا، وهو دعاء علّمه فاطمة صلوات الله عليها سلمان، وقد أثبتناه في المفاتيح.\n\n'
                      '3- وروي أنّهم (عليهم السلام) كانوا يتداوون من الحمّى بالماء البارد وهو أن يتناوبوا ببلّ الثياب فواحد في الماء وآخر على الجسد فإذا نشف الذي على الجسد لبس الاخر رطباً.\n\n'
                      '4- ووجد بخطّ الرضا (عليه السلام) أنه تؤخذ للحمّى ثلاث قطع من الورق يكتب على الأولى: بِسْمِ الله الرَّحْمنِ الرَّحيمِ لاتَخَفْ إنَّكَ أنْتَ الاعْلى، وعلى الثانية: بِسْمِ الله الرَّحْمنِ الرَّحيمِ لاتَخَفْ نَجَوتَ مِنَ القَوْمِ الظّالِمينَ، وعلى الثالثة: بِسْمِ الله الرَّحْمنِ الرَّحيمِ ألا لَهُ الخَلْقُ وَألامْرُ تَبارَكَ الله ربِّ العالَمينَ. ثم يقرأ على كل قطعة التوحيد ثلاثا ويبلعها المحموم ثلاثة أيام، كل يوم واحدة منها، يبرأ إن شاء الله تعالى.\n\n'
                      '5- حلّ أزرار قميصك وأدخل رأسك في جيبك وأذّن وأقم، واقرأ سورة الحمد سبع مرّات تعاف إن شاء اللّه.\n\n'
                      '6- وروي عن الأئمة (عليهم السلام) أنّه يكتب في رق، ويعلق على المحموم: اللّهُمَّ إِنِّي أَسْأَلُكَ بِعِزَّتِكَ وَقُدْرَتِكَ وَسُلْطانِكَ وَما أحاطَ بِهِ عِلْمُكَ أنْ تُصَلِّيَ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَأنْ لاتُسَلِّطَ عَلى فُلانٍ بِنْ فُلانٍ شَيْئاً مِمّا خَلَقْتَ بِسوءٍ، وَارْحَمْ جِلْدَهُ الرَّقيقَ وَعَظْمَهُ الدَّقيقَ مِنْ فَوْرَةِ الحَريقِ أخْرُجي ياأمَّ مُلْدَمْ ياآكِلَةَ اللَّحْمِ وَشارِبَةَ الدَّمِ حَرِّها وَبَرْدِها مِنْ جَهَنَّمْ إنْ كُنْتِ آمَنْتِ بَالله الاعْظَمِ أنْ لاتأكُلي لِفُلانٍ بِنْ فُلانَهَ لَحْما وَلا تَمُصّي لَهُ دَما وَلا تَنْهَكي لَهُ عَظْما وَلا تَثوري عَلَيهِ غَمّا وَلا تُهيّجي عَلَيْهِ صُداعا، وَانْتَقِلي عِنْ شَعْرِهِ وَبَشْرِهِ وَلَحْمِهِ وَدَمِهِ إِلى مَنْ زَعَمَ مَعَ الله إلها آخَرَ، لا إلهَ إِلاّ هوَ سُبْحانَهُ وَتَعالى عَمّا يُشْرِكونَ ويكتب بعد كلمة يشركون اسم ذمّي أو عدوّ من أعداء اللّه.\n\n'
                      '7- يكتب للحمى ويعلق على عضد المحموم اليمنى: بِسْمِ الله الرَّحْمنِ الرَّحيمِ الحَمْدُ لله ربِّ العالَمينَ … إلى آخر السورة: بِسْمِ الله وَبِالله أعوذُ بِكَلِماتِ الله التّاماتِ كُلِّها الَّتي لايُجاوِزُهُنَّ بَرُّ وَلا فاجِرٌ مِنْ شَرِّ ماخَلَقَ وَذَرَأَ وَبَرَأَ وَمِنْ شَرِّ الهامَّةِ وَالسّامَّةِ وَالعامَّةِ وَاللامَّةَ، وَمِنْ شَرِّ طَوارِقِ اللَّيلِ وَالنَّهارِ، وَمِنْ شَرِّ فُسّاقِ العَرَبِ وَالعَجَمِ، وَمِنْ شَرِّ فَسَقَةِ الجِنِّ وَالانْسِ، وَمِنْ شَرِّ الشَّيْطانِ وَشِرْكِهِ، وَمِنْ شَرِّ كُلِّ ذي شَرٍّ وَمِنْ شَرِّ كُلِّ دابَةٍ هوَ آخِذٌ بِناصِيَتِها، إنَّ رَبّي عَلى صِراطٍ مُسْتَقيمٍ. رَبَّنا عَلَيْكَ تَوَكَلْنا وَإلَيْكَ أنَبْنا وَإلَيْكَ المَصيرُ، يانارُ كوني بَرْداً وَسَلاما عَلى إبْراهيمَ وَأرادوا بِهِ كَيْداً فَجَعَلْناهُمُ الاخْسَرينَ. بَرْداً وَسَلاما عَلى فُلانٍ بِنْ فُلانَةَ. رَبَّنا لاتؤاخِذْنا إنْ نَسينا أوْ أخْطَأْنا… إِلى آخر السورة: حَسْبي الله لا إلهَ إِلاّ هوَ فَاتَّخِذْهُ وَكيلاً وَتَوَكَّلْ عَلى الحَيِّ الَّذي لايَمُوتُ وَسَبِّحْ بِحَمْدِهِ. وَكَفى بِهِ بِذَنوبِ عِبادِهِ خَبيراً بَصيراً، لا إلهَ إِلاّ الله وَحْدَهُ لاشَريكَ لَهُ صَدَقَ وَعْدَهُ وَنَصَرَ عَبْدَهُ وَهَزَمَ الاحْزابَ وَحْدَهُ، ماشاءَ الله لاقوَةَ إِلاّ بِالله كَتَبَ الله لاغْلِبَنَّ أنا وَرُسُلي. إنَّ الله قَويٌ عَزيزٌ، إنَّ حِزْبَ الله هُمُ الغالِبونَ، وَمَنْ يَعْتَصِمُ بِالله فَقَدْ هُدي إِلى صِراطٍ مُسْتَقيمٍ، وَصَلّى الله عَلى مُحَمَّدٍ وَآلِهِ الطَيّبينَ الطاهرينَ.\n\n'
                      '8- يكتب على ثلاث سُكرات ويأكلها المحموم بثلاث غدوات ؛ كل يوم قطعة فيها الريق: الأولى: عَقَدْتُ بِإذْنِ اللّهِ. الثانية: نَدَدْتُ بِإذْنِ اللّهِ. الثالثة: سَكَنْتُ بِإذْنِ اللّهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Lilza7ir.screenRoute,
          pushBack: Dou3a2Li7alAlmarbout.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/عوذة الحمى.mp3',
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
