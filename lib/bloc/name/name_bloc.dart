import 'package:bloc_test/bloc/name/name_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameBloc extends Bloc<NameEvent,String>{
  NameBloc():super(''){
    
      on<NameSet>((event,emit){
        emit(event.name);
      });
      
      on<NameUpdate>((event,emit){
        emit(event.name);
      });

      on<NameDelete>((event,emit){
        emit('');
      });
   
  }
}