import 'package:fruits_app/features/home/doman/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;
  CartEntity({required this.cartItems});


  addCartItem(CartItemEntity cartItemEntity){
    cartItems.add(cartItemEntity);
  }
  removeCartItem(CartItemEntity cartItemEntity){
    cartItems.remove(cartItemEntity);
  }

  
}