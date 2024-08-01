import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/items_of_date_row.dart';

class DateRow extends StatelessWidget {
  const DateRow({
    super.key,
    required this.dateOrDays1,
    required this.dateOrDays2,
  });

  final String dateOrDays1;
  final String dateOrDays2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ItemsOfDateRow(
          startDayOrExpiresIn: 'Start Day: ',
          dateOrDays: dateOrDays1,
        ),
        const Spacer(),
        ItemsOfDateRow(
          startDayOrExpiresIn: 'Expires In: ',
          dateOrDays: dateOrDays2,
        ),
      ],
    );
  }
}