import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/checkout/presentation/widget/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});
  static const route = 'CheckoutRoute';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        context,
        isIcon: true,
        title: 'الشحن',
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: CheckoutViewBody(),
    );
  }
}
