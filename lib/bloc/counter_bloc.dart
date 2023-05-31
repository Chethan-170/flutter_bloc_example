import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/bloc/counter_event.dart';
import 'package:bloc_tutorial/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(super.initialState);
}
