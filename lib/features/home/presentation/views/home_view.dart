import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/presentation/widgets/custom_button_navigation_bar.dart';
import 'package:fruits_app/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const route = 'HomeRoute';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(),
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
