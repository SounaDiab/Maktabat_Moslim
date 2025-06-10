import 'package:flutter/material.dart';

class SearchProvider with ChangeNotifier {
  List<Map<String, String>> _allItems = [];
  List<Map<String, String>> _filteredItems = [];

  List<Map<String, String>> get filteredItems => _filteredItems;

  void setItems(List<Map<String, String>> items) {
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
