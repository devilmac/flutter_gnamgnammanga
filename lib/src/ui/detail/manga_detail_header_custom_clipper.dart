import 'package:flutter/cupertino.dart';

class MangaDetailHeaderCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height * 0.2);

    var firstControlPoint = Offset(size.width * 0.15, size.height * 0.25);
    var firstEndPoint = Offset(size.width * 0.16, size.height * 0.45);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.20, size.height * 0.95);
    var secondEndPoint = Offset(size.width * 0.70, size.height * 0.90);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * 0.71, size.height * 0.9);
    var thirdEndPoint = Offset(size.width * 0.9, size.height * 0.85);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    var fourthControlPoint = Offset(size.width, size.height * 0.85);
    var fourthEndPoint = Offset(size.width, size.height * 0.95);

    path.quadraticBezierTo(fourthControlPoint.dx, fourthControlPoint.dy,
        fourthEndPoint.dx, fourthEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
