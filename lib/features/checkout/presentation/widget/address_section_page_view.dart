import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_text_form_field.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';
import 'package:provider/provider.dart';

class AddressSectionPageView extends StatelessWidget {
  const AddressSectionPageView({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        CustomTextFormField(
          onSaved: (value) {
            context.read<OrderEntity>().shippingAddressEntity!.name = value!;
          },
            hintText: 'الاسم كامل', keyboardType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          onSaved: (value) {
            context.read<OrderEntity>().shippingAddressEntity!.email = value!;
          },
            hintText: 'البريد الإلكتروني', keyboardType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          onSaved: (value) {
            context.read<OrderEntity>().shippingAddressEntity!.address = value!;
          },
            hintText: 'العنوان', keyboardType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          onSaved: (value) {
            context.read<OrderEntity>().shippingAddressEntity!.city = value!;
          },
            hintText: 'المدينه', keyboardType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          onSaved: (value) {
            context.read<OrderEntity>().shippingAddressEntity!.addressDetails = value!;
          },
            hintText: 'رقم الطابق , رقم الشقه ..',
            keyboardType: TextInputType.text),
        SizedBox(
          height: 16,
        ),
        CustomTextFormField(
          onSaved: (value) {
            context.read<OrderEntity>().shippingAddressEntity!.phoneNumber = value!;
          },
            hintText: 'رقم الهاتف', keyboardType: TextInputType.number),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
