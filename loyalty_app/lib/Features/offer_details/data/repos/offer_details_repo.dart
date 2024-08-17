import 'package:dartz/dartz.dart';
import 'package:loyalty_app/Features/offer_details/data/models/offer_details_model/offer_details_model.dart';
import 'package:loyalty_app/core/errors/failures.dart';

abstract class OfferDetailsRepo{
  Future<Either<Failure, OfferDetailsModel>> fetchOfferDetails({required String userId, required String offerId});
}