import 'package:bloc_tutorial/cubits/color/color_cubit.dart';
import 'package:bloc_tutorial/cubits/counter/counter_cubit.dart';
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
    return BlocListener<ColorCubit, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          incrementSize = 1;
        } else if (state.color == Colors.green) {
          incrementSize = 10;
        } else if (state.color == Colors.blue) {
          incrementSize = 100;
        } else if (state.color == Colors.black) {
          context.read<CounterCubit>().changeCounter(-100);
          incrementSize = -100;
        }
      },
      child: MaterialApp(
        title: 'cubit2cubit',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          backgroundColor: context.watch<ColorCubit>().state.color,
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
                    context.read<ColorCubit>().changeColor();
                  },
                ),
                SizedBox(height: 20.0),
                Text(
                  "Count: ${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}",
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
                    context.read<CounterCubit>().changeCounter(incrementSize);
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
