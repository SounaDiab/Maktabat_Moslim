import '../Util/app_imports.dart';

class SearchProvider with ChangeNotifier {
  List<Map<String, dynamic>> _allItems = [];
  List<Map<String, dynamic>> _filteredItems = [];

  List<Map<String, dynamic>> get filteredItems => _filteredItems;

  void setItems(List<Map<String, dynamic>> items) {
    _allItems = items;
    _filteredItems = items;
    notifyListeners();
  }

  void search(String query) {
    if (query.isEmpty) {
      _filteredItems = _allItems;
    } else {
      _filteredItems =
          _allItems.where((item) => item['title']!.contains(query)).toList();
    }
    notifyListeners();
  }

  void clearSearch() {
    _filteredItems = _allItems;
    notifyListeners();
  }
}
