import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubit/cubit/product_cubit.dart';
import 'package:fruits_app/core/hleper_functions/get_it_function.dart';
import 'package:fruits_app/core/repos/product_repo.dart';
import 'package:fruits_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        getIt.get<ProductRepo>(),
      ),
      child: HomeViewBody(),
    );
  }
}
