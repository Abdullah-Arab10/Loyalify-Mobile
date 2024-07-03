import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';

class FilteringItem extends StatelessWidget {
  const FilteringItem({super.key, required this.text, required this.isActive});

  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14),
      child: Container(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color:
              isActive == true ? AppColors.kPrimaryColor : AppColors.gainsboro,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(
            color: isActive == true
                ? AppColors.kPrimaryColor
                : AppColors.lightGray,
          ),
        ),
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
