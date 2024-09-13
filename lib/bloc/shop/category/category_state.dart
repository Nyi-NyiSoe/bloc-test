import 'package:bloc_test/bloc/shop/category/category.dart';

abstract class CategoryState {}

class CategoryLoadingState extends CategoryState {
}

class CategoryLoadedState extends CategoryState {
  final List<Category> categories;

  CategoryLoadedState(this.categories);
}

class CategoryErrorState extends CategoryState {
  final String error;

  CategoryErrorState(this.error);
}
