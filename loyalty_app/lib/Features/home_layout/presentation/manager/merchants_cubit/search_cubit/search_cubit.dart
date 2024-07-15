import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/home_layout/data/models/search_model/search_stores_model.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/merchants_repos/merchants_repos.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.merchantsRepo) : super(SearchInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  final MerchantsRepo merchantsRepo;

  Future<void> searchStores({required int categoryId, String? search}) async {
    emit(SearchLoading());
    var result = await merchantsRepo.searchStores(categoryId: categoryId, search: search);
    result.fold((failure) {
      emit(SearchFailure(failure.errMessage));
    }, (stores) {
      emit(SearchSuccess(stores));
    });
  }
}
