import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loyalty_app/Features/home_layout/data/models/home_models/get_points_model/get_points_model.dart';
import 'package:loyalty_app/Features/home_layout/data/models/home_models/popular_offers_model/popular_offers_model.dart';
import 'package:loyalty_app/Features/home_layout/data/models/home_models/popular_stores_model/popular_stores_model.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/home_repo/home_repo.dart';
import 'package:loyalty_app/core/errors/failures.dart';
import 'package:loyalty_app/core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;
  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, GetPointsModel>> getUserPoints(String userId) async {
    try {
      var data =
          await apiService.get(endPoint: '/Points/GetUserPoints/$userId');

      GetPointsModel getPointsModel = GetPointsModel.fromJson(data);

      return right(getPointsModel);
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
  Future<Either<Failure, PopularOffersModel>> getPopularOffers() async {
    try {
      var data = await apiService.get(endPoint: '/Offer/GetPopularOffers');

      PopularOffersModel popularOffersModel = PopularOffersModel.fromJson(data);

      return right(popularOffersModel);
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
  Future<Either<Failure, PopularStoresModel>> getPopularStores() async {
    try {
      var data = await apiService.get(endPoint: '/Store/GetPopularStores');

      PopularStoresModel popularStoresModel = PopularStoresModel.fromJson(data);

      return right(popularStoresModel);
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
