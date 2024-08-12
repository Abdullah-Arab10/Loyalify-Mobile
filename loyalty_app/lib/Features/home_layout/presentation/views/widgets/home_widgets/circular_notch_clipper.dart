import 'package:flutter/material.dart';

class CircularNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    double w = size.width;
    double h = size.height;
    path.lineTo(0, 0);
    path.lineTo(w, 0);
    path.lineTo(w, h - 50); // Adjust the height here
    path.quadraticBezierTo(w * 0.5, h + 50, 0, h - 50); // Adjust control point
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}