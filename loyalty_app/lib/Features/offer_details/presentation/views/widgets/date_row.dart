import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/offer_details/presentation/views/widgets/items_of_date_row.dart';

class DateRow extends StatelessWidget {
  const DateRow({
    super.key,
    required this.createdAt,
    required this.deadline,
  });

  final String createdAt;
  final String deadline;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ItemsOfDateRow(
            startDayOrExpiresIn: 'Start Day: ',
            dateOrDays: createdAt,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 10,
          ),
          ItemsOfDateRow(
            startDayOrExpiresIn: 'Expires In: ',
            dateOrDays: deadline,
          ),
        ],
      ),
    );
  }
}