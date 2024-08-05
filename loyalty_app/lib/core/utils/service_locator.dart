import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:loyalty_app/Features/authentication/data/repos/auth_repo_impl.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/merchants_repos/merchants_repos_impl.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/offers_repo/offer_repo_impl.dart';
import 'package:loyalty_app/Features/merchants_details/data/repos/store_details_repo_impl.dart';
import 'package:loyalty_app/core/utils/app_prefs.dart';
import 'package:loyalty_app/core/utils/dio_factory.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_service.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  if (!GetIt.I.isRegistered<DioFactory>()) {
    final sharedPrefs = await SharedPreferences.getInstance();

    getIt.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

    // app prefs instance
    getIt.registerLazySingleton<AppPreferences>(
        () => AppPreferences(sharedPrefs));
    getIt.registerSingleton<DioFactory>(DioFactory());
    Dio dio = await getIt.get<DioFactory>().getDio();
    getIt.registerSingleton<ApiService>(ApiService(dio));
    getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(
      getIt.get<ApiService>(),
    ));
  }
}

initMerchantsModule() {
  if (!GetIt.I.isRegistered<MerchantsReposImpl>()) {
    getIt.registerSingleton<MerchantsReposImpl>(
        MerchantsReposImpl(getIt.get<ApiService>()));
  }
}

initStoreDetailsModule() {
  if (!GetIt.I.isRegistered<StoreDetailsRepoImpl>()) {
    getIt.registerSingleton<StoreDetailsRepoImpl>(
        StoreDetailsRepoImpl(getIt.get<ApiService>()));
  }
}

initOffersModule() {
  if (!GetIt.I.isRegistered<OfferRepoImpl>()) {
    getIt.registerSingleton<OfferRepoImpl>(
        OfferRepoImpl(getIt.get<ApiService>()));
  }
}
