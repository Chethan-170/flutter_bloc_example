import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial/blocs/color/color_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int incrementSize = 1;
  final ColorBloc colorBloc;
  late final StreamSubscription colorSubscription;

  CounterBloc({required this.colorBloc}) : super(CounterState.initial()) {
    colorSubscription = colorBloc.stream.listen((event) {
      if (event.color == Colors.red) {
        incrementSize = 1;
      } else if (event.color == Colors.green) {
        incrementSize = 10;
      } else if (event.color == Colors.blue) {
        incrementSize = 100;
      } else if (event.color == Colors.black) {
        incrementSize = -100;
        add(IncrementCounterEvent());
      }
    });

    on<IncrementCounterEvent>((_incrementCounter));
  }

  void _incrementCounter(
      IncrementCounterEvent evt, Emitter<CounterState> emit) {
    emit(state.copyWith(state.counter + incrementSize));
  }

  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
