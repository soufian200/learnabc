import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnabc/utils/AppRoutes.dart';
import 'package:learnabc/widgets/button_widget.dart';

class CardWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    _onTap() {
      Get.toNamed(AppRoutes.preview,
          arguments: {"title": title, "items": items});
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
              height: 150.h,
              child: Container(
                padding: EdgeInsets.all(10.w),
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color(bgColor),
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(shadowColor),
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: Offset(-5.w, 5.h), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 150.w,
                      height: 150.w,
                      decoration: BoxDecoration(
                        // color: Colors.lime[100],
                        image: DecorationImage(
                          image: AssetImage('assets/$img'),
                          fit: BoxFit.contain,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.r)),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
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
                            size: 60.w),
                      ],
                    )
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
