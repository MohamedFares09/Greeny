import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:fruits_app/core/utils/app_image.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/home/doman/entities/cart_item_entity.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 95,
            child: Row(
              children: [
                Container(
                  color: Color(0xffF3F5F7),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 26),
                  child: Image.asset(
                    'assets/images/watermelon_test.png',
                    width: 50,
                    height: 50,
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'بطيخ',
                      style: AppTextStyles.bold13,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '3 كم ',
                      style: AppTextStyles.regular13
                          .copyWith(color: Color(0xffF4A91F)),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        CartActionButton(
                          icon: Icons.add,
                          color: Color(0xff1B5E37),
                          iconColor: Colors.white,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          '1',
                          style: AppTextStyles.bold13,
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        CartActionButton(
                          icon: Icons.remove,
                          color: Color(0xffF3F5F7),
                          iconColor: Color(0xff979899),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.trash_image),
                    ),
                    Spacer(),
                    Text(
                      '60 جنيه ',
                      style: AppTextStyles.bold16
                          .copyWith(color: Color(0xffF4A91F)),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Color(0xffE4E4E7),
        )
      ],
    );
  }
}

class CartActionButton extends StatelessWidget {
  const CartActionButton({
    super.key,
    required this.icon,
    required this.color,
    required this.iconColor,
  });
  final IconData icon;
  final Color color;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Center(
        child: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
