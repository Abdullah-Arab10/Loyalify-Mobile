import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/splash/data/models/loyalty_page_model.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/texts_section.dart';
import 'package:loyalty_app/core/utils/functions.dart';
import 'package:loyalty_app/core/widgets/custom_picture.dart';

class LoyaltyPage extends StatelessWidget {
  const LoyaltyPage({super.key, required this.item, required this.index});

  final LoyaltyPageModel item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPicture(
            image: item.image, padding: 0, maxWidth: getMaxWidth(context)),
        index != 0
            ? const SizedBox(
                height: 24,
              )
            : const SizedBox(),
        TextsSection(item: item),
      ],
    );
  }
}
