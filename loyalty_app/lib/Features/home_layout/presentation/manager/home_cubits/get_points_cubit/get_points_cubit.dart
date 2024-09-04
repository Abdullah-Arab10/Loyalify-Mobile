import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/home_repo/home_repo.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/service_locator.dart';

part 'get_points_state.dart';

class GetPointsCubit extends Cubit<GetPointsState> {
  GetPointsCubit(this.homeRepo) : super(GetPointsInitialState());

  static GetPointsCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> getUserPoints(String userId) async {
    emit(GetPointsLoadingState());
    var result = await homeRepo.getUserPoints(userId);
    result.fold((failure) {
      emit(GetPointsFailureState(failure.errMessage));
    }, (data) {
      emit(GetPointsSuccessState(data.points ?? 0.0));
    });
  }
}
