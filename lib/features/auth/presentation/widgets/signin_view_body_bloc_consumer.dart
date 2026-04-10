import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/hleper_functions/build_snak_bar.dart';
import 'package:fruits_app/core/utils/widgets/custom_progress_hud.dart';
import 'package:fruits_app/features/auth/presentation/cubits/signin/signin_cubit.dart';
import 'package:fruits_app/features/auth/presentation/widgets/signin_view_body.dart';
import 'package:fruits_app/features/home/presentation/views/main_view.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninErrorState) {
          buildsnakbar(context, state.message, Colors.red);
        } else if (state is SigninSuccessState) {
          buildsnakbar(context, 'تم تسجيل الدخول بنجاح', Colors.green);
          Navigator.pushNamed(context, MainView.route); 
          // Navigate to home screen or other screen
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
            isLoading: state is SigninLoadingState ? true : false,
            child: SigninViewBody());
      },
    );
  }
}
