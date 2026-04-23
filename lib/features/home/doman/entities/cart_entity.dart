import 'package:fruits_app/core/entities/product_entity.dart';
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
  bool isProductExist(ProductEntity productEntity){
    for(var cartItemEntity in cartItems){
      if(cartItemEntity == productEntity){
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity productEntity){
    for(var cartItemEntity in cartItems){
      if(cartItemEntity.productEntity == productEntity){
        return cartItemEntity;
      }
    }
    return CartItemEntity(productEntity: productEntity, count: 1);
  }

  
}