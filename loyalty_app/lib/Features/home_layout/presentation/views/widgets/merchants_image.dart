import 'package:flutter/material.dart';

class MerchantsImage extends StatelessWidget {
  const MerchantsImage({
    super.key,
    required this.image,
    required this.maxWidth,
    this.decoration,
    this.clipBehavior = Clip.none,
  });

  final String image;
  final double maxWidth;
  final Decoration? decoration;
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
            decoration: decoration,
            clipBehavior: clipBehavior,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
