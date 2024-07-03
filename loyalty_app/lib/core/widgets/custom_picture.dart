import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomPicture extends StatelessWidget {
  const CustomPicture({
    super.key,
    required this.image,
    this.color,
    required this.padding,
    required this.maxWidth,
    this.decoration,
    this.colorFilter,
  });

  final String image;
  final Color? color;
  final double padding;
  final double maxWidth;
  final Decoration? decoration;
  final ColorFilter? colorFilter;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
            decoration: decoration,
            // const ShapeDecoration(
            //   shape: OvalBorder(),
            // ),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: SvgPicture.asset(
                image,
                colorFilter: colorFilter != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
              ),
            )),
      ),
    );
  }
}
