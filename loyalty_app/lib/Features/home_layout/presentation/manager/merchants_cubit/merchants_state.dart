part of 'merchants_cubit.dart';

abstract class MerchantsState {
  const MerchantsState();
}

class MerchantsInitialState extends MerchantsState {}

class FetchCategoriesLoading extends MerchantsState {}

class FetchCategoriesFailure extends MerchantsState {
  final String errMessage;

  const FetchCategoriesFailure(this.errMessage);
}

class FetchCategoriesSuccess extends MerchantsState {
  final CategoriesModel categories;

  const FetchCategoriesSuccess(this.categories);
}

class FetchStoresLoading extends MerchantsState {}

class FetchStoresFailure extends MerchantsState {
  final String errMessage;

  const FetchStoresFailure(this.errMessage);
}

class FetchStoresSuccess extends MerchantsState {
  final StoresModel stores;

  const FetchStoresSuccess(this.stores);
}

class ChangeIndexOfItemState extends MerchantsState {}
