import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.image,
    required this.padding,
    required this.maxWidth,
    this.decoration,
    required this.aspectRatio,
    required this.clipBehavior,
  });

  final Image image;
  final double padding;
  final double maxWidth;
  final Decoration? decoration;
  final double aspectRatio;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Container(
            decoration: decoration,
            clipBehavior: clipBehavior,
            child: Padding(padding: EdgeInsets.all(padding), child: image)),
      ),
    );
  }
}
