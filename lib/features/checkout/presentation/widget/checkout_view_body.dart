import 'package:flutter/material.dart';
import 'package:fruits_app/core/hleper_functions/build_snak_bar.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';
import 'package:fruits_app/features/checkout/presentation/widget/checkout_steps_page_view.dart';
import 'package:fruits_app/features/checkout/presentation/widget/steps_item_checkout_view.dart';
import 'package:provider/provider.dart';

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
  final GlobalKey <FormState> _fromKey = GlobalKey<FormState>();


  

  @override
  Widget build(BuildContext context) {
    var orderentity = context.read<OrderEntity>();
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
            child: CheckoutStepsPageView(pageController: pageController , formKey: _fromKey),
          ),
          CustomButton(
            text: getNextButtonText(),
            onPressed: () {
              if (orderentity.payWithCash != null) {
                pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              } else {
                buildsnakbar(context, "يرجي اختيار طريقة الدفع", Colors.red);
              }
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
