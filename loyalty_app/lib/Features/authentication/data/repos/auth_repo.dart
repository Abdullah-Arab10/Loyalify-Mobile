import 'package:dartz/dartz.dart';
import 'package:loyalty_app/Features/authentication/data/models/login_model.dart';
import 'package:loyalty_app/Features/authentication/data/models/register_model.dart';
import 'package:loyalty_app/Features/authentication/data/requests/auth_requests.dart';
import 'package:loyalty_app/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);
  Future<Either<Failure, RegisterModel>> register(RegisterRequest registerRequest);
}
