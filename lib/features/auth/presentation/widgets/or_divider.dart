import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xffC9CECF),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'أو',
            style: AppTextStyles.semibold16.copyWith(color: Color(0xff616A6B)),
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(0xffC9CECF),
          ),
        ),
      ],
    );
  }
}
