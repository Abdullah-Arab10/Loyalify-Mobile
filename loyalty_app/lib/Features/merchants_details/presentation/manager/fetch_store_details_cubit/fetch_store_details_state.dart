part of 'fetch_store_details_cubit.dart';

abstract class FetchStoreDetailsState {
  const FetchStoreDetailsState();
}

class FetchStoreDetailsInitial extends FetchStoreDetailsState {}

class FetchStoreDetailsLoading extends FetchStoreDetailsState {}

class FetchStoreDetailsFailure extends FetchStoreDetailsState {
  final String errMessage;

  const FetchStoreDetailsFailure(this.errMessage);
}

class FetchStoreDetailsSuccess extends FetchStoreDetailsState {}
