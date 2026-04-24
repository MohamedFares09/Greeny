import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_text_styles.dart';

AppBar buildAppBar(BuildContext context,
    {required String title,
    void Function()? onTap,
    List<Widget>? actions,
    bool isIcon = false}) {
  return AppBar(
    actions: actions,
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyles.bold19,
    ),
    leading: isIcon
        ? GestureDetector(
            onTap: onTap,
            child: Icon(Icons.arrow_back_ios_new),
          )
        : SizedBox(),
  );
}
