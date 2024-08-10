import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.topMargin = 0.0,
    this.leftMargin = 0.0,
    this.rightMargin = 0.0,
    this.bottomMargin = 0.0,
    required this.borderRadius,
    this.height,
  });

  final double topMargin;
  final double leftMargin;
  final double rightMargin;
  final double bottomMargin;
  final double borderRadius;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 10,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      margin: EdgeInsetsDirectional.only(
          top: topMargin,
          start: leftMargin,
          end: rightMargin,
          bottom: bottomMargin),
    );
  }
}