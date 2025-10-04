import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class BestSellerText extends StatelessWidget {
  const BestSellerText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'الأكثر مبيعًا',
          style: AppTextStyles.bold16,
        ),
        Spacer(),
        SizedBox(
          child: SizedBox(
            child: Text(
              "المزيد",
              style: AppTextStyles.regular13.copyWith(color: Color(0xff949D9E)),
            ),
          ),
        )
      ],
    );
  }
}
