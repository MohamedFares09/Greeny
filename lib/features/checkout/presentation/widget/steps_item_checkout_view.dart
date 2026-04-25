import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/presentation/widget/step_item.dart';

class StepsItemCheckoutView extends StatelessWidget {
  const StepsItemCheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(getString().length, (index) {
        return StepItem(
          index: (index + 1).toString(),
          text: getString()[index],
          isActive: false,
        );
      }),
    );
  }
}

List<String> getString() {
  return [
    'الشحن',
    'العنوان',
    'الدفع',
  ];
}
