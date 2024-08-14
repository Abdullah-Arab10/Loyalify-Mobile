import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/store_manager/presentation/freezed/freezed_store_manager_data_classes.dart';
import 'package:loyalty_app/core/utils/functions.dart';
part 'add_cashier_state.dart';

class AddCashierCubit extends Cubit<AddCashierState> {
  AddCashierCubit() : super(AddCashierInitialState());

  static AddCashierCubit get(context) => BlocProvider.of(context);

  var cashierObject = CashierObject("", "", "");

  setNameOfCashier(String nameOfCashier) {
    if (_isNameOfCashierValid(nameOfCashier)) {
      cashierObject = cashierObject.copyWith(nameOfCashier: nameOfCashier);
    } else {
      cashierObject = cashierObject.copyWith(nameOfCashier: "");
    }
    _areAllInputsValid();
  }

  bool _isNameOfCashierValid(String nameOfCashier) {
    if (nameOfCashier.isNotEmpty) {
      emit(NameOfCashierIsValid());
      return true;
    } else {
      emit(NameOfCashierIsInValid());
      return false;
    }
  }

  setEmailOfCashier(String emailOfCashier) {
    if (_isEmailOfCashierValid(emailOfCashier)) {
      cashierObject = cashierObject.copyWith(emailOfCashier: emailOfCashier);
    } else {
      cashierObject = cashierObject.copyWith(emailOfCashier: "");
    }
    _areAllInputsValid();
  }

  bool _isEmailOfCashierValid(String emailOfCashier) {
    if (emailOfCashier.isNotEmpty && EmailValidator.validate(emailOfCashier)) {
      emit(EmailOfCashierIsValid());
      return true;
    } else {
      emit(EmailOfCashierIsInValid());
      return false;
    }
  }

  setPasswordOfCashier(String passwordOfCashier) {
    if (_isPasswordOfCashierValid(passwordOfCashier)) {
      cashierObject =
          cashierObject.copyWith(passwordOfCashier: passwordOfCashier);
    } else {
      cashierObject = cashierObject.copyWith(passwordOfCashier: "");
    }
    _areAllInputsValid();
  }

  bool _isPasswordOfCashierValid(String passwordOfCashier) {
    if (passwordOfCashier.isNotEmpty &&
        passwordOfCashier.length >= 8 &&
        isDigitPasswordValid(passwordOfCashier) &&
        isSymbolPasswordValid(passwordOfCashier) &&
        isUpperCasePasswordValid(passwordOfCashier) &&
        isLowerCasePasswordValid(passwordOfCashier)) {
      emit(PasswordOfCashierIsValid());
      return true;
    } else {
      emit(PasswordOfCashierIsInValid());
      return false;
    }
  }

  void _areAllInputsValid() {
    if (cashierObject.nameOfCashier.isNotEmpty &&
        cashierObject.emailOfCashier.isNotEmpty &&
        cashierObject.passwordOfCashier.isNotEmpty) {
      emit(AllDataIsValid());
    }
  }

  clearcashierObject() {
    cashierObject = cashierObject.copyWith(nameOfCashier: "");
    cashierObject = cashierObject.copyWith(emailOfCashier: "");
    cashierObject = cashierObject.copyWith(passwordOfCashier: "");
    emit(AllDataIsInValid());
  }
}
