part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccessfully extends ProductsState {
  final List<Product> product;

  ProductsSuccessfully({this.product});
}

class ProductsError extends ProductsState {

  final String message;
  ProductsError({this.message});

}