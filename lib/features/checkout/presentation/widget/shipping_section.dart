import 'package:flutter/material.dart';

import 'package:fruits_app/features/checkout/presentation/widget/shipping_item.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
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
