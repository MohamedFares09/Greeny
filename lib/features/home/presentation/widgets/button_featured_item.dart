import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class ButtonFeaturedItem extends StatelessWidget {
  const ButtonFeaturedItem({super.key, this.onPressed});
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            backgroundColor: Colors.white),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 4),
          child: Text(
            'تسوق الان',
            style: AppTextStyles.bold13.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }
}
