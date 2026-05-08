import 'package:fruits_app/features/home/doman/entities/cart_item_entity.dart';

class OrderProductModel {
  final String name;
  final double price;
  final int quantity;
  final String imageUrl;
  final String code;

  OrderProductModel(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.imageUrl,
      required this.code});

  factory OrderProductModel.fromEntity(CartItemEntity entity) {
    return OrderProductModel(
      name: entity.productEntity.name,
      price: entity.productEntity.price.toDouble(),
      quantity: entity.quantity,
      imageUrl: entity.productEntity.urlImage!,
      code: entity.productEntity.code,
    );
  }
  toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,
      'code': code,
    };
  }
}
