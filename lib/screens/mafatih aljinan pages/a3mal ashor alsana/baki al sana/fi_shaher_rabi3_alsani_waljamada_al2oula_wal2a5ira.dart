import '../../../../Util/app_imports.dart';
import '../../../../widgets/bloc_builder_mafatih_aljinan.dart';


class FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira extends StatefulWidget {
  static String screenRoute =
      'fi_shaher_rabi3_alsani_waljamada_al2oula_wal2a5ira_screen';
  const FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira({super.key});

  @override
  State<FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira> createState() =>
      _FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5iraState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5iraState
    extends State<FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool(
        'isFavorite_fi_shaher_rabi3_alsani_waljamada_al2oula_wal2a5ira_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isFavorite_fi_shaher_rabi3_alsani_waljamada_al2oula_wal2a5ira_screen',
        value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(BakiAlsana.screenRoute);
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
                      .addFavorite(
                          'في شهر ربيع الثاني والجمادى الاولى والاخرة',
                          FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira
                              .screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(
                          'في شهر ربيع الثاني والجمادى الاولى والاخرة',
                          FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira
                              .screenRoute,
                          FiShaherRabi3AlsaniWaljamadaAl2oulaWal2a5ira
                              .screenRoute);
                }
              },
            ),
          ],
          title: SizedBox(
            height: isTablet ? 60 : 30,
            child: ScrollTitle(
                title: 'في شهر ربيع الثاني والجمادى الاولى والاخرة'),
          ),
        ),
        body: BlocBuilderMafatihAljinan(
          text: 'في شهر ربيع الثاني والجمادى الاولى والاخرة',
          fontSize: _fontSize,
          fontSizeTablet: _fontSizeTablet,
        ),
        bottomNavigationBar: AddCustomBottomNavigationBar(
          pushNext: Fi2a3mal3amaWa2a3malAlnayrouzWa2a3malAl2ashhorAlromiya
              .screenRoute,
          pushBack: FiShaherRabi3Al2awal.screenRoute,
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
