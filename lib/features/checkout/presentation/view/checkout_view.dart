import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/hleper_functions/get_it_function.dart';
import 'package:fruits_app/core/hleper_functions/get_user.dart';
import 'package:fruits_app/core/repos/order_repo/order_repo.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';
import 'package:fruits_app/features/checkout/domain/entity/shipping_address_entity.dart';
import 'package:fruits_app/features/checkout/presentation/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_app/features/checkout/presentation/widget/add_order_cubit_bloc_builder.dart';
import 'package:fruits_app/features/checkout/presentation/widget/checkout_view_body.dart';
import 'package:fruits_app/features/home/doman/entities/cart_entity.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key, required this.cartEntity});
  final CartEntity cartEntity;
  static const route = 'CheckoutRoute';

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  late OrderEntity orderEntity;

  initState() {
    super.initState();
    orderEntity = OrderEntity(widget.cartEntity,
        shippingAddressEntity: ShippingAddressEntity(), uID: getUser()!.uId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOrderCubit(getIt<OrderRepo>()),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(
          context,
          isIcon: true,
          title: 'الشحن',
          onTap: () {
            Navigator.pop(context);
          },
        ),
        body: Provider.value(
            value: orderEntity,
            child: AddOrderCubitBlocBuilder(child: CheckoutViewBody())),
      ),
    );
  }
}
