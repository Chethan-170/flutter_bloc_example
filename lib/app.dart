import 'package:bloc_tutorial/cubits/color/color_cubit.dart';
import 'package:bloc_tutorial/cubits/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                "${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}",
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
                  BlocProvider.of<CounterCubit>(context).changeCounter();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
