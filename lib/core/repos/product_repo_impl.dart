import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/errors/failuer.dart';
import 'package:fruits_app/core/repos/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() {
    // TODO: implement getAllProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() {
    // TODO: implement getBestSellingProducts
    throw UnimplementedError();
  }
}