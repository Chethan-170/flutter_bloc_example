import 'package:bloc_tutorial/app.dart';
import 'package:bloc_tutorial/cubit/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => CounterCubit(),
    child: App(),
  ));
}
