import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/offer_details/data/models/offer_details_model/offer_details_model.dart';
import 'package:loyalty_app/Features/offer_details/data/repos/offer_details_repo.dart';
part 'fetch_offer_details_state.dart';

class FetchOfferDetailsCubit extends Cubit<FetchOfferDetailsState> {
  FetchOfferDetailsCubit(this.offerDetailsRepo)
      : super(FetchOfferDetailsInitial());

  static FetchOfferDetailsCubit get(context) => BlocProvider.of(context);

  final OfferDetailsRepo offerDetailsRepo;

  OfferDetailsModel? offerDetailsModel;

  Future<void> fetchOfferDetails(
      {required int userId, required String offerId}) async {
    emit(FetchOfferDetailsLoading());
    var result = await offerDetailsRepo.fetchOfferDetails(
        userId: userId, offerId: offerId);
    result.fold((failure) {
      emit(FetchOfferDetailsFailure(failure.errMessage));
    }, (details) {
      offerDetailsModel = details;
      emit(FetchOfferDetailsSuccess());
    });
  }
}
