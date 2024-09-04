part of 'get_popular_offers_cubit.dart';

abstract class GetPopularOffersState {
  const GetPopularOffersState();
}

class GetPopularOffersInitialState extends GetPopularOffersState {}

class GetPopularOffersLoadingState extends GetPopularOffersState {}

class GetPopularOffersSuccessState extends GetPopularOffersState {
  final PopularOffersModel popularOffersModel;

  const GetPopularOffersSuccessState(this.popularOffersModel);
}

class GetPopularOffersFailureState extends GetPopularOffersState {
  final String errMessage;

  const GetPopularOffersFailureState(this.errMessage);
}