part of 'merchants_store_cubit.dart';

abstract class MerchantsStoreState {
  const MerchantsStoreState();
}

class MerchantsStoreInitial extends MerchantsStoreState {}

class FetchStoresLoading extends MerchantsStoreState {}

class FetchStoresFailure extends MerchantsStoreState {
  final String errMessage;

  const FetchStoresFailure(this.errMessage);
}

class FetchStoresSuccess extends MerchantsStoreState {
  final StoresModel stores;

  const FetchStoresSuccess(this.stores);
}
