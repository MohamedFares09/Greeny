import 'package:flutter/material.dart';
import 'package:fruits_app/core/hleper_functions/build_snak_bar.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';
import 'package:fruits_app/features/checkout/presentation/widget/step_item.dart';
import 'package:provider/provider.dart';

class StepsItemCheckoutView extends StatelessWidget {
  const StepsItemCheckoutView(
      {super.key,
      required this.currentPageIndex,
      required this.pageController});
  final int currentPageIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(getString().length, (index) {
        return GestureDetector(
          onTap: () {
            if (context.read<OrderEntity>().payWithCash != null) {
              pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            } else {
              buildsnakbar(context, "يرجي اختيار طريقة الدفع", Colors.red);
            }
          },
          child: StepItem(
            index: (index + 1).toString(),
            text: getString()[index],
            isActive: index <= currentPageIndex,
          ),
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
