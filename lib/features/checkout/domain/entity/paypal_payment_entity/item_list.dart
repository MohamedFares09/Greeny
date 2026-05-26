import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';
import 'package:fruits_app/features/home/doman/entities/cart_item_entity.dart';

import 'item.dart';

class ItemList {
  List<ItemEntity>? items;

  ItemList({this.items});

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
      };
    factory ItemList.fromEntity(List<CartItemEntity> cartItems) {
      return ItemList(
        items: cartItems
            .map((cartItem) => ItemEntity.formEntity(cartItem))
            .toList(),
      );
    }
}
