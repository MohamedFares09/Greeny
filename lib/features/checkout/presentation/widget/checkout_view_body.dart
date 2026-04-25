import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/features/checkout/presentation/widget/checkout_steps_pageview.dart';
import 'package:fruits_app/features/checkout/presentation/widget/steps_item_checkout_view.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          StepsItemCheckoutView(),
          Expanded(
            child: CheckoutStepsPageView(pageController: pageController),
          ),
          CustomButton(text: 'التالي'),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
