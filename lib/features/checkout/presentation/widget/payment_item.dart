import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/utils/widgets/app_decorations.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({super.key , required this.title, required this.child});
  final String title ;  
  final Widget child ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text (title,style: AppTextStyles.bold13,),
        SizedBox(height: 8,),
        Container(
          decoration: AppDecoration.greyBoxDecoration,
          child: child ,
        )
      ],
    );
  }
}

