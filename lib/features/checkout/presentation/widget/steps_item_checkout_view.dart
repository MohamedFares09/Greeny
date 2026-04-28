import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/presentation/widget/step_item.dart';

class StepsItemCheckoutView extends StatelessWidget {
  const StepsItemCheckoutView({super.key, required this.currentPageIndex, required this.pageController});
  final int currentPageIndex;
  final PageController pageController; 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(getString().length, (index) {
        return GestureDetector(
          onTap: () {
            pageController.animateToPage(index,
                duration: Duration(milliseconds: 300), curve: Curves.easeIn);
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
