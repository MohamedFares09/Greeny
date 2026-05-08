import 'package:dartz/dartz.dart';

import 'package:fruits_app/core/errors/failuer.dart';
import 'package:fruits_app/core/services/database_services.dart';
import 'package:fruits_app/core/services/firestore_services.dart';
import 'package:fruits_app/core/utils/backend_endpoint.dart';
import 'package:fruits_app/features/checkout/data/models/order_model.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';

import 'order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final DataBaseServices fireStoreServices;

  OrderRepoImpl({required this.fireStoreServices});
  @override
  Future<Either<Failure, void>> addOrder(OrderEntity orderEntity) async {
    try {
      await fireStoreServices.addData(
          path: BackendEndpoint.addOrder,
          data: OrderModel.fromEntity(orderEntity).toJson());
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
