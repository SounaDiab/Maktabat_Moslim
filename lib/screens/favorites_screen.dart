import 'package:flutter/material.dart';
import 'package:maktabat_almoslim/screens/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'favorites_provider.dart';

class FavoritesScreen extends StatefulWidget {
  static String screenRoute = 'favorite_screen';
  final List<Map<String, String>> favoritePages;

  FavoritesScreen({Key? key, required this.favoritePages}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<FavoritesProvider>(context, listen: false).loadFavorites();
  }

  Future<bool> _onWillPop() async {
    Navigator.of(context).pushReplacementNamed(WelcomeScreen.screenRoute);
    return false;
  }

  @override
  Widget build(BuildContext context) {
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
          title: Text(
            'المفضلة',
            style: TextStyle(
              fontSize: isTablet ? 40 : 19,
            ),
          ),
        ),
        body: Consumer<FavoritesProvider>(
          builder: (context, favoritesProvider, child) {
            final favorites = favoritesProvider.favorites;

            return favorites.isEmpty
                ? Center(
                    child: Text(
                      'لا توجد عناصر مفضلة بعد',
                      style: TextStyle(
                        fontSize: isTablet ? 40 : 19,
                        fontFamily: 'DiodrumArabic',
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      // ابحث عن اسم الصفحة والمسار في الـ favorites
                      final favorite = favorites[index];
                      return Column(
                        children: [
                          ListTile(
                            title: Text(
                              favorite['title']!,
                              style: TextStyle(
                                fontFamily: 'UthmanicHafs',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(context, favorite['route']!,
                                  arguments: {
                                    'previousPage': 'favorite_screen'
                                  });
                            },
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () async {
                                Provider.of<FavoritesProvider>(context,
                                        listen: false)
                                    .removeFavorite(favorite['title']!,
                                        favorite['route']!, favorite['route']!);
                                if (favorite['route']! == favorite['route']!) {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs.setBool(
                                      'isFavorite_${favorite['route']}', true);
                                }
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                            child: Divider(),
                          )
                        ],
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
