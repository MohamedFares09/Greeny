import 'package:flutter/material.dart';
import 'package:fruits_app/features/splash/presentation/widgets/splah_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const route = "splash";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplahViewBody(),
    );
  }
}
