import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/doman/entities/buttom_navigation_bar_entity.dart';
import 'package:fruits_app/features/home/presentation/widgets/navigation_bar_item.dart';

class CustomButtonNavigationBar extends StatefulWidget {
  const CustomButtonNavigationBar({super.key, required this.onTabChanged});
  final void Function(int index) onTabChanged;

  @override
  State<CustomButtonNavigationBar> createState() =>
      _CustomButtonNavigationBarState();
}

class _CustomButtonNavigationBarState extends State<CustomButtonNavigationBar> {
  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 275,
      height: 70,
      decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          shadows: [
            BoxShadow(
                color: Color(0x19000000),
                blurRadius: 25,
                offset: Offset(0, -2),
                spreadRadius: 0)
          ]),
      child: Row(
        children: buttonNavigationBarItems.asMap().entries.map((e) {
          var index = e.key;
          var item = e.value;
          return Expanded(
            flex: isSelected == index ? 3 : 2,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  isSelected = index;
                });
                widget.onTabChanged(index);
              },
              child: NavigationBarItem(
                isActive: isSelected == index,
                entity: item,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
