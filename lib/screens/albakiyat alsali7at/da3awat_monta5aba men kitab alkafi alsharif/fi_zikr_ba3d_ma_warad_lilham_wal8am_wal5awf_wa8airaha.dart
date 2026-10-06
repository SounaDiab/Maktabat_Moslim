import '../../../Util/app_imports.dart';

class FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha extends StatefulWidget {
  static String screenRoute =
      'fi_zikr_ba3d_ma_warad_lilham_wal8am_wal5awf_wa8airaha_screen';
  const FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha({super.key});

  @override
  State<FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha> createState() =>
      _FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airahaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airahaState
    extends State<FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_zikr_ba3d_ma_warad_lilham_wal8am_wal5awf_wa8airaha_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_zikr_ba3d_ma_warad_lilham_wal8am_wal5awf_wa8airaha_screen',
        value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacement(CustomPageRoute(
          page: FavoritesScreen(
        favoritePages: [],
      )));
      return false;
    } else {
      Navigator.of(context).pushReplacement(
          CustomPageRoute(page: Da3awatMonta5abaMenKitabAlkafiAlsharif()));
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
          toolbarHeight: isTablet ? 100 : 70,
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
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              padding: EdgeInsets.only(left: isTablet ? 50 : 30),
              icon: Icon(
                isIcon ? Icons.favorite_border : Icons.favorite_rounded,
                size: isTablet ? 40 : 25,
                color: isIcon ? Colors.white : Colors.red,
              ),
              onPressed: () async {
                setState(() {
                  isIcon = !isIcon;
                });
                await _saveFavoriteState(isIcon);

                if (!isIcon) {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .addFavorite(
                          'في ذكر بعض ما ورد للهم والغم والخوف وغيرها',
                          FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في ذكر بعض ما ورد للهم والغم والخوف وغيرها',
                          FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha
                              .screenRoute,
                          FiZikrBa3dMaWaradLilhamWal8amWal5awfWa8airaha
                              .screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(
                title: 'في ذكر بعض ما ورد للهم والغم والخوف وغيرها'),
          ),
        ),
        body: BlocBuilderAlbakiyatAlsalihat(
          text: 'في ذكر بعض ما ورد للهم والغم والخوف وغيرها',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FiAd3iyatAl3ilalWalmarad.screenRoute,
          pushBack: FiZikrDou3a2ainLildin.screenRoute,
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
