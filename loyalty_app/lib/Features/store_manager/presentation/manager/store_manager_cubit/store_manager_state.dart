part of 'store_manager_cubit.dart';

abstract class StoreManagerState {}

class StoreManagerInitialState extends StoreManagerState {}

final class TotalCostIsValid extends StoreManagerState {}

final class TotalCostIsInValid extends StoreManagerState {}

final class AllDataIsValid extends StoreManagerState {}

final class AllDataIsInValid extends StoreManagerState {}
