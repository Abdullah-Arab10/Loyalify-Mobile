part of 'get_points_cubit.dart';

abstract class GetPointsState {
  const GetPointsState();
}

class GetPointsInitialState extends GetPointsState {}

class GetPointsLoadingState extends GetPointsState {}

class GetPointsSuccessState extends GetPointsState {
  final double points;

  const GetPointsSuccessState(this.points);
}

class GetPointsFailureState extends GetPointsState {
  final String errMessage;

  const GetPointsFailureState(this.errMessage);
}
