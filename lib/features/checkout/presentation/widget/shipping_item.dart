
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class ShappingItem extends StatelessWidget {
  const ShappingItem({
    super.key,
    required this.title,
    required this.subTitle,
    required this.price,
  });
  final String title, subTitle;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: Color(0xFFD9D9D9),
      ),
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 13, right: 28),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 18,
              height: 18,
              decoration: ShapeDecoration(
                  shape: OvalBorder(
                      side: BorderSide(width: 1, color: Color(0xff949D9E)))),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: AppTextStyles.bold13,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  subTitle,
                  style: AppTextStyles.regular13,
                ),
              ],
            ),
            Spacer(),
            Center(
              child: Text(
                '${price} جنيه',
                style: AppTextStyles.bold13
                    .copyWith(color: AppColors.lightPrimaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
