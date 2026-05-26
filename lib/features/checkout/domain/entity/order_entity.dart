import 'package:fruits_app/features/checkout/domain/entity/shipping_address_entity.dart';
import 'package:fruits_app/features/home/doman/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  final String uID;
  bool? payWithCash;
  ShippingAddressEntity? shippingAddressEntity = ShippingAddressEntity();

  OrderEntity(this.cartEntity,
      {this.payWithCash, this.shippingAddressEntity, required this.uID});

  double calculateShippingCost() {
    if (payWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  double calculateShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartEntity.calculateTotalPrice() +
        calculateShippingCost() -
        calculateShippingDiscount();
  }


}
