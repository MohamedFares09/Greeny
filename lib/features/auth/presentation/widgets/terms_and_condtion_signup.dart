import 'package:flutter/material.dart';
import 'package:fruits_app/constants.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class TermsAndCondtionSignup extends StatefulWidget {
  const TermsAndCondtionSignup({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndCondtionSignup> createState() => _TermsAndCondtionSignupState();
}

class _TermsAndCondtionSignupState extends State<TermsAndCondtionSignup> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14.0, 0),
      child: Row(
        children: [
          Checkbox(
            focusColor: AppColors.lightPrimaryColor,
            fillColor: WidgetStatePropertyAll(
              isChecked ? AppColors.primaryColor : Colors.transparent,
            ),
            checkColor: Colors.white,
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
                widget.onChanged(value);
              });
            },
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width -
                (kHorizontalPadding * 2) -
                50,
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "من خلال إنشاء حساب ، فإنك توافق على",
                    style:
                        AppTextStyles.semibold13.copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: "  ",
                    style:
                        AppTextStyles.semibold13.copyWith(color: Colors.black),
                  ),
                  TextSpan(
                    text: "الشروط والأحكام الخاصة بنا",
                    style: AppTextStyles.semibold13
                        .copyWith(color: AppColors.lightPrimaryColor),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
//   Text("من خلال إنشاء حساب ، فإنك توافق على",
//            style: AppTextStyles.semibold13.copyWith(color: Color(0xff949D9E))),
//        Text("الشروط والأحكام الخاصة بنا",
//            style: AppTextStyles.semibold13
//                .copyWith(color: AppColors.primaryColor)),
