import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/list_of_nine_verses.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alhoussein_wa2adabiha.dart';
import 'alrbi3a_almo5asasa.dart';
import 'alsania_almo5asasa.dart';

class AlsalisaAlmo5asasa extends StatefulWidget {
  static String screenRoute = 'alsalisa_almo5asasa_screen';
  const AlsalisaAlmo5asasa({super.key});

  @override
  State<AlsalisaAlmo5asasa> createState() => _AlsalisaAlmo5asasaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlsalisaAlmo5asasaState extends State<AlsalisaAlmo5asasa> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_alsalisa_almo5asasa_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alsalisa_almo5asasa_screen', value);
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
          .pushReplacementNamed(ZiyaratAlhousseinWa2adabiha.screenRoute);
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
                      .addFavorite('الثالثة المخصوصة: زيارة النصف من شعبان',
                          AlsalisaAlmo5asasa.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الثالثة المخصوصة: زيارة النصف من شعبان',
                          AlsalisaAlmo5asasa.screenRoute,
                          AlsalisaAlmo5asasa.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'الثالثة المخصوصة: زيارة النصف من شعبان',
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
                      'اعلم انّه قد وردت أحاديث كثيرة في فضل زيارته في النّصف من شعبان ويكفيها فضلاً انّها رويت بعدّة اسناد معتبرة عن الامام زين العابدين وعن الامام جعفر الصّادق (عليهما السلام) قالا : من أحبّ أن يصافحه مائة ألف نبيّ وأربعة وعشرون ألف نبيّ فليزر قبر أبي عبد الله الحسين بن علي (عليهما السلام) في النّصف من شعبان فانّ أرواح النّبيّين (عليهم السلام) يستأذنون الله في زيارته فيؤذن لهم، فطوبى لمن صافح هؤلاء وصافحوه ومنهم خمسة اولو العزم من الرّسل هم نوح وابراهيم ومُوسى وعيسى ومحمّد صلّى الله عليه وآله وعليهم اجمعين.\n\n'
                      'قال الرّاوي : قلنا له ما معنى اولي العزم؟ قال : بعثوا الى شرق الارض وغربها جنّها وانسها. وقد وردت فيه زيارتان ، فالاولى هي ما أوردناه لزيارته (عليه السلام) في أوّل يوم من رجب، والثّانية ما رواه الشّيخ الكفعمي في كتاب البلد الامين عن الصّادق (عليه السلام) وهي كما يلي : تقِف عند قبره وتقُول :\n\n'
                      'اَلْحَمْدُ للهِ الْعَلِيِّ الْعَظيمِ وَالسَّلامُ عَلَيْكَ اَيُّهَا الْعَبْدُ الصّالِحُ الزَّكيُّ اُودِعُكَ شَهادَةً مِنّي لَكَ تُقَرِّبُني اِلَيْكَ فِي يَوْمِ شَفاعَتِكَ، اَشْهَدُ اَنَّكَ قُتِلْتَ وَلَمْ تَمُتْ بَلْ بِرَجاءِ حَياتِكَ حَيِيَتْ قُلُوبُ شيعَتِكَ، وَبِضِياءِ نُورِكَ اهْتَدَى الطّالِبُونَ اِلَيْكَ، وَاَشْهَدُ اَنَّكَ نُورُ اللهِ الَّذي لَمْ يُطْفَأْ وَلا يُطْفَأُ اَبَداً، وَاَنَّكَ وَجْهُ اللهِ الَّذي لَمْ يَهْلِكْ وَلا يُهْلَكُ اَبَداً، وَاَشْهَدُ اَنَّ هذِهِ التُّرْبَةَ تُرْبَتُكَ، وَهذَا الْحَرَمَ حَرَمُكَ، وَهذَا الْمَصْرَعَ مَصْرَعُ بَدَنِكَ لا ذَليلَ وَاللهِ مُعِزُّكَ وَلا مَغْلُوبَ وَاللهِ ناصِرُكَ، هذِهِ شَهادَةٌ لي عِنْدَكَ اِلى يَوْمَ قَبْضِ روُحي بِحَضْرَتِكَ، وَالسَّلامُ عَلَيْكُمْ وَرَحْمَةُ اللهِ وَبَرَكاتُهُ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Alrbi3aAlmo5asasa.screenRoute,
          pushBack: AlsaniaAlmo5asasa.screenRoute,
          soud: 'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/الثالثة المخصصة.mp3',
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
