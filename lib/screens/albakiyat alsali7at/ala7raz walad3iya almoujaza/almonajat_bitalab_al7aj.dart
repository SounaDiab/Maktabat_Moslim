import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/widgets/container_scrollview.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/list_of_nine_verses.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ala7raz_walad3iya_almoujaza.dart';
import 'almonajat_bitalab_altawba.dart';
import 'almonajat_likashf_alzolm.dart';

class AlmonajatBitalabAl7aj extends StatefulWidget {
  static String screenRoute = 'almonajat_bitalab_al7aj_screen';
  const AlmonajatBitalabAl7aj({super.key});

  @override
  State<AlmonajatBitalabAl7aj> createState() =>
      _AlmonajatBitalabAl7ajState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlmonajatBitalabAl7ajState
    extends State<AlmonajatBitalabAl7aj> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_almonajat_bitalab_al7aj_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_almonajat_bitalab_al7aj_screen', value);
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
          .pushReplacementNamed(Ala7razWalad3iyaAlmoujaza.screenRoute);
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
                          'المناجاة بطلب الحج',
                          AlmonajatBitalabAl7aj.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'المناجاة بطلب الحج',
                          AlmonajatBitalabAl7aj.screenRoute,
                          AlmonajatBitalabAl7aj.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            'المناجاة بطلب الحج',
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
                      'اللّهُمَّ إرْزُقْني الحَجُّ الَّذي افْتَرَضْتَهُ عَلى مَنْ اسْتَطاعَ إلَيْهِ سَبيلاً وَاجْعَلْ لي فيهِ هادِيا وَإلَيْهِ دَليلاً، وَقَرِّبْ لي بُعْدَ المَسالِكِ وَأَعِنّي عَلى تَأديَةِ المَناسِكِ وَحَرِّمْ بِإحْرامي عَلى النّارِ جَسَدي وَزِدْ لِلْسَفَرِ قُوَّتي وَجَلَدي وَارْزُقْني رَبِّ بِالوُقوفِ بَيْنَ يَدَيْكَ وَالافاضَةَ إلَيْكَ وَأظْفِرْ بي بِالنَّجْحِ بِوافِرِ الرَّبحِ وَأَصْدِرْني رَبِّ مِنْ مَوْقِفِ الحَجِّ الاَكْبَرِ إِلى مُزْدَلَفَةِ المَشْعَرِ واجْعَلْها زُلْفَةً إِلى رَحْمَتِكَ وَطَريقا إِلى جَنَّتِكَ وَقِفْني مَوْقِفَ المَشْعَرِ الحَرامِ وَمَقامَ وُقُوفِ الاحْرامِ وَأَهِّلني لِتَأديَةِ المَناسِكِ وَنَحْرِ الهَدْي التَّوامِكَ بِدَمٍ يَثُجُّ وَأَوْداجٍ تَمُجُّ وَإراقَةِ الدِّماءِ المَسْفوحَةِ وَالهَدايا المَذْبوحَةِ وَفَري أَوْداجِها عَلى ما أَمَرْتَ وَالتَّنَفُّل بِها كَما وَسَمْتَ، وَاحْضِرْني اللّهُمَّ صَلاةَ العيدِ راجيا لِلْوَعْدِ خائِفا مِنَ الوَعيدِ حالِقا شَعْرَ رَأسي وَمُقَصِّراً ومُجْتَهِداً في طاعَتِكَ مُشَمِّراً راميا للجِمارِ بَسَبْعٍ بَعْدَ سَبْعٍ مِنَ الاحْجارِ، وَأَدْخِلْني اللّهُمَّ عَرْصَةَ بَيْتِكَ وَعَقْوَتَكَ وَمَحَلَّ أَمْنِكَ وَكَعْبَتَكَ وَمَساكينِكَ وَسُؤالِكَ وَمَحاويجِكَ، وَجُدْ عَلَيَّ اللّهُمَّ بِوافِرِ الاَجْرِ مِنَ الانْكِفاءِ وَالنَّفْرِ وَاخْتِمْ اللّهُمَّ مَناسِكَ حَجّي وَانْقَضاء عَجِّي بِقَبُولٍ مِنْكَ لي وَرأفَةٍ مِنْكَ بي ياأَرْحَمَ الرّاحِمينَ.',
                  weight: FontWeight.w600,
                  size: isTablet ? _fontSizeTablet : _fontSize,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: AlmonajatLikashfAlzolm.screenRoute,
          pushBack: AlmonajatBitalabAltawba.screenRoute,
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
