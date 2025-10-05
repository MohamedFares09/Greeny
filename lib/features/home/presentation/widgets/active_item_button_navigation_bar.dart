import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1.5.toInt(),
      child: Center(
        child: Container(
          padding: EdgeInsets.only(left: 8),
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: Color(0xFFEEEEEE)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: ShapeDecoration(
                    color: Color(0xFF1B5E37),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Center(child: SvgPicture.asset(image)),
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                '$text',
                style: AppTextStyles.semibold11
                    .copyWith(color: AppColors.primaryColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
