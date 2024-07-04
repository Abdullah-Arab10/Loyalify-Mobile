import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/data/models/categories_model/categories_model.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/merchants_repos/merchants_repos.dart';
part 'merchants_category_state.dart';

class MerchantsCategoryCubit extends Cubit<MerchantsCategoryState> {
  MerchantsCategoryCubit(this.merchantsRepo)
      : super(MerchantsCategoryInitial());

  MerchantsCategoryCubit get(context) => BlocProvider.of(context);

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
}
