import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/cubit/cubit/product_cubit.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/utils/widgets/search_text_feild.dart';
import 'package:fruits_app/features/home/presentation/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruits_app/features/home/presentation/widgets/filiter_sort_header.dart';
import 'package:fruits_app/features/home/presentation/widgets/head_product_view_body.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: kTopPadding,
                ),
                HeadProductViewBody(),
                SizedBox(
                  height: kTopPadding,
                ),
                SearchTextFeild(),
                SizedBox(
                  height: 12,
                ),
                //   FeaturedList(),
                SizedBox(
                  height: 12,
                ),
                FilterSortHeader(
                    ProductLenght: context.read<ProductCubit>().productLenght),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          ProductGridViewBlocBuilder()
        ],
      ),
    );
  }
}
