import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/filtering_item.dart';

class ListOfFilteringItem extends StatelessWidget {
  const ListOfFilteringItem({super.key});

  static const items = ['All', 'Food & Drinks', 'Fashion', 'Travel', 'Banking'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<MerchantsCubit, MerchantsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 2, right: 16),
            child: Row(
              children: items.map((e) {
                return IntrinsicWidth(
                    child: GestureDetector(
                  onTap: () {
                    MerchantsCubit.get(context).changeIndex(items.indexOf(e));
                  },
                  child: FilteringItem(
                    text: e,
                    isActive: items.indexOf(e) ==
                        MerchantsCubit.get(context).currentIndex,
                  ),
                ));
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
