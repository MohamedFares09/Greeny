import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_text_form_field.dart';

class AddressSectionPageView extends StatelessWidget {
  const AddressSectionPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        CustomTextFormField(
            hintText: 'الاسم كامل', keyboardType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
            hintText: 'البريد الإلكتروني', keyboardType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
            hintText: 'العنوان', keyboardType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
            hintText: 'المدينه', keyboardType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
            hintText: 'رقم الطابق , رقم الشقه ..',
            keyboardType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
            hintText: 'رقم الهاتف', keyboardType: TextInputType.number),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
