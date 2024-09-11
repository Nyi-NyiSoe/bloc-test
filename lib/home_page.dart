import 'package:bloc_test/bloc/counter/counter_bloc.dart';
import 'package:bloc_test/bloc/name/name_bloc.dart';
import 'package:bloc_test/bloc/shop/product_bloc.dart';
import 'package:bloc_test/bloc/shop/product_state.dart';
import 'package:bloc_test/bloc/todo/todo.dart';
import 'package:bloc_test/bloc/todo/todo_bloc.dart';
import 'package:bloc_test/bloc/todo/todo_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = context.read<CounterBloc>();
    final nameBloc = context.read<NameBloc>();
    final todoBloc = context.read<TodoBloc>();
    final productBloc = context.read<ProductBloc>();
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    final nameController = TextEditingController();
                    return AlertDialog(
                      title: Text('To do '),
                      content: TextField(
                        controller: nameController,
                        decoration: InputDecoration(hintText: 'Enter title'),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              todoBloc.add(TodoAdd(Todo(
                                  title: nameController.text,
                                  completed: false)));
                              Navigator.pop(context);
                            },
                            child: Text('Set'))
                      ],
                    );
                  });
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state is ProductLoadingState) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProductLoadedState) {
          return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return Text(state.products[index].slug.toString());
              });
        } else if (state is ProductErrorState) {
          return Center(child: Text(state.message));
        } else {
          return Center(child: Text('No products found'));
        }
      }),
    ));
  }
}
