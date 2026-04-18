import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/doman/entities/cart_item_entity.dart';
import 'package:fruits_app/features/home/presentation/widgets/cart_item.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        return CartItem(cartItemEntity: cartItems[index]);
      },
    );
  }
}