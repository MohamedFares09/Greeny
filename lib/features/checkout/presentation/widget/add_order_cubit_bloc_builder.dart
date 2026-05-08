import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/hleper_functions/build_snak_bar.dart';
import 'package:fruits_app/core/utils/widgets/custom_progress_hud.dart';
import 'package:fruits_app/features/checkout/presentation/cubits/add_order_cubit/add_order_cubit.dart';

class AddOrderCubitBlocBuilder extends StatelessWidget {
  const AddOrderCubitBlocBuilder({super.key, required this.child});
final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      builder: (context, state) {
        return CustomProgressHUD(isLoading: state is AddOrderLoading , child: child);
      },
      listener: (context, state) {
        if (state is AddOrderSuccess) {
          buildsnakbar(context, 'تم اضافة الطلب بنجاح', Colors.green);
        }
        if (state is AddOrderFailure) {
          buildsnakbar(context, state.errorMessage, Colors.red);
        }
    } );
  }
}