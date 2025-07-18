import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_2a2imat_sir.dart';
import 'ziyarat_al2imam_almahdi_al2o5ra_alsalisa.dart';
import 'ziyarat_al2imam_almahdi_al2o5ra_alsaniya.dart';

class ZiyaratAl2imamAlmahdiAlsalat3alaih extends StatefulWidget {
  static String screenRoute = 'ziyarat_al2imam_almahdi_alsalat_3alaih_screen';
  const ZiyaratAl2imamAlmahdiAlsalat3alaih({super.key});

  @override
  State<ZiyaratAl2imamAlmahdiAlsalat3alaih> createState() =>
      _ZiyaratAl2imamAlmahdiAlsalat3alaihState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratAl2imamAlmahdiAlsalat3alaihState
    extends State<ZiyaratAl2imamAlmahdiAlsalat3alaih> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs
        .getBool('isFavorite_ziyarat_al2imam_almahdi_alsalat_3alaih_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_ziyarat_al2imam_almahdi_alsalat_3alaih_screen', value);
  }

      Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ziyarat2a2imatSir.screenRoute);
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
                          'زيارة الإمام المهدي (عليه السلام) - الصلاة عليه',
                          ZiyaratAl2imamAlmahdiAlsalat3alaih.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'زيارة الإمام المهدي (عليه السلام) - الصلاة عليه',
                          ZiyaratAl2imamAlmahdiAlsalat3alaih.screenRoute,
                          ZiyaratAl2imamAlmahdiAlsalat3alaih.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'زيارة الإمام المهدي (عليه السلام) - الصلاة عليه',
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
                      'اللّهُمَّ بَلِّغْ مَولايَ صاحِبَ الزَّمانِ صَلواتُ الله عَلَيْهِ عَنْ جَمِيعِ المُؤْمِنِينَ وَالمُؤْمِناتِ فِي مَشارِقِ الاَرْضِ وَمَغارِبِها وَبَرِّها وَبَحْرِها وَسَهْلِها وَجَبَلِها، حَيِّهِمْ وَمَيِّتِهِمْ وَعَنْ وَالِدَيَّ وَوُلْدِي وَعَنِّي مِنَ الصَّلَواتِ وَالتَّحِياتِ زِنَةَ عَرْشِ الله وَمِدادَ كَلِماتِهِ وَمُنْتَهى رِضاهُ وَعَدَدَ ما أحْصاهُ كِتابُهُ وَأَحاطَ بِهِ عِلْمُهُ، اللّهُمَّ إِنِّي أُجَدِّدُ لَهُ فِي هذا اليَوْمِ وَفِي كُلِّ يَوْمٍ عَهْداً وَعَقْداً وَبَيْعَةً فِي رَقَبَتِي، اللّهُمَّ كَما شَرَّفْتَنِي بِهذا التَّشْرِيفِ وَفَضَّلْتَنِي بِهِذِهِ الفَضِيلَةِ وَخَصَصْتَنِي بِهِذِهِ النِّعْمَةِ فَصَلِّ عَلى مَوْلايَ وَسَيِّدِي صاحِبِ الزَّمانِ، وَاجْعَلْنِي مِنْ أَنْصارِهِ وَأَشْياعِهِ وَالذَّابِّينَ عَنْهُ وَاجْعَلْنِي مِنَ المُسْتَشْهَدِينَ بَيْنَ يَدَيْهِ طائِعاً غَيْرَ مُكْرَهٍ فِي الصَفِّ الَّذِي نَعَتَّ أَهْلَهُ فِي كِتابِكَ، فَقُلْتَ: صَفّا كَأَنَّهُمْ بُنْيانٌ مَرْصوصٌ عَلى طاعَتِكَ وَطاعَةِ رَسُولِكَ وَآلِهِ عَلَيْهِمُ السَّلامُ ؛ اللّهُمَّ هذِهِ بَيْعَةٌ لَهُ فِي عُنُقِي إِلى يَوْمِ القِيامَةِ.\n\n'
                      'أقول: قال العلامة المجلسي في (البحار): وجدت في بعض الكتب القديمة بعد ذلك: ويصفق بيده اليمنى على اليسرى كتصفيق البيعة. واعلم أيضاً أنّا قد ذكرنا في أعمال السرداب المقدّس زيارات أربع فهذه هي خامسة الزيارات في كتابنا هذا وقد أوردنا أيضاً زيارة له (عليه السلام) في أيام الجمع في الباب الأول عند ذكر زيارات الحجج الطاهرين (عليهم السلام) في أيام الاسبوع (ص129).الثالث: دعاء العهد روي عن الصادق (عليه السلام) أنه قال: من دعا إلى الله تعالى أربعين صباحا بهذا العهد كان من أنصار قائمنا، فإن مات قبله أخرجه الله تعالى من قبره وأعطاه بكل كلمة ألف حسنة ومحا عنه ألف سيئة، وهو هذا:\n\n'
                      '[ اللّهُمَّ رَبَّ النُّورِ العَظِيمِ وَرَبَّ الكُرْسِيِّ الرَّفِيعِ وَرَبَّ البَحْرِ المَسْجُورِ وَمُنْزِلَ التَّوْراةِ وَالانْجِيلِ وَالزَّبُورِ وَرَبَّ الظِّلِّ وَالحَرُورِ وَمُنْزِلَ القُرْآنِ العَظِيمِ وَرَبَّ المَلائِكَةِ المُقَرَّبِينَ وَالأَنْبِياءِ وَالمُرْسَلِينَ، اللّهُمَّ إِنِّي أَسْأَلُكَ بِوَجْهِكَ الكَرِيمِ وَبِنُورِ وَجْهِكَ المُنِيرِ وَمُلْكِكَ القَدِيمِ، ياحَيُّ ياقَيُّومُ أَسْأَلُكَ بِاسْمِكَ الَّذِي أَشْرَقَتْ بِهِ السَّماواتُ وَالاَرَضُونَ وَبِاسْمِكَ الَّذِي يَصْلَحُ بِهِ الأوَّلُونَ وَالآخِرُونَ، ياحَيّاً قَبْلَ كُلِّ حَيٍّ وَياحَيّاً بَعْدَ كُلِّ حَيٍّ وَياحَيّاً حِينَ لاحَيَّ يامُحْيِيَ المَوْتى وَمُمِيتَ الاَحْياءِ ياحَيُّ لا إِلهَ إِلاّ أَنْتَ، اللّهُمَّ بَلِّغْ مَوْلانا الإمام الهادِيَ المَهْدِيَّ القائِمَ بِأَمْرِكَ صَلواتُ الله عَلَيْهِ وَعَلى آبائِهِ الطَّاهِرِينَ عَنْ جَمِيعِ المُؤْمِنِينَ وَالمُؤْمِناتِ فِي مَشارِقِ الاَرْضِ وَمَغارِبِها سَهْلِها وَجَبَلِها وَبَرِّها وَبَحْرِها وَعَنِّي وَعَنْ وَالِدَيَّ مِنَ الصَّلَواتِ زِنَةَ عَرْشِ الله وَمِدادَ كَلِماتِهِ وَما أحْصاهُ عِلْمُهُ وَأَحاطَ بِهِ كِتابُهُ، اللّهُمَّ إِنِّي أُجَدِّدُ لَهُ فِي صَبيحةِ يَوْمِي هذا وَما عِشْتُ مِنْ أيّامِي عَهْداً وَعَقْداً وَبَيْعَةً لَهُ فِي عُنُقِي '
                      'لاأَحُولُ عَنْها وَلاأَزُولُ أَبَداً، اللّهُمَّ اجْعَلْنِي مِنْ أَنْصارِهِ وَأَعْوانِهِ وَالذَّابِّينَ عَنْهُ وَالمُسارِعِينَ إِلَيْهِ فِي قَضاء حَوائِجِهِ وَالمُمْتَثِلِينَ لاَوامِرِهِ وَالمُحامِينَ عَنْهُ وَالسَّابِقِينَ إِلى إِرادَتِهِ وَالمُسْتَشْهَدِينَ بَيْنَ يَدَيْهِ، اللّهُمَّ إِنْ حالَ بَيْنِي وَبَيْنَهُ المَوْتُ الَّذِي جَعَلْتَهُ عَلى عِبادِكَ حَتْما مَقْضِيّا فَأخْرِجْنِي مِنْ قَبْرِي مُؤْتَزِراً كَفَنِي شاهِراً سَيْفِي مُجَرِّداً قَناتِي مُلَبِّيا دَعْوَةَ الدَّاعِي فِي الحاضِرِ وَالبادِي، اللّهُمَّ أَرِنِي الطَّلْعَةَ الرَّشِيدَةَ وَالغُرَّةَ الحَمِيدَةَ وَاكْحُلْ ناظِرِي '
                      'بِنَظْرَةٍ مِنِّي إِلَيْهِ وَعَجِّلْ فَرَجَهُ وَسَهِّلْ مَخْرَجَهُ وَأَوْسِعْ مَنْهَجَهُ وَاسْلُكْ بِي مَحَجَّتَهُ وَأَنْفِذْ أَمْرَهُ وَاشْدُدْ أَزْرَهُ، وَاعْمُرِ اللّهُمَّ بِهِ بِلادَكَ وَأَحْيِ بِه عِبادَكَ فَإِنَّكَ قُلْتَ وَقَوْلُكَ الحَقُّ: ظَهَرَ الفَسادُ فِي البَرِّ وَالبَحْرِ بِما كَسَبَتْ أَيْدِي النَّاسِ فَأَظْهِرِ اللّهُمَّ لَنا وَلِيَّكَ وَابْنَ بِنْتِ نَبِيِّكَ المُسَمّى بِاسْمِ رَسُولِكَ حَتّى لايَظْفَرَ بِشَيٍْ مِنَ الباطِلِ إِلاّ مَزَّقَهُ وَيَحِقَّ الحَقَّ وَيُحَقِّقَهُ، وَاجْعَلْهُ اللّهُمَّ مَفْزَعاً لِمَظْلُومِ عِبادِكَ وَناصِراً لِمْن لايَجِدُ لَهُ ناصِراً غَيْرَكَ وَمُجَدِّداً لِما عُطِّلَ مِنْ أَحْكامِ كِتابِكَ وَمُشَيِّداً لِما وَرَدَ مِنْ أَعْلامِ '
                      'دِينِكَ وَسُنَنِ نَبِيِّكَ صَلّى الله عَلَيْهِ وَآلِهِ، وَاجْعَلْهُ، اللّهُمَّ مِمَّنْ حَصَّنْتَهُ مِنْ بَأْسِ المُعْتَدِينَ اللّهُمَّ وَسُرَّ نَبِيِّكَ مُحَمَّداً صَلّى الله عَلَيْهِ وَآلِهِ بِرُؤْيَتِهِ وَمَنْ تَبِعَهُ عَلى دَعْوَتِهِ وَارْحَم اسْتِكانَتَنا بَعْدَهُ اللّهُمَّ اكْشِفْ هذِهِ الغُمَّةَ عَنْ هذِهِ الاُمَّةِ بِحُضُورِهِ وَعَجِّلْ لَنا ظُهُورَهُ إِنَّهُمْ يَرَوْنَهُ بَعِيداً وَنَراهُ قَرِيباً بِرَحْمَتِكَ ياأَرْحَمَ الرَّاحِمِينَ ].ثم تضرب على فخذك الايمن بيدك “ثلاث مرّات” وتقول كل ” مرّة “: [ العَجَلَ العَجَلَ يامَوْلايَ ياصاحِبَ الزَّمانِ ].',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: ZiyaratAl2imamAlmahdiAl2o5raAlsalisa.screenRoute,
        pushBack: ZiyaratAl2imamAlmahdiAl2o5raAlsaniya.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/زيارة الامام المهدي - الصلاة عليها.mp3',
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
