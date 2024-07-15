import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loyalty_app/Features/home_layout/data/models/categories_model/categories_model.dart';
import 'package:loyalty_app/Features/home_layout/data/models/search_model/search_stores_model.dart';
import 'package:loyalty_app/Features/home_layout/data/models/stores_model/stores_model.dart';
import 'package:loyalty_app/Features/home_layout/data/repos/merchants_repos/merchants_repos.dart';
import 'package:loyalty_app/core/errors/failures.dart';
import 'package:loyalty_app/core/utils/api_service.dart';

class MerchantsReposImpl implements MerchantsRepo {
  final ApiService apiService;

  MerchantsReposImpl(this.apiService);

  @override
  Future<Either<Failure, CategoriesModel>> fetchCategories() async {
    try {
      var data = await apiService.get(endPoint: '/Category/GetCategories');

      CategoriesModel categoriesModel = CategoriesModel.fromJson(data);

      return right(categoriesModel);
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
  Future<Either<Failure, StoresModel>> fetchAllStores(
      {required int categoryId}) async {
    try {
      var data = await apiService.get(
          endPoint: '/Store/GetAllStoresUser?CategoryId=$categoryId');

      StoresModel storesModel = StoresModel.fromJson(data);

      return right(storesModel);
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
  Future<Either<Failure, SearchStoresModel>> searchStores(
      {required int categoryId, String? search}) async {
    try {
      var data = await apiService.get(
          endPoint: search != null
              ? '/Store/GetAllStoresUser?CategoryId=$categoryId&Search=$search'
              : '/Store/GetAllStoresUser?CategoryId=$categoryId');

      SearchStoresModel storesModel = SearchStoresModel.fromJson(data);

      return right(storesModel);
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
