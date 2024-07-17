import 'package:flutter/material.dart';
import 'package:loyalty_app/core/widgets/list_of_offers.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        ListOfOffers(
          topMargin: 24,
          leftMargin: 24,
          rightMargin: 24,
          bottomMargin: 0,
          isLogo: true,
        ),
      ],
    );
  }
}
