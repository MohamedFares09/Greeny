import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/presentation/widget/shipping_section.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: getPages().length,
        itemBuilder: (context, index) {
          return getPages()[index];
        });
  }
}

List<Widget> getPages() {
  return [
    ShippingSection(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];
}
