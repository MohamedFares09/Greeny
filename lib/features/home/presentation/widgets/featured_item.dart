import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:fruits_app/core/utils/app_image.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/features/home/presentation/widgets/button_featured_item.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: itemWidth * 0.85,
      child: Stack(
        children: [
          Positioned(
              left: 0,
              right: itemWidth * 0.4,
              bottom: 0,
              top: 0,
              child: Image.asset(
                Assets.watermelon_image,
                fit: BoxFit.fill,
              )),
          Container(
            width: itemWidth / 2,
            height: 158,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4)),
              image: DecorationImage(
                  image: svg.Svg(Assets.shape_iamge), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 33),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'عروض العيد',
                    style:
                        AppTextStyles.regular13.copyWith(color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    'خصم 25%',
                    style: AppTextStyles.bold19.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  ButtonFeaturedItem(
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 29,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
