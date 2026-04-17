import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/presentation/views/product_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/custom_button_navigation_bar.dart';
import 'package:fruits_app/features/home/presentation/views/home_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const route = 'HomeRoute';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    const HomeView(),
    const ProductView(),
    const Scaffold(body: Center(child: Text('سلة التسوق'))),
    const Scaffold(body: Center(child: Text('حسابي'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomButtonNavigationBar(
        onTabChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _views[_selectedIndex],
    );
  }
}
