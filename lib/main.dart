import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:launch_review/launch_review.dart';
import 'package:learnabc/screens/preview.dart';
import 'package:learnabc/utils/AppRoutes.dart';
import 'package:learnabc/widgets/card_widget.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   systemNavigationBarColor: Colors.green, // navigation bar color
  //   statusBarColor: Colors.green, // status bar color
  // ));

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String bundleId = 'learnabc';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // lock screen orientation
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "تعليم اﻷطفال",
              style: TextStyle(
                fontSize: 22.sp,
                fontFamily: "Madani",
              ),
            ),
            toolbarHeight: 56.h,
            elevation: 0,
            backgroundColor: Colors.green,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.star,
                  size: 30.h,
                ),
                tooltip: 'Rate Us',
                onPressed: () {
                  LaunchReview.launch(
                    androidAppId: "com.laminn.$bundleId",
                  );
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                  size: 30.h,
                ),
                tooltip: 'Share',
                onPressed: () {
                  Share.share(
                      'https://play.google.com/store/apps/details?id=com.laminn.$bundleId');
                },
              ),
            ],
          ),
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
                    // const Text(
                    //   "Learn Kids",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //     fontSize: 35.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: EdgeInsets.all(10.w),
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
                                {
                                  "letter": "ث",
                                  "word": "ثور",
                                  "img": "animals/ox.png",
                                  "audio": "letters/4.mp3",
                                },
                                {
                                  "letter": "ج",
                                  "word": "جمل",
                                  "img": "animals/camel.png",
                                  "audio": "letters/5.mp3",
                                },
                                {
                                  "letter": "ح",
                                  "word": "حصان",
                                  "img": "animals/horse.png",
                                  "audio": "letters/6.mp3",
                                },
                                {
                                  "letter": "خ",
                                  "word": "خروف",
                                  "img": "animals/sheep.png",
                                  "audio": "letters/7.mp3",
                                },
                                {
                                  "letter": "د",
                                  "word": "دب",
                                  "img": "animals/bear.png",
                                  "audio": "letters/8.mp3",
                                },
                                {
                                  "letter": "ذ",
                                  "word": "ذئب",
                                  "img": "animals/wolf.png",
                                  "audio": "letters/9.mp3",
                                },
                                {
                                  "letter": "ر",
                                  "word": "راكون",
                                  "img": "animals/raccoon.png",
                                  "audio": "letters/10.mp3",
                                },
                                {
                                  "letter": "ز",
                                  "word": "زرافة",
                                  "img": "animals/giraffe.png",
                                  "audio": "letters/11.mp3",
                                },
                                {
                                  "letter": "س",
                                  "word": "سلحفاة",
                                  "img": "animals/turtle.png",
                                  "audio": "letters/12.mp3",
                                },
                                {
                                  "letter": "ش",
                                  "word": "شبل",
                                  "img": "animals/cub.png",
                                  "audio": "letters/13.mp3",
                                },
                                {
                                  "letter": "ص",
                                  "word": "صوص",
                                  "img": "animals/sauce.png",
                                  "audio": "letters/14.mp3",
                                },
                                {
                                  "letter": "ض",
                                  "word": "ضفدع",
                                  "img": "animals/frog.png",
                                  "audio": "letters/15.mp3",
                                },
                                {
                                  "letter": "ط",
                                  "word": "طير",
                                  "img": "animals/bird.png",
                                  "audio": "letters/16.mp3",
                                },
                                {
                                  "letter": "ظ",
                                  "word": "ظبي",
                                  "img": "animals/antelope.png",
                                  "audio": "letters/17.mp3",
                                },
                                {
                                  "letter": "ع",
                                  "word": "عنكبوت",
                                  "img": "animals/spider.png",
                                  "audio": "letters/18.mp3",
                                },
                                {
                                  "letter": "غ",
                                  "word": "غراب",
                                  "img": "animals/crow.png",
                                  "audio": "letters/19.mp3",
                                },
                                {
                                  "letter": "ف",
                                  "word": "فيل",
                                  "img": "animals/elephant.png",
                                  "audio": "letters/20.mp3",
                                },
                                {
                                  "letter": "ق",
                                  "word": "قرش",
                                  "img": "animals/shark.png",
                                  "audio": "letters/21.mp3",
                                },
                                {
                                  "letter": "ك",
                                  "word": "كلب",
                                  "img": "animals/dog.png",
                                  "audio": "letters/22.mp3",
                                },
                                {
                                  "letter": "ل",
                                  "word": "لاما",
                                  "img": "animals/lama.png",
                                  "audio": "letters/23.mp3",
                                },
                                {
                                  "letter": "م",
                                  "word": "معز",
                                  "img": "animals/goat.png",
                                  "audio": "letters/24.mp3",
                                },
                                {
                                  "letter": "ن",
                                  "word": "نعامة",
                                  "img": "animals/ostrich.png",
                                  "audio": "letters/25.mp3",
                                },
                                {
                                  "letter": "ه",
                                  "word": "هر",
                                  "img": "animals/cat.png",
                                  "audio": "letters/26.mp3",
                                },
                                {
                                  "letter": "و",
                                  "word": "وحيد القرن",
                                  "img": "animals/unicorn.png",
                                  "audio": "letters/27.mp3",
                                },
                                {
                                  "letter": "ي",
                                  "word": "يمامة",
                                  "img": "animals/dove.png",
                                  "audio": "letters/28.mp3",
                                },
                              ],
                              bgColor: 0xFF83BD75,
                              shadowColor: 0xFF4E944F),
                          CardWidget(
                              img: "numbers.png",
                              title: "اﻷعداد",
                              items: [
                                {
                                  "word": "واحد",
                                  "img": "numbers/1.png",
                                  "audio": "numbers/1.mp3",
                                },
                                {
                                  "word": "إثنان",
                                  "img": "numbers/2.png",
                                  "audio": "numbers/2.mp3",
                                },
                                {
                                  "word": "ثلاثة",
                                  "img": "numbers/3.png",
                                  "audio": "numbers/3.mp3",
                                },
                                {
                                  "word": "أربعة",
                                  "img": "numbers/4.png",
                                  "audio": "numbers/4.mp3",
                                },
                                {
                                  "word": "خمسة",
                                  "img": "numbers/5.png",
                                  "audio": "numbers/5.mp3",
                                },
                                {
                                  "word": "ستّة",
                                  "img": "numbers/6.png",
                                  "audio": "numbers/6.mp3",
                                },
                                {
                                  "word": "سبعة",
                                  "img": "numbers/7.png",
                                  "audio": "numbers/7.mp3",
                                },
                                {
                                  "word": "ثامنية",
                                  "img": "numbers/8.png",
                                  "audio": "numbers/8.mp3",
                                },
                                {
                                  "word": "تعسة",
                                  "img": "numbers/9.png",
                                  "audio": "numbers/9.mp3",
                                },
                                {
                                  "word": "عشرة",
                                  "img": "numbers/10.png",
                                  "audio": "numbers/10.mp3",
                                },
                              ],
                              bgColor: 0xFFA85CF9,
                              shadowColor: 0xFF5534A5),
                          CardWidget(
                            img: "colors.png",
                            title: "اﻷلوان",
                            items: [
                              {
                                "word": "أسود",
                                "img": "colors/black.png",
                                "audio": "colors/black.mp3",
                              },
                              {
                                "word": "أزرق",
                                "img": "colors/blue.png",
                                "audio": "colors/blue.mp3",
                              },
                              {
                                "word": "بنّي",
                                "img": "colors/brown.png",
                                "audio": "colors/brown.mp3",
                              },
                              {
                                "word": "أخضر",
                                "img": "colors/green.png",
                                "audio": "colors/green.mp3",
                              },
                              {
                                "word": "رمادي",
                                "img": "colors/grey.png",
                                "audio": "colors/grey.mp3",
                              },
                              {
                                "word": "برتقالي",
                                "img": "colors/orange.png",
                                "audio": "colors/orange.mp3",
                              },
                              {
                                "word": "وردي",
                                "img": "colors/pink.png",
                                "audio": "colors/pink.mp3",
                              },
                              {
                                "word": "بنفسجي",
                                "img": "colors/purple.png",
                                "audio": "colors/purple.mp3",
                              },
                              {
                                "word": "أحمر",
                                "img": "colors/red.png",
                                "audio": "colors/red.mp3",
                              },
                              {
                                "word": "أصفر",
                                "img": "colors/yellow.png",
                                "audio": "colors/yellow.mp3",
                              },
                              {
                                "word": "أبيض",
                                "img": "colors/white.png",
                                "audio": "colors/white.mp3",
                              },
                            ],
                            bgColor: 0xFFFF7F3F,
                            shadowColor: 0xFFEA5C2B,
                          ),
                          CardWidget(
                            img: "animals.png",
                            title: "الحيوانات",
                            items: [
                              {
                                "word": "لاما",
                                "img": "animals/lama.png",
                                "audio": "animals/lama.mp3",
                              },
                              {
                                "word": "ثعبان",
                                "img": "animals/snake.png",
                                "audio": "animals/snake.mp3",
                              },
                              {
                                "word": "وحيد القرن",
                                "img": "animals/unicorn.png",
                                "audio": "animals/unicorn.mp3",
                              },
                              {
                                "word": "أسود",
                                "img": "animals/shark.png",
                                "audio": "animals/shark.mp3",
                              },
                              {
                                "word": "ظبي",
                                "img": "animals/shark.png",
                                "audio": "animals/elephant.mp3",
                              },
                              {
                                "word": "فيل",
                                "img": "animals/shark.png",
                                "audio": "animals/elephant.mp3",
                              },
                              {
                                "word": "قرد",
                                "img": "animals/shark.png",
                                "audio": "animals/monkey.mp3",
                              },
                              {
                                "word": "غزال",
                                "img": "animals/shark.png",
                                "audio": "animals/deer.mp3",
                              },
                              {
                                "word": "دبّ",
                                "img": "animals/bear.png",
                                "audio": "animals/bear.mp3",
                              },
                              {
                                "word": "جمل",
                                "img": "animals/camel.png",
                                "audio": "animals/camel.mp3",
                              },
                              {
                                "word": "كتكوت",
                                "img": "animals/chick.png",
                                "audio": "animals/chick.mp3",
                              },
                              {
                                "word": "دجاجة",
                                "img": "animals/chicken.png",
                                "audio": "animals/chicken.mp3",
                              },
                              {
                                "word": "ديك",
                                "img": "animals/cock.png",
                                "audio": "animals/cock.mp3",
                              },
                              {
                                "word": "بقرة",
                                "img": "animals/cow.png",
                                "audio": "animals/cow.mp3",
                              },
                              {
                                "word": "حمار",
                                "img": "animals/danky.png",
                                "audio": "animals/danky.mp3",
                              },
                              {
                                "word": "كلب",
                                "img": "animals/dog.png",
                                "audio": "animals/dog.mp3",
                              },
                              {
                                "word": "بطة",
                                "img": "animals/duck.png",
                                "audio": "animals/duck.mp3",
                              },
                              {
                                "word": "ثعلب",
                                "img": "animals/fox.png",
                                "audio": "animals/fox.mp3",
                              },
                              {
                                "word": "معز",
                                "img": "animals/goat.png",
                                "audio": "animals/goat.mp3",
                              },
                              {
                                "word": "فرس النهر",
                                "img": "animals/hippo.png",
                                "audio": "animals/hippo.mp3",
                              },
                              {
                                "word": "حصان",
                                "img": "animals/horse.png",
                                "audio": "animals/horse.mp3",
                              },
                              {
                                "word": "أسد",
                                "img": "animals/lion.png",
                                "audio": "animals/lion.mp3",
                              },
                              {
                                "word": "سلطعون",
                                "img": "animals/lobster.png",
                                "audio": "animals/lobster.mp3",
                              },
                              {
                                "word": "ثور",
                                "img": "animals/ox.png",
                                "audio": "animals/ox.mp3",
                              },
                              {
                                "word": "ببغاء",
                                "img": "animals/parrot.png",
                                "audio": "animals/parrot.mp3",
                              },
                              {
                                "word": "أرنب",
                                "img": "animals/rabbit.png",
                                "audio": "animals/rabbit.mp3",
                              },
                              {
                                "word": "خروف",
                                "img": "animals/sheep.png",
                                "audio": "animals/sheep.mp3",
                              },
                            ],
                            bgColor: 0xFFF94892,
                            shadowColor: 0xFFE60965,
                          ),
                          CardWidget(
                              img: "vegetables&fruits.png",
                              title: " الفواكه و الخضار",
                              items: [
                                {
                                  "word": "تفاح",
                                  "img": "vegetables&fruits/apple.png",
                                  "audio": "vegetables&fruits/apple.mp3",
                                },
                                {
                                  "word": "موز",
                                  "img": "vegetables&fruits/banana.png",
                                  "audio": "vegetables&fruits/banana.mp3",
                                },
                                {
                                  "word": "جزر",
                                  "img": "vegetables&fruits/carrot.png",
                                  "audio": "vegetables&fruits/carrot.mp3",
                                },
                                {
                                  "word": "كرز",
                                  "img": "vegetables&fruits/cherry.png",
                                  "audio": "vegetables&fruits/cherry.mp3",
                                },
                                {
                                  "word": "ذرة",
                                  "img": "vegetables&fruits/corn.png",
                                  "audio": "vegetables&fruits/corn.mp3",
                                },
                                {
                                  "word": "خيار",
                                  "img": "vegetables&fruits/cucumber.png",
                                  "audio": "vegetables&fruits/cucumber.mp3",
                                },
                                {
                                  "word": "باذنجان",
                                  "img": "vegetables&fruits/eggplanet.png",
                                  "audio": "vegetables&fruits/eggplanet.mp3",
                                },
                                {
                                  "word": "ثوم",
                                  "img": "vegetables&fruits/garlic.png",
                                  "audio": "vegetables&fruits/garlic.mp3",
                                },
                                {
                                  "word": "عنب",
                                  "img": "vegetables&fruits/grape.png",
                                  "audio": "vegetables&fruits/grape.mp3",
                                },
                                {
                                  "word": "ليمون",
                                  "img": "vegetables&fruits/lemon.png",
                                  "audio": "vegetables&fruits/lemon.mp3",
                                },
                                {
                                  "word": "بصل",
                                  "img": "vegetables&fruits/onion.png",
                                  "audio": "vegetables&fruits/onion.mp3",
                                },
                                {
                                  "word": "برتقال",
                                  "img": "vegetables&fruits/orange.png",
                                  "audio": "vegetables&fruits/orange.mp3",
                                },
                                {
                                  "word": "إجاص",
                                  "img": "vegetables&fruits/pear.png",
                                  "audio": "vegetables&fruits/pear.mp3",
                                },
                                {
                                  "word": "بازيلاء",
                                  "img": "vegetables&fruits/peas.png",
                                  "audio": "vegetables&fruits/peas.mp3",
                                },
                                {
                                  "word": "فلفل",
                                  "img": "vegetables&fruits/pepper.png",
                                  "audio": "vegetables&fruits/pepper.mp3",
                                },
                                {
                                  "word": "أناناس",
                                  "img": "vegetables&fruits/pineapple.png",
                                  "audio": "vegetables&fruits/pineapple.mp3",
                                },
                                {
                                  "word": "رمان",
                                  "img": "vegetables&fruits/pomegranate.png",
                                  "audio": "vegetables&fruits/pomegranate.mp3",
                                },
                                {
                                  "word": "بطاطا",
                                  "img": "vegetables&fruits/potatoes.png",
                                  "audio": "vegetables&fruits/potatoes.mp3",
                                },
                                {
                                  "word": "يقطين",
                                  "img": "vegetables&fruits/pumpkin.png",
                                  "audio": "vegetables&fruits/pumpkin.mp3",
                                },
                                {
                                  "word": "فجل",
                                  "img": "vegetables&fruits/radish.png",
                                  "audio": "vegetables&fruits/radish.mp3",
                                },
                                {
                                  "word": "فراولة",
                                  "img": "vegetables&fruits/strawberry.png",
                                  "audio": "vegetables&fruits/strawberry.mp3",
                                },
                                {
                                  "word": "طماطم",
                                  "img": "vegetables&fruits/tomatoes.png",
                                  "audio": "vegetables&fruits/tomatoes.mp3",
                                },
                                {
                                  "word": "بطيخ",
                                  "img": "vegetables&fruits/watermelon.png",
                                  "audio": "vegetables&fruits/watermelon.mp3",
                                },
                              ],
                              bgColor: 0xFF83BD75,
                              shadowColor: 0xFF4E944F),
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
                          CardWidget(
                            img: "weekdays.png",
                            title: "أيام السبوع",
                            items: [
                              {
                                "img": "week-days/saturday.png",
                                "audio": "week-days/saturday.mp3",
                              },
                              {
                                "img": "week-days/sunday.png",
                                "audio": "week-days/sunday.mp3",
                              },
                              {
                                "img": "week-days/monday.png",
                                "audio": "week-days/monday.mp3",
                              },
                              {
                                "img": "week-days/tuesday.png",
                                "audio": "week-days/tuesday.mp3",
                              },
                              {
                                "img": "week-days/wednesday.png",
                                "audio": "week-days/wednesday.mp3",
                              },
                              {
                                "img": "week-days/thursday.png",
                                "audio": "week-days/thursday.mp3",
                              },
                              {
                                "img": "week-days/friday.png",
                                "audio": "week-days/friday.mp3",
                              },
                            ],
                            bgColor: 0xFF406882,
                            shadowColor: 0xFF1A374D,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
