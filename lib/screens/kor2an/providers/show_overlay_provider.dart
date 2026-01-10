import '../../../Util/app_imports.dart';

class ShowOverlayProvider extends ChangeNotifier {
  bool isShowOverlay = false;

  void toggleisShowOverlay() {
    isShowOverlay = !isShowOverlay;
    notifyListeners();
  }
}
