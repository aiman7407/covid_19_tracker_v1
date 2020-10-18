import 'package:flutter/material.dart';




class CurveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height );
    path.quadraticBezierTo(size.width/2, size.height/2,
        size.width,size.height);

    path.lineTo(size.width, 0);
    return path;

  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
