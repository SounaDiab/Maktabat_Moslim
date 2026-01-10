import '../../../Util/app_imports.dart';
import '../../../widgets/bloc_builder_salat_lail.dart';

class WaktahaWakaifyatiha extends StatefulWidget {
  static String screenRoute = 'waktaha_wakaifyatiha_screen';
  const WaktahaWakaifyatiha({super.key});

  @override
  State<WaktahaWakaifyatiha> createState() => _WaktahaWakaifyatihaState();
}

class _WaktahaWakaifyatihaState extends State<WaktahaWakaifyatiha> {
  bool isIcon = true;
  bool _showHiddenButtons = false;

  double _fontSize = 18;
  double _fontSizeTablet = 30;

  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_waktaha_wakaifyatiha_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_waktaha_wakaifyatiha_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(SalatAllayl.screenRoute);
      return false;
    }
  }

  Key selectableKey = UniqueKey();
  // bool _hasSelection = false;

  void _clearSelection() {
    setState(() {
      selectableKey = UniqueKey(); // إعادة بناء SelectableText
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() {
            _showHiddenButtons = !_showHiddenButtons;
          });
        },
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
                  color: isIcon ? Colors.black : Colors.red,
                ),
                onPressed: () async {
                  setState(() {
                    isIcon = !isIcon;
                  });
                  await _saveFavoriteState(isIcon);

                  if (!isIcon) {
                    Provider.of<FavoritesProvider>(context, listen: false)
                        .addFavorite(
                            'وقتها وكيفيتها', WaktahaWakaifyatiha.screenRoute);
                  } else {
                    Provider.of<FavoritesProvider>(context, listen: false)
                        .removeFavorite(
                            'وقتها وكيفيتها',
                            WaktahaWakaifyatiha.screenRoute,
                            WaktahaWakaifyatiha.screenRoute);
                  }
                },
              ),
            ],
            title: SizedBox(
              height: isTablet ? 60 : 30,
              child: ScrollTitle(title: 'وقتها وكيفيتها'),
            ),
          ),
          body: Stack(
            children: [
              BlocBuilderSalatLail(
                text: 'وقتها وكيفيتها',
                fontSize: _fontSize,
                fontSizeTablet: _fontSizeTablet,
              ),
              Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    setState(() {
                      _showHiddenButtons = !_showHiddenButtons;
                    });
                    FocusScope.of(context)
                        .unfocus(); // إخفاء الكيبورد لو كان ظاهر
                    // اخفاء التحديد
                    _clearSelection;
                  },
                ),
              ),
              if (_showHiddenButtons)
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(TesbihPage.screenRoute);
                        },
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.red,
                          size: isTablet ? 40 : 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(NameListPage.screenRoute);
                        },
                        child: Icon(
                          Icons.group_add,
                          color: Colors.red,
                          size: isTablet ? 40 : 20,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          bottomNavigationBar: AddCustomBottomNavigationBar(
            pushNext: Dou3aaBa3dSalatAlwater.screenRoute,
            pushBack: SawabahaWaFawa2idaha.screenRoute,
            soud: '',
            onTap: (double fontSize) {
              setState(() {
                isTablet ? _fontSizeTablet = fontSize : _fontSize = fontSize;
              });
              Navigator.of(context).pop();
            },
            onLongPress: () {
              final snackBar = SnackBar(
                content: Center(
                  child: Text(
                    '${isTablet ? _fontSizeTablet.toInt() : _fontSize.toInt()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                width: 60,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.blue,
                duration: const Duration(seconds: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ),
      ),
    );
  }
}
