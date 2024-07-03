import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/data/models/categories_model/categories_model.dart';
import 'package:loyalty_app/Features/home_layout/data/models/categories_model/category.dart';
import 'package:loyalty_app/Features/home_layout/data/models/stores_model/stores_model.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/merchants_repos/merchants_repos.dart';
part 'merchants_state.dart';

class MerchantsCubit extends Cubit<MerchantsState> {
  MerchantsCubit(this.merchantsRepo) : super(MerchantsInitialState());

  static MerchantsCubit get(context) => BlocProvider.of(context);

  final MerchantsRepo merchantsRepo;

  Future<void> fetchCategories() async {
    emit(FetchCategoriesLoading());
    var result = await merchantsRepo.fetchCategories();
    result.fold((failure) {
      emit(FetchCategoriesFailure(failure.errMessage));
    }, (category) {
      emit(FetchCategoriesSuccess(category));
    });
  }

  Future<void> fetchStores() async {
    emit(FetchStoresLoading());
    var result = await merchantsRepo.fetchAllStores(categoryId: 0);
    result.fold((failure) {
      emit(FetchStoresFailure(failure.errMessage));
    }, (stores) {
      emit(FetchStoresSuccess(stores));
    });
  }

  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeIndexOfItemState());
  }
}
