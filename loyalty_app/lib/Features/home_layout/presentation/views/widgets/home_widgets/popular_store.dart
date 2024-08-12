import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_image.dart';

class PopularStore extends StatelessWidget {
  const PopularStore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImage(
          image: Image.asset(
            Assets.imagesSss,
            fit: BoxFit.cover,
          ),
          maxWidth: 60,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          clipBehavior: Clip.antiAlias,
          padding: 0,
          aspectRatio: 1,
        ),
        const SizedBox(
          height: 5,
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Starbucks',
            style: AppStyles.styleSemiBold16(context).copyWith(
              color: AppColors.black
            ),
          ),
        ),
      ],
    );
  }
}
