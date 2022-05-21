import 'dart:io';

class AdsManager {
  static const bool isAdsEnabled = false;
  static const bool _testMode = true;

  static const timeToShowAd = 22;

  /// AppID
  static String get appId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3465655585438996~3497529715";
    } else {
      throw UnsupportedError("Unsuported Platform");
    }
  }

  /// BannerAdUnitId
  static String get bannerAdUnitId {
    if (_testMode) {
      // Development
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/6300978111';
      }
    } else {
      // Production
      if (Platform.isAndroid) {
        return "ca-app-pub-3465655585438996/4943554894";
      }
    }
    throw UnsupportedError("Unsupported platform");
  }

  /// IntersitialAdUnitId
  static String get intersitialAdUnitId {
    if (_testMode) {
      // Development
      if (Platform.isAndroid) {
        return 'ca-app-pub-3940256099942544/1033173712';
      }
    } else {
      // Production
      if (Platform.isAndroid) {
        return "ca-app-pub-3465655585438996/2148484134";
      }
    }
    throw UnsupportedError("Unsupported platform");
  }
}
