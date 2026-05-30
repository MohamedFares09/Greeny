import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/repos/order_repo/order_repo.dart';
import 'package:fruits_app/features/checkout/domain/entity/order_entity.dart';
import 'package:meta/meta.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this.orderRepo) : super(AddOrderInitial());
  final OrderRepo orderRepo;

  Future<void> addOrder({required OrderEntity orderEntity}) async {
    if (isClosed) return;
    emit(AddOrderLoading());
    final result = await orderRepo.addOrder(orderEntity);
    if (isClosed) return;
    result.fold(
      (failure) => emit(AddOrderFailure(failure.message)),
      (success) => emit(AddOrderSuccess()),
    );
  }
}
