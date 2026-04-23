import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:fruits_app/core/utils/app_image.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/home/doman/entities/cart_item_entity.dart';
import 'package:fruits_app/features/home/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:fruits_app/features/home/presentation/cubit/cart_item/cart_item_cubit.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartItemCubit, CartItemState>(
      buildWhen: (previous, current) {
        if (current is CartItemUpdated) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 95,
                child: Row(
                  children: [
                    Container(
                      color: Color(0xffF3F5F7),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 26),
                      child: Image.network(
                        cartItemEntity.productEntity.urlImage!,
                        width: 50,
                        height: 50,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cartItemEntity.productEntity.name,
                          style: AppTextStyles.bold13,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          " ${cartItemEntity.productEntity.unitAmout} كم",
                          style: AppTextStyles.regular13
                              .copyWith(color: Color(0xffF4A91F)),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            CartActionButton(
                              onPressed: () {
                                cartItemEntity.incrementCount();
                                context
                                    .read<CartItemCubit>()
                                    .updateCartItem(cartItemEntity);
                              },
                              icon: Icons.add,
                              color: Color(0xff1B5E37),
                              iconColor: Colors.white,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              cartItemEntity.count.toString(),
                              style: AppTextStyles.bold13,
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            CartActionButton(
                              onPressed: () {
                                cartItemEntity.decrementCount();
                                context
                                    .read<CartItemCubit>()
                                    .updateCartItem(cartItemEntity);
                              },
                              icon: Icons.remove,
                              color: Color(0xffF3F5F7),
                              iconColor: Color(0xff979899),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context
                                .read<CartCubit>()
                                .removeProduct(cartItemEntity);
                          },
                          child: SvgPicture.asset(Assets.trash_image),
                        ),
                        Spacer(),
                        Text(
                          '${cartItemEntity.calculateTotalPrice()} جنيه ',
                          style: AppTextStyles.bold16
                              .copyWith(color: Color(0xffF4A91F)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: Color(0xffE4E4E7),
            )
          ],
        );
      },
    );
  }
}

class CartActionButton extends StatelessWidget {
  const CartActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.onPressed,
  });
  final IconData icon;
  final Color color;
  final Color iconColor;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,
          ),
          child: Center(
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
        ));
  }
}
