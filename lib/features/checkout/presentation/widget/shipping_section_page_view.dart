import 'package:flutter/material.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';

import 'package:fruits_app/features/checkout/presentation/widget/shipping_item.dart';
import 'package:provider/provider.dart';

class ShippingSectionPageView extends StatefulWidget {
  const ShippingSectionPageView({super.key});

  @override
  State<ShippingSectionPageView> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSectionPageView> {
  int indexSelected = -1;
 
  @override
  Widget build(BuildContext context) {
     var orderEntity = context.read<OrderEntity>();
    return Column(
      children: [
        ShappingItem(
          onTap: () {
            indexSelected = 0;
            setState(() {});
            orderEntity.payWithCash = true;
          },
          isSeleced: indexSelected == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: context
              .read<OrderEntity>()
              .cartEntity
              .calculateTotalPrice()
              .toInt(),
        ),
        SizedBox(
          height: 8,
        ),
        ShappingItem(
          onTap: () {
            indexSelected = 1;
            setState(() {});
            orderEntity.payWithCash = false;
          },
          isSeleced: indexSelected == 1,
          title: 'الدفع عبر الإنترنت',
          subTitle: 'التسليم من المكان',
          price: (context.read<OrderEntity>().cartEntity.calculateTotalPrice() +
                  40)
              .toInt(),
        ),
      ],
    );
  }
}
