import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_image.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';
import 'package:fruits_app/core/utils/widgets/custom_notification.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: Notfiation(),
      leading: Image.asset(Assets.profile_image),
      title: Text(
        textAlign: TextAlign.right,
        'صباح الخير !..',
        style: AppTextStyles.regular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text(
        "أحمد مصطفي",
        style: AppTextStyles.bold16,
        textAlign: TextAlign.right,
      ),
    );
  }
}
