import 'package:bloc_tutorial/app.dart';
import 'package:bloc_tutorial/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider<ThemeBloc>(
    create: (context) => ThemeBloc(),
    child: App(),
  ));
}
