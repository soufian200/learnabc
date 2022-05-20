import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnabc/widgets/button_widget.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class Preview extends StatefulWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  late String _title;
  late List _items;
  late bool isConnected = false;

  void checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      setState(() {
        isConnected = false;
      });
    } else {
      setState(() {
        isConnected = true;
      });
      if (_items.isNotEmpty) play(_items[0]["audio"]);
    }
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    var data = Get.arguments;
    setState(() {
      _title = data["title"];
      _items = data["items"];
    });

    checkConnection();

    super.initState();
  }

  int _currentPage = 0;

  final PageController pageController = PageController(viewportFraction: 1);

  AudioPlayer audioPlayer = AudioPlayer();
  final player = AudioCache(prefix: "assets/sounds/");
  play(String audio) async {
    final url = await player.load(audio);
    await audioPlayer.play(url.path, isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.green[800], // status bar color
    ));

    return Scaffold(
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
      child: !isConnected
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.wifi_off_outlined,
                    size: 80.sp,
                  ),
                  Text("لا توجد شبكة",
                      style: TextStyle(
                        fontFamily: "Madani",
                        fontSize: 16.sp,
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        checkConnection();
                      },
                      child: Text("حاول مرة اخرى",
                          style: TextStyle(
                            fontFamily: "Madani",
                            fontSize: 15.sp,
                          )))
                ],
              ),
            )
          : Column(
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
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      margin: EdgeInsets.only(top: 25.h),
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
                                  bottom: -8.h,
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
                              pageController.animateToPage(_currentPage + 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeIn);
                            },
                            img: "buttons/backword.png",
                            size: 76.w),
                        Button(
                            onTap: () {
                              play(_items[_currentPage % _items.length]
                                  ["audio"]);
                            },
                            img: "buttons/volume.png",
                            size: 106.w),
                        Button(
                            onTap: () {
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
