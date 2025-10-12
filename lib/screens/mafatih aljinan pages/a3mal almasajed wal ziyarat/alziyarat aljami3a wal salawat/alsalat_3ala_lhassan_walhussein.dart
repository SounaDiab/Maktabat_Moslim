import 'package:flutter/material.dart';
import '../../../../widgets/bloc_builder_mafatih_aljinan.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/scroll_title.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../alziyarat_aljami3a_walsalawat.dart';
import 'alsalat_3ala_ali_bin_lhussein.dart';
import 'alsalat_3ala_alsayida_fatima.dart';

class Alsalat3alaLhassanWalhussein extends StatefulWidget {
  static String screenRoute = 'alsalat_3ala_lhassan_walhussein_screen';
  const Alsalat3alaLhassanWalhussein({super.key});

  @override
  State<Alsalat3alaLhassanWalhussein> createState() =>
      _Alsalat3alaLhassanWalhusseinState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Alsalat3alaLhassanWalhusseinState
    extends State<Alsalat3alaLhassanWalhussein> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_alsalat_3ala_lhassan_walhussein_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_alsalat_3ala_lhassan_walhussein_screen', value);
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
          .pushReplacementNamed(AlziyaratAljami3aWalsalawat.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isTablet ? 100 : 50,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
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
                    .addFavorite('الصلاة على الحسن والحسين (عليهما السلام)',
                        Alsalat3alaLhassanWalhussein.screenRoute);
              } else {
                Provider.of<FavoritesProvider>(context, listen: false)
                    .removeFavorite(
                        'الصلاة على الحسن والحسين (عليهما السلام)',
                        Alsalat3alaLhassanWalhussein.screenRoute,
                        Alsalat3alaLhassanWalhussein.screenRoute);
              }
            },
          ),
        ],
        title: SizedBox(
          height: 30,
          child: ScrollTitle(title: 'الصلاة على الحسن والحسين (عليهما السلام)'),
        ),
      ),
      body: BlocBuilderMafatihAljinan(
        text: 'الصلاة على الحسن والحسين (عليهما السلام)',
        fontSize: _fontSize,
        fontSizeTablet: _fontSizeTablet,
      ),
      bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: Alsalat3alaAliBinLhussein.screenRoute,
        pushBack: Alsalat3alaAlsayidaFatima.screenRoute,
        soud:
            '',
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
    );
  }
}
