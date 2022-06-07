import 'package:get/get.dart';
import 'package:learnabc/AdsManager.dart';
import 'package:learnabc/controllers/interstitial_controller.dart';

class InterAdBinding implements Bindings {
  @override
  void dependencies() {
    if (AdsManager.isAdsEnabled) {
      Get.put(InterstitialAdController());
    }
  }
}
