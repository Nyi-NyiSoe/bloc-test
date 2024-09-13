import 'package:bloc_test/bloc/counter/counter_bloc.dart';
import 'package:bloc_test/bloc/name/name_bloc.dart';
import 'package:bloc_test/bloc/shop/category/category_bloc.dart';
import 'package:bloc_test/bloc/shop/category/category_event.dart';
import 'package:bloc_test/bloc/shop/product_bloc.dart';
import 'package:bloc_test/bloc/shop/product_event.dart';
import 'package:bloc_test/bloc/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(),
          ),
          BlocProvider(create: (context) => NameBloc()),
          BlocProvider(create: (context) => TodoBloc()),
          BlocProvider(
              create: (context) => ProductBloc()..add(ProductFetchEvent())),
          BlocProvider(
              create: (context) => CategoryBloc()..add(CategoryFetchEvent()))
        ],
        child: HomePage(),
      ),
    );
  }
}
