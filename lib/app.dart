import 'package:bloc_tutorial/blocs/counter/counter_bloc.dart';
import 'package:bloc_tutorial/blocs/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hydrated Bloc',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: context.watch<ThemeBloc>().state.appTheme == AppTheme.light
          ? ThemeData.light()
          : ThemeData.dark(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '${context.watch<CounterBloc>().state.counter}',
          style: const TextStyle(fontSize: 64.0),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
            child: const Icon(Icons.brightness_6),
          ),
          const SizedBox(width: 5.0),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementCounterEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 5.0),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementCounterEvent());
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 5.0),
          FloatingActionButton(
            onPressed: () {
              HydratedBloc.storage.clear();
            },
            child: const Icon(Icons.delete_forever),
          ),
        ],
      ),
    );
  }
}
