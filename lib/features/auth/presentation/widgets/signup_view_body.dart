import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruits_app/core/utils/widgets/password_feild.dart';
import 'package:fruits_app/features/auth/presentation/cubits/signup_cubit.dart/signup_cubit.dart';
import 'package:fruits_app/features/auth/presentation/widgets/already_have_account.dart';
import 'package:fruits_app/features/auth/presentation/widgets/terms_and_condtion_signup.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;
  late bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTextFormField(
                  onSaved: (value) {
                    name = value!;
                  },
                  hintText: "الاسم كامل",
                  keyboardType: TextInputType.name),
              SizedBox(height: 16),
              CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hintText: "البريد الالكتروني",
                  keyboardType: TextInputType.emailAddress),
              SizedBox(height: 16),
              PasswordField(
                onSaved: (value) {
                  password = value!;
                },
              ),
              SizedBox(height: 16),
              TermsAndCondtionSignup(
                onChanged: (value) {
                  isCheck = value;
                },
              ),
              SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isCheck) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            name: name,
                            email: email.trim(),
                            password: password,
                          );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'يجب الموافقة على الشروط والأحكام لإنشاء حساب جديد.',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    print('Email to register: $email');
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: "إنشاء حساب جديد",
              ),
              SizedBox(height: 26),
              AlreadyHaveAccount()
            ],
          ),
        ),
      ),
    );
  }
}
