import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/core/utils/widgets/custom_notification.dart';
import 'package:fruits_app/features/best_selling/presentation/widgets/best_selling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const route = 'BestSellingRoute';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildAppBar(context, title: "الأكثر مبيعاً", actions: [Notfiation()]),
      body: BestSellingViewBody(),
    );
  }
}
