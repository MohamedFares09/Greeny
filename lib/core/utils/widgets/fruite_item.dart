import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_image.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class FruiteItem extends StatelessWidget {
  const FruiteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(4),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
                onPressed: () {}, icon: Icon(Icons.favorite_border_outlined)),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(Assets.watermelon_image),
                  SizedBox(
                    height: 24,
                  ),
                  ListTile(
                    title: Text(
                      'بطيخ',
                      style: AppTextStyles.semibold13,
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          '20جنية',
                          style: AppTextStyles.semibold13
                              .copyWith(color: AppColors.scendryColor),
                        ),
                        Text(
                          ' / الكيلو',
                          style: AppTextStyles.semibold13
                              .copyWith(color: AppColors.lightScendryColor),
                        )
                      ],
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
