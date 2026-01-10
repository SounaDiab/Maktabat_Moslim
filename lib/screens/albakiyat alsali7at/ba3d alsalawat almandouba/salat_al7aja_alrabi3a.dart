import '../../../Util/app_imports.dart';

class SalatAl7ajaAlrabi3a extends StatefulWidget {
  static String screenRoute = 'salat_al7aja_alrabi3a_screen';
  const SalatAl7ajaAlrabi3a({super.key});

  @override
  State<SalatAl7ajaAlrabi3a> createState() => _SalatAl7ajaAlrabi3aState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatAl7ajaAlrabi3aState extends State<SalatAl7ajaAlrabi3a> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_salat_al7aja_alrabi3a_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_al7aja_alrabi3a_screen', value);
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
          .pushReplacementNamed(Ba3dAlsalawatAlmandouba.screenRoute);
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
                      .addFavorite('صلاة الحاجة الرابعة',
                          SalatAl7ajaAlrabi3a.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة الحاجة الرابعة',
                          SalatAl7ajaAlrabi3a.screenRoute,
                          SalatAl7ajaAlrabi3a.screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(title: 'صلاة الحاجة الرابعة'),
          ),
        ),
        body: BlocBuilderAlbakiyatAlsalihat(
          text: 'صلاة الحاجة الرابعة',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatAl7ajaAl5amisa.screenRoute,
          pushBack: SalatAl7ajaAlsalisa.screenRoute,
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
