import 'package:flutter/material.dart';

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({
    super.key,
    required this.aspectRatio,
    required this.borderRadius,
  });

  final double aspectRatio;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
