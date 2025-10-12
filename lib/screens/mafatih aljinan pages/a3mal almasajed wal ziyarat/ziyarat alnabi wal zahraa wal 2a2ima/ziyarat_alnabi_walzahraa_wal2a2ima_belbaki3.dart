import 'package:flutter/material.dart';
import '../../../../widgets/bloc_builder_mafatih_aljinan.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../widgets/add_custom_bottom_navigation_bar.dart';
import '../../../../widgets/scroll_title.dart';
import '../../../favorites_provider.dart';
import '../../../favorites_screen.dart';
import '../ziyarat_alnabi_walzahraa_wal2a2ima.dart';
import 'alwada3.dart';
import 'ziyarat_alnabi.dart';

class ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3 extends StatefulWidget {
  static String screenRoute =
      'ziyarat_alnabi_walzahraa_wal2a2ima_belbaki3_screen';
  const ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3({super.key});

  @override
  State<ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3> createState() =>
      _ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3State
    extends State<ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_ziyarat_alnabi_walzahraa_wal2a2ima_belbaki3_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_ziyarat_alnabi_walzahraa_wal2a2ima_belbaki3_screen', value);
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
          .pushReplacementNamed(ZiyaratAlnabiWalzahraaWal2a2ima.screenRoute);
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
                          'في زيارة النبي والزهراء والأئمة بالبقيع صلوات الله عليهم اجمعين في المدينة الطيبة',
                          ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في زيارة النبي والزهراء والأئمة بالبقيع صلوات الله عليهم اجمعين في المدينة الطيبة',
                          ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3.screenRoute,
                          ZiyaratAlnabiWalzahraaWal2a2imaBelbaki3.screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(
                title:
                    'في زيارة النبي والزهراء والأئمة بالبقيع صلوات الله عليهم اجمعين في المدينة الطيبة'),
          ),
        ),
        body: BlocBuilderMafatihAljinan(
          text:
              'في زيارة النبي والزهراء والأئمة بالبقيع صلوات الله عليهم اجمعين في المدينة الطيبة',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: ZiyaratAlnabi.screenRoute,
          pushBack: Alwada3.screenRoute,
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
