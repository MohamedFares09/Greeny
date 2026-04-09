import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;

  Future<void> getBestSellingProducts() async {
    emit(ProductLoading());
    var result = await productRepo.getBestSellingProducts();
    result.fold((failure) {
      emit(ProductFailure(errorMessage: failure.message));
    }, (products) {
      emit(ProductSuccess(products: products));
    });
  }
}
