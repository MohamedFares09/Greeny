import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/errors/failuer.dart';
import 'package:fruits_app/core/models/product_model.dart';
import 'package:fruits_app/core/repos/product_repo.dart';
import 'package:fruits_app/core/services/database_services.dart';
import 'package:fruits_app/core/utils/backend_endpoint.dart';

class ProductRepoImpl extends ProductRepo {
  final DataBaseServices dataBaseServices;
  ProductRepoImpl(this.dataBaseServices);
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      var data = await dataBaseServices.getData(
          path: BackendEndpoint.getAllProducts) as List<Map<String, dynamic>>;
      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } on Exception catch (e) {
      return left(ServerFailure( e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }
}
