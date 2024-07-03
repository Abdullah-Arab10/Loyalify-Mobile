import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/merchants_item.dart';
import 'package:loyalty_app/core/utils/api_service.dart';
import 'package:loyalty_app/core/utils/app_images.dart';

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MerchantsCubit, MerchantsState>(
      builder: (context, state) {
        if (state is FetchStoresSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: state.stores.stores?.length,
            itemBuilder: (context, index) {
              return MerchantsItem(
                image: '${ApiService.baseUrl}${state.stores.stores?[index].storeImage ?? ''}',
                merchantName: state.stores.stores?[index].name ?? '',
                categoryName: state.stores.stores?[index].category ?? '',
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
