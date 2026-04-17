import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/repos/product_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());
  int productLenght = 0;
  final ProductRepo productRepo;

  Future<void> getBestSellingProducts() async {
    if (isClosed) return;
    emit(ProductLoading());
    var result = await productRepo.getBestSellingProducts();
    if (isClosed) return;
    result.fold((failure) {
      emit(ProductFailure(errorMessage: failure.message));
    }, (products) {
      if (isClosed) return;
      productLenght = products.length;
      emit(ProductSuccess(products: products));
    });
  }

  Future<void> getProducts() async {
    if (isClosed) return;
    emit(ProductLoading());
    var result = await productRepo.getProducts();
    if (isClosed) return;
    result.fold((failure) {
      emit(ProductFailure(errorMessage: failure.message));
    }, (products) {
      if (isClosed) return;
      emit(ProductSuccess(products: products));
    });
  }
}
