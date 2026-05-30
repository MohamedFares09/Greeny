import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_app/core/hleper_functions/build_snak_bar.dart';
import 'package:fruits_app/core/utils/widgets/app_keys.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';
import 'package:fruits_app/features/checkout/domain/entity/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruits_app/features/checkout/presentation/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_app/features/checkout/presentation/widget/checkout_steps_page_view.dart';
import 'package:fruits_app/features/checkout/presentation/widget/steps_item_checkout_view.dart';
import 'package:fruits_app/features/home/presentation/views/main_view.dart';
import 'package:provider/provider.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);

  int currentPageIndex = 0;
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    valueNotifier.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 20),
          StepsItemCheckoutView(
            currentPageIndex: currentPageIndex,
            pageController: pageController,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: CheckoutStepsPageView(
              pageController: pageController,
              formKey: _fromKey,
              valueListenable: valueNotifier,
            ),
          ),
          CustomButton(
            text: getNextButtonText(),
            onPressed: () {
              if (currentPageIndex == 0) {
                _handleShippingValidation(orderEntity, context);
              } else if (currentPageIndex == 1) {
                _handleAddressValidation();
              } else {
                _handleOrderPayment(context);
              }
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _handleShippingValidation(OrderEntity orderEntity, BuildContext context) {
    if (orderEntity.payWithCash != null) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      buildsnakbar(context, 'Please choose a payment method', Colors.red);
    }
  }

  String getNextButtonText() {
    switch (currentPageIndex) {
      case 0:
      case 1:
        return 'Next';
      case 2:
        return 'Place order';
      default:
        return '';
    }
  }

  void _handleAddressValidation() {
    if (_fromKey.currentState!.validate()) {
      _fromKey.currentState!.save();
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
      buildsnakbar(context, 'Please fill all fields', Colors.red);
    }
  }

  void _handleOrderPayment(BuildContext context) {
    var orderEntity = context.read<OrderEntity>();
    if (orderEntity.payWithCash == true) {
      context.read<AddOrderCubit>().addOrder(orderEntity: orderEntity);
      Navigator.pushReplacementNamed(context, MainView.route);
    } else {
      _processPayment(context);
    }
  }

  void _processPayment(BuildContext context) {
    var checkoutContext = context;
    var orderEntity = context.read<OrderEntity>();
    var addOrderCubit = context.read<AddOrderCubit>();
    var paypalPaymentEntity = PaypalPaymentEntity.fromEntity(orderEntity);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext paypalContext) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kClientId,
          secretKey: kPaypalSecretKey,
          transactions: [paypalPaymentEntity.toJson()],
          note: 'Contact us for any questions on your order.',
          onSuccess: (Map params) async {
            log('PayPal success: $params');
            addOrderCubit.addOrder(orderEntity: orderEntity);
            Navigator.pop(paypalContext);
            buildsnakbar(
              checkoutContext,
              'Payment completed successfully',
              Colors.green,
            );
          },
          onError: (error) {
            log(error.toString());
            Navigator.pop(paypalContext);
            buildsnakbar(
              checkoutContext,
              _getPaypalErrorMessage(error),
              Colors.red,
            );
          },
          onCancel: () {
            log('PayPal payment cancelled');
          },
        ),
      ),
    );
  }

  String _getPaypalErrorMessage(dynamic error) {
    final errorText = error.toString();
    if (errorText.contains('COMPLIANCE_VIOLATION')) {
      return 'PayPal declined this transaction because of account or country compliance rules. Try another sandbox buyer or merchant account.';
    }

    return 'Payment failed. Please try again.';
  }
}
