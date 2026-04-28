import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/presentation/widget/active_item_checkout.dart';
import 'package:fruits_app/features/checkout/presentation/widget/in_active_item_checkout.dart';

class StepItem extends StatelessWidget {
  const StepItem({super.key,required this.index,required this.text, required this.isActive});
  final String index, text;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: InActiveItemCheckout(index: index, text: text),
        secondChild: ActiveItemCheckout(text: text),
        crossFadeState:
            isActive ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: Duration(milliseconds: 300));
  }
}
