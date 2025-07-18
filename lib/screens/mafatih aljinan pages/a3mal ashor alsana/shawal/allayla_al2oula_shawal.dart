import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../shawal.dart';
import 'a3mal_yawm_3id_alfitr.dart';

class AllaylaAl2oulaShawal extends StatefulWidget {
  static String screenRoute = 'allayla_al2oula_shawal_screen';
  const AllaylaAl2oulaShawal({super.key});

  @override
  State<AllaylaAl2oulaShawal> createState() => _AllaylaAl2oulaShawalState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AllaylaAl2oulaShawalState extends State<AllaylaAl2oulaShawal> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_allayla_al2oula_shawal_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_allayla_al2oula_shawal_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Shawal.screenRoute);
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
                          'الليلة الأولى', AllaylaAl2oulaShawal.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الليلة الأولى',
                          AllaylaAl2oulaShawal.screenRoute,
                          AllaylaAl2oulaShawal.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الليلة الأولى',
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
                      'هي من اللّيالي الشّريفة وقد وردت في فضل العبادة فيها واحيائها احاديث كثيرة ، وروي انّها لا تقل عن ليلة القدر ولها عدّة أعمال :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle: 'الغُسل اذا غربت الشّمس.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'احياؤها بالصّلاة والدّعاء والاستغفار والبيتوتة في المسجد.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'أن يقول في أعقاب صلوات المغرب والعشاء وعقيب صلاة العيد اللهُ اَكْبَرُ اللهُ اَكْبَرُ لا اِلـهَ إلاّ اللهُ وَاللهُ اَكْبَرُ، اللهُ اَكْبَرُ وَللهِ الْحَمْدُ، الْحَمْدُ للهِ عَلى ما هَدانا وَلَهُ الشُّكْرُ على ما اَوْلانا.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع :',
                  subtitle:
                      'أن يرفع يديه الى السّماء اذا فرغ من فريضة المغرب ونافلته ويقول : يا ذَا الْمَنِّ وَالطَّوْلِ ا يا ذَا الْجُودِ، يا مُصْطَفِيَ مُحَمَّد وَناصِرَهُ، صَلِّ عَلى مُحَمَّد وَآل مُحَمَّد، وَاغْفِرْ لي كُلَّ ذَنْب اَحْصَيْتَهُ ا وَهُوَ عِنْدَكَ في كِتاب مُبين ثمّ يسجد ويقول في سجوده مائة مرّة اَتُوبُ اِلَى اللهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'زيارة الحسين (عليه السلام) فانّ لها فضلاً عظيماً وسيأتي في باب الزّيارات ما يخصّ هذه اللّيلة من الزّيارة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'أن يدعو عشر مرّات بالدّعاء يا دائِمَ الْفَضْلِ الذي مضى في أعمال ليلة الجمعة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'أن يصلّي عشر ركعات التي مضت في أعمال اللّيلة الاخيرة من شهر رمضان (ص232).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثامن :',
                  subtitle:
                      'يصلّي ركعتين يقرأ في الاُولى بعد الحمد التّوحيد ألف مرّة ويقرأها في الثّانية مرّة واحدة ويسجد بعد السّلام فيقول : اَتُوبُ اِلَى اللهِ (ثمّ يقول) يا ذَا الْمَنِّ وَالطَّوْلِ، يا مُصْطَفِيَ مُحَمَّد صَلّى اللهُ عَلَيْهِ وَآلِهِ، صَلِّ عَلى مُحَمَّد وَآلِهِ وَافْعَلْ بي كَذا وَكَذا ويسأل حاجته.\n\n'
                      'وروي انّ امير المؤمنين (عليه السلام) كان يصلّيها كما ذكر فاذا رفع رأسه يقول: والذي نفسي بيده لا يفعلها احد يسأل الله تعالى شيئاً الّا أعطاه ولو أتاه من الذّنوب عدد رمل الصّحراء غفر الله له ، ووردت التّوحيد في رواية اخرى مائة مرّة عوض الالف مرّة ولكن على هذه الرّواية يصلّي هذه الصّلاة بعد فريضة المغرب ونافلته.\n\n'
                      'وقد روى الشّيخ والسّيد بعد هذه الصّلاة هذا الدّعاء :\n\n'
                      'يا اَللهُ يا اَللهُ يا اَللهُ، يا رَحْمنُ يا اَللهُ، يا رَحيمُ يا اَللهُ، يا مَلِكُ يا اَللهُ، يا قُدُّوسُ يا اَللهُ، يا سَلامُ يا اَللهُ، يا مؤْمِنُ يا اَللهُ يا مُهَيْمِنُ يا اَللهُ، يا عَزيزُ يا اَللهُ، يا جَبّارُ يا اَللهُ، يا مُتَكَبِّرُ يا اَللهُ، يا خالِقُ يا اَللهُ، يا بارِئُ يا اَللهُ، يا مُصَوِّرُ يا اَللهُ، يا عالِمُ يا اَللهُ، يا عَظيمُ يا اَللهُ، يا عَليمُ يا اَللهُ، يا كَريمُ يا اَللهُ، يا حَليمُ يا اَللهُ، يا حَكيمُ يا اَللهُ، يا سَميعُ يا اَللهُ، يا بَصيرُ يا اَللهُ، يا قَريبُ يا اَللهُ، يا مُجيبُ يا اَللهُ، يا جَوادُ يا اَللهُ، يا ماجِدُ يا اَللهُ، يا مِليُّ يا اَللهُ، يا وَفِيُّ يا اَللهُ، يا مَوْلى يا اَللهُ، يا قاضي يا اَللهُ، يا سَريعُ يا اَللهُ، يا شَديدُ يا اَللهُ، يا رَؤوفُ يا اَللهُ، يا رَقيبُ يا اَللهُ، يا مَجيدُ يا اَللهُ، يا حَفيظُ يا اَللهُ، يا مُحيطُ يا اَللهُ، يا سَيِّدَ السّاداتِ يا اَللهُ، يا اَوَّلُ يا اَللهُ، يا اخِرُ يا اَللهُ يا ظاهِرُ يا اَللهُ، يا باطِنُ يا اَللهُ، يا فاخِرُ يا اَللهُ، يا قاهِرُ يا اَللهُ، يا رَبّاهُ يا اَللهُ يا رَبّاهُ يا اَللهُ يا رَبّاهُ يا اَللهُ،  يا وَدُودُ يا اَللهُ، يا نُورُ يا اَللهُ، يا رافِعُ يا اَللهُ، يا مانِعُ يا اَللهُ، يا دافِعُ يا اَللهُ، يا فاتِحُ يا اَللهُ، يا نَفّاحُ يا اَللهُ، يا جَليلُ يا اَللهُ، يا جَميلُ يا اَللهُ، يا شَهيدُ يا اَللهُ، يا شاهِدُ يا اَللهُ، يا مُغيثُ يا اَللهُ، يا حَبيبُ يا اَللهُ، يا فاطِرُ يا اَللهُ، يا مُطَهِّرُ يا اَللهُ، يا مَلِكُ يا اَللهُ، يا مُقْتَدِرُ يا اَللهُ، يا قابِضُ يا اَللهُ، يا باسِطُ يا اَللهُ، يا مِحيي يا اَللهُ، يا مُميتُ يا اَللهُ يا باعِثُ يا اَللهُ، يا وارِثُ يا اَللهُ، يا مُعطي يا اَللهُ، يا مُفْضِلُ يا اَللهُ، يا مُنْعِمُ يا اَللهُ، يا حَقُّ يا اَللهُ، يا مُبينُ يا اَللهُ، يا طَيِّبُ يا اَللهُ، يا مُحْسِنُ يا اَللهُ، يا مُجْمِلُ يا اَللهُ، يا مُبْدِئُ يا اَللهُ، يا مُعيدُ يا اَللهُ، يا بارِئُ يا اَللهُ، يا بَديعُ يا اَللهُ، يا هادي يا اَللهُ، يا كافي يا اَللهُ، يا شافي يا اَللهُ، يا عَلِىُّ يا اَللهُ، يا عَظيمُ يا اَللهُ، يا حَنّانُ يا اَللهُ، يا مَنّانُ يا اَللهُ، يا ذَا الْطَّوْلِ يا اَللهُ، يا مُتَعالي يا اَللهُ، يا عَدْلُ يا اَللهُ، يا ذَا الْمَعارِجِ يا اَللهُ، يا صادِقُ يا اَللهُ، يا صَدُوقُ يا اَللهُ، يا دَيّانُ يا اَللهُ، يا باقي يا اَللهُ، يا واقي يا اَللهُ، يا ذَا الْجَلالِ يا اَللهُ، يا ذَا الاِكْرامِ يا اَللهُ، يا مَحْمُودُ يا اَللهُ، يا مَعْبُودُ يا اَللهُ، يا صانِعُ يا اَللهُ، يا مُعينُ يا اَللهُ، يا مُكَوِّنُ يا اَللهُ، '
                      'يا فَعّالُ يا اَللهُ، يا لَطيفُ يا اَللهُ، يا غَفُورُ يا اَللهُ، يا شَكُورُ يا اَللهُ، يا نُورُ يا اَللهُ، يا قَديرُ يا اَللهُ، يا رَبّاهُ يا اَللهُ يا رَبّاهُ يا اَللهُ يا رَبّاهُ يا اَللهُ يا رَبّاهُ يا اَللهُ يا رَبّاهُ يا اَللهُ يا رَبّاهُ يا اَللهُ يا رَبّاهُ يا اَللهُ يا رَبّاهُ يا اَللهُ يا رَبّاهُ يا اَللهُ يا رَبّاهُ اَسْاَلُكَ اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَتَمُنَّ عَلَيَّ بِرِضاكَ، وَتَعْفُوَ عَنّي بِحِلْمِكَ، وَتُوَسِّعَ عَلَيَّ مِنْ رِزْقِكَ الْحَلالِ الطَّيِّبِ، وَمِنْ حَيْثُ اَحْتَسِبُ وَمِنْ حَيْثُ لا اَحْتَسِبُ، فَاِنّي عَبْدُكَ لَيْسَ لي اَحَدٌ سِواكَ، وَلا اَحَدٌ اَسْأَلُهُ غَيْرُكَ يا اَرْحَمَ الرّاحِمينَ، ما شاءَ اللهُ لا قُوَّةَ إلاّ بِاللهِ الْعَلِيِّ الْعَظيمِ (ثم تسجد وتقول)يا اَللهُ يا اَللهُ يا اَللهُ، يا رَبُّ رَبُّ رَبُّ يا مُنْزِلَ الْبَرَكاتِ بِكَ تُنْزَلُ كُلُّ حاجَة، اَسْاَلُكَ بِكُلِّ اسْم في مَخْزُونِ الْغَيْبِ عِنْدَكَ، وَالاَْسْماءِ الْمَشْهُورةِ عِنْدَكَ، الْمَكْتُوبَةِ عَلى سُرادِقِ عَرْشِكَ، اَنْ تُصَلِّيَ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْ تَقْبَلَ مِنّي شَهْرَ رَمَضانَ، وَتَكْتُبَني مِنَ الْوافِدينَ اِلى بَيْتِكَ الْحَرامِ، وَتَصْفَحَ لي عَنِ الذُّنُوبِ الْعِظامِ، وَتَسْتَخْرِجَ لي يا رَبِّ كُنُوزَكَ يا رَحْمـنُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التاسع :',
                  subtitle:
                      'يصلّي أربع عشرة ركعة يقرأ في كلّ ركعة الحمد وآية الكرسي وثلاث مرّات سورة قُل هو اللهُ احدٌ ليكون له بكلّ ركعة عبادة أربعين سنة وعبادة كلّ من صام وصلّى في هذا الشّهر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العاشر :',
                  subtitle:
                      'قال الشّيخ في المصباح: اغتسل في آخر اللّيل واجلس في مصلاّك الى طلوع الفجر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: A3malYawm3idAlfitr.screenRoute,
        pushBack: A3malYawm3idAlfitr.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الليلة الاولى من شوال.mp3',
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
