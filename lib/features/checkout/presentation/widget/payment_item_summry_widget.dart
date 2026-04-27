
import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/checkout/presentation/widget/payment_item.dart';

class PaymentItemSummryWidget extends StatelessWidget {
  const PaymentItemSummryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
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
                  '150 جنيه',
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
                Text('180 جنيه', style: AppTextStyles.bold16),
              ],
            ),
          ],
        ));
  }
}
