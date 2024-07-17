import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/offer_widgets/offers_item.dart';

class ListOfOffers extends StatelessWidget {
  const ListOfOffers({
    super.key,
    required this.topMargin,
    required this.leftMargin,
    required this.rightMargin,
    required this.bottomMargin,
    required this.isLogo,
  });

  final double topMargin;
  final double leftMargin;
  final double rightMargin;
  final double bottomMargin;
  final bool isLogo;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) => OffersItem(
        topMargin: topMargin,
        leftMargin: leftMargin,
        rightMargin: rightMargin,
        bottomMargin: bottomMargin,
        isLogo: isLogo,
      ),
    );
  }
}
