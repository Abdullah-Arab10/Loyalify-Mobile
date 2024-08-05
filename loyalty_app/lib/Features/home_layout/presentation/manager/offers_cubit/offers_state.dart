part of 'offers_cubit.dart';

abstract class OffersState {
  const OffersState();
}

class OffersStateInitial extends OffersState {}

class FetchOffersLoading extends OffersState {
  final List<Item> oldOffers;
  final bool isFirstFetch;

  const FetchOffersLoading(this.oldOffers, {this.isFirstFetch = false});
}

class FetchOffersFailure extends OffersState {
  final String errMessage;

  const FetchOffersFailure(this.errMessage);
}

class FetchOffersSuccess extends OffersState {
  final int? status;
  final List<Item> offers;

  const FetchOffersSuccess(this.offers, this.status);
}
