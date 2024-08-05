import 'package:dartz/dartz.dart';
import 'package:loyalty_app/Features/home_layout/data/models/offer_model/offer_model.dart';
import 'package:loyalty_app/core/errors/failures.dart';

abstract class OfferRepo {
  Future<Either<Failure, OfferModel>> fetchAllOffersUser(int pageNum);
  Future<Either<Failure, OfferModel>> fetchStoreOffers(int storeId);
}
