import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/auth/presentation/views/signup_view.dart';

class DoNotHaveAnAccount extends StatelessWidget {
  const DoNotHaveAnAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'لا تمتلك حساب ؟ ',
          style: AppTextStyles.semibold16.copyWith(color: Color(0xff616A6B)),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignupView.route);
          },
          child: Text(
            'قم بانشاء حساب',
            style: AppTextStyles.semibold16.copyWith(color: Color(0xff1B5E37)),
          ),
        ),
      ],
    );
  }
}
