import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/utils/functions.dart';
import 'package:loyalty_app/core/widgets/custom_svg_picture.dart';

class CustomNoDataOrFailure extends StatelessWidget {
  const CustomNoDataOrFailure({super.key, required this.text, required this.image});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvgPicture(
              image: image,
              maxWidth: getMaxWidth(context)),
          Text(
            text,
            style: AppStyles.styleSemiBold20(context),
          )
        ],
      ),
    );
  }
}
