part of 'process_on_points_cubit.dart';

abstract class ProcessOnPointsState {}

class ProcessOnPointsInitialState extends ProcessOnPointsState {}

class ProcessOnPointsLoadingState extends ProcessOnPointsState {}

class ProcessOnPointsFailureState extends ProcessOnPointsState {
  final String message;

  ProcessOnPointsFailureState(this.message);
}

class ProcessOnPointsSuccessState extends ProcessOnPointsState {}
