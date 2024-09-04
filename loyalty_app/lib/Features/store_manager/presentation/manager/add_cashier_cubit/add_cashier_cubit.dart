import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/store_manager/data/repos/store_manager_repos.dart';
import 'package:loyalty_app/Features/store_manager/presentation/freezed/freezed_store_manager_data_classes.dart';
import 'package:loyalty_app/core/utils/functions.dart';
part 'add_cashier_state.dart';

class AddCashierCubit extends Cubit<AddCashierState> {
  AddCashierCubit(this.storeManagerRepos) : super(AddCashierInitialState());

  static AddCashierCubit get(context) => BlocProvider.of(context);

  var cashierObject = CashierObject("", "", "", "");

  final StoreManagerRepos storeManagerRepos;

  bool isLoading = false;

  Future<void> addCashier(
    String storeManagerId,
  ) async {
    isLoading = true;
    emit(CashierAddedLoading());
    var result = await storeManagerRepos.addCashier(
        storeManagerId,
        cashierObject.firstNameOfCashier,
        cashierObject.lastNameOfCashier,
        cashierObject.emailOfCashier,
        cashierObject.passwordOfCashier);
    result.fold((failure) {
      isLoading = false;
      emit(CashierAddedFailure(failure.errMessage));
    }, (data) {
      isLoading = false;

      emit(CashierAddedSuccess());
    });
  }

  setFirstNameOfCashier(String firstNameOfCashier) {
    if (_isFirstNameOfCashierValid(firstNameOfCashier)) {
      cashierObject =
          cashierObject.copyWith(firstNameOfCashier: firstNameOfCashier);
    } else {
      cashierObject = cashierObject.copyWith(firstNameOfCashier: "");
    }
    _areAllInputsValid();
  }

  bool _isFirstNameOfCashierValid(String firstNameOfCashier) {
    if (firstNameOfCashier.isNotEmpty) {
      emit(FirstNameOfCashierIsValid());
      return true;
    } else {
      emit(FirstNameOfCashierIsInValid());
      return false;
    }
  }

  setLastNameOfCashier(String lastNameOfCashier) {
    if (_isLastNameOfCashierValid(lastNameOfCashier)) {
      cashierObject =
          cashierObject.copyWith(lastNameOfCashier: lastNameOfCashier);
    } else {
      cashierObject = cashierObject.copyWith(lastNameOfCashier: "");
    }
    _areAllInputsValid();
  }

  bool _isLastNameOfCashierValid(String lastNameOfCashier) {
    if (lastNameOfCashier.isNotEmpty) {
      emit(LastNameOfCashierIsValid());
      return true;
    } else {
      emit(LastNameOfCashierIsInValid());
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
    if (cashierObject.firstNameOfCashier.isNotEmpty &&
        cashierObject.emailOfCashier.isNotEmpty &&
        cashierObject.passwordOfCashier.isNotEmpty) {
      emit(AllDataIsValid());
    }
  }

  clearcashierObject() {
    cashierObject = cashierObject.copyWith(firstNameOfCashier: "");
    cashierObject = cashierObject.copyWith(emailOfCashier: "");
    cashierObject = cashierObject.copyWith(passwordOfCashier: "");
    emit(AllDataIsInValid());
  }
}
