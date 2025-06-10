import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../a3mal_w2ad3iyat_layali_ramadan.dart';
import 'allayla_2al7adiya_wal3ishrin.dart';
import 'allayla_2alsabi3a_3ashar.dart';

class Allayla2altasi3a3ashar extends StatefulWidget {
  static String screenRoute = 'allayla_2altasi3a_3ashar_screen';
  const Allayla2altasi3a3ashar({super.key});

  @override
  State<Allayla2altasi3a3ashar> createState() => _Allayla2altasi3a3asharState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Allayla2altasi3a3asharState extends State<Allayla2altasi3a3ashar> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_allayla_2altasi3a_3ashar_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_allayla_2altasi3a_3ashar_screen', value);
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
          .pushReplacementNamed(A3malW2ad3iyatLayaliRamadan.screenRoute);
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
                      .addFavorite('الليلة التاسعة عشر',
                          Allayla2altasi3a3ashar.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الليلة التاسعة عشر',
                          Allayla2altasi3a3ashar.screenRoute,
                          Allayla2altasi3a3ashar.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الليلة التاسعة عشر',
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
                      'وهي اوّل ليلة من ليالي القدر، وليلة القدر هي ليلة لا يضاهيها في الفضل سواها من اللّيالي والعمل فيها خير من عمل ألف شهر، وفيها يقدّر شؤون السّنة وفيها تنزّل الملائكة والرّوح الاعظم باذن الله، فتمضي الى امام العصر (عليه السلام) وتتشرّف بالحضور لديه، فتعرض عليه ما قدر لكلّ احد من المقدّرات، وأعمال ليالي القدر نوعان : فقسم منها عام يؤدّى في كلّ ليلة من اللّيالي الثلاثة، وقسم خاص يؤتى فيما خصّ به من هذه اللّيالي.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'القسم الاوّل :',
                  subtitle: '',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle:
                      'الغُسل ، قال العلامة المجلسي (رحمه الله) : الافضل أن يغتسل عند غروب الشّمس ليكون على غسل لصلاة العشاء.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'الصّلاة ركعتان يقرأ في كلّ ركعة بعد الحمد التّوحيد سبع مرّات ويقول بعد الفراغ سبعين مرّة اَسْتَغْفِرُ اللهَ واَتُوبُ اِلَيْهِ وفي النّبوي : من فعل ذلك لا يقوم من مقامه حتّى يغفر الله له ولابويه الخبر.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث : تأخذ المصحف فتنشره وتضعه بين يديك وتقول :',
                  subtitle:
                      'اَللّـهُمَّ اِنّي اَسْاَلُكَ بِكِتابِكَ وَما فيهِ وَفيهِ اسْمُكَ الاَكْبَرُ وَاَسْماؤُكَ الْحُسْنى، وَما يُخافُ وَيُرْجى اَنْ تَجْعَلَني مِنْ عُتَقائِكَ مِنَ النّارِ وتدعو بما بدالك من حاجة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرابع : خذ المُصحف فدعه على رأسك وقُل :',
                  subtitle:
                      'اَللّـهُمَّ بِحَقِّ هذَا الْقُرْآنِ، وَبِحَقِّ مَنْ اَرْسَلْتَهُ بِهِ، وَبِحَقِّ كُلِّ مُؤْمِن مَدَحْتَهُ فيهِ، وَبِحَقِّكَ عَلَيْهِمْ، فَلا اَحَدَ اَعْرَفُ بِحَقِّكَ مِنْكَ ثمَّ قُل عَشر مرّات بِكَ يااَللهُ وعَشر مرّات بِمُحَمَّد وعَشر مرّات بِعَليٍّ وعَشر مرّات بِفاطِمَةَ وعَشر مرّات بِالْحَسَنِ وعَشر مرّات بِالْحُسَيْنِ وعَشر مرّات بِعَلِي بْنِ الْحُسَيْنِ وعَشر مرّات بُمَحَمَّدِ بْنِ عَلِيٍّ وعَشر مرّات بِجَعْفَرِ بْنِ مُحَمَّد وعَشر مرّات بِمُوسَى بْنِ جَعْفَر وعَشر مرّات بِعَلِيِّ بْنِ مُوسى وعَشر مرّات بِمُحَمَّدِ بْنِ عَلِيٍّ وعَشر مرّات بِعَلِيِّ بْنِ مُحَمَّد وعَشر مرّات بِالْحَسَنِ بْنِ عَلِيٍّ وعَشر مرّات بِالْحُجَّةِ وتسأل حاجتك.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامس :',
                  subtitle:
                      'زيارة الحسين (عليه السلام) في الحديث انّه اذا كان ليلة القدر نادى مناد من السّماء السّابعة من بطنان العرش انّ الله قد غفر لمن زار قبر الحسين (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السادس :',
                  subtitle:
                      'احياء هذه اللّيالي الثّلاثة ففي الحديث : مَنْ احيا ليلة القدر غفرت له ذنوبه ولو كانت ذنوبه عدد نجوم السّماء ومثاقيل الجبال ومكائيل البحار.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السابع :',
                  subtitle:
                      'الصّلاة مائة ركعة فانّها ذات فضل كثير، والافضل أن يقرأ في كلّ ركعة بعد الحمد التّوحيد عشر مرّات.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّامن : تقول :',
                  subtitle:
                      'اَللّـهُمَّ اِنّي اَمْسَيْتُ لَكَ عَبْداً داخِراً لا اَمْلِكُ لِنَفْسي نَفْعاً وَلا ضَرّاً، وَلا اَصْرِفُ عَنْها سُوءاً، اَشْهَدُ بِذلِكَ عَلى نَفْسي، وَاَعْتَرِفُ لَكَ بِضَعْفِ قُوَّتي، وَقِلَّةِ حيلَتي، فَصَلِّ عَلى مُحَمَّد وَآلِ مُحَمَّد، وَاَنْجِزْ لي ما وَعَدْتَني وَجَميعَ الْمُؤْمِنينَ وَالْمُؤْمِناتِ مِنَ الْمَغْفِرَةِ في هذِهِ اللَّيْلَةِ، وَاَتْمِمْ عَلَيَّ ما آتَيْتَني فَاِنّي عَبْدُكَ الْمِسْكينُ الْمُسْتَكينُ الضَّعيفُ الْفَقيرُ الْمَهينُ، اَللّـهُمَّ لا تَجْعَلْني ناسِياً لِذِكْرِكَ فيـما اَوْلَيْتَني، وَلا لاِِحْسانِكَ فيـما اَعْطَيْتَني، وَلا آيِساً مِنْ اِجابَتِكَ وَاِنْ اَبْطَأَتَ عَنّي، في سَرّاءَ اَوْ ضَرّاءَ، اَوْ شِدَّة اَوْ رَخاء، اَوْ عافِيَة اَوْ بَلاء، اَوْ بُؤْس اَوْ نَعْماءَ اِنَّكَ سَميعُ الدُّعاءِ.\n\n'
                      'وقد روى الكفعمي هذا الدّعاء عن الامام زين العابدين (عليه السلام) كان يدعو به في هذه اللّيالي قائماً وقاعداً وراكعاً وساجداً، وقال العلاّمة المجلسي (رحمه الله) : انّ أفضل الاعمال في هذه اللّيالي هو الاستغفار والدّعاء لمطالب الدّنيا والاخرة للنّفس وللوالدين والاقارب وللاخوان المؤمنين الاحياء منهم والاموات والذّكر والصّلاة على محمّد وآل محمّد ما تيسّر، وقد ورد في بعض الاحاديث استحباب قراءة دعاء الجوشن الكبير في هذه اللّيالي الثّلاث.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أقول :',
                  subtitle:
                      'قد أوردنا الدّعاء فيما مضى وقد روي انّ النّبي (صلى الله عليه وآله وسلم) قيل له : ماذا أسأل الله تعالى اذا أدركت ليلة القدر ؟ قال : العافية.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title:
                      'أما القسم الثّاني أي مايخصّ كلّ ليلة من ليالي القدر فهو كما يلي :',
                  subtitle: '',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاوّل :',
                  subtitle:
                      'أن يقول مائة مرّة اَسْتَغْفِرُ اللهَ واَتُوبُ اِلَيْهِ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثاني :',
                  subtitle:
                      'مائة مرّة اَللّـهُمَّ الْعَنْ قَتَلَةَ اَميرِ الْمُؤمِنينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثالث :',
                  subtitle:
                      'دعاء يا ذَا الَّذي كانَ وقد مضى الدّعاء في القسم الرّابع من الكتاب.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابع : يقول :',
                  subtitle:
                      'اَللّـهُمَّ اْجْعَلْ فيـما تَقْضي وَتُقَدِّرُ مِنَ الاَمْرِ الَْمحْتُومِ، وَفيـما تَفْرُقُ مِنَ الاَمْرِ الحَكيمِ في لَيْلَةِ الْقَدْرِ، وَفِي الْقَضاءِ الَّذي لا يُرَدُّ وَلا يُبَدَّلْ، اَنْ تَكْتُبَني مِنْ حُجّاجِ بَيْتِكَ الْحَرامِ، الْمَبْرُورِ حَجُّهُمُ، الْمَشْكُورِ سَعْيُهُمُ، الْمَغْفُورِ ذُنُوبُهُمُ الْمُكَفَّرِ عَنْهُمْ سَيِّئاتُهُمْ وَاجْعَلْ فيـما تَقْضي وَتُقَدِّرُ اَنْ تُطيلَ عُمْري وَتُوَسِّعَ عَلَيَّ في رِزْقي، وَتَفْعَلَ بي كَذا وَكَذا ويسأل حاجته عوض هذه الكلمة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Allayla2al7adiyaWal3ishrin.screenRoute,
          pushBack: Allayla2alsabi3a3ashar.screenRoute,
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
