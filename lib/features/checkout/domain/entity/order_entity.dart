import 'package:fruits_app/features/checkout/domain/entity/shipping_address_entity.dart';
import 'package:fruits_app/features/home/doman/entities/cart_item_entity.dart';

class OrderEntity {
  final List<CartItemEntity> cartItems;
  final bool payWithCash;
  final ShippingAddressEntity shippingAddressEntity;

  OrderEntity(this.payWithCash, {required this.cartItems, required this.shippingAddressEntity});
}
