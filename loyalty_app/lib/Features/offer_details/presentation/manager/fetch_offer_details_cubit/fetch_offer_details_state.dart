part of 'fetch_offer_details_cubit.dart';

abstract class FetchOfferDetailsState {
  const FetchOfferDetailsState();
}

class FetchOfferDetailsInitial extends FetchOfferDetailsState {}

class FetchOfferDetailsLoading extends FetchOfferDetailsState {}

class FetchOfferDetailsFailure extends FetchOfferDetailsState {
  final String errMessage;

  const FetchOfferDetailsFailure(this.errMessage);
}

class FetchOfferDetailsSuccess extends FetchOfferDetailsState {}
