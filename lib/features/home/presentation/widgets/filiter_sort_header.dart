import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_image.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/best_selling/presentation/views/best_selling_view.dart';

class FilterSortHeader extends StatelessWidget {
  const FilterSortHeader({super.key, required this.ProductLenght});
  final int ProductLenght;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BestSellingView.route);
      },
      child: Row(
        children: [
          Text(
            '$ProductLenght نتائج',
            style: AppTextStyles.bold16,
          ),
          Spacer(),
          SizedBox(
            child: SizedBox(child: SvgPicture.asset(Assets.filitering_image)),
          )
        ],
      ),
    );
  }
}
