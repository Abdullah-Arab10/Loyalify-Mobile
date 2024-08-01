import 'package:flutter/material.dart';
import 'package:loyalty_app/core/resources/app_colors.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/widgets/custom_button.dart';

class OfferDescriptionAndButtonSection extends StatelessWidget {
  const OfferDescriptionAndButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome to Starbucks, a global coffeehouse chain that has been enchanting coffee lovers since 1971. Renowned for our commitment to quality coffee, ethically sourced beans, and a warm ambiance, Starbucks is not just a coffee destination; it’s a community.',
          style: AppStyles.styleSemiBold18(context).copyWith(
            color: AppColors.sonicSilver,
          ),
          textAlign: TextAlign.left,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Divider(
                height: 30,
                color: Color(0xffEEEEF1),
              ),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  foregroundColor: AppColors.white,
                  text: 'Redeem',
                  backgroundColor: AppColors.kPrimaryColor,
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
