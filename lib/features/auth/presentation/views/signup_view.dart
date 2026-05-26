import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/hleper_functions/get_it_function.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/auth/doman/repos/auth_repo.dart';
import 'package:fruits_app/features/auth/presentation/cubits/signup_cubit.dart/signup_cubit.dart';
import 'package:fruits_app/features/auth/presentation/widgets/signup_view_body_bloc_consumer.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const route = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(context, title: "حساب جديد", onTap: () {
          Navigator.of(context).pop();
        }),
        body: SignupViewBodyBlocConsumer(),
      ),
    );
  }
}
