import 'package:flutter/material.dart';

void buildsnakbar(
    BuildContext context, String message, Color? backgroundColor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 1),
      content: Text(message),
      backgroundColor: backgroundColor,
    ),
  );
}
