import 'dart:math';

import 'package:bloc_tutorial/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Payload',
      debugShowCheckedModeBanner: false,
      theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.light
          ? ThemeData.light()
          : ThemeData.dark(),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Theme"),
          ),
          body: Center(
            child: ElevatedButton(
                onPressed: () {
                  int randInt = Random().nextInt(10);
                  context
                      .read<ThemeBloc>()
                      .add(ChangeThemeEvent(randInt: randInt));
                },
                child: Text(
                  'Change Theme',
                  style: TextStyle(fontSize: 24),
                )),
          )),
    );
  }
}
