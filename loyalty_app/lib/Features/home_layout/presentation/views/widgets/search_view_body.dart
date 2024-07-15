import 'package:flutter/material.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/merchants_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/manager/merchants_cubit/search_cubit/search_cubit.dart';
import 'package:loyalty_app/Features/home_layout/presentation/views/widgets/search_categories_and_stores_body.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.searchController});

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SearchCategoriesAndStoresBody(
      searchController: searchController,
      onFieldSubmitted: (value) {
        SearchCubit.get(context).searchStores(
            categoryId: MerchantsCubit.get(context).currentIndex,
            search: value);
      },
    );
  }
}
