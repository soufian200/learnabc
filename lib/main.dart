import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnabc/utils/Func.dart';
import 'package:learnabc/widgets/button_widget.dart';
import 'package:learnabc/widgets/card_widget.dart';

void main() {
  runApp(ScreenUtilInit(
      designSize: const Size(414, 736),
      builder: (_) => GetMaterialApp(
            defaultTransition: Transition.rightToLeftWithFade,
            debugShowCheckedModeBanner: false,
            initialRoute: "/",
            getPages: [
              GetPage(
                  name: "/",
                  page: () => const MyHomePage(
                        title: 'hello world',
                      )),
            ],
          )));
}

class Preview extends StatefulWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  State<Preview> createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  int _currentPage = 0;

  final PageController pageController = PageController(viewportFraction: 1);

  List items = [
    {
      "letter": "أ",
      "word": "أرنب",
      "img": "animals/rabbit.png",
      "audio": "1.mp3",
    },
    {
      "letter": "ب",
      "word": "ببغاء",
      "img": "animals/parrot.png",
      "audio": "2.mp3",
    },
    {
      "letter": "ت",
      "word": "تمساح",
      "img": "animals/crocodile.png",
      "audio": "3.mp3",
    },
  ];
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
                        print("backword - clicked...................");
                      },
                      img: "buttons/backword.png",
                      size: 60.w),
                  Text(
                    "الحروف",
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
                    print(index);
                    play(items[index]["audio"]);
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: items.length,
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
                                          'assets/${items[index]["img"]}'),
                                      fit: BoxFit.contain,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(10.0)),
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "${items[index]["letter"]}",
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
                                  "${items[index]["word"]}",
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
                          play(items[_currentPage]["audio"]);
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

// ==========================

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.green,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: const Preview());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List items = [
    {
      "title": "1",
    },
    {
      "title": "2",
    },
    {
      "title": "1",
    },
    {
      "title": "2",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        // padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/bg.png"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "Learn Kids",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CardWidget(
                        img: "letters.png",
                        title: "الحروف",
                        bgColor: 0xFF83BD75,
                        shadowColor: 0xFF4E944F),
                    CardWidget(
                        img: "numbers.png",
                        title: "اﻷعداد",
                        bgColor: 0xFFA85CF9,
                        shadowColor: 0xFF5534A5),
                    CardWidget(
                      img: "colors.png",
                      title: "اﻷلوان",
                      bgColor: 0xFFF94892,
                      shadowColor: 0xFFE60965,
                    ),
                    CardWidget(
                        img: "colors.png",
                        title: "الحيوانات",
                        bgColor: 0xFFEFD345,
                        shadowColor: 0xFFBABD42),
                    CardWidget(
                        img: "colors.png",
                        title: " الفواكه و الخضار",
                        bgColor: 0xFF83BD75,
                        shadowColor: 0xFF4E944F),
                    CardWidget(
                      img: "shapes.png",
                      title: "اﻷشكال",
                      bgColor: 0xFF0AA1DD,
                      shadowColor: 0xFF2155CD,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
