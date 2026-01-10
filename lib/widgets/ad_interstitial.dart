import '../Util/app_imports.dart';

class InterstitialAdManager {
  InterstitialAd? _interstitialAd;
  bool _isAdReady = false;

  void loadAd(String adUnitId) {
    InterstitialAd.load(
      adUnitId: adUnitId, // 🔹 استبدل لاحقًا بالحقيقي
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd = ad;
          _isAdReady = true;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              loadAd(adUnitId); // إعادة التحميل
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              ad.dispose();
            },
          );
        },
        onAdFailedToLoad: (error) {
          _isAdReady = false;
          debugPrint('Interstitial failed to load: ${error.code}');
        },
      ),
    );
  }

  void showAd() {
    if (_isAdReady && _interstitialAd != null) {
      _interstitialAd!.show();
      _isAdReady = false;
    }
  }

  void dispose() {
    _interstitialAd?.dispose();
  }
}
