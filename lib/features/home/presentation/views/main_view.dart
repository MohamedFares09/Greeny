import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/presentation/widgets/custom_button_navigation_bar.dart';
import 'package:fruits_app/features/home/presentation/widgets/home_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});
  static const route = 'HomeRoute';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(),
      body: SafeArea(child: HomeView()),
    );
  }
}
