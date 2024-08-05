part of 'fetch_store_offers_cubit.dart';

abstract class FetchStoreOffersState {
  const FetchStoreOffersState();
}

class FetchStoreOffersInitial extends FetchStoreOffersState {}

class FetchStoreOffersLoading extends FetchStoreOffersState {}

class FetchStoreOffersFailure extends FetchStoreOffersState {
  final String errMessage;

  const FetchStoreOffersFailure(this.errMessage);
}

class FetchStoreOffersSuccess extends FetchStoreOffersState {
  final OfferModel storeOffers;

  const FetchStoreOffersSuccess(this.storeOffers);
}
