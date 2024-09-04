import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/data/models/home_models/popular_offers_model/popular_offers_model.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/home_repo/home_repo.dart';

part 'get_popular_offers_state.dart';

class GetPopularOffersCubit extends Cubit<GetPopularOffersState> {
  GetPopularOffersCubit(this.homeRepo) : super(GetPopularOffersInitialState());

  static GetPopularOffersCubit get(context) => BlocProvider.of(context);

  final HomeRepo homeRepo;

  Future<void> getPopularOffers() async {
    emit(GetPopularOffersLoadingState());
    var result = await homeRepo.getPopularOffers();
    result.fold((failure) {
      emit(GetPopularOffersFailureState(failure.errMessage));
    }, (data) {
      emit(GetPopularOffersSuccessState(data));
    });
  }
}
