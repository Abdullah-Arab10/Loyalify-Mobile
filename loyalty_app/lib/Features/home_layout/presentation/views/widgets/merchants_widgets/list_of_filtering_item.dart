import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_category_cubit/merchants_category_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_store_cubit/merchants_store_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/search_cubit/search_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_widgets/filtering_item.dart';

class ListOfFilteringItem extends StatelessWidget {
  const ListOfFilteringItem(
      {super.key, required this.items, required this.fetchOrSearch});

  final FetchCategoriesSuccess items;
  final bool fetchOrSearch;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<MerchantsCubit, MerchantsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 2, right: 16),
            child: Row(
              children: items.categories.categories.map((e) {
                return IntrinsicWidth(
                    child: GestureDetector(
                  onTap: () {
                    MerchantsCubit.get(context)
                        .changeIndex(items.categories.categories.indexOf(e));
                    fetchOrSearch == true
                        ? MerchantsStoreCubit.get(context).fetchStores(
                            categoryId: items.categories.categories.indexOf(e))
                        : SearchCubit.get(context).searchStores(
                            categoryId: items.categories.categories.indexOf(e));
                  },
                  child: FilteringItem(
                    text: e.name ?? '',
                    isActive: items.categories.categories.indexOf(e) ==
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
