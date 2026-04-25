import 'package:flutter/material.dart';

import 'package:fruits_app/features/checkout/presentation/widget/shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShappingItem(
          isSeleced: true,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: 40,
        ),
        SizedBox(
          height: 8,
        ),
        ShappingItem(
          isSeleced: false,
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: 40,
        ),
      ],
    );
  }
}
