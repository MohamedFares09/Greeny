import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/hleper_functions/build_snak_bar.dart';
import 'package:fruits_app/features/home/presentation/cart_cubit/cart_cubit.dart';
import 'package:fruits_app/features/home/presentation/views/cart_view.dart';
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
    const CartView(),
    const Scaffold(body: Center(child: Text('حسابي'))),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: CustomButtonNavigationBar(
          onTabChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: SafeArea(
          child: BlocListener<CartCubit, CartState>(
            listener: (context, state) {
              if (state is CartAdded) {
                buildsnakbar(
                    context, 'تم إضافة المنتج إلى السلة', Colors.green);
              }
              if (state is CartRemoved) {
                buildsnakbar(context, 'تم إزالة المنتج من السلة', Colors.red);
              }
            },
            child: IndexedStack(
              index: _selectedIndex,
              children: _views,
            ),
          ),
        ),
      ),
    );
  }
}
