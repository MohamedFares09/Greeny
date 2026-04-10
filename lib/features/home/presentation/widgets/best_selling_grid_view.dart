import 'package:flutter/material.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/utils/widgets/fruite_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 163 / 214,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16),
        itemBuilder: (context, index) {
          return FruiteItem();
        });
  }
}
