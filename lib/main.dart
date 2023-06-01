import 'package:bloc_tutorial/app.dart';
import 'package:bloc_tutorial/cubits/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: App(),
  ));
}
