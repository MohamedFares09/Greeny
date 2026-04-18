import 'package:flutter/material.dart';
import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/features/home/presentation/widgets/cart_header.dart';
import 'package:fruits_app/features/home/presentation/widgets/cart_item_list.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: kTopPadding,
                  ),
                  buildAppBar(context, title: 'السلة'),
                  SizedBox(
                    height: kTopPadding,
                  ),
                  CartHeader(),
                  SizedBox(
                    height: 24,
                  ),
                  CartItemList(cartItems: []),
                ],
              ),
            ),
          ],
        ),
        Positioned(
            bottom: 50,
            left: 16,
            right: 16,
            child: CustomButton(text: "الدفع 120 جنيه  "))
      ],
    );
  }
}
