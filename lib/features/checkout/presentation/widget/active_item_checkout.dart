import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class ActiveItemCheckout extends StatelessWidget {
  const ActiveItemCheckout({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 16,
          ),
        ),
        SizedBox(width: 4),
        Text(
          'الشحن',
          style: AppTextStyles.bold13.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
