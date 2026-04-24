import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/presentation/widget/steps_item_checkout_view.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          StepsItemCheckoutView()
        ],
      ),
    );
  }
}
