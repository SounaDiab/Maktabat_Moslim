import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../almonajat.dart';
import 'monajat_almo7ebin.dart';
import 'monajat_almoti3in_lillah.dart';

class MonajatAlmoridin extends StatefulWidget {
  static String screenRoute = 'monajat_almoridin_screen';
  const MonajatAlmoridin({super.key});

  @override
  State<MonajatAlmoridin> createState() => _MonajatAlmoridinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _MonajatAlmoridinState extends State<MonajatAlmoridin> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_monajat_almoridin_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_monajat_almoridin_screen', value);
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
                          'مناجات المريدين', MonajatAlmoridin.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'مناجات المريدين',
                          MonajatAlmoridin.screenRoute,
                          MonajatAlmoridin.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'مناجات المريدين',
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
                      'سُبْحانَكَ ما اَضْيَقَ الْطُّرُقَ عَلى مَنْ لَمْ تَكُنْ دَليلَهُ، وَما اَوْضَحَ الْحَقَّ عِنْدَ مَنْ هَدَيْتَهُ سَبيلَهُ، اِلـهي فَاسْلُكْ بِنا سُبُلَ الْوُصُولِ اِلَيْكَ، وَسَيِّرْنا في اَقْرَبِ الطُّرُقِ لِلْوُفُودِ عَلَيْكَ، قَرِّبْ عَلَيْنَا الْبَعيدَ وَسَهِّلْ عَلَيْنَا الْعَسيرَ الشَّديدَ، وَاَلْحِقْنا بِعِبادِكَ الَّذينَ هُمْ بِالْبِدارِ اِلَيْكَ يُسارِعُونَ، وَبابَكَ عَلَى الدَّوامِ يَطْرُقُونَ، وَاِيّاكَ فِي اللَّيْلِ وَالنَّهارِ يَعْبُدُونَ، وَهُمْ مِنْ هَيْبَتِكَ مُشْفِقُونَ، الَّذينَ صَفَّيْتَ لَهُمُ الْمَشارِبَ وَبَلَّغْتَهُمُ الرَّغائِبَ، وَاَنْجَحْتَ لَهُمُ الْمَطالِبَ، وَقَضَيْتَ لَهُمْ مِنْ فَضْلِكَ الْمَآرِبَ، وَمَلاَْتَ لَهُمْ ضَمائِرَهُمْ مِنْ حُبِّكَ، وَرَوَّيْتَهُمْ مِنْ صافي شِرْبِكَ، فَبِكَ اِلى لَذيذِ مُناجاتِكَ وَصَلُوا، وَمِنْكَ اَقْصى مَقاصِدِهِمْ حَصَّلُوا، فَيا مَنْ هُوَ عَلَى الْمُقْبِلينَ عَلَيْهِ مُقْبِلٌ، وَبِالْعَطْفِ عَلَيْهِمْ عائِدٌ مُفْضِلٌ، وَبِالْغافِلينَ عَنْ ذِكْرِهِ رَحيمٌ رَؤوفٌ وَبِجَذْبِهِمْ اِلى بابِهِ وَدُودٌ عَطُوفٌ، اَسْاَلُكَ اَنْ تَجْعَلَني مِنْ اَوْفَرِهِمْ مِنْكَ حَظّاً، وَاَعْلاهُمْ عِنْدَكَ مَنْزِلاً، وَاَجْزَلِهِمْ مِنْ وُدِّكَ قِسْماً، وَاَفْضَلِهِمْ في مَعْرِفَتِكَ نَصيباً، فَقَدِ انْقَطَعَتْ اِلَيْكَ هِمَّتي، وَانْصَرَفَتْ نَحْوَكَ رَغْبَتي، فَاَنْتَ لا غَيْرُكَ مُرادي، وَلَكَ لا لِسِواكَ سَهَري وَسُهادي، وَلِقاؤُكَ قُرَّةُ عَيْني، وَوَصْلُكَ مُنى نَفْسي، وَاِلَيْكَ شَوْقي، وَفي مَحَبَّتِكَ وَلَهي، وَاِلى هَواكَ صَبابَتي، وَرِضاكَ بُغْيَتي، وَرُؤْيَتَكَ حاجَتي وَجِوارُكَ طَلَبي، وَقُرْبُكَ غايَةُ سُؤْلي، وَفي مُناجاتِكَ رَوْحي وَراحَتي، وَعِنْدَكَ دَواءُ عِلَّتي وَشِفاءُ غُلَّتي، وَبَرْدُ لَوْعَتي، وَكَشْفُ كُرْبَتي، فَكُنْ اَنيسي في وَحْشَتي، وَمُقيلَ عَثْرَتي، وَغافِرَ زَلَّتي، وَقابِلَ تَوْبَتي، وَمُجيبَ دَعْوَتي، وَوَلِيَّ عِصْمَتي، وَمُغْنِيَ فاقَتي، وَلا تَقْطَعْني عَنْكَ، وَلا تُبْعِدْني مِنْكَ، يا نَعيمي وَجَنَّتي، وَيا دُنْيايَ وَآخِرَتي، يا اَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: MonajatAlmo7ebin.screenRoute,
        pushBack: MonajatAlmoti3inLillah.screenRoute,
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
