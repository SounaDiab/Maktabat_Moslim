import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'dou3a2_al3afiya.dart';
import 'dou3a2_liwaja3_alra2s_walisoda3_walisomm.dart';

class AwzatWadou3a2Lilamrad extends StatefulWidget {
  static String screenRoute = 'awzat_wadou3a2_lilamrad_screen';
  const AwzatWadou3a2Lilamrad({super.key});

  @override
  State<AwzatWadou3a2Lilamrad> createState() => _AwzatWadou3a2LilamradState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AwzatWadou3a2LilamradState extends State<AwzatWadou3a2Lilamrad> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_awzat_wadou3a2_lilamrad_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_awzat_wadou3a2_lilamrad_screen', value);
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
                      .addFavorite('عوذة ودعاء للامراض',
                          AwzatWadou3a2Lilamrad.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'عوذة ودعاء للامراض',
                          AwzatWadou3a2Lilamrad.screenRoute,
                          AwzatWadou3a2Lilamrad.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'عوذة ودعاء للامراض',
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
                      'اشتر صاعا من بر ثم استلق على قفاك وانثره على صدرك وقل: اللّهُمَّ إِنِّي أَسْأَلُكَ بِإسْمِكَ الَّذي إذا سَأَلَكَ بِهِ المُضْطَرُ كَشَفْتَ مابِهِ مِنْ ضُرٍّ وَمَكَنْتَ لَهُ في الارْضِ وَجَعَلْتَهُ خَليفتك عَلى خَلْقِكَ أنْ تُصَلِّيَ عَلى مُحَمَّدٍ وَعَلى أهْلِ بَيْتِهِ وَأنْ تُعافيني مِنْ عِلَّتي، ثم استو جالسا واجمع البر من حولك، وقل مثل ذلك.\n\n'
                      'واقسمه أربعة أمداد، مدّ لكل مسكين وقل مثل ذلك تطيب إن شاء الله تعالى. وأيضاً عن أمير المؤمنين صلوات الله وسلامه عليه : ضع يدك على الوجع وقل ثلاثا: الله الله الله رَبِّي حَقّا لا أُشْرِكُ بِهِ شَيْئاً، اللّهُمَّ أنْتَ لَها وَلِكُلِّ عَظيمَةٍ فَفَرِّجْها.\n\n'
                      'وروي عن الصادق (عليه السلام) قال : ضع يدك على الوجع وقل : بسم اللّه. ثم امسح يدك عليه وقل سبعا: أعوذُ بِعِزَّةِ الله وَأعوذُ بِقُدْرَةِ الله وَأعوذُ بِجَلالِ الله وَأعوذُ بِعَظَمَةِ الله وَأعوذُ بِجَمْعِ الله وأعوذُ بِرَسولِ الله صَلّىْ الله عَلَيْهِ وَآلِهِ وَأعوذُ بِأسَّماء الله مِنْ شَرِّ ما أحْذَرُ وَمِنْ شَرِّ ما أخافُ عَلى نَفْسي. وروي في مرض الأولاد أنّ الامّ تصعد السطح وتأخذ الخمار من رأسها فتبرز شعرها تحت السماء ثم تسجد وتقول: اللّهُمَّ رَبِّ أنْتَ أعْطَيْتَنيهِ وَأنْتَ وَهَبْتَهُ لي، اللّهُمَّ فَاجْعَلْ هِبَتَكَ اليَومَ جَديدَةً إنَّكَ قادِرٌ مُقْتَدِرْ فلا ترفع رأسها حتى يطيب ابنها.\n\n'
                      'وروى الشهيد رض : أنّ من اشتدّ وجعه فليقرأ على قدح فيه ماء سورة الحمد أربعين مرة ثم يصبه على بدنه وليجعل المريض عنده مكيلاً فيه برّ ويناول السائل بيده ويأمر أن يدعو له فيعافى إن شاء الله تعالى. وروي بأسانيد معتبرة : عالجوا مرضاكم بالصدقة. وروى الشهيد أيضاً لرفع الاسقام يمسك بعضد المريض الايمن وليقرأ الحمد سبعاً ويدعو بهذا الدعاء: اللّهُمَّ أزِلْ عَنْهُ العِلَلَ وَالدّاءَ وَأعِدْهُ إِلى الصَحَّةَ وَالشِفاءِ وَأمِدَّهُ بِحُسْنِ الوقايَةِ وَرُدَّهُ إِلى حُسْنِ العافيةِ وَاجْعَلْ مانالَهُ في مَرَضِهِ هذا مادَّةً لِحياتِهِ وَكُفّارَةً لَسَيّئاتِهِ، اللّهُمَّ وَصَلِّ عَلى مُحَمَّدٍ وَآل مُحَمَّدٍ، فان لم ينجع كرّر الحمد سبعين مرّة فإنه ينجع إن شاء تعالى.\n\n'
                      'وعن الباقر (عليه السلام) قال : من لم يبرئه الحمد والاخلاص لم يبرئه شي وكل علة تبرؤها هاتان السورتان. وعن الصادق (عليه السلام) قال : ما اشتكى أحد من المؤمنين شَيْئاً قط، فقال بإخلاص : ونُنَزِّلُ مِنَ القُرْآنِ ماهوَ شِفاءٌ وَرَحْمَةٌ لِلمؤمِنينَ، ومسح على العلّة إِلاّ شفاه اللّه.\n\n'
                      'وعن الرضا (صلوات الله وسلامه عليه) : للامراض كلها قل عليها: يامُنَزِّلَ الشِّفاءِ وَمُذْهِبَ الدّاءِ صَلِّ عَلى مُحَمَّدٍ وَآلِهِ وَأنْزِلْ عَلى وَجَعي الشِّفاءَ. وروى السيد ابن طاووس رض في (المهج) عن ابن عبّاس قال: كنت جالسا عند علي (عليه السلام) فدخل عليه رجل متغيّر اللون وقال ياأمير المؤمنين إنّي رجل مسقام كثير العلل والاوجاع، فعلّمني دعاءً استعين به على أسقامي.\n\n'
                      'فقال (عليه السلام) أعلّمك دعاء علّمه جبرائيل النبي (صلّى الله عليه وآله وسلم) في مرض الحسنين (عليهم السلام) وهو : إلهي كُلَّما أنْعَمْتَ عَليّ نِعْمَةً قَلَّ لَكَ عِنْدَها شُكْري، وَكُلَّما إبْتَلَيْتَني بِبَليَّةٍ قَلَّ لَكَ عِنْدَها صَبْري، فيامَنْ قَلَّ شُكْري عِنْدَ نِعَمِهِ فَلَمْ يَحْرِمْني وَيامَنْ قَلَّ صَبْري عِنْدَ بَلائِهِ فَلَمْ يَخْذُلْني وَيامَنْ رَآني عَلى المَعاصي فَلَمْ يَفْضَحْني وَيامَنْ رَاَّني عَلى الخَطايا فَلَمْ يُعاقِبْني عَلَيْها، صَلِّ عَلى مُحَمَّدٍ وَآلِ مُحَمَّدٍ وَاغْفِرْ لي ذَنْبي وَاشْفِني مِنْ مَرَضي إنَّكَ عَلى كُلِّ شَيٍ قَديرُ.\n\n'
                      'قال ابن عبّاس : فرأيت الرجل بعد سنة حسن اللون مشربا بحمرة. قال: مادعوت به وأنا سقيم إِلاّ شفيت ولا مريض إِلاّ برئت ومادخلت على سلطان خفت جوره وقرأته إِلاّ رده الله عنّي.\n\n'
                      'ويروى أن النجاشي كان قد ورث من آبائه منذ أربعمائة عام قلنسوة توضع على الالام فتسكن فحلّت القلنسوة بحثا عما فيها فوجد فيها هذا الدعاء: بِسْمِ اللّهِ المَلِكَ الحَقِّ المُبينِ شَهِدَ الله أنَّهُ لا إلهَ إِلاّ هوَ وَالمَلائِكَةُ وَأولو العِلْمِ قائِما بِالقِسْطِ، لا إلهَ إِلاّ هوَ العَزيزُ الحَكيمُ.\n\n'
                      'إنَّ الدِّينُ عِنْدَ الله الاسلامُ، الله نُورٌ وَحِكْمَةٌ وَحَوْلٌ وَقوَةٌ وقُدْرَةٌ وَسُلْطانٌ وَبُرْهانٌ، لا إلهَ إِلاّ الله ، آدَمُ صَفي الله لا إلهَ إِلاّ الله إبْراهيمُ خَليلُ الله لا إلهَ إِلاّ الله موسى كَليمُ الله لا إلهَ إِلاّ الله مُحَمَّدٌ العَربيُّ رَسولُ الله وَحَبيبَهُ وَخيرَتُهُ مِنْ خَلْقِهِ، أُسْكُنْ ياجَميعَ الاوْجاعِ والاسْقامِ وَالامراضِ وَجَميعَ العِلَلِ وَجَميعَ الحُمّياتِ، سَكَّنْتُكِ بالَّذي سَكَنَ لَهُ مافي اللَّيْلِ وَالنّهارِ وَهوَ السَميعُ العَليمُ وَصَلى الله عَلى خَيْرِ خَلْقِهِ مُحَمَّدٍ وَآلِهِ أجْمَعينَ.\n\n'
                      'وفي (مكارم الاخلاق) أن الملك النجاشي كان مصدوعا فكتب إلى رسول الله (صلّى الله عليه وآله وسلم) يشكو ذلك فبعث إليه النبي (صلّى الله عليه وآله وسلم) بهذا الحرز فجعله النجاشي في قلنسوته، فسكن صداعه، وهذا هو الحرز: بِسْمِ الله الرَّحْمنِ الرَّحيمِ. لا إلهَ إِلاّ الله المَلِكُ الحَقُّ المُبينُ، شَهِدَ اللّهُ… إِلى آخر الآية. لله نورٌ وَحِكْمَةٌ وَعِزُّ وَقوَةٌ وَبُرْهانٌ وَقُدْرَةٌ وَسُلْطانٌ وَرَحْمَةٌ، يامَنْ لايَنامُ لا إلهَ إِلاّ الله إبْراهيمُ خَليلُ الله ، لا إلهَ إِلاّ الله موسى كَليمُ الله ، لا إلهَ إِلاّ الله عيسى روحُ الله وَكَلِمَتُهُ، لا إلهَ إِلاّ الله مُحَمَّدٌ رسولُ الله وَحَبيبَهُ وَصَفيُّهُ وَصَفْوَتُهُ صَلّى الله عَلَيْهِ وَآلِهِ وَسَلَّمْ، أُسْكُنْ سَكَّنْتُكَ بِمَنْ يَسْكُنُ لَهُ مافي السَّماواتِ والارضِ وَبِمَنْ سَكَنَ لَهُ مافي اللَّيلِ وَالنَّهارِ وَهوَ السَّميعُ العَليمُ، فَسَخَّرْنا لَهُ الرّيحَ تَجْري بِأمْرِهِ رَخاءً حَيْثُ أصابَ وَالشَّياطينَ كُلُّ بَناءٍ وَغَوّاصٍ ألا إِلى الله تَصيرُ الامورُ.\n\n'
                      'عوذة لوجع الرأس ولوجع الاذن عن باقر العلوم (عليه السلام) قال: لوجع الرأس امسح رأسك وقل سبعا: أعوذُ بالله الَّذي سَكَنَ لَهُ مافي البَرِّ وَالبَحْرِ وَمافي السَّماواتِ وَالارْضِ وَهوَ السَّميعُ العَليمُ. وقد رويت هذه العوذة أيضاً سبع مرات لوجع الاذن عن الصادق (عليه السلام).\n\n'
                      'وعنه (عليه السلام) أيضا: خذ شَيْئاً من الجبن العتيق البالغ العتاقة فاسحقه واجعل عليه شَيْئاً من اللبن واحمه على النار ثم قطر منه في الاذن التي تؤلمك عدة قطرات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Liwaja3Alra2sWalisoda3Walisomm.screenRoute,
          pushBack: Dou3a2Al3afiya.screenRoute,
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
