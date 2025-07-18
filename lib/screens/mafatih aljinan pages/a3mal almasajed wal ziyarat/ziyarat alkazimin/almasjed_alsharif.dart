import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alkazimin.dart';
import 'ziyarat_2o5ra_lmohamad_altaki_alsaniya.dart';
import 'ziyarat_alnowab_al2arba3a.dart';

class AlmasjedAlsharif extends StatefulWidget {
  static String screenRoute = 'almasjed_alsharif_screen';
  const AlmasjedAlsharif({super.key});

  @override
  State<AlmasjedAlsharif> createState() => _AlmasjedAlsharifState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlmasjedAlsharifState extends State<AlmasjedAlsharif> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_almasjed_alsharif_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_almasjed_alsharif_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(ZiyaratAlkazimin.screenRoute);
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
                          'في الذهاب الى المسجد الشريف مسجد براثا والصلاة فيه',
                          AlmasjedAlsharif.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في الذهاب الى المسجد الشريف مسجد براثا والصلاة فيه',
                          AlmasjedAlsharif.screenRoute,
                          AlmasjedAlsharif.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'في الذهاب الى المسجد الشريف مسجد براثا والصلاة فيه',
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
                      'اعلم انّ جامع براثا من المساجد المعروفة المباركة وهو واقع على الطّريق بين الكاظميّة وبغداد على الطّريق الّذي يسلكه الوافدون لزيارة الاعتاب المقدّسة في العراق من دون مبالاة بالمسجد الّذي يمرّون عليه ، على ما روي له من الفضل والشّرف الرّفيع.\n\n'
                      'قال الحموي وهو من مورّخي سنة ستمائة في كتابه مُعجم البلدان : براثا محلّة كانت في طرف بغداد في قبلة الكرخ وجنوبي باب محول وكان لها جامع مفرد تصلّي فيه الشّيعة وقد خربت عن آخرهما وقال : كانت الشّيعة قبل الرّاضي بالله الخليفة العبّاسي يجتمع فيه قوم منهم يسبّون الصّحابة فكبسه الرّاضي بالله وأخذ مَنْ وجده فيه وحبسهم وهدمه حتّى سوّى به الارض، وأنهى الشّيعة خبره الى حكم الماكاني امير الامراء ببغداد، فأمر باعادة بنائه وتوسيعه واحكامه وكتب في صدره اسم الرّاضي، ولم تزل الصّلاة تقام فيه الى بعد الخمسين وأربعمائة، ثمّ تعطّلت الى الان وكانت براثا قبل بناء بغداد قرية يزعمون انّ عليّاً (عليه السلام) مرّ بها لما خرج لقتال الحروريّة بالنّهروان وصلّى في موضع من الجامِع المذكور، وانّه دخل حمّاماً كان في هذه القرية، وينسب الى '
                      'براثا هذه أبو شعيب البراثي العابد كان أوّل من سكن براثا في كوخ يتعبّد فيه فمرّت بكوخه جارية من ابناء الكتاب الكبار وابناء الدّنيا كانت ربيت في القُصور، فنظرت الى أبي شعيب فاستحسنت حاله وما كان عليه فصارت كالاسير له، فجاءت الى أبي شعيب وقالت : أريد أن أكون لك خادمة ، فقال لها : إن أردتِ ذلك فتعرّي من هيئتك وتجرّدي عمّا أنت فيه حتّى تصلحي لما أردتِ، فتجرّدت (السّعيدة) عن كلّ ما تملكه ولبست لبسة النّساك وحضرته فتزوّجها، فلمّا دخلت الكوخ رأت قطعة خصاف كانت في مجلس أبي شعيب تقيه من النّدى ، فقالت : ما أنا بمقيمة عندك حتّى تخرج الخصاف لانّي سمعتك تقول : انّ الارض تقول : يَا ابْنَ آدَمَ تَجْعَلُ بَيْنِى وَبَيْنَكَ حِجاباً وَاَنْتَ غَداً في بَطْني ، فرماها أبو شعيب ومكثت عنده سنين يتعبّدان أحسن العبادة وتوفّيا على ذلك.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أقول :',
                  subtitle:
                      'قد حدّثنا في كتاب هديّة الزّائر في فضل هذا المسجد الشّريف وقلنا هُناك انّ لهذا المسجد كما يبدو من مجموع هذه الاحاديث فضائل عديدة تكفي احداها لو حازها مسجد من المساجد أن تشدّ اليه الرّحال وتطوي المراحل ابتغاء رضوان الله بالصّلاة فيه والدّعاء :',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الاُولى :',
                  subtitle:
                      'انّ الله تعالى أقرّ أن لا ينزله بجيشه الاّ نبيّ أو وصيّ نبيّ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّانية :',
                  subtitle: 'انّه بيت مريم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّالثة :',
                  subtitle: 'انّه أرض عيسى (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الرّابعة :',
                  subtitle: 'انّ فيه العين الّتي نبعت لمريم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الخامسة :',
                  subtitle:
                      'انّ أمير المؤمنين صلوات الله وسلامه عليه أبان تلك العين باعجازه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّادسة :',
                  subtitle:
                      'انّ فيهِ صخرة بيضاء مباركة عليها وضعت مريم عيسى (عليه السلام)من عاتقها.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'السّابعة :',
                  subtitle:
                      'انّ أمير المؤمنين (عليه السلام) كشف باعجازه عن تلك الصّخرة فنصبها الى القبلة وصلّى اليها.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّامنة :',
                  subtitle:
                      'صلاة أمير المؤمنين (عليه السلام) وابنيه الحسن المجتبى وسيّد الشّهداء (عليهم السلام) فيه.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'التّاسعة :',
                  subtitle:
                      'انّ امير المؤمنين (عليه السلام) أقام هناك أربعة أيّام.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'العاشرة :',
                  subtitle:
                      'انّه صلّى فيه الانبياء لا سيّما النّبي خليل الرّحمن (عليه السلام).',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الحادية عشرة :',
                  subtitle:
                      'انّ هناك قبر نبيّ من الانبياء ولعلّه يوشع (عليه السلام) ، فقد قال الشّيخ رحمة الله عليه: انّ قبره في الفسحة المقابلة لمسجد براثا.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'الثّانية عشرة :',
                  subtitle:
                      'انّ فيه قد رُدّت الشّمس لامير المؤمنين (عليه السلام)، والغريب انّ المسجد بما له من الفضل والشّرف الرّفيع وبما بدا فيه من الايات الالهيّة والمعجزات  الحيدريّة قد عفاه معظم الوافدين لزيارة الاعتاب المقدّسة في العراق وهو لم يكن في ناحية منعزلة وانّما هو واقع على طريقهم الّذي يجتازونه مراراً عديدة ، فلم يعهد أن يؤمّه فرد واحد من كلّ ألف من الزّوار وقد يتّفق انّ زائراً من الزّوار يتوجّه اليه متوخياً عظيم فضل الله فيه، فاذا وافاه والباب مغلق فاقتضى فتح الباب أن يبذل نزراً يسيراً من المال تماسك عنه وتضايق وأغمظ عن عظيم الاجر وهو لا يحجم عن بذل الجزيل لمشاهدة مدينة بغداد وصروح الجبابرة فيها ، فضلاً عن المبالغ الطّائلة الّتي ينفقها في فضول المعاش وفي التّعامل مع يهود بغداد على أمتعتهم النّحسة النّجسة الّتي صارت ابتياعها كالجزء المكمّل لزيارة معظم الزّائرين والله المستعان.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiyaratAlnowabAl2arba3a.screenRoute,
          pushBack: Ziyarat2o5raLmohamadAltakiAlsaniya.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/المسجد الشريف.mp3',
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
