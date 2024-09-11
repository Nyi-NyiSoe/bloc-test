// product_state.dart
import 'package:bloc_test/bloc/shop/product.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductLoadedState extends ProductState {
  final List<Product> products;

  ProductLoadedState({required this.products});
}

class ProductErrorState extends ProductState {
  final String message;

  ProductErrorState({required this.message});
}