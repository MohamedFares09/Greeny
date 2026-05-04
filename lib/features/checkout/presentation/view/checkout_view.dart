import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';
import 'package:fruits_app/features/checkout/domain/entity/shipping_address_entity.dart';
import 'package:fruits_app/features/checkout/presentation/widget/checkout_view_body.dart';
import 'package:fruits_app/features/home/doman/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key, required this.cartEntity});
  final CartEntity cartEntity;
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
      body: Provider.value (
        value : OrderEntity(cartEntity , shippingAddressEntity: ShippingAddressEntity())  ,
        child: CheckoutViewBody()),
    );
  }
}
