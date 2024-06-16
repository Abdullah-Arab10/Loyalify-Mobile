import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loyalty_app/Features/splash/data/models/loyalty_page_model.dart';
import 'package:loyalty_app/Features/splash/presentation/views/widgets/texts_section.dart';

class LoyaltyPage extends StatelessWidget {
  const LoyaltyPage({super.key, required this.item, required this.index});

  final LoyaltyPageModel item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 72,
        ),
        Expanded(
          child: Center(child: SvgPicture.asset(item.image)),
        ),
        index != 0 ? const SizedBox(height: 24,) : const SizedBox(),
        Expanded(
          child: TextsSection(item: item),
        ),
      ],
    );
  }
}
