import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/errors/failuer.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';

abstract class OrderRepo {
  Future<Either<Failure, void>> addOrder(OrderEntity orderEntity);
}
