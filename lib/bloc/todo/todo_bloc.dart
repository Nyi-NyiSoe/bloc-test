import 'package:bloc_test/bloc/todo/todo.dart';
import 'package:bloc_test/bloc/todo/todo_event.dart';
import 'package:bloc_test/bloc/todo/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent,TodoState> {
  TodoBloc(): super(TodoState([])){
    on<TodoAdd>((event,emit){
      final newTodo = List<Todo>.from(state.todos)..add(event.todo);
      emit(TodoState(newTodo));
    });

    on<TodoDelete>((event,emit){
      final newTodo = List<Todo>.from(state.todos)..removeAt(event.index);
      emit(TodoState(newTodo));
    });
    
    on<TodoComplete>((event,emit){
      final updateTodo = List<Todo>.from(state.todos);
      final todo = updateTodo[event.index];
      todo.completed = !todo.completed;
      emit(TodoState(updateTodo));
    });

    
  }

}