import 'package:dartz/dartz.dart';
import 'package:loyalty_app/Features/home_layout/data/models/home_models/get_points_model/get_points_model.dart';
import 'package:loyalty_app/Features/home_layout/data/models/home_models/popular_offers_model/popular_offers_model.dart';
import 'package:loyalty_app/Features/home_layout/data/models/home_models/popular_stores_model/popular_stores_model.dart';
import 'package:loyalty_app/core/errors/failures.dart';

abstract class HomeRepo {
  Future<Either<Failure, GetPointsModel>> getUserPoints(String userId);
  Future<Either<Failure, PopularStoresModel>> getPopularStores();
  Future<Either<Failure, PopularOffersModel>> getPopularOffers();
}
