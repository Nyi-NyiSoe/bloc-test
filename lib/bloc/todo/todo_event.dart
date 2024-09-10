import 'package:bloc_test/bloc/todo/todo.dart';

abstract class TodoEvent {}

class  TodoAdd extends TodoEvent{
  Todo todo;
  TodoAdd(this.todo);
}

class TodoDelete extends TodoEvent{
  final int index;
  TodoDelete(this.index);
} 

class TodoComplete extends TodoEvent{
  final int index;
  TodoComplete(this.index); 
} 