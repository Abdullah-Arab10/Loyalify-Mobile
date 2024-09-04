import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/data/models/home_models/popular_stores_model/popular_stores_model.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/home_repo/home_repo.dart';

part 'get_popular_stores_state.dart';

class GetPopularStoresCubit extends Cubit<GetPopularStoresState> {
  GetPopularStoresCubit(this.homeRepo) : super(GetPopularStoresInitialState());

  static GetPopularStoresCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  PopularStoresModel? popularStoresModel;

  Future<void> getPopularStores() async {
    emit(GetPopularStoresLoadingState());
    var result = await homeRepo.getPopularStores();
    result.fold((failure) {
      emit(GetPopularStoresFailureState(failure.errMessage));
    }, (data) {
      popularStoresModel = data;
      emit(GetPopularStoresSuccessState(data));
    });
  }
}
