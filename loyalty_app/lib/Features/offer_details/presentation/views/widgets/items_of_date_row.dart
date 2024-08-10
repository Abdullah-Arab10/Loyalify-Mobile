import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';

class ItemsOfDateRow extends StatelessWidget {
  const ItemsOfDateRow({
    super.key,
    required this.startDayOrExpiresIn,
    required this.dateOrDays,
  });

  final String startDayOrExpiresIn;
  final String dateOrDays;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(startDayOrExpiresIn, style: AppStyles.styleSemiBold18(context)),
        Text(
          dateOrDays != '' ? dateOrDays.substring(0, 10) : '',
          style: AppStyles.styleSemiBold16(context)
              .copyWith(color: AppColors.sonicSilver),
        ),
      ],
    );
  }
}
