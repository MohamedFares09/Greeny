
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/utils/widgets/custom_notification.dart';

class HeadProductViewBody extends StatelessWidget {
  const HeadProductViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 16,
        ),
        Text(
          'المنتجات',
          style: AppTextStyles.bold19,
        ),
        Notfiation(),
      ],
    );
  }
}
