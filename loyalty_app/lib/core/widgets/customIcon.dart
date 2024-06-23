import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loyalty_app/Features/authentication/data/models/text_field_model.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.all(12.0),
          child: SvgPicture.asset(
            image,
          ),
        );
  }
}