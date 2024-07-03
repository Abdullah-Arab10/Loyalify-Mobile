import 'package:dartz/dartz.dart';
import 'package:loyalty_app/Features/home_layout/data/models/categories_model/categories_model.dart';
import 'package:loyalty_app/Features/home_layout/data/models/stores_model/stores_model.dart';
import 'package:loyalty_app/core/errors/failures.dart';

abstract class MerchantsRepo {
  Future<Either<Failure, CategoriesModel>> fetchCategories();
  Future<Either<Failure, StoresModel>> fetchAllStores(
      {required int categoryId, String? search});
}
