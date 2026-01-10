import '../../../Util/app_imports.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode themeMode =
      ThemeMode.system == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light;

  bool get isDarkMode {
    return themeMode == ThemeMode.dark;
  }

  void toggleTheme(bool newValue) {
    themeMode = newValue ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
