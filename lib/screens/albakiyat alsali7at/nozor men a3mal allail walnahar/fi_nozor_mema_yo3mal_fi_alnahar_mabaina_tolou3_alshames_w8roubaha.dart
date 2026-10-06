import '../../../Util/app_imports.dart';

class FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha
    extends StatefulWidget {
  static String screenRoute =
      'fi_nozor_mema_yo3mal_fi_alnahar_mabaina_tolou3_alshames_w8roubaha_screen';
  const FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha({super.key});

  @override
  State<FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha>
      createState() =>
          _FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubahaState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubahaState
    extends State<FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_nozor_mema_yo3mal_fi_alnahar_mabaina_tolou3_alshames_w8roubaha_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_nozor_mema_yo3mal_fi_alnahar_mabaina_tolou3_alshames_w8roubaha_screen',
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
                      .addFavorite(
                          'في نزر مما يعمل في النهار ما بين طلوع الشمس وغروبها',
                          FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في نزر مما يعمل في النهار ما بين طلوع الشمس وغروبها',
                          FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha
                              .screenRoute,
                          FiNozorMemaYo3malFiAlnaharMabainaTolou3AlshamesW8roubaha
                              .screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(
                title: 'في نزر مما يعمل في النهار ما بين طلوع الشمس وغروبها'),
          ),
        ),
        body: BlocBuilderAlbakiyatAlsalihat(
          text: 'في نزر مما يعمل في النهار ما بين طلوع الشمس وغروبها',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: FimaYo3malMen7inAl8ouroub2ela7inAlnawm.screenRoute,
          pushBack: Alta3kibatAl5asaBfaridatAlsob7.screenRoute,
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
