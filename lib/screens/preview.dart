import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnabc/utils/Func.dart';
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
  @override
  void initState() {
    var data = Get.arguments;
    setState(() {
      _title = data["title"];
      _items = data["items"];
    });

    if (_items.isNotEmpty) play(_items[0]["audio"]);
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

  var randomColor = Color(Funcs.getRandomColor());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.all(10.0),
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        // color: Color(0xffBDE6F1),
        image: DecorationImage(
          alignment: Alignment.bottomCenter,
          image: AssetImage("assets/green-earth.png"),
          fit: BoxFit.contain,
        ),
      ),
      child: Container(
        child: Column(
          children: [
            Container(
              child: Row(
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
                      color: const Color(0xFF3A3845),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 440.h,
              width: double.infinity,
              child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: pageController,
                  onPageChanged: (index) {
                    play(_items[index]["audio"]);
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: _items.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          width: 300.w,
                          height: 400.h,
                          // color: Colors.amber[100],
                          child: Stack(children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  margin: EdgeInsets.only(top: 40.h),
                                  width: 250.w,
                                  height: 250.w,
                                  decoration: BoxDecoration(
                                    // color: Colors.red,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/${_items[index]["img"]}'),
                                      fit: BoxFit.contain,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                  ),
                                ),
                              ),
                            ),
                            _items[index]["letter"] == null
                                ? const SizedBox()
                                : Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        "${_items[index]["letter"]}",
                                        style: TextStyle(
                                            fontFamily: "Madani",
                                            fontSize: 100.sp,
                                            color: randomColor),
                                      ),
                                    ),
                                  ),
                            Positioned.fill(
                              bottom: -10.h,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "${_items[index]["word"]}",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 65.sp,
                                    fontFamily: 'Madani',
                                    color: Color(Funcs.getRandomColor()),
                                  ),
                                ),
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    );
                  }),
            ),
            Center(
              child: SizedBox(
                width: 300.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Button(
                        onTap: () {
                          print("backword - clicked...................");
                          print(_currentPage + 1);
                          pageController.animateToPage(_currentPage + 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn);
                        },
                        img: "buttons/backword.png",
                        size: 80.w),
                    Button(
                        onTap: () {
                          print("clicked...................");
                          play(_items[_currentPage]["audio"]);
                        },
                        img: "buttons/volume.png",
                        size: 110.w),
                    Button(
                        onTap: () {
                          print("forword - clicked...................");
                          if (_currentPage > 0) {
                            print(_currentPage - 1);
                            pageController.animateToPage(_currentPage - 1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          }
                        },
                        img: "buttons/forword.png",
                        size: 80.w),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )));
  }
}
