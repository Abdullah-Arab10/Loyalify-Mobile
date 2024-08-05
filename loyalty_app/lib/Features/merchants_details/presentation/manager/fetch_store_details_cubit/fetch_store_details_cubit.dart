import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/merchants_details/data/models/store_details_model/store_details_model.dart';
import 'package:loyalty_app/Features/merchants_details/data/repos/store_details_repo.dart';
part 'fetch_store_details_state.dart';

class FetchStoreDetailsCubit extends Cubit<FetchStoreDetailsState> {
  FetchStoreDetailsCubit(this.storeDetailsRepo)
      : super(FetchStoreDetailsInitial());

  static FetchStoreDetailsCubit get(context) => BlocProvider.of(context);

  final StoreDetailsRepo storeDetailsRepo;

  StoreDetailsModel? storeDetailsModel;

  Future<void> fetchStoreDetails({required int storeId}) async {
    emit(FetchStoreDetailsLoading());
    var result = await storeDetailsRepo.fetchStoreDetails(storeId: storeId);
    result.fold((failure) {
      emit(FetchStoreDetailsFailure(failure.errMessage));
    }, (details) {
      storeDetailsModel = details;
      emit(FetchStoreDetailsSuccess());
    });
  }
}
