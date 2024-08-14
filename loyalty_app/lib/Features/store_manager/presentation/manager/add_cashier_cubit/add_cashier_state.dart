part of 'add_cashier_cubit.dart';

abstract class AddCashierState {
  const AddCashierState();
}

class AddCashierInitialState extends AddCashierState {}

final class CashierAddedLoading extends AddCashierState {}

final class CashierAddedSuccess extends AddCashierState {}

final class CashierAddedFailure extends AddCashierState {
  final String errMessage;

  CashierAddedFailure(this.errMessage);
}

final class NameOfCashierIsValid extends AddCashierState {}

final class NameOfCashierIsInValid extends AddCashierState {}

final class EmailOfCashierIsValid extends AddCashierState {}

final class EmailOfCashierIsInValid extends AddCashierState {}

final class PasswordOfCashierIsValid extends AddCashierState {}

final class PasswordOfCashierIsInValid extends AddCashierState {}

final class AllDataIsValid extends AddCashierState {}

final class AllDataIsInValid extends AddCashierState {}