import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconBottomNavBar extends StatelessWidget {
  const CustomIconBottomNavBar({
    super.key,
    required this.image,
    required this.color,
  });
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
    ;
  }
}
