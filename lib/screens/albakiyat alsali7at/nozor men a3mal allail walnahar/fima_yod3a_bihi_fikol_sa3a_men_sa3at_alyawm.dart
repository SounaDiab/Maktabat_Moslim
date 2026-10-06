import '../../../Util/app_imports.dart';

class FimaYod3aBihiFikolSa3aMenSa3atAlyawm extends StatefulWidget {
  static String screenRoute =
      'fima_yod3a_bihi_fikol_sa3a_men_sa3at_alyawm_screen';
  const FimaYod3aBihiFikolSa3aMenSa3atAlyawm({super.key});

  @override
  State<FimaYod3aBihiFikolSa3aMenSa3atAlyawm> createState() =>
      _FimaYod3aBihiFikolSa3aMenSa3atAlyawmState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FimaYod3aBihiFikolSa3aMenSa3atAlyawmState
    extends State<FimaYod3aBihiFikolSa3aMenSa3atAlyawm> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fima_yod3a_bihi_fikol_sa3a_men_sa3at_alyawm_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fima_yod3a_bihi_fikol_sa3a_men_sa3at_alyawm_screen', value);
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
          CustomPageRoute(page: NozorMenA3malAllailWalnahar()));
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
                      .addFavorite('فيما يدعى به في كل ساعة من ساعات اليوم',
                          FimaYod3aBihiFikolSa3aMenSa3atAlyawm.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'فيما يدعى به في كل ساعة من ساعات اليوم',
                          FimaYod3aBihiFikolSa3aMenSa3atAlyawm.screenRoute,
                          FimaYod3aBihiFikolSa3aMenSa3atAlyawm.screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(title: 'فيما يدعى به في كل ساعة من ساعات اليوم'),
          ),
        ),
        body: BlocBuilderAlbakiyatAlsalihat(
          text: 'فيما يدعى به في كل ساعة من ساعات اليوم',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FimaYata3alakBel8odat.screenRoute,
          pushBack: FiAzkarWda3awatTokra2Saba7anWamasa2an.screenRoute,
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
