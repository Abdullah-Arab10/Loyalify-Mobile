import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/offer_widgets/offers_item.dart';

class OffersView extends StatelessWidget {
  const OffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) => const OffersItem(),
        ),
      ],
    );
  }
}

