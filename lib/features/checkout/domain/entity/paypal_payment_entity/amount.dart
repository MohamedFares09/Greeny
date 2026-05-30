import 'package:fruits_app/core/hleper_functions/get_currency.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';

import 'details.dart';

class Amount {
  String? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
  factory Amount.fromEntity(OrderEntity orderEntity) {
    final details = DetailsEntity.fromEntity(orderEntity);
    final total = double.parse(details.subtotal!) +
        double.parse(details.shipping!) -
        double.parse(details.shippingDiscount!);

    return Amount(
      total: total.toStringAsFixed(2),
      currency: getCurrency(),
      details: details,
    );
  }
}
