import 'dart:async';

import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/data/models/offer_model/item.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/offer_widgets/offers_item.dart';

class ListOfOffers extends StatelessWidget {
  const ListOfOffers({
    super.key,
    required this.topMargin,
    required this.leftMargin,
    required this.rightMargin,
    required this.bottomMargin,
    required this.isLogo,
    required this.offers,
    required this.scrollController,
    required this.isLoading,
  });

  final double topMargin;
  final double leftMargin;
  final double rightMargin;
  final double bottomMargin;
  final bool isLogo;
  final List<Item> offers;
  final ScrollController scrollController;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: scrollController,
        itemCount: offers.length + (isLoading ? 1 : 0),
        itemBuilder: (BuildContext context, int index) {
          if (index < offers.length) {
            return OffersItem(
              topMargin: topMargin,
              leftMargin: leftMargin,
              rightMargin: rightMargin,
              bottomMargin: bottomMargin,
              isLogo: isLogo,
              coverImage: offers[index].offerImage,
              storeImage: offers[index].storeImage,
              offerName: offers[index].offerName,
              pointsAmount: offers[index].pointAmount,
              storeName: offers[index].storeName,
            );
          } else {
            Timer(const Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
        });
  }
}
