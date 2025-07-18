import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../lailat_aljom3a_wnaharaha_w2a3malaha.dart';
import 'salat_alnabi.dart';
import 'salat_alsaida_alzahraa.dart';

class SalatAmirAmo2minin extends StatefulWidget {
  static String screenRoute = 'salat_amir_almo2minin_screen';
  const SalatAmirAmo2minin({super.key});

  @override
  State<SalatAmirAmo2minin> createState() => _SalatAmirAmo2mininState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAmirAmo2mininState extends State<SalatAmirAmo2minin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_amir_almo2minin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_amir_almo2minin_screen', value);
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
          .pushReplacementNamed(LailatAljom3aWnaharahaW2a3malaha.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              if (previousPage == 'favorite_screen') {
                Navigator.of(context)
                    .pushReplacementNamed(FavoritesScreen.screenRoute);
              } else {
                Navigator.of(context).pushReplacementNamed(
                    LailatAljom3aWnaharahaW2a3malaha.screenRoute);
              }
            },
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
                      .addFavorite('صلاة أمير المؤمنين (ع)',
                          SalatAmirAmo2minin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة أمير المؤمنين (ع)',
                          SalatAmirAmo2minin.screenRoute,
                          SalatAmirAmo2minin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'صلاة أمير المؤمنين (ع)',
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
                      'روى الشّيخ والسيّد عن الصّادق (عليه السلام): انّه قال من صلّى منكم أربع ركعات صلاة أمير المؤمنين (عليه السلام) خَرَج من ذُنوبه كيوم ولدته أمّه وقضيت حوائجه.\n\n'
                      'يقرأ في كلِّ رَكعة الحَمد مرّة وخمسين مرّة الاخلاص (قُلْ هُوَ اللهُ أحَدٌ) فاذا فرغ مِنها دعا بهذا الدّعاء وَهو تسبيحُه (عليه السلام) :\n\n'
                      'سُبْحانَ مَنْ لا تَبيدُ مَعالِمُهُ سُبْحانَ مَنْ لا تَنْقُصُ خَزائنُهُ سُبْحانَ مَنْ لاَ اضْمِحْلالَ لِفَخْرِهِ سُبْحانَ مَنْ لا يَنْفَدُ ما عِنْدَهُ سُبحانَ مَنْ لاَ انْقِطاعَ لِمُدَّتِهِ سُبْحانَ مَنْ لا يُشارِكُ اَحَداً فى اَمْرِهِ سُبْحانَ مَنْ لا اِلـهَ غَيْرُهُ ويَدعُو بعد ذلك ويقول:\n\n'
                      'يا مَنْ عَفا عَنِ السَّيِئاتِ وَلَمْ يُجازِ بِهَا ارْحَمْ عَبْدَكَ يا اَللهُ، نَفْسى نَفْسى اَنَا عَبْدُكَ يا سَيِّْداهُ اَنَا عَبْدُكَ بَيْنَ يَدَيْكَ يا رَبّاهُ اِلـهى بِكَيْنُونَتِكَ يا اَمَلاهُ يا رَحْماناهُ يا غِياثاهُ عَبْدُكَ عَبْدُكَ لا حيلَةَ لَهُ يا مُنتَهى رَغْبَتاهُ يا مُجْرِيَ الدَّمِ في عُرُوقي يا سَيِّداهُ يا مالِكاهُ اَيا هُوَ اَيا هُوَ يا رَبّاهُ، عَبْدُكَ عبدك لا حيلَةَ لي وَلا غِنى بي عَنْ نَفسْي وَلا اَسْتَطيعُ لَها ضَرّاً وَلا نَفْعاً وَلا اَجِدُ مَنْ اُصانِعُهُ تَقَطَّعَتْ اَسْبابُ الْخَدائِعِ عَنّي وَاضْمَحَلَّ كُلُّ مَظْنُون عّنى اَفْرَدَنِى الدَّهْرُ اِلَيْكَ فَقُمْتُ بَيْنَ يَدَيْكَ هذَا الْمَقامَ، يا اِلـهى بِعِلْمِكَ كانَ هذا كُلُّهُ فَكَيْفَ اَنْتَ صانِعٌ بي وَلَيْتَ شِعْري كَيْفَ تَقُولُ لِدُعائي اَتَقُولُ نَعْمَ اَمْ تَقُولُ لا، فَاِنْ قُلْتَ لافَيا وَيْلى يا وَيْلى يا ويْلى يا عَوْلى يا عَوْلى يا عَوْلى يا شِقْوَتى يا شِقْوَتى يا شِقْوَتى يا ذُلّي يا ذُلّى يا ذُلّى اِلى مَنْ وَمِمَّنْ اَوْ عِنْدَ مَنْ اَوْ كَيْفَ اَوْ ماذا اَوْ اِلى اَيِّ شَيء اَلْجَأ وَمَنْ اَرْجُو وَمَنْ يَجُودُ عَليَّ بِفَضْلِهِ حينِ تَرْفُضُنى يا واسِعَ الْمَغْفِرَةِ، وَاِنْ قُلْتَ نَعَمْ كَما هُوَ الظَّنُّ بِكَ وَالرَّجاءُ لَكَ فَطُوبى لي اَنَا السَّعيدُ وَاَناَ الْمَسْعُودُ فَطُوبى لى وَاَنَا الْمَرْحُومُ يا مُتَرَحِّمُ يامُتَرَئّفُ يا مُتَعَطِّفُ يا مُتَجَبِّرُ (يا متحنّن) يا مُتَمَلِّكُ يا مُقْسِطُ لا عَمَلَ لى اَبْلُغُ بِهِ نَجاحَ حاجَتى أَسْأَلُكَ بِاْسمِكَ الَّذي جَعَلْتَهُ فى مَكْنُونِ غَيْبِكَ وَاسْتَقَرَّ عِنْدَكَ فَلا يَخْرُجُ مِنْكَ اِلى شَيء سِواكَ أَسْأَلُكَ بِهِ وَبِكَ (بك وبه) فَاِنَّهُ اَجَلُّ وَاَشْرَفُ اَسْمائِكَ لا شَيءَ لي غَيْرُ هذا وَلا اَحَدَ اَعْوَدُ عَليَّ مِنْكَ يا كَيْنُونُ يا مُكَوِّنُ يا مَنْ عَرَّفَنى نَفْسَهُ يا مَنْ اَمَرَنى بِطاعَتِهِ يا مَنْ نَهانى عَنْ مَعْصِيَتِهِ وَيا مَدْعُوُّ يا مَسْؤوُلُ يا مَطْلُوباً اِلَيْهِ رَفَضْتُ وَصِيَّتَكَ الَّتى اَوْصَيْتَنى وَلَمْ اُطِعْكَ وَلَوْ اَطَعْتُكَ فيما اَمَرْتَنى لَكَفَيْتَنى ما قُمْتُ اِلَيْكَ فيهِ وَاَنَا مَعَ مَعْصِيَتى لَكَ راج فَلا تَحُلْ بَيْنى وَبَيْنَ ما رَجَوْتُ يا مُتَرَحِّماً لى اَعِذْني مِنْ بَيْنِ يَدَيَّ وَمِنْ خَلْقى وَمِنْ فَوْقى وَمِنْ تَحْتى وَمِنْ كُلِّ جِهاتِ الاِحاطَةِ بى اَللّـهُمَّ بِمُحَمَّد سَيِّدي وَبِعَلِيٍّ وَلِيّى وَبِالاَْئِمَةِ الرّاشِدينَ عَلَيْهِمُ السَّلام اجْعَلْ عَلَيْنَا صَلَواتِكَ وَرَأْفَتَكَ وَرَحْمتَكَ وَأْوسِعْ عَلَيْنا مِنْ رِزْقِكَ وَاقْضِ عَنَّا الدَّيْنَ وَجَميعَ حَوائِجِنا يا اَللهُ يا اَللهُ يا اَللهُ اِنَّكَ عَلى كُلِّcشَيْء قَديرٌ.\n\n'
                      'ثمّ قال (عليه السلام): مَن صلّى هذه الصلاة ودعا بهذا الدّعاء انفتل وَلم يبق بينه وَبين الله تعالى ذنبٌ الاَّ غفره لَه.\n\n'
                      'وردتنا أحاديث كثيرة في فضل هذه الاربع ركعات في يوم الجمعة واذا قال المُصلّي بعدما فرغ مِنها (اَللّـهُمَّ صَلِّ عَلى النَّبِيِّ الْعَرَبِيِّ وَالِهِ) ففي الحديث انّه يغفر لَه ما تقدّم مِن ذنبِه وما تأخّر وكان كمن ختم القرآن اثنتي عشرة ختمة ورفع الله عنه عطشِ يوم القِيامة.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: SalatAlsaidaAlzahraa.screenRoute,
        pushBack: SalatAlnabi.screenRoute,
        soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/صلاة امير المؤمنين.mp3',
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
