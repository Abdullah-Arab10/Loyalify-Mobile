import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.image,
    required this.color,
  });

  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            image,
            colorFilter: ColorFilter.mode(
              color,
               BlendMode.srcIn),
          ),
        );
  }
}