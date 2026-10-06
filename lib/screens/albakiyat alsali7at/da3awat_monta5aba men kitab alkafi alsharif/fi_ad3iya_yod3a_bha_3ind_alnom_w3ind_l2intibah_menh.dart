import '../../../Util/app_imports.dart';

class FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh extends StatefulWidget {
  static String screenRoute =
      'fi_ad3iya_yod3a_bha_3ind_alnom_w3ind_l2intibah_menh_screen';
  const FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh({super.key});

  @override
  State<FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh> createState() =>
      _FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenhState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenhState
    extends State<FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_ad3iya_yod3a_bha_3ind_alnom_w3ind_l2intibah_menh_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_ad3iya_yod3a_bha_3ind_alnom_w3ind_l2intibah_menh_screen',
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
                          'في ادعية يدعى بها عند النوم وعند الانتباه منه',
                          FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في ادعية يدعى بها عند النوم وعند الانتباه منه',
                          FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh
                              .screenRoute,
                          FiAd3iyaYod3aBha3indAlnomW3indL2intibahMenh
                              .screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(
                title: 'في ادعية يدعى بها عند النوم وعند الانتباه منه'),
          ),
        ),
        body: BlocBuilderAlbakiyatAlsalihat(
          text: 'في ادعية يدعى بها عند النوم وعند الانتباه منه',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext:
              FiZikr3idatDa3awatYod3aBha2iza5arajL2insanMenManzlhi.screenRoute,
          pushBack:
              Fi3idaMenAl2ad3iyaAllatiYod3aBihaSaba7anWmasa2an.screenRoute,
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
