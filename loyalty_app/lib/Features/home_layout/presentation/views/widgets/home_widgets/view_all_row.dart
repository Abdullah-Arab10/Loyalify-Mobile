import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class ViewAllRow extends StatelessWidget {
  const ViewAllRow({super.key, required this.leftText});

  final String leftText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              leftText,
              style: AppStyles.styleBold20(context),
            ),
          ),
          Row(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'View All',
                  style: AppStyles.styleBold18(context)
                      .copyWith(color: AppColors.kPrimaryColor),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Transform.rotate(
                angle: -1.57079633 * 2,
                child: CustomIcon(
                    image: Assets.imagesLeftArrow,
                    color: AppColors.kPrimaryColor,
                    padding: 0),
              )
            ],
          ),
        ],
      ),
    );
  }
}
