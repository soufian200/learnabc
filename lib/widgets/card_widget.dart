import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learnabc/widgets/button_widget.dart';

class CardWidget extends StatelessWidget {
  final String img;
  final String title;
  final int bgColor;
  final int shadowColor;
  const CardWidget(
      {Key? key,
      required this.img,
      required this.title,
      required this.bgColor,
      required this.shadowColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.only(bottom: 20.h),
      width: double.infinity,
      height: 150.h,
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
                    fontFamily: "Madani", fontSize: 30.sp, color: Colors.white),
              ),
              Button(
                  onTap: () {
                    print("backword - clicked...................");
                  },
                  img: "buttons/forword.png",
                  size: 60.w),
            ],
          )
        ],
      ),
    );
  }
}
