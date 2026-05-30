import 'package:fruits_app/core/hleper_functions/get_currency.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';

class DetailsEntity {
  String? subtotal;
  String? shipping;
  String? shippingDiscount;

  DetailsEntity({this.subtotal, this.shipping, this.shippingDiscount});

  Map<String, dynamic> toJson() => {
        'subtotal': subtotal,
        'shipping': shipping,
        'shipping_discount': shippingDiscount,
      };

  factory DetailsEntity.fromEntity(OrderEntity orderEntity) {
    return DetailsEntity(
      subtotal: _calculatePaypalSubtotal(orderEntity),
      shipping: formatPaypalAmount(orderEntity.calculateShippingCost()),
      shippingDiscount:
          formatPaypalAmount(orderEntity.calculateShippingDiscount()),
    );
  }
}

String _calculatePaypalSubtotal(OrderEntity orderEntity) {
  var subtotal = 0.0;

  for (final cartItem in orderEntity.cartEntity.cartItems) {
    final itemPrice = double.parse(formatPaypalAmount(
      cartItem.productEntity.price,
    ));
    subtotal += itemPrice * cartItem.quantity;
  }

  return subtotal.toStringAsFixed(2);
}
