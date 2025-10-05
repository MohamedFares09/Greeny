
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/app_image.dart';

class Notfiation extends StatelessWidget {
  const Notfiation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: ShapeDecoration(shape: OvalBorder()),
      child: SvgPicture.asset(Assets.notfication_image),  
    );
  }
}
