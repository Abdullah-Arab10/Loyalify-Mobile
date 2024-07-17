import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';

class FilteringItem extends StatelessWidget {
  const FilteringItem(
      {super.key,
      required this.text,
      required this.isActive,
      this.leftPaddingForItem,
      this.horizontalPaddingForText,
      this.verticalPaddingForText,
      this.borderRadius,
      this.alignment, this.inActiveBorderColor, this.inActiveBackgorundColor});

  final bool isActive;
  final String text;
  final double? leftPaddingForItem;
  final double? horizontalPaddingForText;
  final double? verticalPaddingForText;
  final BorderRadiusGeometry? borderRadius;
  final AlignmentGeometry? alignment;
  final Color? inActiveBackgorundColor;
  final Color? inActiveBorderColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftPaddingForItem ?? 14),
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: horizontalPaddingForText ?? 14,
            vertical: verticalPaddingForText ?? 8),
        decoration: BoxDecoration(
          color:
              isActive == true ? AppColors.kPrimaryColor : inActiveBackgorundColor ?? AppColors.gainsboro,
          borderRadius: borderRadius ?? BorderRadius.circular(30.0),
          border: Border.all(
            color: isActive == true
                ? AppColors.kPrimaryColor
                : inActiveBorderColor ?? AppColors.lightGray,
          ),
        ),
        alignment: alignment,
        child: Text(
          text,
          style: AppStyles.styleBold18(context).copyWith(
            color: isActive == true ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}
