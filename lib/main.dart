import 'package:bloc_tutorial/app.dart';
import 'package:bloc_tutorial/blocs/color/color_bloc.dart';
import 'package:bloc_tutorial/blocs/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ColorBloc(),
      ),
      BlocProvider(
        create: (context) => CounterBloc(colorBloc: context.read<ColorBloc>()),
      ),
    ],
    child: App(),
  ));
}
