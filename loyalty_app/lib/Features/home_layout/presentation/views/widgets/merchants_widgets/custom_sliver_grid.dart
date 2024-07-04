import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_store_cubit/merchants_store_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_widgets/merchants_item.dart';
import 'package:loyalty_app/core/utils/api_service.dart';

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({
    super.key,
    required this.state,
  });

  final FetchStoresSuccess state;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: state.stores.stores.length,
      itemBuilder: (context, index) {
        return MerchantsItem(
          image:
              '${ApiService.baseUrl}${state.stores.stores[index].storeImage ?? ''}',
          merchantName: state.stores.stores[index].name ?? '',
          categoryName: state.stores.stores[index].category ?? '',
        );
      },
    );
  }
}
