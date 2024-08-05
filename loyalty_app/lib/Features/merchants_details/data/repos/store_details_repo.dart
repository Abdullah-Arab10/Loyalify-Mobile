import 'package:dartz/dartz.dart';
import 'package:loyalty_app/Features/merchants_details/data/models/store_details_model/store_details_model.dart';
import 'package:loyalty_app/core/errors/failures.dart';

abstract class StoreDetailsRepo {
  Future<Either<Failure, StoreDetailsModel>> fetchStoreDetails({required int storeId});
}
