import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopx/core/api/Network.dart';
import 'package:shopx/features/shop/data/Product.dart';
import 'package:shopx/features/shop/data/ProductsResponseModel.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  getProducts() async {
    emit(ProductsLoading());

    final result = await Network.fetchProducts();

    if(result != null){
      emit(ProductsSuccessfully(product: result));
    }
    else{
      emit(ProductsError(message: "Error !"));
    }
  }

}
