import 'package:bloc_tutorial/blocs/color/color_bloc.dart';
import 'package:bloc_tutorial/blocs/counter/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int incrementSize = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bloc2bloc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocListener<ColorBloc, ColorState>(
        listener: (context, state) {
          if (state.color == Colors.red) {
            incrementSize = 1;
          } else if (state.color == Colors.green) {
            incrementSize = 10;
          } else if (state.color == Colors.blue) {
            incrementSize = 100;
          } else if (state.color == Colors.black) {
            incrementSize = -100;
            context
                .read<CounterBloc>()
                .add(IncrementCounterEvent(incrementSize: incrementSize));
          }
        },
        child: Scaffold(
          backgroundColor: context.watch<ColorBloc>().state.color,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text(
                    'Change Color',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  onPressed: () {
                    context.read<ColorBloc>().add(ChangeColorEvent());
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  "${context.select((CounterBloc value) => value.state.counter)}",
                  style: TextStyle(
                    fontSize: 52.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  child: Text(
                    'Increment Counter',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  onPressed: () {
                    context.read<CounterBloc>().add(
                        IncrementCounterEvent(incrementSize: incrementSize));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
