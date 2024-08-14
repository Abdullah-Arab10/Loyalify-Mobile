import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_store_manager_data_classes.freezed.dart';

@freezed
class StoreManagerObject with _$StoreManagerObject {
  factory StoreManagerObject(String totalCost) = _StoreManagerObject;
}

@freezed
class CashierObject with _$CashierObject {
  factory CashierObject(String nameOfCashier, String emailOfCashier,
      String passwordOfCashier) = _CashierObject;
}
