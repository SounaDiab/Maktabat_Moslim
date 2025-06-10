import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ba3d_alsalawat_almandouba.dart';
import 'salat_al5awf_men_alzalim.dart';
import 'salat_alisti8asa.dart';

class SalatAl7ojaFiJamkaran extends StatefulWidget {
  static String screenRoute = 'salat_al7oja_fi_jamkaran_screen';
  const SalatAl7ojaFiJamkaran({super.key});

  @override
  State<SalatAl7ojaFiJamkaran> createState() => _SalatAl7ojaFiJamkaranState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAl7ojaFiJamkaranState extends State<SalatAl7ojaFiJamkaran> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_salat_al7oja_fi_jamkaran_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_al7oja_fi_jamkaran_screen', value);
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
          .pushReplacementNamed(Ba3dAlsalawatAlmandouba.screenRoute);
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
                      .addFavorite('صلاة الحجة (عليه السلام) في جامع جمكران',
                          SalatAl7ojaFiJamkaran.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الحجة (عليه السلام) في جامع جمكران',
                          SalatAl7ojaFiJamkaran.screenRoute,
                          SalatAl7ojaFiJamkaran.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة الحجة (عليه السلام) في جامع جمكران',
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
                      'وهو يبعد عن بلدة قم الطيبة مسافة فرسخ واحد وقد حكى الشيخ رض في كتاب (النجم الثاقب) حديث بناء هذا الجامع بأمر من صاحب العصر (عليه السلام) وذلك في الحكاية الأولى من الباب السابع من الكتاب وقد أتى في ذلك الحديث أنه (صلوات الله وسلامه عليه) قال لحسن المثلة الجمكراني: قل للناس ليرغبوا في هذا الموضع وليغيروه وليصلوا فيه أربع ركعتان منها لتحية المسجد يقرأ في كل ركعة منها الحمد مرة وقل هو الله أحد سبع مرات ويسبح سبعا في كل ركوع وسجود، وركعتان منها صلاة الحجة (عليه السلام) يقرأ المصلّي في الأولى سورة الفاتحة فإذا بلغ الآية: إياك نعبد وإياك نستعين كرّرها مائة مرة ثم أتّم الفاتحة ويفعل مثل ذلك في الركعة الثانية ويسبّح سبعا في كل ركوع وسجود فإذا أتمّ الصلاة هلل وسبّح تسبيح الزهراء (صلوات الله وسلامه عليها) فإذا فرغ من التسبيح سجد وصلّى على النبي وآله مائة مرة وهذه الكلمة مروية بنصها عنه (عليه السلام) قال: فمن صلاهما فكأنّما صلّى في البيت العتيق، أي الكعبة.\n\n'
                      'وروى أيضاً في كتاب (النجم الثاقب) عن كتاب (كنوز النجاح) للشيخ الطبرسي أنّه خرج من الناحية المقدسة للحجة (عليه السلام) أنّ من كان له الى الله حاجة فليغتسل ليلة الجمعة بعد منتصف الليل فيذهب إلى مصلاه فيصلّي ركعتين يقرأ في الأولى سورة الحمد فإذا بلغ منها الآية: إيّاك نعبد وإيّاك نستعين كرّرها مائة مرة، ثم أتمّ الحمد، ثم قرأ التوحيد مرّة واحدة ثم ركع وسجد السجدتين فكرّر التسبيح: سبحان ربي العظيم وبحمده في الركوع سبع مرات وكرّر التسبيح: سبحان ربي الاعلى وبحمده في كل من السجدتين سبعا ثم أتى بالركعة الثانية نظيرة للأولى فإذا فرغ من الصلاة دعا بهذا الدعاء فإنّ الله تعالى يقضي له حاجته البتة مهما كانت إِلاّ إذا كانت في قطيعة رحم. وهذا هو الدعاء: اللَّهُمَّ إنْ أطَعْتُكَ فَالَمحْمَدَةُ لَكَ وَإنْ عَصَيْتُكَ فَالحُجَّةُ لَكَ مِنْكَ الرّوحُ وَمِنْكَ الفَرَجُ، سُبْحانَ مَنْ أنْعَمَ وَشَكَرَ سُبْحانَ مَنْ قَدَرَ وَغَفَرَ. اللَّهُمَّ إنْ كُنْتُ عَصَيْتُكَ فَإنّي قَدْ أطَعْتُكَ في أحَبِّ الاشْياءِ إلَيكَ وَهوَ الايمانُ بِكَ، لَمْ أتَّخِذْ لَكَ وَلَداً وَلَمْ أدْعُ لَكَ شَريكا مَنّا مِنْكَ بِهِ عَليّ لامنّا مِنّي بِهِ عَلَيْكَ، وَقَدْ عَصَيْتُكَ ياإلهي عَلى غَيْرِ وَجْهِ المُكابَرَةِ وَلا الخُروجَ عَنْ عُبودِيَّتِكَ وَلا الجُحودِ لِرِبوبيَّتِكَ، ولكِنْ أطَعْتُ هَوايَ وَأزَلَّني الشَّيْطانُ فَلَكَ الحُجَّةُ عَليّ وَالبَيانُ، فَإنْ تُعَذِبْني فَبِذنوبي غَيْرَ ظالِمٍ وَإنْ تَغْفِرْ لي وَتَرْحَمْنِي فَإنَّكَ جَوادٌ كَريمٌ. ثم بقدر ما يفي به النفس: ياكَريمُ ياكَريمُ. ثم يقول بعد ذلك: ياآمِنا مِنْ كُلِّ شَيٍ وَكُلُّ شَيٍ مِنْكَ خائِفٌ حَذِرٌ، أسْأَلَكَ بِأمْنِكَ مِنْ كُلِّ شَيٍ وَخَوفِ كُلِّ شَيٍ مِنْكَ أنْ تُصَلّيَ عَلى مُحَمَّدٍ وِآلِ مُحَمَّدٍ، وَأنْ تُعْطيَني أمانا لِنَفْسي وَأهْلي وَمالي وَوَلَدي حَتّى لاأخافَ أحَداً وَلاأحْذَرَ مِنْ شَيٍ أبَداً، إنَّكَ عَلى كُلِّ شَيٍ قَديرٌ، وَحَسْبُنا الله وَنِعْمَ الوَكيلُ.\n\n'
                      'ياكافيَ إبْراهيمَ نَمْرودَ وَياكافيَ موسى فِرْعَوْنَ. أَسْأَلُكَ أنْ تُصَلِّيَ عَلى مُحَمَّدٍ وَآل مُحَمَّدٍ وَأنْ تَكْفيَني شَرَّ فُلانٍ بِنْ فُلانٍ، وليذكر اسم من يضره واسم أبيه وليسأل الله تعالى دفع ضرره وكفاية شرّه فإنّ الله تعالى يكفيه ذلك البتّة إن شاء الله تعالى.\n\n'
                      'ثم يسجد ويسأل حاجته ويتضرّع إلى الله جل جلاله فإنّه مامن مؤمن ولا مؤمنة صلّى هذه الصلاة ودعا بهذا الدعاء مخلصاً إِلاّ وانفتح له أبواب السماء لقضاء حوائجه واستجيب دعاؤه لوقته من ليلته مهما كانت حاجته وهذا من فضل الله علينا وعلى الناس. انتهى.\n\n'
                      'أقول: قد روى أيضاً هذه الصلاة النجل الجليل للشيخ الطبرسي رضي الدين حسن بن الفضل في كتاب (مكارم الاخلاق) ويختلف الذي رواه عن هذا الدعاء اختلافاً يسيراً فقد استبدل في مفتتح الدعاء بكلمة: اللهم ان كنت عصيتك كلمة: اللهم ان كنت قد عصيتك وأضيفت بعد كلمة: لا أخاف كلمة أحداً وبعد كلمة: فرعون كلمة: اسألك، ولايختلفان في غيرها.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAl5awfMenAlzalim.screenRoute,
          pushBack: SalatAlisti8asa.screenRoute,
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
