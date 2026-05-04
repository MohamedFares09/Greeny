import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/presentation/widget/address_section_page_view.dart';
import 'package:fruits_app/features/checkout/presentation/widget/payment_section_page_view.dart';
import 'package:fruits_app/features/checkout/presentation/widget/shipping_section_page_view.dart';

class CheckoutStepsPageView extends StatelessWidget {
  const CheckoutStepsPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

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

  List<Widget> getPages() {
    return [
      ShippingSectionPageView(),
      AddressSectionPageView(
        formKey: formKey,
        valueListenable: valueListenable,
      ),
      PaymentSectionPageView(
        pageController: pageController,
      ),
    ];
  }
}
