import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:loyalty_app/Features/store_manager/data/repos/store_manager_repos.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';
part 'process_on_points_state.dart';

class ProcessOnPointsCubit extends Cubit<ProcessOnPointsState> {
  ProcessOnPointsCubit(this.storeManagerRepos) : super(ProcessOnPointsInitialState());

  static ProcessOnPointsCubit get(context) => BlocProvider.of(context);

  final StoreManagerRepos storeManagerRepos;

  bool isLoading = false;

  Future<void> takeOffer(String userId, String offerId) async {
    isLoading = true;
    emit(ProcessOnPointsLoadingState());
    var result = await storeManagerRepos.takeOffer(userId, offerId);
    result.fold((failure) {
      isLoading = false;
      emit(ProcessOnPointsFailureState(failure.errMessage));
    }, (data) {
      isLoading = false;

      emit(ProcessOnPointsSuccessState());
    });
  }

    Future<void> addPoints(String userId, String storeManagerId, double bill) async {
    isLoading = true;
    emit(ProcessOnPointsLoadingState());
    var result = await storeManagerRepos.addPoints(userId, storeManagerId, bill);
    result.fold((failure) {
      isLoading = false;
      emit(ProcessOnPointsFailureState(failure.errMessage));
    }, (data) {
      isLoading = false;

      emit(ProcessOnPointsSuccessState());
    });
  }
}
