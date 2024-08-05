import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/data/models/offer_model/offer_model.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/offers_repo/offer_repo.dart';

part 'fetch_store_offers_state.dart';

class FetchStoreOffersCubit extends Cubit<FetchStoreOffersState> {
  FetchStoreOffersCubit(this.offerRepo) : super(FetchStoreOffersInitial());

  static FetchStoreOffersCubit get(context) => BlocProvider.of(context);

  final OfferRepo offerRepo;

  Future<void> fetchStoreOffers({required int storeId}) async {
    emit(FetchStoreOffersLoading());
    var result = await offerRepo.fetchStoreOffers(storeId);
    result.fold((failure) {
      emit(FetchStoreOffersFailure(failure.errMessage));
    }, (storeOffers) {
      emit(FetchStoreOffersSuccess(storeOffers));
    });
  }
}
