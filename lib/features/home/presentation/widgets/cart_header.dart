import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/home/presentation/cart_cubit/cart_cubit.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
        context.read<CartCubit>().cartEntity.cartItems.length;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12),
      color: Color(0xffEBF9F1),
      child: Center(
          child: Text(
        'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
        style: AppTextStyles.regular13,
      )),
    );
  }
}
