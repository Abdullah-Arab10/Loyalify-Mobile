part of 'merchants_category_cubit.dart';

abstract class MerchantsCategoryState {
  const MerchantsCategoryState();
}

class MerchantsCategoryInitial extends MerchantsCategoryState{}

class FetchCategoriesLoading extends MerchantsCategoryState {}

class FetchCategoriesFailure extends MerchantsCategoryState {
  final String errMessage;

  const FetchCategoriesFailure(this.errMessage);
}

class FetchCategoriesSuccess extends MerchantsCategoryState {
  final CategoriesModel categories;

  const FetchCategoriesSuccess(this.categories);
}