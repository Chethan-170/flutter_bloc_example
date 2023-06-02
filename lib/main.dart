import 'package:bloc_tutorial/app.dart';
import 'package:bloc_tutorial/cubits/color/color_cubit.dart';
import 'package:bloc_tutorial/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => ColorCubit()),
    BlocProvider(
        create: (context) =>
            CounterCubit(colorCubit: context.read<ColorCubit>()))
  ], child: App()));
}
