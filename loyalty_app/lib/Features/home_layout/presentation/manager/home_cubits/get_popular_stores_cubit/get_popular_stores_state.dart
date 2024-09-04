part of 'get_popular_stores_cubit.dart';

abstract class GetPopularStoresState {
  const GetPopularStoresState();
}

class GetPopularStoresInitialState extends GetPopularStoresState {}

class GetPopularStoresLoadingState extends GetPopularStoresState {}

class GetPopularStoresSuccessState extends GetPopularStoresState {
  final PopularStoresModel popularStoresModel;

  const GetPopularStoresSuccessState(this.popularStoresModel);
}

class GetPopularStoresFailureState extends GetPopularStoresState {
  final String errMessage;

  const GetPopularStoresFailureState(this.errMessage);
}
