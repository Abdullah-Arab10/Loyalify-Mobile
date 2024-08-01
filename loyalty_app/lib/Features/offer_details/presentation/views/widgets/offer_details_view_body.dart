import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/date_row.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/offer_cover_image_and_texts_section.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/offer_description_and_button_section.dart';

class OfferDetailsViewBody extends StatelessWidget {
  const OfferDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                OfferCoverImageAndTextsSection(),
                SizedBox(
                  height: 10,
                ),
                DateRow(
                  dateOrDays1: '8/2/2024',
                  dateOrDays2: '3 Days',
                ),
                Divider(
                  height: 30,
                  color: Color(0xffEEEEF1),
                ),
                OfferDescriptionAndButtonSection()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
