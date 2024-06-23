import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loyalty_app/Features/splash/data/models/loyalty_page_model.dart';

class CustomPicture extends StatelessWidget {
  const CustomPicture({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: 1,
        child: FittedBox(
          fit: BoxFit.cover,
          child: SvgPicture.asset(
            image,
            ),
        ),
      ),
    );
  }
}