import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';
import 'package:fruits_app/features/checkout/presentation/widget/edit_address_payment_item.dart';
import 'package:fruits_app/features/checkout/presentation/widget/payment_item.dart';
import 'package:provider/provider.dart';

class PaymentItemSummryWidget extends StatelessWidget {
  const PaymentItemSummryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PaymentItem(
            title: 'ملخص الطلب',
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'المجموع الفرعي :',
                      style: AppTextStyles.regular13,
                    ),
                    Text(
                      '${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه',
                      style: AppTextStyles.semibold16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'التوصيل  : ',
                      style: AppTextStyles.regular13,
                    ),
                    Text(
                      '30جنية',
                      style: AppTextStyles.semibold13,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 0.5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('الكلي :', style: AppTextStyles.bold16),
                    Text(
                      '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 30} جنيه',
                      style: AppTextStyles.bold16,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          EditAddressPaymentItem(),
        ],
      ),
    );
  }
}
