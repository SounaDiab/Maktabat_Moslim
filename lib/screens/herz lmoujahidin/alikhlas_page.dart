import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/sowar_koraan.dart';
import '../favorites_provider.dart';
import '../favorites_screen.dart';
import '../herz_almoujahidin_home_screen.dart';
import 'alfalak_page.dart';
import 'alkafiroun_page.dart';

class AlikhlasPage extends StatefulWidget {
  static String screenRoute = 'alikhlas_screen';
  AlikhlasPage({super.key});

  @override
  State<AlikhlasPage> createState() => _AlikhlasPageState();
}

class _AlikhlasPageState extends State<AlikhlasPage> {
  bool isIcon = true;
  @override
  void initState() {
    super.initState();
    _loadFavoriteState();
  }

  Future<void> _loadFavoriteState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? savedState = prefs.getBool('isFavorite_alikhlas_screen');
    setState(() {
      isIcon = savedState ?? true;
    });
  }

  Future<void> _saveFavoriteState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFavorite_alikhlas_screen', value);
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
          .pushReplacementNamed(HerzAlmoujahidinHomeScreen.screenRoute);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    String name = 'سورة الإخلاص';
    double size = MediaQuery.of(context).textScaleFactor;
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth >= 600;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: isTablet ? 100 : 50,
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
                      .addFavorite(name, AlikhlasPage.screenRoute);
                } else {
                  Provider.of<FavoritesProvider>(context, listen: false)
                      .removeFavorite(name, AlikhlasPage.screenRoute,
                          AlikhlasPage.screenRoute);
                }
              },
            ),
          ],
          title: Text(
            name,
            style: TextStyle(
              fontSize: isTablet
                  ? 40
                  : size > 1.0
                      ? 16
                      : 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SowarKoraan(
          title: name,
          basmala: 'بسم الله الرحمن الرحيم',
          koraan:
              'قُلۡ هُوَ ٱللَّهُ أَحَدٌ (1) ٱللَّهُ ٱلصَّمَدُ (2) لَمۡ يَلِدۡ وَلَمۡ يُولَدۡ (3) وَلَمۡ يَكُن لَّهُۥ كُفُوًا أَحَدُۢ (4)',
          music:
              'https://cdn.jsdelivr.net/gh/SounaDiab/image_audio@master/audio/$name.mp3',
          next: AlfalakPage.screenRoute,
          back: AlkafirounPage.screenRoute,
        ),
      ),
    );
  }
}
