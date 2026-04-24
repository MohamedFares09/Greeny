import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/presentation/widget/active_item_checkout.dart';
import 'package:fruits_app/features/checkout/presentation/widget/in_active_item_checkout.dart';

class StepsItemCheckoutView extends StatelessWidget {
  const StepsItemCheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(getString().length, (index) {
        return ActiveItemCheckout(
          //    index: index,
          text: getString()[index],
        );
      }),
    );
  }
}

List<String> getString() {
  return ['الشحن', 'العنوان', 'الدفع', 'المراجعه'];
}
