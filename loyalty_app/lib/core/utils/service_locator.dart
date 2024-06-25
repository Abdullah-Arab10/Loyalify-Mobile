import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:loyalty_app/Features/authentication/data/repos/auth_repo_impl.dart';
import 'package:loyalty_app/core/utils/dio_factory.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async{
  if (!GetIt.I.isRegistered<DioFactory>()) {
    getIt.registerSingleton<DioFactory>(DioFactory());
    Dio dio = await getIt.get<DioFactory>().getDio();
    getIt.registerSingleton<ApiService>(ApiService(dio));
    getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
      getIt.get<ApiService>(),
    ));
  }
}
