import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';

class OfferTextsSection extends StatelessWidget {
  const OfferTextsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('Get Free 1 Cup Coffe E-Voucher',
              style: AppStyles.styleBold20(context)),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Text('3.750 points',
                  style: AppStyles.styleSemiBold16(context)
                      .copyWith(color: AppColors.sonicSilver)),
              const SizedBox(
                width: 16,
              ),
              Text('Starbucks',
                  style: AppStyles.styleSemiBold16(context)),
            ],
          ),
        ),
      ],
    );
  }
}