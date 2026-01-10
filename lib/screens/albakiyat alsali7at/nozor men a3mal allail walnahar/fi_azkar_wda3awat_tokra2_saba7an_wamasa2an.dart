import '../../../Util/app_imports.dart';


class FiAzkarWda3awatTokra2Saba7anWamasa2an extends StatefulWidget {
  static String screenRoute =
      'fi_azkar_wda3awat_tokra2_saba7an_wamasa2an_screen';
  const FiAzkarWda3awatTokra2Saba7anWamasa2an({super.key});

  @override
  State<FiAzkarWda3awatTokra2Saba7anWamasa2an> createState() =>
      _FiAzkarWda3awatTokra2Saba7anWamasa2anState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiAzkarWda3awatTokra2Saba7anWamasa2anState
    extends State<FiAzkarWda3awatTokra2Saba7anWamasa2an> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_azkar_wda3awat_tokra2_saba7an_wamasa2an_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_azkar_wda3awat_tokra2_saba7an_wamasa2an_screen', value);
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
          .pushReplacementNamed(NozorMenA3malAllailWalnahar.screenRoute);
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
                      .addFavorite('في اذكار ودعوات تقرأ صباحاً ومساءً',
                          FiAzkarWda3awatTokra2Saba7anWamasa2an.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في اذكار ودعوات تقرأ صباحاً ومساءً',
                          FiAzkarWda3awatTokra2Saba7anWamasa2an.screenRoute,
                          FiAzkarWda3awatTokra2Saba7anWamasa2an.screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(title: 'في اذكار ودعوات تقرأ صباحاً ومساءً'),
          ),
        ),
        body: BlocBuilderAlbakiyatAlsalihat(
          text: 'في اذكار ودعوات تقرأ صباحاً ومساءً',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FimaYod3aBihiFikolSa3aMenSa3atAlyawm.screenRoute,
          pushBack: FiL2intibahMenAlnawmWsalatAllayl.screenRoute,
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
