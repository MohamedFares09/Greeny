import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/features/checkout/presentation/widget/checkout_steps_page_view.dart';
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
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          StepsItemCheckoutView(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: CheckoutStepsPageView(pageController: pageController),
          ),
          CustomButton(
            text: getNextButtonText(),
            onPressed: () {
              pageController.nextPage(
                  duration: Duration(milliseconds: 300), curve: Curves.easeIn);
            },
          ),
          SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }

  String getNextButtonText() {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'تأكيد الطلب';
      default:
        return '';
    }
  }
}
