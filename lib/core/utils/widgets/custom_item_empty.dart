
import 'package:flutter/material.dart';

class CustomItemEmpty extends StatelessWidget {
  const CustomItemEmpty({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 64,
          color: Colors.grey,
        ),
        Text(text, style: TextStyle(fontSize: 18)),
      ],
    );
  }
}
