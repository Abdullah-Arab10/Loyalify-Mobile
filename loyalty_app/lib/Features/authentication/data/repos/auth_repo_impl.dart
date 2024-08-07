import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loyalty_app/Features/authentication/data/models/login_model.dart';
import 'package:loyalty_app/Features/authentication/data/models/register_model.dart';
import 'package:loyalty_app/Features/authentication/data/repos/auth_repo.dart';
import 'package:loyalty_app/Features/authentication/data/requests/auth_requests.dart';
import 'package:loyalty_app/core/errors/failures.dart';
import 'package:loyalty_app/core/utils/api_service.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl(this.apiService);
  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    try {
      var result = await apiService.post(endPoint: '/Auth/login', data: {
        'email': loginRequest.email,
        'password': loginRequest.password,
      });

      final value = LoginModel.fromJson(result);

      return right(value);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register(
      RegisterRequest registerRequest) async {
    try {
      var result = await apiService.post(endPoint: '/Auth/register', data: {
        'firstName': registerRequest.firstName,
        'lastName': registerRequest.lastName,
        'email': registerRequest.email,
        'password': registerRequest.password,
        'phoneNumber': registerRequest.phoneNumber,
        'address': registerRequest.address
      });

      final value = RegisterModel.fromJson(result);

      return right(value);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
