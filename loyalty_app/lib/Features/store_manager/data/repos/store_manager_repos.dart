import 'package:dartz/dartz.dart';
import 'package:loyalty_app/Features/store_manager/data/models/process_on_points_model.dart';
import 'package:loyalty_app/core/errors/failures.dart';

abstract class StoreManagerRepos {
  Future<Either<Failure, ProcessOnPointsModel>> takeOffer(String userId, String offerId);
  Future<Either<Failure, ProcessOnPointsModel>> addPoints(
      String userId, String storeManagerId, double bill);
}