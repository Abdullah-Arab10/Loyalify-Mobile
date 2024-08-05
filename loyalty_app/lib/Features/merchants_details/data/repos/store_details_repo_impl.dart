import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loyalty_app/Features/merchants_details/data/models/store_details_model/store_details_model.dart';
import 'package:loyalty_app/Features/merchants_details/data/repos/store_details_repo.dart';
import 'package:loyalty_app/core/errors/failures.dart';
import 'package:loyalty_app/core/utils/api_service.dart';

class StoreDetailsRepoImpl implements StoreDetailsRepo {
  final ApiService apiService;
  StoreDetailsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, StoreDetailsModel>> fetchStoreDetails(
      {required int storeId}) async {
    try {
      var data =
          await apiService.get(endPoint: '/Store/GetStoreById/$storeId');

      StoreDetailsModel storeDetails = StoreDetailsModel.fromJson(data);

      return right(storeDetails);
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
