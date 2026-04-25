import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/checkout/presentation/widget/shipping_item.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShappingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: 40,
        ),
        SizedBox(
          height: 8,
        ),
        ShappingItem(
          title: 'الدفع عند الاستلام',
          subTitle: 'التسليم من المكان',
          price: 40,
        ),
      ],
    );
  }
}
