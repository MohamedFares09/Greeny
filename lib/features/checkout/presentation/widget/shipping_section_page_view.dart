import 'package:flutter/material.dart';

import 'package:fruits_app/features/checkout/presentation/widget/shipping_item.dart';

class ShippingSectionPageView extends StatefulWidget {
  const ShippingSectionPageView({super.key});

  @override
  State<ShippingSectionPageView> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSectionPageView> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShappingItem(
          onTap: () {
            indexSelected = 0;
            setState(() {});
          },
          isSeleced: indexSelected == 0,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: 40,
        ),
        SizedBox(
          height: 8,
        ),
        ShappingItem(
          onTap: () {
            indexSelected = 1;
            setState(() {});
          },
          isSeleced: indexSelected == 1,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: 40,
        ),
      ],
    );
  }
}
