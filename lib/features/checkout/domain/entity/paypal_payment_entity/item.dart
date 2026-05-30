import 'package:fruits_app/core/hleper_functions/get_currency.dart';
import 'package:fruits_app/features/home/doman/entities/cart_item_entity.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
        'name': name,
        'quantity': quantity,
        'price': price,
        'currency': currency,
      };
  factory ItemEntity.formEntity(CartItemEntity cartItem) {
    return ItemEntity(
      name: cartItem.productEntity.name,
      quantity: cartItem.quantity,
      price: formatPaypalAmount(cartItem.productEntity.price),
      currency: getCurrency(),
    );
  }
}
