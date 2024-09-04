import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loyalty_app/Features/offer_details/data/models/offer_details_model/offer_details_model.dart';
import 'package:loyalty_app/Features/offer_details/data/repos/offer_details_repo.dart';
import 'package:loyalty_app/core/errors/failures.dart';
import 'package:loyalty_app/core/utils/api_service.dart';

class OfferDetailsRepoImpl implements OfferDetailsRepo {
  final ApiService apiService;
  OfferDetailsRepoImpl(this.apiService);

  @override
  Future<Either<Failure, OfferDetailsModel>> fetchOfferDetails(
      {required String userId, required String offerId}) async {
    try {
      var data = await apiService.get(endPoint: '/Offer/GetOfferDetails?UserId=$userId&OfferId=$offerId');

      OfferDetailsModel offerDetails = OfferDetailsModel.fromJson(data);

      return right(offerDetails);
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
