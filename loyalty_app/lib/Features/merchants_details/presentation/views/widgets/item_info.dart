import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIcon(image: image, color: AppColors.kPrimaryColor, padding: 0),
        const SizedBox(
          width: 12,
        ),
        Text(
          text,
          style: AppStyles.styleSemiBold18(context),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
