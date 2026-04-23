import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/features/home/doman/entities/cart_entity.dart';
import 'package:fruits_app/features/home/doman/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(cartItems: []);
  void addProduct(ProductEntity productEntity){
    // product exist in cartEntity or not 
    bool isExist = cartEntity.isProductExist(productEntity);
    CartItemEntity cartItemEntity = cartEntity.getCartItem(productEntity);
    if(isExist){
      cartItemEntity.incrementCount();
    //  cartEntity.addCartItem(cartItemEntity); // because we already have the cartItemEntity
    } else {
      cartEntity.addCartItem(cartItemEntity);
    }
    emit(CartAdded());
  }


  void removeProduct(CartItemEntity cartItemEntity){
  cartEntity.removeCartItem(cartItemEntity);
  emit(CartRemoved());
  }
}
