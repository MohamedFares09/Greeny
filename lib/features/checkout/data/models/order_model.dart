import 'package:fruits_app/features/checkout/data/models/order_product_model.dart';
import 'package:fruits_app/features/checkout/data/models/shipping_address_model.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';

class OrderModel {
  final double totalPrice;
  final String uid;
  final ShippingAddressModel shippingAddressModel;
  final List<OrderProductModel> orderProducts;
  final String paymentMethod;

  OrderModel({
    required this.totalPrice,
    required this.uid,
    required this.shippingAddressModel,
    required this.orderProducts,
    required this.paymentMethod,
  });

  factory OrderModel.fromEntity(OrderEntity entity) {
    return OrderModel(
      totalPrice: entity.cartEntity.calculateTotalPrice(),
      uid: entity.uID,
      shippingAddressModel:
          ShippingAddressModel.fromEntity(entity.shippingAddressEntity!),
      orderProducts: entity.cartEntity.cartItems
          .map((item) => OrderProductModel.fromEntity(item))
          .toList(),
      paymentMethod: entity.payWithCash! ? 'Cash' : 'PayPal',
    );
  }

  toJson() {
    return {
      'totalPrice': totalPrice,
      'uid': uid,
      'shippingAddress': shippingAddressModel.toJson(),
      'orderProducts':
          orderProducts.map((product) => product.toJson()).toList(),
      'paymentMethod': paymentMethod,
    };
  }
}
