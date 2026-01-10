import '../../../Util/app_imports.dart';


class SalatYawmAl2arbi3aa2 extends StatefulWidget {
  static String screenRoute = 'salat_yawm_al2arbi3aa2_screen';
  const SalatYawmAl2arbi3aa2({super.key});

  @override
  State<SalatYawmAl2arbi3aa2> createState() => _SalatYawmAl2arbi3aa2State();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _SalatYawmAl2arbi3aa2State extends State<SalatYawmAl2arbi3aa2> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_salat_yawm_al2arbi3aa2_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_salat_yawm_al2arbi3aa2_screen', value);
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
          .pushReplacementNamed(ZikrSalawatAyamAl2osbou3.screenRoute);
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
                      .addFavorite('صلاة يوم الاربعاء',
                          SalatYawmAl2arbi3aa2.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'صلاة يوم الاربعاء',
                          SalatYawmAl2arbi3aa2.screenRoute,
                          SalatYawmAl2arbi3aa2.screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(title: 'صلاة يوم الاربعاء'),
          ),
        ),
        body: BlocBuilderAlbakiyatAlsalihat(
          text: 'صلاة يوم الاربعاء',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: SalatYawmAl5amiss.screenRoute,
          pushBack: SalatYawmAlsoulasaa2.screenRoute,
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
