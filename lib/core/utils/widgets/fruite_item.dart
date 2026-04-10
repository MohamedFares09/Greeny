import 'package:flutter/material.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class FruiteItem extends StatelessWidget {
  const FruiteItem({super.key, required this.product});
  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.favorite_border_outlined),
                onPressed: () {},
              ),
            ),
            product.urlImage != null
                ? Flexible(
                    child: Image.network(
                      product.urlImage!,
                      fit: BoxFit.contain,
                    ),
                  )
                : Flexible(
                    child: Container(
                    color: Colors.grey,
                    height: 100,
                    width: 100,
                  )),
            const SizedBox(height: 8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                product.name,
                style: AppTextStyles.semibold13,
              ),
              subtitle: Row(
                children: [
                  Flexible(
                    child: Text(
                      '${product.price}جنية',
                      style: AppTextStyles.semibold13
                          .copyWith(color: AppColors.scendryColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      ' / الكيلو',
                      style: AppTextStyles.semibold13
                          .copyWith(color: AppColors.lightScendryColor),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              trailing: CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                radius: 15,
                child: const Icon(
                  Icons.add,
                  size: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
