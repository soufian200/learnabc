import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:learnabc/AdsManager.dart';
import 'package:learnabc/controllers/interstitial_controller.dart';
import 'package:learnabc/widgets/button_widget.dart';
import 'package:get/get.dart';

class Preview extends StatefulWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  late String _title;
  late List _items;

  late BannerAd _bannerAd;
  bool _isBannerAdLoaded = false;
  int numOfPlayed = 0;

  int _currentPage = 0;

  final PageController pageController = PageController(viewportFraction: 1);

  AudioPlayer audioPlayer = AudioPlayer();
  final player = AudioCache(prefix: "assets/sounds/");

  ///
  /// Play Audio
  play(String audio) async {
    final url = await player.load(audio);
    await audioPlayer.play(url.path, isLocal: true);
  }

  ///
  /// Load Banner Ads
  ///  */
  void loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdsManager.bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          _isBannerAdLoaded = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
        print('Ad load failed (code=${error.code} message=${error.message})');
      }),
    );
    _bannerAd.load();
  }

  /// load interstital ad
  void loadInterAd() {
    ///
    if (AdsManager.isAdsEnabled) {
      late InterstitialAdController interstitialAdController = Get.find();
      interstitialAdController.show();
    }
  }

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    /// change navbar bg color
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xff4E944F) // navigation bar color
        ));

    ///
    var data = Get.arguments;
    setState(() {
      _title = data["title"];
      _items = data["items"];
    });
    play(_items[0]["audio"]);

    /// Load Ads
    if (AdsManager.isAdsEnabled) {
      loadBannerAd();
    }
  }

  @override
  void dispose() {
    if (AdsManager.isAdsEnabled) {
      _bannerAd.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.green[800], // status bar color
    ));

    return Scaffold(
        bottomNavigationBar: _isBannerAdLoaded && AdsManager.isAdsEnabled
            ? Container(
                alignment: Alignment.center,
                height: _bannerAd.size.height.toDouble(),
                width: _bannerAd.size.width.toDouble(),
                child: AdWidget(ad: _bannerAd),
              )
            : const SizedBox(),
        body: SafeArea(
            child: Container(
          padding: EdgeInsets.all(10.r),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xffBDE6F1),
            image: DecorationImage(
              alignment: Alignment.bottomCenter,
              image: AssetImage("assets/bgg.png"),
              fit: BoxFit.contain,
            ),
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button(
                      onTap: () {
                        Get.back();
                      },
                      img: "buttons/backword.png",
                      size: 60.w),
                  Text(
                    _title,
                    style: TextStyle(
                      fontSize: 40.sp,
                      fontFamily: "Dahka",
                      color: const Color(0xff1A132F),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                // color: Colors.red,
                width: 320.w,
                height: 380.h,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    onPageChanged: (index) {
                      play(_items[index % _items.length]["audio"]);
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    reverse: true,
                    itemBuilder: (context, index) {
                      return Stack(children: [
                        _items[index % _items.length]["img"] == null
                            ? const SizedBox()
                            : Positioned.fill(
                                top: 45.h,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: 250.r,
                                    height: 250.r,
                                    decoration: BoxDecoration(
                                      // color: Colors.purple,
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/${_items[index % _items.length]["img"]}'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                        _items[index % _items.length]["letter"] == null
                            ? const SizedBox()
                            : Positioned.fill(
                                top: -12.h,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Text(
                                    "${_items[index % _items.length]["letter"]}",
                                    style: TextStyle(
                                        fontFamily: "Madani",
                                        fontSize: 80.sp,
                                        color: const Color(0xffE60965)),
                                  ),
                                ),
                              ),
                        _items[index % _items.length]["word"] == null
                            ? const SizedBox()
                            : Positioned.fill(
                                // bottom: 0.h,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Text(
                                    "${_items[index % _items.length]["word"]}",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 60.sp,
                                      fontFamily: 'Madani',
                                      color: const Color(0xff1A132F),
                                    ),
                                  ),
                                ),
                              ),
                      ]);
                    }),
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: SizedBox(
                  width: 300.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                          onTap: () {
                            ///
                            loadInterAd();

                            ///
                            pageController.animateToPage(_currentPage + 1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          },
                          img: "buttons/backword.png",
                          size: 76.w),
                      Button(
                          onTap: () {
                            ///
                            loadInterAd();

                            ///
                            play(_items[_currentPage % _items.length]["audio"]);
                          },
                          img: "buttons/volume.png",
                          size: 106.w),
                      Button(
                          onTap: () {
                            ///
                            loadInterAd();

                            ///
                            if (_currentPage > 0) {
                              pageController.animateToPage(_currentPage - 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn);
                            }
                          },
                          img: "buttons/forword.png",
                          size: 76.w),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
