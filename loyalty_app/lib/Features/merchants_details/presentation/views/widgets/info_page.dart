import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/merchants_details/presentation/views/widgets/item_info.dart';
import 'package:loyalty_app/core/resources/app_styles.dart';
import 'package:loyalty_app/core/utils/app_images.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to Starbucks, a global coffeehouse chain that has been enchanting coffee lovers since 1971. Renowned for our commitment to quality coffee, ethically sourced beans, and a warm ambiance, Starbucks is not just a coffee destination; it’s a community.\n \nAt Starbucks, we pride ourselves on delivering an exceptional coffee experience. From our iconic handcrafted beverages to our delectable pastries, each item on our menu is crafted with precision and passion. Our baristas, trained to perfection, are dedicated to bringing you the finest coffee moments.\n \nBeyond coffee, Starbucks is committed to social responsibility and sustainability. We strive to make a positive impact on the communities we serve and the environment. Join us in this mission.',
          style: AppStyles.styleSemiBold18(context),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 16,
        ),
        const InfoItem(
          image: Assets.imagesLocation,
          text: 'Nabek',
        ),
        const SizedBox(
          height: 16,
        ),
        const InfoItem(
          image: Assets.imagesPhone,
          text: '(212) 555-1234',
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
