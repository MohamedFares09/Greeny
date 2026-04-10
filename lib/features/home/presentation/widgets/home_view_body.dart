
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/cubit/cubit/product_cubit.dart';
import 'package:fruits_app/core/utils/widgets/search_text_feild.dart';
import 'package:fruits_app/features/home/presentation/widgets/best_seller_text.dart';
import 'package:fruits_app/features/home/presentation/widgets/best_selling_grid_view_bloc_builder.dart';
import 'package:fruits_app/features/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:fruits_app/features/home/presentation/widgets/featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getBestSellingProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(kHorizontalPadding),
              child: Column(
                children: [
                  SizedBox(
                    height: kTopPadding,
                  ),
                  CustomHomeAppBar(),
                  SizedBox(
                    height: kTopPadding,
                  ),
                  SearchTextFeild(),
                  SizedBox(
                    height: 12,
                  ),
                  FeaturedList(),
                  SizedBox(
                    height: 12,
                  ),
                  BestSellerText(),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
          BestSellingGridViewBlocBuilder()
        ],
      ),
    );
  }
}
