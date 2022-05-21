import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:learnabc/AdsManager.dart';
import 'package:learnabc/utils/AppRoutes.dart';
import 'package:learnabc/widgets/button_widget.dart';

class CardWidget extends StatefulWidget {
  final String img;
  final String title;
  final List items;
  final int bgColor;
  final int shadowColor;
  const CardWidget(
      {Key? key,
      required this.img,
      required this.title,
      required this.items,
      required this.bgColor,
      required this.shadowColor})
      : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late InterstitialAd _interstitialAd;
  bool _isInterstitialAdLoaded = false;

  _loadIntertitialAd() {
    InterstitialAd.load(
        adUnitId: AdsManager.intersitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            // Keep a reference to the ad so you can show it later.
            _interstitialAd = ad;
            _isInterstitialAdLoaded = true;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  void initState() {
    super.initState();
    if (AdsManager.isAdsEnabled) {
      _loadIntertitialAd();
    }
  }

  @override
  void dispose() {
    if (AdsManager.isAdsEnabled) {
      _interstitialAd.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _onTap() {
      if (_isInterstitialAdLoaded && AdsManager.isAdsEnabled) {
        _interstitialAd.show();
      }

      Get.toNamed(AppRoutes.preview,
          arguments: {"title": widget.title, "items": widget.items});
    }

    return Column(
      children: [
        Material(
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          child: InkWell(
            onTap: () {
              _onTap();
            },
            child: Ink(
              width: double.infinity,
              height: 165.h,
              child: Container(
                padding: EdgeInsets.all(10.w),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(widget.bgColor),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(widget.shadowColor),
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: Offset(-5.w, 5.h), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontFamily: "Madani",
                              fontSize: 30.sp,
                              color: Colors.white),
                        ),
                        Button(
                            onTap: () {
                              _onTap();
                            },
                            img: "buttons/forword.png",
                            size: 56.w),
                      ],
                    ),
                    Container(
                      width: 150.r,
                      height: 150.r,
                      decoration: BoxDecoration(
                        // color: Colors.lime[100],
                        image: DecorationImage(
                          image: AssetImage('assets/${widget.img}'),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.r),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
