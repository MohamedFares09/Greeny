import 'package:fruits_app/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int quantity;

  CartItemEntity({
    required this.productEntity,
    this.quantity = 0,
  });

  num calculateTotalPrice() {
    return productEntity.price * quantity;
  }

  num calculateTotalWeight() {
    return productEntity.unitAmout * quantity;
  }

  incrementQuantity() {
    quantity++;
  }

  decrementQuantity() {
    if (quantity > 0) {
      quantity--;
    }
  }
}
