
import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/doman/entities/buttom_navigation_bar_entity.dart';
import 'package:fruits_app/features/home/presentation/widgets/active_item_button_navigation_bar.dart';
import 'package:fruits_app/features/home/presentation/widgets/in_active_button_navigation_bar.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key, required this.isActive, required this.entity});
  final bool isActive;
  final ButtonNavigationBarEntity entity;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? ActiveItem(
            image: entity.activeImage,
            text: entity.name,
          )
        : InActiveItem(image: entity.inActiveImage);
  }
}
