import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';

class DetailsEntity {
  double? subtotal;
  double? shipping;
  double? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };
  factory DetailsEntity.fromEntity(OrderEntity orderEntity) {
    return DetailsEntity(
      subtotal: orderEntity.cartEntity.calculateTotalPrice(),
      shipping: orderEntity.calculateShippingDiscount(),
      shippingDiscount: orderEntity.calculateShippingCost(),
    );
  }
}
