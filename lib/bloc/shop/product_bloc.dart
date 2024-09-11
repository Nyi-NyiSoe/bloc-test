import 'dart:convert';

import 'package:bloc_test/bloc/shop/product.dart';
import 'package:bloc_test/bloc/shop/product_event.dart';
import 'package:bloc_test/bloc/shop/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductLoadingState()){
   on<ProductFetchEvent>(_fetchProducts);
  }
  
}

Future<void> _fetchProducts(
    ProductFetchEvent event, Emitter<ProductState> emit) async {
  emit(ProductLoadingState());

  try {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      final products = data.map((product) => Product.fromJson(product)).toList();  
     print(products);
      emit(ProductLoadedState(products: products));
    } else {
      emit(ProductErrorState(message: 'Failed to load products'));
    }
  } catch (e) {
    emit(ProductErrorState(message: e.toString()));
  }
}
