import '../Util/app_imports.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Map<String, String>> _favorites = [];

  List<Map<String, String>> get favorites => _favorites;

  FavoritesProvider() {
    loadFavorites();
  }

  void addFavorite(String title, String route) async {
    if (!_favorites
        .any((fav) => fav['title'] == title && fav['route'] == route)) {
      _favorites.add({'title': title, 'route': route});
      await saveFavorites();
      notifyListeners();
    }
  }

  void removeFavorite(String title, String route, String screenRoute) async {
    _favorites
        .removeWhere((fav) => fav['title'] == title && fav['route'] == route);
    await saveFavorites();
    notifyListeners();
  }

  Future<void> saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson =
        jsonEncode(_favorites.toList()); // تحويل القائمة إلى JSON
    await prefs.setString('favorites', favoritesJson);
  }

  // استرجاع المفضلات من SharedPreferences
  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesJson = prefs.getString('favorites');
    if (favoritesJson != null) {
      final List<dynamic> decodedList = jsonDecode(favoritesJson);
      _favorites.clear();
      _favorites.addAll(
          decodedList.map((item) => Map<String, String>.from(item)).toList());
      notifyListeners();
    }
  }
}
