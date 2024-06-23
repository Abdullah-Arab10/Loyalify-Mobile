part of 'auth_validation_cubit.dart';

abstract class AuthValidationState{}

final class AuthValidationInitial extends AuthValidationState {}

final class EmailIsValid extends AuthValidationInitial {}

final class EmailIsInValid extends AuthValidationInitial {}

final class PasswordIsValid extends AuthValidationInitial {}

final class PasswordIsInValid extends AuthValidationInitial {}

final class AllDataIsValid extends AuthValidationInitial {}