import 'package:fruits_app/core/hleper_functions/get_currency.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';

import 'details.dart';

class Amount {
  double? total;
  String? currency;
  DetailsEntity? details;

  Amount({this.total, this.currency, this.details});

  Map<String, dynamic> toJson() => {
        'total': total,
        'currency': currency,
        'details': details?.toJson(),
      };
  factory Amount.fromEntity(OrderEntity orderEntity) {
    return Amount(
      total: orderEntity.calculateTotalPriceAfterDiscountAndShipping(),
      currency: getCurrency(),
      details: DetailsEntity.fromEntity(orderEntity)

    );
  }
}
