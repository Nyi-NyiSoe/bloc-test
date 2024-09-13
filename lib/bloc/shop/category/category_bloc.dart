import 'dart:convert';

import 'package:bloc_test/bloc/shop/category/category.dart';
import 'package:bloc_test/bloc/shop/category/category_event.dart';
import 'package:bloc_test/bloc/shop/category/category_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryLoadingState()) {
    on<CategoryFetchEvent>((event, emit) => _fetchCategory(event, emit));
  }
}

Future<void> _fetchCategory(
    CategoryFetchEvent event, Emitter<CategoryState> emit) async {
  emit(CategoryLoadingState());

  try {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products/categories'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      final categories =
          data.map((product) => Category.fromJson(product)).toList();
      print(categories);
      emit(CategoryLoadedState(categories));
    } else {
      emit(CategoryErrorState('Failed to load products'));
    }
  } catch (e) {
    emit(CategoryErrorState(e.toString()));
  }
}
