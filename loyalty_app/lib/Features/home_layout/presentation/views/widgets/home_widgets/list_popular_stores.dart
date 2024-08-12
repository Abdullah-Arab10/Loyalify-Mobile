import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/home_widgets/popular_store.dart';

class ListPopularStores extends StatelessWidget {
  const ListPopularStores({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) => Padding(
        padding: EdgeInsets.only(
            left: index == 0 ? 16 : 0, right: index == 7 ? 16 : 0),
        child: const PopularStore(),
      ),
      separatorBuilder: (context, index) => const SizedBox(
        width: 15,
      ),
    );
  }
}
