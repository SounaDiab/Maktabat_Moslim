import '../../../../Util/app_imports.dart';
import '../../../../widgets/bloc_builder_mafatih_aljinan.dart';

class AllaylaAlsabi3aWal3ishrounRamadan extends StatefulWidget {
  static String screenRoute = 'allayla_alsabi3a_wal3ishroun_ramadan_screen';
  const AllaylaAlsabi3aWal3ishrounRamadan({super.key});

  @override
  State<AllaylaAlsabi3aWal3ishrounRamadan> createState() =>
      _AllaylaAlsabi3aWal3ishrounRamadanState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AllaylaAlsabi3aWal3ishrounRamadanState
    extends State<AllaylaAlsabi3aWal3ishrounRamadan> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_allayla_alsabi3a_wal3ishroun_ramadan_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_allayla_alsabi3a_wal3ishroun_ramadan_screen', value);
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
      Navigator.of(context).pushReplacement(CustomPageRoute(page: Ramadan()));
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
                      .addFavorite('الليلة السابعة والعشرون',
                          AllaylaAlsabi3aWal3ishrounRamadan.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'الليلة السابعة والعشرون',
                          AllaylaAlsabi3aWal3ishrounRamadan.screenRoute,
                          AllaylaAlsabi3aWal3ishrounRamadan.screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(title: 'الليلة السابعة والعشرون'),
          ),
        ),
        body: BlocBuilderMafatihAljinan(
          text: 'الليلة السابعة والعشرون',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Dou3aaAllaylaAlsaminaWal3ishrounRamadan.screenRoute,
          pushBack: Dou3aaAllaylaAlsabi3aWal3ishrounRamadan.screenRoute,
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
