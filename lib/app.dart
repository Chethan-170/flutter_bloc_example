import 'package:bloc_tutorial/cubit/counter/counter_cubit.dart';
import 'package:bloc_tutorial/show_me_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: Builder(builder: (context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return BlocProvider.value(
                          value: context.read<CounterCubit>(),
                          child: ShowMeCounter(),
                        );
                      }));
                    },
                    child: Text(
                      'Show Me Counter',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    },
                    child: Text(
                      'Increment Counter ${context.watch<CounterCubit>().state.counter}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              );
            }),
          ),
        ));
  }
}
