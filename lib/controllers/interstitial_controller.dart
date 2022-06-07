import 'package:get/state_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:learnabc/AdsManager.dart';

class InterstitialAdController extends GetxController {
  ///
  /// Interstital Ad
  ///
  late InterstitialAd _interstitialAd;
  final RxBool _isInterstitialAdLoaded = false.obs;
  final RxInt _showedTimes = 1.obs;

  ///
  InterstitialAd get interstitialAd => _interstitialAd;

  ///
  int get showedTimes => _showedTimes.value;

  ///
  void show() {
    if (_showedTimes.value % 6 == 0) {
      if (_isInterstitialAdLoaded.value) {
        interstitialAd.show();
      }
    } else {
      if (!_isInterstitialAdLoaded.value) {
        loadIntertitialAd();
      }
    }
    _showedTimes.value++;
  }

  ///
  bool get isInterstitialAdLoaded => _isInterstitialAdLoaded.value;

  ///
  void loadIntertitialAd() {
    InterstitialAd.load(
        adUnitId: AdsManager.intersitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;

            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                // print(
                // '$ad onAdDismissedFullScreenContent.====================================================>');
                ad.dispose();
                _isInterstitialAdLoaded.value = false;
              },
            );
            _isInterstitialAdLoaded.value = true;
          },
          onAdFailedToLoad: (LoadAdError error) {
            // print('InterstitialAd failed to load: $error');
          },
        ));
  }
}
