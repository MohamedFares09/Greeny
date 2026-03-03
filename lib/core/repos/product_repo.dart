import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/errors/failuer.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}