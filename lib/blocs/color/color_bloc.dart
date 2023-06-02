import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'color_event.dart';
part 'color_state.dart';

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(ColorState.initial()) {
    on<ChangeColorEvent>(_changeColor);
  }

  void _changeColor(ChangeColorEvent evt, Emitter<ColorState> emit) {
    if (state.color == Colors.red) {
      emit(state.copyWith(Colors.green));
    } else if (state.color == Colors.green) {
      emit(state.copyWith(Colors.blue));
    } else if (state.color == Colors.blue) {
      emit(state.copyWith(Colors.black));
    } else if (state.color == Colors.black) {
      emit(state.copyWith(Colors.red));
    }
  }
}
