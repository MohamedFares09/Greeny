import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class InActiveItemCheckout extends StatelessWidget {
  const InActiveItemCheckout({super.key , required this.index , required this.text});
  
  final String text , index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11.5,
          backgroundColor: AppColors.lightGreyColor,
          child: Text(
            index.toString(),
            style: AppTextStyles.semibold13,
          ),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: AppTextStyles.semibold13.copyWith(color: Color(0xffAAAAAA)),
        )
      ],
    );
  }
}
