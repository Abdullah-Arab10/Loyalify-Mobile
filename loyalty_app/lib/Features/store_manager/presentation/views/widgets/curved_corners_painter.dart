import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';

class CurvedCornersPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const double cornerLength = 40.0; // Increase corner length
    const double curveRadius = 12.0; // Increase curve radius slightly

    // Top-left corner (blue)
    final paintBlue = Paint()
      ..color = AppColors.kPrimaryColor
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(
          center: const Offset(curveRadius, curveRadius), radius: curveRadius),
      3.14, // Start angle
      1.57, // Sweep angle
      false,
      paintBlue,
    );
    canvas.drawLine(
      const Offset(curveRadius, 0),
      const Offset(cornerLength, 0),
      paintBlue,
    );
    canvas.drawLine(
      const Offset(0, curveRadius),
      const Offset(0, cornerLength),
      paintBlue,
    );

    // Top-right corner (amber)
    final paintAmber = Paint()
      ..color = AppColors.kPrimaryColor
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width - curveRadius, curveRadius),
          radius: curveRadius),
      4.71, // Start angle
      1.57, // Sweep angle
      false,
      paintAmber,
    );
    canvas.drawLine(
      Offset(size.width - cornerLength, 0),
      Offset(size.width - curveRadius, 0),
      paintAmber,
    );
    canvas.drawLine(
      Offset(size.width, curveRadius),
      Offset(size.width, cornerLength),
      paintAmber,
    );

    // Bottom-left corner (green)
    final paintGreen = Paint()
      ..color = AppColors.kPrimaryColor
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(curveRadius, size.height - curveRadius),
          radius: curveRadius),
      1.57, // Start angle
      1.57, // Sweep angle
      false,
      paintGreen,
    );
    canvas.drawLine(
      Offset(0, size.height - curveRadius),
      Offset(0, size.height - cornerLength),
      paintGreen,
    );
    canvas.drawLine(
      Offset(curveRadius, size.height),
      Offset(cornerLength, size.height),
      paintGreen,
    );

    // Bottom-right corner (red)
    final paintRed = Paint()
      ..color = AppColors.kPrimaryColor
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;
    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width - curveRadius, size.height - curveRadius),
          radius: curveRadius),
      0, // Start angle
      1.57, // Sweep angle
      false,
      paintRed,
    );
    canvas.drawLine(
      Offset(size.width, size.height - curveRadius),
      Offset(size.width, size.height - cornerLength),
      paintRed,
    );
    canvas.drawLine(
      Offset(size.width - curveRadius, size.height),
      Offset(size.width - cornerLength, size.height),
      paintRed,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
