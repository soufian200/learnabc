import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final Function onTap;
  final String img;
  final double size;
  const Button(
      {Key? key, required this.onTap, required this.img, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(55.r)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Ink(
          child: Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                // color: Colors.red,
                image: DecorationImage(
                  image: AssetImage("assets/$img"),
                  fit: BoxFit.cover,
                ),
              )),
        ),
      ),
    );
  }
}
