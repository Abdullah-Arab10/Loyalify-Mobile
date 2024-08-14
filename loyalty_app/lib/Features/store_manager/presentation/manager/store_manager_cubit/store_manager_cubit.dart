import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/store_manager/presentation/freezed/freezed_store_manager_data_classes.dart';
part 'store_manager_state.dart';

class StoreManagerCubit extends Cubit<StoreManagerState> {
  StoreManagerCubit() : super(StoreManagerInitialState());

  static StoreManagerCubit get(context) => BlocProvider.of(context);

  var storeManagerObject = StoreManagerObject("");

  setTotalCost(String totalCost) {
    if (_isTotalCostValid(totalCost)) {
      storeManagerObject = storeManagerObject.copyWith(totalCost: totalCost);
    } else {
      storeManagerObject = storeManagerObject.copyWith(totalCost: "");
    }
    _areAllInputsValid();
  }

  bool _isTotalCostValid(String totalCost) {
    if (totalCost.isNotEmpty) {
      emit(TotalCostIsValid());
      return true;
    } else {
      emit(TotalCostIsInValid());
      return false;
    }
  }

  void _areAllInputsValid() {
    if (storeManagerObject.totalCost.isNotEmpty) {
      emit(AllDataIsValid());
    }
  }

  clearstoreManagerObject() {
    storeManagerObject = storeManagerObject.copyWith(totalCost: "");
    emit(AllDataIsInValid());
  }
}
