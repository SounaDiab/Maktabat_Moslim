import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'monajat_al3arifin.dart';
import 'monajat_almotawasilin.dart';

class MonajatAlmoftakirin extends StatefulWidget {
  static String screenRoute = 'monajat_almoftakirin_screen';
  const MonajatAlmoftakirin({super.key});

  @override
  State<MonajatAlmoftakirin> createState() => _MonajatAlmoftakirinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAlmoftakirinState extends State<MonajatAlmoftakirin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_monajat_almoftakirin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_almoftakirin_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Almonajat.screenRoute);
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
                Navigator.of(context)
                    .pushReplacementNamed(Almonajat.screenRoute);
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
                      .addFavorite(
                          'مناجات المفتقرين', MonajatAlmoftakirin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجات المفتقرين',
                          MonajatAlmoftakirin.screenRoute,
                          MonajatAlmoftakirin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات المفتقرين',
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
                      'اِلـهي كَسْري لا يَجْبُرُهُ اِلاّ لُطْفُكَ وَحَنانُكَ، وَفَقْري لايُغْنيهِ اِلاّ عَطْفُكَ وَاِحْسانُكَ، وَرَوْعَتِي لا يُسَكِّنُهَا إلاَّ أَمانُكَ، وَذِلَّتي لا يُعِزُّها اِلاّ سُلْطانُكَ، وَاُمْنِيَّتي لا يُبَلِّغُنيها اِلاّ فَضْلُكَ، وَخَلَّتي لا يَسُدُّها اِلاّ طَوْلُكَ، وَحاجَتي لا يَقْضيها غَيْرُكَ، وَكَرْبي لا يُفَرِّجُهُ سِوى رَحْمَتِكَ، وَضُرّي لا يَكْشِفُهُ غَيْرُ رَأفَتِكَ، وَغُلَّتي لا يُبَرِّدُها اِلاّ وَصْلُكَ، وَلَوْعَتي لا يُطْفيها اِلاّ لِقاؤُكَ، وَشَوْقي اِلَيْكَ لا يَبُلُّهُ إلاّ النَّظَرُ اِلى وَجْهِكَ، وَقَراري لا يَقِّرُّ دُونَ دُنُوّي مِنْكَ، وَلَهْفَتي لا يَرُدُّها اِلاّ رَوْحُكَ، وَسُقْمي لا يَشْفيهِ اِلاّ طِبُّكَ، وَغَمّي لا يُزيلُهُ اِلاّ قُرْبُكَ، وَجُرْحي لا يُبْرِئُهُ اِلاّ صَفْحُكَ، وَرَيْنُ قَلْبي لا يَجْلُوهُ اِلاّ عَفْوُكَ، وَوَسْواسُ صَدْري لا يُزيحُهُ اِلاّ اَمْرُكَ، فَيا مُنْتَهى اَمَلِ الاْمِلينَ، وَيا غايَةَ سُؤْلِ السّائِلينَ، وَيا اَقْصى طَلِبَةِ الطّالِبينَ، وَيا اَعْلى رَغْبَةِ الرّاغِبينَ، وَيا وَلِيَّ الصّالِحينَ، وَيا اَمانَ الْخائِفينَ، وَيا مُجيبَ دَعْوَةِ الْمُضْطَرّينَ، وَيا ذُخْرَ الْمُعْدِمينَ، وَيا كَنْزَ الْبائِسينَ، وَيا غِياثَ الْمُسْتَغيثينَ، وَيا قاضِيَ حَوائِجِ الْفُقَراءِ وَالْمَساكينَ، وَيا اَكرَمَ الاَْكْرَمينَ، وَيا اَرْحَمَ الرّاحِمينَ، لَكَ تَخَضُّعي وَسُؤالي، وَاِلَيْكَ تَضَرُّعي وَابْتِهالي، اَسْاَلُكَ اَنْ تُنيلَني مِنْ رَوْحِ رِضْوانِكَ، وَتُديمَ عَلَيَّ نِعَمَ امْتِنانِكَ، وَها اَنـَا بِبابِ كَرَمِكَ واقِفٌ، وَلِنَفَحاتِ بِرِّكَ مُتَعَرِّضٌ، وَبِحَبْلِكَ الشَّديدِ مُعْتَصِمٌ، وَبِعُرْوَتِكَ الْوُثْقى مُتَمَسِّكٌ، اِلـهي اِرْحَمْ عَبْدَكَ الذَّليلَ ذَا الّلِسانِ الْكَليلِ وَالْعَمَلِ الْقَليلِ، وَامْنُنْ عَلَيْهِ بِطَوْلِكَ الْجَزيلِ، وَاكْنُفْهُ تَحْتَ ظِلِّكَ الظَّليلِ، يا كَريمُ يا جَميلُ يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAl3arifin.screenRoute,
        pushBack: MonajatAlmotawasilin.screenRoute,
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
