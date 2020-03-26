import 'package:flutter/material.dart';

class CustomizedOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, size.height);

    var inicio = Offset(size.width + size.width * 0.2, size.height * 0.5);
    var fim = Offset(0, 0);

    path.quadraticBezierTo(inicio.dx, inicio.dy, fim.dx, fim.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != null;
  }
 
}