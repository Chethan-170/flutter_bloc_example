import 'dart:math';

import 'package:bloc_tutorial/cubits/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeCubit>().state.appTheme == AppTheme.light
          ? ThemeData.light()
          : ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theming using Cubit'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () {
                var randInt = Random().nextInt(10);
                context.read<ThemeCubit>().changeTheme(randInt);
              },
              child: Text('Change Theme')),
        ),
      ),
    ));
  }
}
