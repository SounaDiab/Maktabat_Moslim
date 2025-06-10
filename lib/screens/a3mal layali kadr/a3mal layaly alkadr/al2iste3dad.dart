import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/a3mal%20layali%20kadr/a3mal%20layaly%20alkadr/mawane3_alkoboul.dart';
import 'package:maktabat_almoslim/screens/a3mal%20layali%20kadr/a3mal%20layaly%20alkadr/sawab_al2i7ya2.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/container_scrollview.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../a3mal_layaly_alkadr.dart';

class Al2iste3dad extends StatefulWidget {
  static String screenRoute = 'al2istedad_screen';
  const Al2iste3dad({super.key});

  @override
  State<Al2iste3dad> createState() => _Al2iste3dadState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Al2iste3dadState extends State<Al2iste3dad> {
  bool isIcon = true;
  String music = '';
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_al2istedad_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_al2istedad_screen', value);
  }

  // Future<bool> _onWillPop() async {
  //   final searchProvider = Provider.of<SearchProvider>(context, listen: false);
  //   searchProvider.clearSearch();
  //   Navigator.of(context).pushReplacementNamed(A3malLayalyAlkadr.screenRoute);
  //   return false;
  // }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(A3malLayalyAlkadr.screenRoute);
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
                          'الإستعداد لليلة القدر', Al2iste3dad.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite('الإستعداد لليلة القدر',
                          Al2iste3dad.screenRoute, Al2iste3dad.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الإستعداد لليلة القدر',
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
                child: ListOfNineVerses(
                  title: '',
                  subtitle:
                      'وينبغي للمصدّق بالدين، وبنصّ القرآن المبين أنْ يجتهد لليلة القدر بكل ما يقدر عليه من الوسائل. ومن الاجتهاد أن يكثر ويبالغ في الدعاء لتوفيقها طول سنته، وأن يرزق فيها أحبّ الأعمال إلى الله وأن يجعلها له خيراً من ألف شهر وأن يقبلها منه ويكتبه فيها من المقرّبين ويرضى عنه ويُرضي عنه نبيّه وأئمته لا سيّما إمام زمانه عجل الله تعالى فرجه الشريف.. ومن الاجتهاد أن يُعدّ العدة لتحصيل مقدمات العبادة من لباسٍ مناسب وعطر، وما يتصدّق به فيها على فقراء مخصوصين لصدقته ويتخير لها أدعية مناسبة. وينبغي أن يزيد في شوقه إلى الفوز بكرامات ما أُعدّ له في هذه الليلة، وأن يعيّن لليلته من الأعمال ما هو أنسب لحاله وإخلاصه وحضوره وصفاته ورضا مولاه... ويجتهد أن لا يشتغل في شيء من أجزاء ليلته عن الله ولو بالمباحات. كما أن عليه أن لا يغفل قلبه عن حقيقة ما يقوم به من الأعمال والأذكار حين اشتغاله بها. ويسهل ذلك بأن يتفكّر إجمالاً في العمل قبل أنْ يدخل فيه. وبالجملة، على السالك أن لا يستقلّ من الخير ولو ذرّة فيتركه لأجل قلّته فيخسر ولا يستكثر شيئاً منه فيعجب، أو يتركه من جهة أنّه لا يقدر عليه بل يفعل منه كلّ ما قدر عليه، ويستصغره بعد فعله في جنب الله. ولا يستبعد أن يجيب الله دعاء عباده لمجرد صورة الدعاء ولو بلقلقة اللسان ويعاملهم بكرم عفوه، وإيّاه إيّاه أن يُقنط أحداً من رحمة الله ولو كان عمله مشوباً ببعض الأكدار، لعلّه إذا لم يترك العمل قد يُوَفّق لبعض النفحات الإلهيّة وينقلب الأمر رأساً على عقب فيفوز مع الفائزين. ... ولا بدّ للمؤمن في أول الليلة من أن يبالغ في التوسل والاستشفاع بخفير الليلة من المعصومين عليهم السلام ويذكر كلّ ما يحتاج إليه من التوفيق في أعماله وأحواله ويجدّ في تلطيف ألفاظ الاسترحام والاستشفاع بهم عليهم السلام. وأعمال ليالي القدر نوعان: نوعٌ منها عام يؤدّى في كلّ ليلة من الليالي الثلاث ونوعٌ خاص يؤتى فيما خصّ كلّ ليلة من الليالي. وسنشرع بما هو عام يشمل الليالي الثلاث.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Mawane3Alkoboul.screenRoute,
          pushBack: SawabAl2i7ya2.screenRoute,
          soud: music,
          onTap: (double fontSize) {
            // تحديث حجم الخط
            setState(() {
              isTablet ? _fontSizeTablet = fontSize : _fontSize = fontSize;
            });
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
