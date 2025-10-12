import 'package:flutter/material.dart';
import '../../../widgets/bloc_builder_albakiyat_alsalihat.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../widgets/scroll_title.dart';
import '../../favorites_provider.dart';
import '../../favorites_screen.dart';
import '../ala7raz_walad3iya_almoujaza.dart';
import 'fi_ba3d_ala7raz_walad3iya_almoujaza.dart';
import 'fi_ba3d_ma_yata3alak_belmawt.dart';

class Dou3a2AlsajadFiZikrAltawba extends StatefulWidget {
  static String screenRoute = 'dou3a2_alsajad_fi_zikr_altawba_screen';
  const Dou3a2AlsajadFiZikrAltawba({super.key});

  @override
  State<Dou3a2AlsajadFiZikrAltawba> createState() =>
      _Dou3a2AlsajadFiZikrAltawbaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Dou3a2AlsajadFiZikrAltawbaState
    extends State<Dou3a2AlsajadFiZikrAltawba> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_dou3a2_alsajad_fi_zikr_altawba_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_dou3a2_alsajad_fi_zikr_altawba_screen', value);
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
                color: isIcon ? Theme.of(context).iconTheme.color : Colors.red,
              ),
              onPressed: () async {
                setState(() {
                  isIcon = !isIcon;
                });
                await _saveFavoriteState(isIcon);

                if (!isIcon) {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .addFavorite(
                          'دعاء السجاد (عليه السلام) وكان من دعائه (عليه السلام) في ذكر التوبة وطلبها',
                          Dou3a2AlsajadFiZikrAltawba.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'دعاء السجاد (عليه السلام) وكان من دعائه (عليه السلام) في ذكر التوبة وطلبها',
                          Dou3a2AlsajadFiZikrAltawba.screenRoute,
                          Dou3a2AlsajadFiZikrAltawba.screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(
                title:
                    'دعاء السجاد (عليه السلام) وكان من دعائه (عليه السلام) في ذكر التوبة وطلبها'),
          ),
        ),
        body: BlocBuilderAlbakiyatAlsalihat(
          text:
              'دعاء السجاد (عليه السلام) وكان من دعائه (عليه السلام) في ذكر التوبة وطلبها',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiBa3dAla7razWalad3iyaAlmoujaza.screenRoute,
          pushBack: FiBa3dMaYata3alakBelmawt.screenRoute,
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
      ),
    );
  }
}
