import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/utils/app_images.dart';
import 'package:loyalty_app/core/widgets/custom_icon.dart';

class PointsRow extends StatelessWidget {
  const PointsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomIcon(
              image: Assets.imagesStar, color: Color(0xffAFBCDC), padding: 0),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Your Points',
                  style: AppStyles.styleSemiBold16(context).copyWith(
                    color: AppColors.sonicSilver,
                  ),
                ),
              ),
              Row(
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      '249,560',
                      style: AppStyles.styleBold29(context),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '(\$249.56)',
                    style: AppStyles.styleSemiBold16(context).copyWith(
                      color: AppColors.sonicSilver,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Transform.rotate(
            angle: -1.57079633 * 2,
            child: CustomIcon(
                image: Assets.imagesLeftArrow,
                color: AppColors.sonicSilver,
                padding: 0),
          )
        ],
      ),
    );
  }
}