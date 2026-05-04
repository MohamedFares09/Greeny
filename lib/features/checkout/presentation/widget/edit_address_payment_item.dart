import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';

class EditAddressPaymentItem extends StatelessWidget {
  const EditAddressPaymentItem({
    required this.pageController,
    super.key,
  });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "عنوان التوصيل",
              style: AppTextStyles.bold13,
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                pageController.animateToPage(1,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.grey,
                    size: 16,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text("تعديل",
                      style: AppTextStyles.semibold13
                          .copyWith(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: Colors.grey,
              size: 26,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "${context.read<OrderEntity>().shippingAddressEntity.toString()}",
              style: AppTextStyles.regular13,
            ),
          ],
        ),
      ],
    );
  }
}
