import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loyalty_app/Features/authentication/presentation/freezed/freezed_data_classes.dart';
import 'package:loyalty_app/core/utils/functions.dart';
part 'auth_validation_state.dart';


class AuthValidationCubit extends Cubit<AuthValidationState> {
  AuthValidationCubit() : super(AuthValidationInitial());
  
static AuthValidationCubit get(context) => BlocProvider.of(context);

  var loginObject = LoginObject("", "");

  setPassword(String password) {
    _isPasswordValid(password);
    loginObject = loginObject.copyWith(password: password);
    _areAllInputsValid();
  }

  setEmail(String email) {
    _isEmailValid(email);
    loginObject = loginObject.copyWith(email: email);
    _areAllInputsValid();
  }

  bool _isPasswordValid(String password) {
    if (password.isNotEmpty &&
        password.length >= 6 &&
        isDigitPasswordValid(password) &&
        isUpperCasePasswordValid(password) &&
        isLowerCasePasswordValid(password)) {
      emit(PasswordIsValid());
      return true;
    } else {
      emit(PasswordIsInValid());
      return false;
    }
  }

  bool _isEmailValid(String email) {
    if (email.isNotEmpty && EmailValidator.validate(email)) {
      emit(EmailIsValid());
      return true;
    } else {
      emit(EmailIsInValid());
      return false;
    }
  }

  void _areAllInputsValid() {
    if (_isPasswordValid(loginObject.password) &&
        _isEmailValid(loginObject.email)) {
      emit(AllDataIsValid());
    }
  }

}
