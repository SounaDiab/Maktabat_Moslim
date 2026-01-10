import '../../../../Util/app_imports.dart';
import '../../../../widgets/bloc_builder_mafatih_aljinan.dart';


class Fima3alaAlza2irMora3atoh extends StatefulWidget {
  static String screenRoute = 'fima_3ala_alza2ir_mora3atoh_screen';
  const Fima3alaAlza2irMora3atoh({super.key});

  @override
  State<Fima3alaAlza2irMora3atoh> createState() =>
      _Fima3alaAlza2irMora3atohState();
}

double _fontSize = 18;
double _fontSizeTablet = 30;

class _Fima3alaAlza2irMora3atohState extends State<Fima3alaAlza2irMora3atoh> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState =
        prefs.getBool('isFavorite_fima_3ala_alza2ir_mora3atoh_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_fima_3ala_alza2ir_mora3atoh_screen', value);
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
                Provider.of<FavoritesProvider>(context, listen: false)
                    .addFavorite('فيما على الزائر مراعاته',
                        Fima3alaAlza2irMora3atoh.screenRoute);
              } else {
                Provider.of<FavoritesProvider>(context, listen: false)
                    .removeFavorite(
                        'فيما على الزائر مراعاته',
                        Fima3alaAlza2irMora3atoh.screenRoute,
                        Fima3alaAlza2irMora3atoh.screenRoute);
              }
            },
          ),
        ],
        title: SizedBox(
          height: 30,
          child: ScrollTitle(title: 'فيما على الزائر مراعاته'),
        ),
      ),
      body: BlocBuilderMafatihAljinan(
        text: 'فيما على الزائر مراعاته',
        fontSize: _fontSize,
        fontSizeTablet: _fontSizeTablet,
      ),
      bottomNavigationBar: AddCustomBottomNavigationBar(
        pushNext: AlziyaratAlmotlakaAl2oula.screenRoute,
        pushBack: FiFadlZiyaratAlhussein.screenRoute,
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
