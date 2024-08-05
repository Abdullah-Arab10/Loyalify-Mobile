import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/data/models/offer_model/item.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/offers_repo/offer_repo.dart';
part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit(this.offerRepo) : super(OffersStateInitial());

  static OffersCubit get(context) => BlocProvider.of(context);

  int page = 1;

  List<Item> offers = [];

  bool isLoading = false;

  final OfferRepo offerRepo;

  void determineOffers(List<Item> selectedOffers, bool oldOrNew) {
    offers = selectedOffers;
    oldOrNew ? isLoading = true : isLoading;
  }

  Future<void> fetchAllOffersUser() async {
    if (state is FetchOffersLoading) return;

    final currentState = state;

    var oldOffers = <Item>[];
    if (currentState is FetchOffersSuccess) {
      oldOffers = currentState.offers;
    }

    emit(FetchOffersLoading(oldOffers, isFirstFetch: page == 1));

    var result = await offerRepo.fetchAllOffersUser(page);

    result.fold((failure) {
      emit(FetchOffersFailure(failure.errMessage));
    }, (offers) {
      page++;

      final allOffers = (state as FetchOffersLoading).oldOffers;
      allOffers.addAll(offers.items);

      emit(FetchOffersSuccess(allOffers, offers.status));
    });
  }
}
