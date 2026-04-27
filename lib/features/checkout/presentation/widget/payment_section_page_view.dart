import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/presentation/widget/payment_item_summry_widget.dart';

class PaymentSectionPageView extends StatelessWidget {
  const PaymentSectionPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PaymentItemSummryWidget(),
      ],
    );
  }
}
