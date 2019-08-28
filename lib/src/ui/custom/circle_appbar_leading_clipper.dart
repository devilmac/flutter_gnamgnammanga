import 'package:flutter/cupertino.dart';

class CircleAppBarLeadingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 32);
    path.lineTo(24, 32);
//    path.addArc(Rect.fromCircle(center: Offset(48, 48), radius: 28), 0, 90);
//    path.lineTo(48, 74);
    path.arcToPoint(Offset(24, 74), radius: Radius.circular(21));
    path.lineTo(0.0, 74);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.lineTo(0.0, 0.0);

//    path.lineTo(30, 0.0);

//    path.lineTo(56, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
