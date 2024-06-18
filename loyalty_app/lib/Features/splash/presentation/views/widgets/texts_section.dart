import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/splash/data/models/loyalty_page_model.dart';
import 'package:loyalty_app/core/utils/app_styles.dart';

class TextsSection extends StatelessWidget {
  const TextsSection({
    super.key,
    required this.item,
  });

  final LoyaltyPageModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 44),
          child: Column(
            children: [
              Text(
                item.title1,
                style: AppStyles.styleBold29(context),
                textAlign: TextAlign.center,
              ),
              Text(
                item.title2,
                style: AppStyles.styleBold29(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            item.subTitle,
            style: AppStyles.styleMedium18(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}