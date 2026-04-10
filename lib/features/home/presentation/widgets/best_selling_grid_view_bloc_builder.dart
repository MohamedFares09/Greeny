import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubit/cubit/product_cubit.dart';
import 'package:fruits_app/core/hleper_functions/get_dummy_product.dart';
import 'package:fruits_app/core/utils/widgets/custom_error_widget.dart';
import 'package:fruits_app/features/home/presentation/widgets/best_selling_grid_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BestSellingGridViewBlocBuilder extends StatelessWidget {
  const BestSellingGridViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {

        if(state is ProductSuccess){
          return BestSellingGridView(products: state.products);
        }
        else if(state is ProductFailure){
          return SliverToBoxAdapter(child: CustomErrorWidget(errorMessage: state.errorMessage));
        }
        return Skeletonizer.sliver(child:  BestSellingGridView(products: getDummyProducts(),));
        
      },
    );
  }
}
