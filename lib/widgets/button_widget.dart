import 'package:flutter/material.dart';

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
      borderRadius: BorderRadius.all(Radius.circular(size / 2)),
      color: Colors.white,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Ink(
            height: size,
            width: size,
            decoration: BoxDecoration(
              // color: Colors.red,
              image: DecorationImage(
                image: AssetImage("assets/$img"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(size / 2)),
            )),
      ),
    );
  }
}
