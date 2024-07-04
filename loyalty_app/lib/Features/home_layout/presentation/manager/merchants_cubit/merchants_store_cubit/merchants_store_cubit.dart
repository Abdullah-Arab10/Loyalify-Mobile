import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/data/models/stores_model/stores_model.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/merchants_repos/merchants_repos.dart';
part 'merchants_store_state.dart';

class MerchantsStoreCubit extends Cubit<MerchantsStoreState> {
  MerchantsStoreCubit(this.merchantsRepo) : super(MerchantsStoreInitial());

  MerchantsStoreCubit get(context) => BlocProvider.of(context);

  final MerchantsRepo merchantsRepo;

  Future<void> fetchStores() async {
    emit(FetchStoresLoading());
    var result = await merchantsRepo.fetchAllStores(categoryId: 0);
    result.fold((failure) {
      emit(FetchStoresFailure(failure.errMessage));
    }, (stores) {
      emit(FetchStoresSuccess(stores));
    });
  }
}
