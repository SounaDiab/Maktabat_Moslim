import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../al2ad3iya_wal3awzat_lil2alam_wal2askam.dart';
import 'al3awza_libtal_alsi7r.dart';
import 'awza_lidaf3_wasawis_alshaitan.dart';

class Al7erzMenAl3ain extends StatefulWidget {
  static String screenRoute = 'al7erz_men_al3ain_screen';
  const Al7erzMenAl3ain({super.key});

  @override
  State<Al7erzMenAl3ain> createState() => _Al7erzMenAl3ainState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Al7erzMenAl3ainState extends State<Al7erzMenAl3ain> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_al7erz_men_al3ain_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_al7erz_men_al3ain_screen', value);
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
                      .addFavorite(
                          'الحرز من العين', Al7erzMenAl3ain.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الحرز من العين',
                          Al7erzMenAl3ain.screenRoute,
                          Al7erzMenAl3ain.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الحرز من العين',
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
                      'روي لذلك قرأة اَّية: وإن يكاد. وأيضاً عن الصادق (عليه السلام) قال: إذا خفت أن تصاب بالعين، أو تصيب بها أحداً فقل ثلاثا : ما شاءَ الله وَلا قوَّةَ إِلاّ بِالله العَلي العَظيمِ.\n\n'
                      'وروي أنّه إذا تهيّأ أحدكم بهيئة تعجبُهُ فليقرأ حين يخرج من بيته المعوّذتين فإنّه لايضرّه شي بإذن الله تعالى.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أيضاً لدفع العين',
                  subtitle:
                      'ارفع يدك إلى حذاء وجهك واقرأ الحمد والتوحيد والمعوّذتين ؛ وامسحهما على نواصيك.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'أيضاً عوذه لدفع العين',
                  subtitle:
                      'اللّهُمَّ رَبَّ مَطَرٍ حابِسٍ وَحَجَرٍ يابِسٍ وَلَيْلٍ دامِسٍ وَرَطْبٍ ويابِسْ رُدَّ عَينَ العاينِ عَلَيهِ في كَبِدِهِ وَنَحْرِهِ وَمالِهِ فَارْجِعَ البَصَرَ هَلْ تَرى مِنْ فُطور ثُمَّ ارْجع البَصَرَ كَرَّتينِ يَنْقَلِبْ إلَيْكَ البَّصَرُ خاسِئا وَهُوَ حَسيرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'عوذة أخرى',
                  subtitle:
                      'يقول: اللّهُمَّ ذا السُّلْطانِ العَظيمِ وَالمَنِّ القَّديمِ وَالوَجْهِ الكَريمِ ذا الكَلِماتِ التّاماتِ وَالدَّعواتِ المُسْتَجاباتِ عافِ فُلانا مِنْ أنْفُسِ الجِنِّ وَأعْيُنَ الانْسِ. وهي عوذة عوّذ بها النبي (صلّى الله عليه وآله وسلم) الحسنين (عليهما السلام) وقال لاصحابه: عليكم ان تعوّذوا بها أولادكم.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
              Container(
                child: ListOfNineVerses(
                  title: 'عوذة لصيانة الحيوان وغيره من الاصابة بالعين',
                  subtitle:
                      'مروية عن أمير المؤمنين (عليه السلام): بِسْمِ الله الرَّحْمنِ الرَّحيمِ بِسْمِ الله العَظيمِ عَبَسَ عابِسٌ وَشَهاب قابِس وَحَجَرٍ يابِس رُدَّتْ عَينُ العاينِ عَلَيهِ مِنْ رأسِهِ الى قَدَميهِ، أخَذَ عَيْناهُ قابِضْ بِكلاهُ وَعَلى جارِهِ وَأقارِبِهِ جِلْدَهُ دَقيقٌ وَدَمُهُ رَقيقٌ وَبابُ المَكروهِ تَليقُ فَارْجِعَ البَصَرَ كَرَّتينِ يَنْقَلِبْ إلَيْكَ البَّصَرُ خاسِئا وَهُوَ حَسيرٌ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AwzaLidaf3WasawisAlshaitan.screenRoute,
          pushBack: Al3awzaLibtalAlsi7r.screenRoute,
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
