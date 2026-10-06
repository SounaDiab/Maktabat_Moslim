import '../../../Util/app_imports.dart';

class FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5ira extends StatefulWidget {
  static String screenRoute =
      'fi_da3awat_mojzat_ljami3_7wa2ej_aldonia_wal2a5ira_screen';
  const FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5ira({super.key});

  @override
  State<FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5ira> createState() =>
      _FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5iraState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5iraState
    extends State<FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5ira> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_da3awat_mojzat_ljami3_7wa2ej_aldonia_wal2a5ira_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_da3awat_mojzat_ljami3_7wa2ej_aldonia_wal2a5ira_screen',
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
                          'في دعوات موجزات لجميع حوائج الدنيا والاخرة',
                          FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5ira
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في دعوات موجزات لجميع حوائج الدنيا والاخرة',
                          FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5ira
                              .screenRoute,
                          FiDa3awatMojzatLjami37wa2ejAldoniaWal2a5ira
                              .screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(
                title: 'في دعوات موجزات لجميع حوائج الدنيا والاخرة'),
          ),
        ),
        body: BlocBuilderAlbakiyatAlsalihat(
          text: 'في دعوات موجزات لجميع حوائج الدنيا والاخرة',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3a2Al2i7tijabAmirAlmo2minin.screenRoute,
          pushBack: FiBa3dAla7razWal3owaz.screenRoute,
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
