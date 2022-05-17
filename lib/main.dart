import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnabc/screens/preview.dart';
import 'package:learnabc/utils/AppRoutes.dart';
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
              GetPage(name: AppRoutes.preview, page: () => const Preview()),
            ],
          )));
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
                        items: [
                          {
                            "letter": "أ",
                            "word": "أرنب",
                            "img": "animals/rabbit.png",
                            "audio": "letters/1.mp3",
                          },
                          {
                            "letter": "ب",
                            "word": "ببغاء",
                            "img": "animals/parrot.png",
                            "audio": "letters/2.mp3",
                          },
                          {
                            "letter": "ت",
                            "word": "تمساح",
                            "img": "animals/crocodile.png",
                            "audio": "letters/3.mp3",
                          },
                        ],
                        bgColor: 0xFF83BD75,
                        shadowColor: 0xFF4E944F),
                    // CardWidget(
                    //     img: "numbers.png",
                    //     title: "اﻷعداد",
                    //     bgColor: 0xFFA85CF9,
                    //     shadowColor: 0xFF5534A5),
                    // CardWidget(
                    //   img: "colors.png",
                    //   title: "اﻷلوان",
                    //   bgColor: 0xFFF94892,
                    //   shadowColor: 0xFFE60965,
                    // ),
                    // CardWidget(
                    //     img: "colors.png",
                    //     title: "الحيوانات",
                    //     bgColor: 0xFFEFD345,
                    //     shadowColor: 0xFFBABD42),
                    // CardWidget(
                    //     img: "colors.png",
                    //     title: " الفواكه و الخضار",
                    //     bgColor: 0xFF83BD75,
                    //     shadowColor: 0xFF4E944F),
                    CardWidget(
                      img: "shapes.png",
                      title: "اﻷشكال",
                      items: [
                        {
                          "word": "مثلث",
                          "img": "shapes/triangle.png",
                          "audio": "shapes/trianlge.mp3",
                        },
                        {
                          "word": "مربع",
                          "img": "shapes/square.png",
                          "audio": "shapes/square.mp3",
                        },
                        {
                          "word": "دائرة",
                          "img": "shapes/circle.png",
                          "audio": "shapes/circle.mp3",
                        },
                        {
                          "word": "مستطيل",
                          "img": "shapes/rectangle.png",
                          "audio": "shapes/rectangle.mp3",
                        },
                        {
                          "word": "معين",
                          "img": "shapes/rhombus.png",
                          "audio": "shapes/rhombus.mp3",
                        },
                        {
                          "word": "هلال",
                          "img": "shapes/crescent-moon.png",
                          "audio": "shapes/crescent-moon.mp3",
                        },
                        {
                          "word": "خماسي",
                          "img": "shapes/pantagon.png",
                          "audio": "shapes/pantagon.mp3",
                        },
                        {
                          "word": "سداسي",
                          "img": "shapes/hexagon.png",
                          "audio": "shapes/hexagon.mp3",
                        },
                        {
                          "word": "نجمة",
                          "img": "shapes/star.png",
                          "audio": "shapes/star.mp3",
                        },
                        {
                          "word": "قلب",
                          "img": "shapes/heart.png",
                          "audio": "shapes/heart.mp3",
                        },
                      ],
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
