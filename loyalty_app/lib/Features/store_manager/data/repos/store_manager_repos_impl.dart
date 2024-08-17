import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loyalty_app/Features/store_manager/data/models/process_on_points_model.dart';
import 'package:loyalty_app/Features/store_manager/data/repos/store_manager_repos.dart';
import 'package:loyalty_app/core/errors/failures.dart';
import 'package:loyalty_app/core/utils/api_service.dart';

class StoreManagerReposImpl implements StoreManagerRepos {
  final ApiService apiService;

  StoreManagerReposImpl(this.apiService);

  @override
  Future<Either<Failure, ProcessOnPointsModel>> takeOffer(
      String userId, String offerId) async {
    try {
      var result = await apiService.postType2(
          endPoint:
              '/Offer/TakeOffer?UserId=4aaac0e9-b189-4219-bd7d-08dcbe350f93&OfferId=$offerId');

      final value = ProcessOnPointsModel.fromJson(result);

      return right(value);
    } catch (e) {
      if (e is DioException) {
        return left(
          AuthServerFailure.fromDioError(e),
        );
      }
      return left(
        AuthServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ProcessOnPointsModel>> addPoints(
      String userId, String storeManagerId, double bill) async {
    try {
      var result = await apiService.post(
        endPoint: '/Points/AddPoints',
        data: {
          'userId' : '4aaac0e9-b189-4219-bd7d-08dcbe350f93' /*userId*/,
          'storeManagerId' : storeManagerId,
          'bill' : bill
        },
      );

      final value = ProcessOnPointsModel.fromJson(result);

      return right(value);
    } catch (e) {
      if (e is DioException) {
        return left(
          AuthServerFailure.fromDioError(e),
        );
      }
      return left(
        AuthServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
