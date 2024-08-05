import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loyalty_app/Features/home_layout/data/models/offer_model/offer_model.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/offers_repo/offer_repo.dart';
import 'package:loyalty_app/core/errors/failures.dart';
import 'package:loyalty_app/core/utils/api_service.dart';

class OfferRepoImpl implements OfferRepo {
  final ApiService apiService;

  OfferRepoImpl(this.apiService);

  @override
  Future<Either<Failure, OfferModel>> fetchAllOffersUser(int pageNum) async {
    try {
      var data = await apiService.get(
          endPoint: '/Offer/GetAllOffersUser?Page=$pageNum');

      OfferModel offerModel = OfferModel.fromJson(data);

      return right(offerModel);
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
  Future<Either<Failure, OfferModel>> fetchStoreOffers(int storeId) async {
    try {
      var data =
          await apiService.get(endPoint: '/Offer/GetStoreOffers/$storeId');

      OfferModel offerModel = OfferModel.fromJson(data);

      return right(offerModel);
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
