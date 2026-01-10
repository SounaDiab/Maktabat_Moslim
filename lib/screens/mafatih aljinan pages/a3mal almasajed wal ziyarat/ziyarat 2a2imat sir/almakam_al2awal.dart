import '../../../../Util/app_imports.dart';
import '../../../../widgets/bloc_builder_mafatih_aljinan.dart';


class AlmakamAl2awal extends StatefulWidget {
  static String screenRoute = 'almakam_al2awal_screen';
  const AlmakamAl2awal({super.key});

  @override
  State<AlmakamAl2awal> createState() => _AlmakamAl2awalState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _AlmakamAl2awalState extends State<AlmakamAl2awal> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_almakam_al2awal_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_almakam_al2awal_screen', value);
  }

  Future<bool> _onWillPop() async {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    final previousPage = args?['previousPage'];
    if (previousPage == 'favorite_screen') {
      Navigator.of(context).pushReplacementNamed(FavoritesScreen.screenRoute);
      return false;
    } else {
      Navigator.of(context).pushReplacementNamed(Ziyarat2a2imatSir.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isTablet ? 100 : 70,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
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
                Provider.of<FavoritesProvider>(context, listen: false).addFavorite(
                    'المقام الاول: في زيارة أئمة سر من رأى (عليه السلام) واعمال السرداب',
                    AlmakamAl2awal.screenRoute);
              } else {
                Provider.of<FavoritesProvider>(context, listen: false)
                    .removeFavorite(
                        'المقام الاول: في زيارة أئمة سر من رأى (عليه السلام) واعمال السرداب',
                        AlmakamAl2awal.screenRoute,
                        AlmakamAl2awal.screenRoute);
              }
            },
          ),
        ],
        title: SizedBox(
          height: 30,
          child: ScrollTitle(
              title:
                  'المقام الاول: في زيارة أئمة سر من رأى (عليه السلام) واعمال السرداب'),
        ),
      ),
      body: BlocBuilderMafatihAljinan(
        text:
            'المقام الاول: في زيارة أئمة سر من رأى (عليه السلام) واعمال السرداب',
        fontSize: _fontSize,
        fontSizeTablet: _fontSizeTablet,
      ),
      bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: ZiyaratAlimamAl3askari.screenRoute,
        pushBack: ZiyaratAl2imamAlmahdiAl2o5raAlsalisa.screenRoute,
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
    );
  }
}
