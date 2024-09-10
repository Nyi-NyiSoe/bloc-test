import 'package:bloc_test/bloc/counter/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent,int>{
  CounterBloc(): super(0){
    on<CounterIncrement>((event, emit) {
      emit(state+1);
    },);

     on<CounterDecrement>((event, emit) {
     if(state>0){
      emit(state-1);
     }
    },);
  }

}